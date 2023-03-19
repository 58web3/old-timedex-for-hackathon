const uuid = require('uuid');
const TeamSchema = require("../schemas/team");
const UserModel = require('./user');
const UserWalletModel = require('./user_wallet');

// Get model using schema
const Team = dynamoose.model("Team", TeamSchema);

const create = async (team, userId) => {
  const systemDate = new Date().getTime();
  const teamId = uuid.v4();

  for (const member of team.team_members) {
    const userWallet = await UserWalletModel.getUserWalletByWalletAddress(member);
    if (!userWallet) continue;

    const user = await UserModel.getUserByKey(userWallet.user_id);

    if (user) {
      user.team_ids.push(teamId);
      await UserModel.update(user, userId);
    }
  }

  return await Team.create({
    team_id: teamId,
    team_name: team.team_name,
    team_description: team.team_description,
    team_members: team.team_members.map(e => ({
      wallet_address: e?.toLowerCase(),
    })),
    dao_contract_address: team.dao_contract_address,
    created_at: systemDate,
    created_by: userId,
    updated_at: systemDate,
    updated_by: userId,
    delete_flg: false,
  });
};

const getTeams = async (teamIds) => {
  const condition = new dynamoose.Condition()
    .where("team_id").in([...teamIds]);

  const teams = teamIds.length > 0 ? await Team.scan(condition).exec() : [];
  return teams;
}

const getByKey = async (teamId) => {
  const team = await Team.get({ team_id: teamId });
  if (!team) return null;

  return {
    team_id: team.team_id,
    team_name: team.team_name,
    team_description: team.team_description,
    team_members: team.team_members.map(e => ({ wallet_address: e.wallet_address?.toLowerCase() })),
    created_at: team.created_at,
    created_by: team.created_by,
    updated_at: team.updated_at,
    updated_by: team.updated_by,
    delete_flg: team.delete_flg
  }
}

const update = async (teamData, userId) => {
  const systemDate = new Date().getTime();
  const oldTeam = await getByKey(teamData.team_id);
  const removeMembers = oldTeam.team_members.filter(x => !teamData.team_members.find(y => y.toLowerCase() == x.wallet_address?.toLowerCase()))
  const addMembers = teamData.team_members.filter(x => !oldTeam.team_members.find(y => y.wallet_address?.toLowerCase() == x?.toLowerCase()));

  const team = Team.update({
    team_id: teamData.team_id
  }, {
    team_name: teamData.team_name,
    team_description: teamData.team_description,
    team_members: teamData.team_members.map(e => ({ wallet_address: e?.toLowerCase() })),
    dao_contract_address: teamData.dao_contract_address,
    updated_at: systemDate,
    updated_by: userId,
  });

  for (const member of removeMembers) {
    const userWallet = await UserWalletModel.getUserWalletByWalletAddress(member.wallet_address);
    if (!userWallet) continue;

    const user = await UserModel.getUserByKey(userWallet.user_id);
    if (user) {
      user.team_ids = user.team_ids.filter(e => e !== teamData.team_id);
      await UserModel.update(user, userId);
    }
  }

  for (const member of addMembers) {
    const userWallet = await UserWalletModel.getUserWalletByWalletAddress(member);
    if (!userWallet) continue;

    const user = await UserModel.getUserByKey(userWallet.user_id);
    if (user) {
      user.team_ids.push(teamData.team_id);
      await UserModel.update(user, userId);
    }
  }

  return team;
}

module.exports = {
  create,
  getTeams,
  getByKey,
  update,
  Team,
};
