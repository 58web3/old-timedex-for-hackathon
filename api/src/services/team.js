const TeamModel = require("../models/team");
const UserModel = require("../models/user");
const UserWalletModel = require("../models/user_wallet");
const web3Util = require("../util/web3");
const { ethers } = require('ethers');

const create = async function (teamData, userId) {
  const team = await TeamModel.create(teamData, userId);

  // call contract
  const abi = [
    // Add other functions here if necessary
    {
      inputs: [
        // Add other inputs here if necessary
        {
          internalType: "string",
          name: "teamId",
          type: "string",
        },
        {
          internalType: "string",
          name: "teamName",
          type: "string",
        },
        {
          internalType: "address[]",
          name: "teamMembers",
          type: "address[]",
        },
      ],
      name: "createTeam",
      outputs: [
        {
          internalType: "address",
          name: "",
          type: "address",
        },
      ],
      stateMutability: "nonpayable",
      type: "function",
    },
  ];

  let iface = new ethers.utils.Interface(abi);
  const data = iface.encodeFunctionData("createTeam", [
    team.team_id,
    team.team_name,
    team.team_members
    // team.team_members.map(e => e.wallet_address),
  ]);

  //Get wallet address
  const walletAddress = await UserWalletModel.getUserWalletByUserId(userId);

  return {
    team_id: team.team_id,
    transaction_data: {
      data: data,
      from: walletAddress,
      to: process.env.TEAM_FACTORY_ADDRESS,
      gasLimit: Number(process.env.GAS_LIMIT || 400000),
      gasPrice: await web3Util.getGasPrice(),
    },
  };
};

const getTeams = async function (userId) {
  const user = await UserModel.getUserByKey(userId);
  const teams = await TeamModel.getTeams(user.team_ids);

  return teams.map((t) => ({
    team_id: t.team_id,
    team_name: t.team_name,
    team_description: t.team_description,
    team_members: t.team_members,
    created_at: t.created_at,
    created_by: t.created_by,
    updated_at: t.updated_at,
    updated_by: t.updated_by,
    delete_flg: t.delete_flg,
  }));
};

const getByKey = async function (teamId) {
  const team = await TeamModel.getByKey(teamId);

  return team;
};

const update = async function (teamData, userId, res) {
  const team = await getByKey(teamData.team_id);
  if (!team) return res.status(404).json({ message: "Not found" });

  if (team.created_by != userId) {
    return res.status(403).json({ message: "Forbidden" });
  }

  if (teamData.team_name) team.team_name = teamData.team_name;
  if (teamData.team_description)
    team.team_description = teamData.team_description;
  if (teamData.team_members) team.team_members = teamData.team_members;

  return await TeamModel.update(team, userId);
};

const updateTeamMembers = async function (teamId, membersData, userId) {
  const team = await getByKey(teamId);
  if (!team) throw new Error("Team not found");

  if (team.created_by != userId) {
    throw new Error("Forbidden");
  }

  team.team_members = membersData;
  return await TeamModel.update(team, userId);
}

const updateMemberStatus = async function (teamId, memberId, newStatus, userId) {
  const team = await getByKey(teamId);
  if (!team) throw new Error("Team not found");

  if (team.created_by != userId) {
    throw new Error("Forbidden");
  }

  const memberIndex = team.team_members.findIndex(m => m.member_id === memberId);
  if (memberIndex === -1) {
    throw new Error("Member not found");
  }

  if (newStatus !== 'Approved' && newStatus !== 'Unapproved') {
    throw new Error("Invalid status");
  }

  team.team_members[memberIndex].status = newStatus;
  return await TeamModel.update(team, userId);
};

const updateBlockchainData = async function (teamId, userId) {
  const team = await getByKey(teamId);
  if (!team) throw new Error("Team not found");

  const abi = [
    // Add other functions here if necessary
    {
      inputs: [
        // Add other inputs here if necessary
        {
          internalType: "string",
          name: "teamId",
          type: "string",
        },
        {
          internalType: "string",
          name: "teamName",
          type: "string",
        },
        {
          internalType: "address[]",
          name: "teamMembers",
          type: "address[]",
        },
      ],
      name: "updateTeam",
      outputs: [
        {
          internalType: "address",
          name: "",
          type: "address",
        },
      ],
      stateMutability: "nonpayable",
      type: "function",
    },
  ];

  let iface = new ethers.utils.Interface(abi);
  const data = iface.encodeFunctionData("updateTeam", [
    team.team_id,
    team.team_name,
    team.team_members.map(e => e.wallet_address),
  ]);

  // Get wallet address
  const walletAddress = await UserWalletModel.getUserWalletByUserId(userId);

  return {
    team_id: team.team_id,
    transaction_data: {
      data: data,
      from: walletAddress,
      to: process.env.TEAM_FACTORY_ADDRESS,
      gasLimit: Number(process.env.GAS_LIMIT || 400000),
      gasPrice: await web3Util.getGasPrice(),
    },
  };
};

module.exports = {
  create,
  getTeams,
  getByKey,
  update,
  updateTeamMembers,
  updateMemberStatus,
  updateBlockchainData,
};


