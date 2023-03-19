const CalendarModel = require("../models/calendar");
const BookingModel = require("../models/booking");
const UserWalletModel = require("../models/user_wallet");
const ipfsService = require("../util/ipfs");
const web3Util = require("../util/web3");
const { ethers } = require('ethers');
const ical = require('node-ical');
const ics = require('ics');
const GoogleCalendarUtil = require("../util/google_calendar");
const fs = require('fs');

const parseEvents = (calString) => {

  return calString.split('BEGIN:VEVENT').slice(1).map((eventString) => {
    let description;
    let booking_id;
    let priority;

    const data = ical.parseICS(`BEGIN:VEVENT${eventString}`);
    for (const k in data) {
      if (data.hasOwnProperty(k)) {
        const ev = data[k];
        description = ev['description'];
        booking_id = ev['booking_id'];
        priority = ev['priority'];
      }
    }
    return {
      description: description,
      booking_id: booking_id,
      priority: priority,
      content: `BEGIN:VEVENT${eventString}`.replace(`END:VCALENDAR`, '')
    };
  });
}

const parseIcs = (ics) => {
  return ics.split('BEGIN:VEVENT').slice(1).map((eventString) => {
    const data = ical.parseICS(`BEGIN:VEVENT${eventString}`);

    for (const k in data) {
      let description;
      let booking_id;
      let priority;

      if (data.hasOwnProperty(k)) {
        const ev = data[k];
        description = ev['description'];
        booking_id = ev['booking_id'];
        priority = ev['priority'];
      }
      return {
        description: description,
        booking_id: booking_id,
        priority: priority,
        ics_content: `BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//TimeDex//EN
BEGIN:VEVENT${eventString}
END:VCALENDAR`
      };
    }
    return data;
  });
}

const get = async (teamId) => {
  const teamAddress = await web3Util.getTeamAddress(teamId);
  if (teamAddress == ethers.constants.AddressZero) return [];
  
  const calendars = await web3Util.getLatestTeamNftContentUris(teamAddress);

  const events =  await Promise.all(calendars.map(async e => {
    const event = await ipfsService.readFileFromIpfs(e.calendarNftUri.replace('ipfs://', ''));
    return {
      calendar_id: e.calendarId,
      team_id: e.teamId,
      token_id: e.tokenId,
      token_uri: e.tokenUri,
      calendar_nft_uri: e.calendarNftUri,
      ics_contests: parseIcs(event)
    };
  }));
  
  //TODO: filter, page, limit

  return events.map(e=>({
    calendar_id: e.calendar_id,
    ics_contests: e.ics_contests
  }))
}

const getForUser = async (calendarId) => {
  const bookings = await BookingModel.getsByCalendarId(calendarId);

  return [{
    calendar_id: calendarId,
    ics_contests: bookings.map(b=>({
      title: b.title,
      booking_id: b.booking_id,
      priority: b.priority,
      ics_content: b.ics_content
    }))
  }];
}

const create = async (icsContents, googleCalendars, userId) => {
  let calendar = await CalendarModel.getByUserId(userId);
  if (!calendar) {
    calendar = await CalendarModel.create(userId);
  }

  // ICS file
  if (icsContents) {
    for (const icsContent of icsContents) {
      const events = parseEvents(icsContent);
      for (const event of events) {
        //save booking
        await BookingModel.create({
          calendar_id: calendar.calendar_id,
          title: event.title,
          priority: 'Fixed',
          ics_content: event.content
        }, userId);
      }
    }
  }

  // Google calendar
  if (googleCalendars) {
    for (let googleCalendar of googleCalendars) {
      if (!googleCalendar.access_token) {
        continue;
      }

      // get events
      const events = await GoogleCalendarUtil.getUserCalendars(googleCalendar.access_token, googleCalendar.email);
      if (!events) {
        continue;
      }
      for (let event of events) {
        const start = new Date(event.start.dateTime);
        const end = new Date(event.end.dateTime);
        const eventIcs = ics.createEvent({
          start: [start.getFullYear(), start.getMonth() + 1, start.getDate(), start.getHours(), start.getMinutes()],
          end: [end.getFullYear(), end.getMonth() + 1, end.getDate(), end.getHours(), end.getMinutes()],
          title: event.summary,
          description: event.description,
          location: event.location,
          url: event.htmlLink,
          organizer: { name: event.organizer.displayName, email: event.organizer.email },
        });
        await BookingModel.create({
          calendar_id: calendar.calendar_id,
          title: event.title,
          priority: 'Fixed',
          ics_content: eventIcs.value
        }, userId);
      }
    }
  }

  return calendar;
};

