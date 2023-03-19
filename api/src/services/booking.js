const CalendarModel = require("../models/calendar");
const BookingModel = require("../models/booking");
const UserModel = require("../models/user");

const ics = require('ics');

const create = async function (bookingData, userId, res) {
  const calendar = await CalendarModel.getByKey(bookingData.calendar_id);
  if (!calendar) {
    return res.status(404).json({ message: 'Not Found' });
  }

  const booking = await BookingModel.create({
    calendar_id: bookingData.calendar_id,
    title: bookingData.title,
    priority: bookingData.priority,
    attendees: bookingData.attendees,
    is_booking: true
  }, userId);
  
  const eventIcs = ics.createEvent({
    start: handleTime(bookingData.start),
    end: handleTime(bookingData.end),
    title: bookingData.title,
    description: bookingData.summary,
  });

  booking.ics_content = handleIcsContent(eventIcs.value, booking.booking_id, booking.priority);
  await BookingModel.update(booking, userId);
  return booking.booking_id;
};

// This function takes a date string in the format 'YYYYMMDDTHHMMSSZ'
// and returns an array of [year, month, date, hours, minutes].
const handleTime = (dateString) => {
  const year = parseInt(dateString.substr(0, 4));
  const month = parseInt(dateString.substr(4, 2)) - 1;
  const date = parseInt(dateString.substr(6, 2));
  const hours = parseInt(dateString.substr(9, 2));
  const minutes = parseInt(dateString.substr(11, 2));

  const dateArray = [year, month, date, hours, minutes];
  return dateArray;
};

// Add booking id and priority
const handleIcsContent = (icsContent, bookingId, priority ) => {
  const properties = [
    `BOOKING_ID: ${bookingId}`,
    `PRIORITY: ${priority}`,
  ];

  for (const prop of properties) {
    icsContent = icsContent.replace('END:VEVENT', `${prop}\nEND:VEVENT`);
  }
  const lastEventIndex = icsContent.lastIndexOf('END:VEVENT');
  const eventContent = icsContent.substring(icsContent.indexOf('BEGIN:VEVENT'), lastEventIndex + 'END:VEVENT'.length);

  return eventContent + `\n`;
}


module.exports = {
  create,
};
