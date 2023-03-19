const Joi = require('@hapi/joi');

module.exports.createUser = Joi.object({
  nickname: Joi.string().required(),
  email: Joi.string().required(),
  wallet_address: Joi.string().required(),
});

module.exports.updateUser = Joi.object({
  nickname: Joi.string().required(),
  email: Joi.string().required(),
});

module.exports.createDelegator = Joi.object({
  delegators: Joi.array().items(Joi.string())
});
module.exports.generateNonce = Joi.object({
  wallet_address: Joi.string().required(),
});

module.exports.createTeam = Joi.object({
  team_name: Joi.string().required(),
  team_description: Joi.string().max(500).allow(null, ''),
  team_members: Joi.array().items(Joi.string()),
});

module.exports.updatedTeam = Joi.object({
  team_name: Joi.string().required(),
  team_description: Joi.string().max(500).allow(null, ''),
  team_members: Joi.array().items(Joi.string()),
});

module.exports.createCalendar = Joi.object({
  google_calendars: Joi.array().items(Joi.object()),
  outlook_calendars: Joi.array().items(Joi.string()),
  ics_contents: Joi.array().items(Joi.string()),
});

module.exports.createBooking = Joi.object({
  title: Joi.string().required(),
  start: Joi.string().required(),
  end: Joi.string().required(),
  priority: Joi.string().required(),
  attendees: Joi.array().items(Joi.string()),
  summary: Joi.string().required(),
});

module.exports.publish = Joi.object({
  team_ids: Joi.array().items(Joi.string()),
});

module.exports.login = Joi.object({
  signature: Joi.string().max(500).required(),
  wallet_address: Joi.string().max(42).required(),
});

module.exports.sendTransaction = Joi.object({
  raw_transaction: Joi.string().max(10000).required(),
  type: Joi.string().max(50).allow(null, ''),
});
