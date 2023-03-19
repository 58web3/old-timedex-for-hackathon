const uuid = require('uuid');
const CalendarSchema = require("../schemas/calendar");

// Get model using schema
const Calendar = dynamoose.model("Calendar", CalendarSchema);

const create = async (userId) => {
  const systemDate = new Date().getTime();
  const calendarId = uuid.v4();

  return await Calendar.create({
    user_id: userId,
    calendar_id: calendarId,
    created_at: systemDate,
    created_by: userId,
    updated_at: systemDate,
    updated_by: userId,
    delete_flg: false,
  });
};

const getByKey = async (calendarId) => {
  return await Calendar.get({
    calendar_id: calendarId
  });
}

const getByUserId = async (userId) => {
  const condition = new dynamoose.Condition().where("user_id").eq(userId);
  const calendars = await Calendar.scan(condition).exec();
  if (calendars.count > 0) {
    return calendars.toJSON()[0];
  }
  return null;
};

module.exports = {
  create,
  getByKey,
  getByUserId,
  Calendar
};
