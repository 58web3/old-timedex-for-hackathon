const TeamSchema = new dynamoose.Schema(
  {
    team_id: {
      type: String,
      hashKey: true,
      required: true,
    },
    team_name: {
      type: String,
      required: true,
    },
    team_description: {
      type: String,
      required: false,
    },
    team_members: {
      type: Array,
      schema: [{
        type: Object,
        schema: {
          wallet_address: String,
          email: String,
          status: String,
          invite_expired_at: Number,
        }
      }],
      required: false,
    },
    dao_contract_address: {
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
      index: {
        name: 'createdByIndex',
        global: true,
      },
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

module.exports = TeamSchema;
