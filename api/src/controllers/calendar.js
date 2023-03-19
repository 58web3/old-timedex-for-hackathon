const CalendarService = require("../services/calendar");
const GoogleCalendar = require("../util/google_calendar")

const get = async function (req, res) {
  try {
    // get parameter
    const teamId = req.query.team_id;
  
    const calendars = await CalendarService.get(teamId);
  
    res.status(200).json(calendars);
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}

const getForUser = async function (req, res) {
  try {
    // get parameter
    const calendarId = req.params.calendar_id;

    const calendars = await CalendarService.getForUser(calendarId);

    res.status(200).json(calendars);
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}

const create = async function (req, res) {
  try {
    // get parameter
    const userId = req.user_id || '';
    const icsContents = req.body.ics_contents;
    const googleCalendars = req.body.google_calendars;
    // return response
    const calendar = await CalendarService.create(icsContents, googleCalendars, userId);
    res.status(200).json({
      message: 'Success',
      calendar_id: calendar.calendar_id
    });
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

const publish = async function (req, res) {
  try {
    const userId = req.user_id || '';
    const teamIds = req.body.team_ids || [];

    const result = await CalendarService.publish(userId, teamIds, res);

    if (result.statusCode >= 400) {
      return result;
    }
    res.status(200).json({
      message: 'Success',
      transcation_data: result
    });

  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}

module.exports = {
  get,
  getForUser,
  create,
  publish
};
