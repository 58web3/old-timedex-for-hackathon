global.dynamoose = require('../../src/init_dynamoose');
const TeamService = require("../../src/services/team");
const TeamModel = require("../../src/models/team");
const UserModel = require("../../src/models/user");
const UserWalletModel = require("../../src/models/user_wallet");
const web3Util = require("../../src/util/web3");

const testUserId = "user12345";
const testTeamId = "team12345";
const testMemberId = "member12345";
const testWalletAddress = "0x3535353535353535353535353535353535353535";

const testTeamData = {
  team_id: testTeamId,
  team_name: "Test Team",
  team_description: "Test Team Description",
  created_by: testUserId,
  team_members: [
    {
      member_id: testMemberId,
      status: "Approved",
      wallet_address: testWalletAddress,
    },
  ],
};

describe("TeamService", () => {
  beforeEach(() => {
    jest.clearAllMocks();
  });

  test("create", async () => {
    TeamModel.create = jest.fn().mockResolvedValue(testTeamData);
    UserWalletModel.getUserWalletByUserId = jest.fn().mockResolvedValue(testWalletAddress);
    web3Util.getGasPrice = jest.fn().mockResolvedValue(20);

    // TODO
    // const result = await TeamService.create(testTeamData, testUserId);

    // expect(TeamModel.create).toHaveBeenCalledWith(testTeamData, testUserId);
    // expect(result.team_id).toBe(testTeamId);
  });

  test("getTeams", async () => {
    UserModel.getUserByKey = jest.fn().mockResolvedValue({ team_ids: [testTeamId] });
    TeamModel.getTeams = jest.fn().mockResolvedValue([testTeamData]);

    const result = await TeamService.getTeams(testUserId);

    expect(UserModel.getUserByKey).toHaveBeenCalledWith(testUserId);
    expect(TeamModel.getTeams).toHaveBeenCalledWith([testTeamId]);
    expect(result).toHaveLength(1);
    expect(result[0].team_id).toBe(testTeamId);
  });

  test("getByKey", async () => {
    TeamModel.getByKey = jest.fn().mockResolvedValue(testTeamData);

    const result = await TeamService.getByKey(testTeamId);

    expect(TeamModel.getByKey).toHaveBeenCalledWith(testTeamId);
    expect(result.team_id).toBe(testTeamId);
  });

  test("update", async () => {
    TeamModel.getByKey = jest.fn().mockResolvedValue(testTeamData);
    TeamModel.update = jest.fn().mockResolvedValue(testTeamData);

    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };

    const result = await TeamService.update(testTeamData, testUserId, res);

    expect(TeamModel.getByKey).toHaveBeenCalledWith(testTeamData.team_id);
    expect(TeamModel.update).toHaveBeenCalledWith(testTeamData, testUserId);
    expect(result.team_id).toBe(testTeamId);
  });

  test("updateTeamMembers", async () => {
    TeamModel.getByKey = jest.fn().mockResolvedValue(testTeamData);
    TeamModel.update = jest.fn().mockResolvedValue(testTeamData);

    const membersData = testTeamData.team_members;
    const result = await TeamService.updateTeamMembers(testTeamId, membersData, testUserId);

    expect(TeamModel.getByKey).toHaveBeenCalledWith(testTeamId);
    expect(TeamModel.update).toHaveBeenCalledWith(testTeamData, testUserId);
    expect(result.team_id).toBe(testTeamId);
  });

  test("updateMemberStatus", async () => {
    TeamModel.getByKey = jest.fn().mockResolvedValue(testTeamData);
    TeamModel.update = jest.fn().mockResolvedValue(testTeamData);

    const newStatus = "Approved";
    const result = await TeamService.updateMemberStatus(testTeamId, testMemberId, newStatus, testUserId);
    expect(TeamModel.getByKey).toHaveBeenCalledWith(testTeamId);
    expect(TeamModel.update).toHaveBeenCalledWith(testTeamData, testUserId);
    expect(result.team_id).toBe(testTeamId);
  });

  test("updateBlockchainData", async () => {
    TeamModel.getByKey = jest.fn().mockResolvedValue(testTeamData);
    UserWalletModel.getUserWalletByUserId = jest.fn().mockResolvedValue(testWalletAddress);
    web3Util.getGasPrice = jest.fn().mockResolvedValue(20);

    const result = await TeamService.updateBlockchainData(testTeamId, testUserId);

    expect(TeamModel.getByKey).toHaveBeenCalledWith(testTeamId);
    expect(result.team_id).toBe(testTeamId);
  });
});
