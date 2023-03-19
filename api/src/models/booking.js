const BookingSchema = require("../schemas/booking");
const moment = require('moment');

// Get model using schema
const Booking = dynamoose.model("Booking", BookingSchema);

const create = async (bookingData, userId) => {
  const systemDate = new Date().getTime();

  return await Booking.create({
    calendar_id: bookingData.calendar_id,
    booking_id: `${moment().format('yyyyMMDD[T]HHmmss')}${randomNumber(5)}`,
    title: bookingData.title,
    priority: bookingData.priority,
    attendees: bookingData.attendees,
    ics_content: bookingData.ics_content,
    is_booking: bookingData.is_booking,
    created_at: systemDate,
    created_by: userId,
    updated_at: systemDate,
    updated_by: userId,
    delete_flg: false,
  });
};

const update = async (bookingData, userId) => {
  const systemDate = new Date().getTime();

  return await Booking.update({
    calendar_id: bookingData.calendar_id,
    booking_id: bookingData.booking_id
  },{
    title: bookingData.title,
    priority: bookingData.priority,
    attendees: bookingData.attendees,
    ics_content: bookingData.ics_content,
    is_booking: bookingData.is_booking,
    updated_at: systemDate,
    updated_by: userId,
    delete_flg: false,
  });
};

const getsByCalendarId = async (calendarId) => {
  return await Booking.query('calendar_id').eq(calendarId).limit(250).exec();
}

const randomNumber = (length = 5) => {
  let result = '';
  const characters = '0123456789';
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }

  return result;
}
module.exports = {
  create,
  update,
  getsByCalendarId,
  Booking
};
