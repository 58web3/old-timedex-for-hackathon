const CalendarSchema = new dynamoose.Schema(
  {
    calendar_id: {
      type: String,
      hashKey: true,
      required: true,
    },
    booking_id: {
      type: String,
      rangeKey: true,
      required: false,
    },
    title: {
      type: String,
      required: false,
    },
    priority: {
      type: String,
      required: false,
    },
    attendees: {
      type: Array,
      schema: [String],
      required: false,
    },
    ics_content: {
      type: String,
      required: false,
    },
    is_booking: {
      type: Boolean,
      required: false,
    },
    created_at: {
      type: Number,
      required: false,
    },
    created_by: {
      type: String,
      required: false,
    },
    updated_at: {
      type: Number,
      required: false,
    },
    updated_by: {
      type: String,
      required: false,
    },
    delete_flg: {
      type: Boolean,
      required: false,
    },
  },
  {
    timestamps: false,
  }
);

module.exports = CalendarSchema;
