const uuid = require('uuid');
const DelegatorSchema = require("../schemas/delegator");

// Get model using schema
const Delegator = dynamoose.model("Delegator", DelegatorSchema);

const getByKey = async (userId) => {
  return await Delegator.get({user_id: userId});
}

const upsert = async (delegatorData, userId) => {
  const systemDate = new Date().getTime();
  const delegator = await Delegator.get({ user_id: delegatorData.user_id });

  if (!delegator) {
    return await Delegator.create({
      user_id: delegatorData.user_id,
      delegate_from_users: delegatorData?.delegate_from_users || [],
      delegate_to_users: delegatorData?.delegate_to_users || [],
      created_at: systemDate,
      created_by: userId,
      updated_at: systemDate,
      updated_by: userId,
      delete_flg: false
    });
  }
  return await Delegator.update({
    user_id: delegatorData.user_id,
  }, {
    delegate_from_users: delegatorData?.delegate_from_users || [],
    delegate_to_users: delegatorData?.delegate_to_users || [],
    updated_at: systemDate,
    updated_by: userId,
  });
};


module.exports = {
  getByKey,
  upsert
};
