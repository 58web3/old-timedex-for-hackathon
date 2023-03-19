const DelegatorSchema = new dynamoose.Schema(
  {
    user_id: {
      type: String,
      hashKey: true,
      required: true,
    },
    delegate_from_users: {
      type: Array,
      schema: [String],
      required: false,
    },
    delegate_to_users: {
      type: Array,
      schema: [String],
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

module.exports = DelegatorSchema;
