const BookingService = require("../services/booking");

const create = async function (req, res) {
  try {
    // get parameter
    const userId = req.user_id || '';
    const calendarId = req.params.calendar_id;

    const bookingData = {
      ...req.body,
      calendar_id: calendarId,
    }

    const result = await BookingService.create(bookingData, userId, res);

    if (result.statusCode >= 400) {
      return result;
    }

    res.status(200).json({
      message: "Success",
      booking_id: result
    });
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

module.exports = {
  create,
};
