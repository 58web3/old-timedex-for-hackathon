const CalendarSchema = new dynamoose.Schema(
  {
    calendar_id: {
      type: String,
      hashKey: true,
      required: true,
    },
    user_id: {
      type: String,
      required: false,
      index: {
        name: 'userIdIndex',
        global: true,
      },
    },
    calendar_nft: {
      type: String,
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