const publish = async (userId, teamIds, res) => {
  //Get wallet address
  const walletAddress = await UserWalletModel.getUserWalletByUserId(userId);

  //Get bookings
  const calendar = await CalendarModel.getByUserId(userId);
  if (!calendar) {
    return res.status(400).json({ message: "Bad request" });
  }
  const bookings = await BookingModel.getsByCalendarId(calendar.calendar_id);

  //Create ics content
  await createIcsFile(bookings.map(e => ({ is_booking: e.is_booking, ics_content: e.ics_content })));

  //upload file to ipfs
  const icsFile = fs.readFileSync(`mycalendar.ics`);
  const icsCid = await ipfsService.uploadToIPFS(icsFile);

  //Create metadata to ipfs
  const metadata = {
    name: process.env.METADATA_NAME,
    description: process.env.METADATA_DESCRIPRION,
    external_url: `ipfs://${icsCid}`
  }
  fs.writeFileSync('metadata.json', JSON.stringify(metadata, null, 4));
  const metadataFile = fs.readFileSync(`metadata.json`);

  const metadataCid = await ipfsService.uploadToIPFS(metadataFile);

  const abi = [{
    "inputs": [
      {
        "internalType": "address",
        "name": "to",
        "type": "address"
      },
      {
        "internalType": "string",
        "name": "calendarId",
        "type": "string"
      },
      {
        "internalType": "string",
        "name": "tokenUri",
        "type": "string"
      },
      {
        "internalType": "string",
        "name": "calendarNftUri",
        "type": "string"
      },
      {
        "internalType": "string[]",
        "name": "teamIds",
        "type": "string[]"
      }
    ],
    "name": "publish",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }];
  let iface = new ethers.utils.Interface(abi);
  console.log({
    walletAddress, calendarId: calendar.calendar_id, metadataCid, icsCid, teamIds
  });
  const data = iface.encodeFunctionData("publish", [walletAddress, calendar.calendar_id, metadataCid, icsCid, teamIds]);

  return {
    data: data,
    from: walletAddress,
    to: process.env.CALENDAR_NFT_ADDRESS,
    gasLimit: Number(process.env.GAS_LIMIT || 400000),
    gasPrice: await web3Util.getGasPrice()
  }
}

async function createIcsFile(events) {
  // TO-DO: check events empty.
  // Start the ics file with the calendar header
  let icsContent = `BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//TimeDex//EN
`;

  for (const event of events) {
    if (!event.is_booking) {
      event.ics_content = event.ics_content.replace('END:VEVENT', `TITLE: 予定あり\nEND:VEVENT`);
    }
    icsContent += `${event.ics_content}`

  }

  // Add the calendar footer
  icsContent += `END:VCALENDAR`;


  // Keep some properties
  const propertiesToKeep = ['BEGIN', 'UID', 'SUMMARY', 'DESCRIPTION', 'DTSTART', 'DTEND', 'PRIORITY', 'LOCATION', 'TITLE', 'END'];

  const filteredContent = icsContent
    .split('\n')
    .filter(line => {
      const property = line.split(':')[0];
      return propertiesToKeep.includes(property);
    })
    .join('\n');


  // Write the ics file to disk
  fs.writeFileSync(`mycalendar.ics`, filteredContent);
}
module.exports = {
  get,
  getForUser,
  create,
  publish
};
