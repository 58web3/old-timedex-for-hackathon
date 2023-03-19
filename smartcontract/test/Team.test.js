// SPDX-License-Identifier: MIT
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Team", function () {
  let Team;
  let team;

  let owner;
  let addr1;
  let addr2;
  let addrs;

  beforeEach(async function () {
    Team = await ethers.getContractFactory("Team");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

    const teamMembers = [addr1.address, addr2.address];

    team = await Team.deploy("Team1", "MyTeam", teamMembers);
    await team.deployed();
  });

  describe("Deployment", function () {

    it("Should set the right team members", async function () {
      const members = await team.getMembers();

      expect(members.length).to.equal(2);
      expect(members[0].walletAddress).to.equal(addr1.address);
      expect(members[1].walletAddress).to.equal(addr2.address);
    });
  });

  describe("Functions", function () {
    it("Should update member info", async function () {
      await team.updateMember(addr1.address, true, "calendar1");

      const members = await team.getMembers();

      expect(members[0].acceptStatus).to.equal(true);
      expect(members[0].calendarId).to.equal("calendar1");
    });

    it("Should update team calendar info", async function () {
      const calendarId = "calendar1";
      const teamId = "Team1";
      const tokenId = 1;
      const tokenUri = "http://example.com/token";
      const calendarNftUri = "http://example.com/calendarNft";

      await team.updateMember(addr1.address, true, calendarId);

      await team.updateMemberCalendar(calendarId, teamId, tokenId, tokenUri, calendarNftUri);

      const calendars = await team.getLatestTeamNftContentUris();

      expect(calendars.length).to.equal(2);
      expect(calendars[0].calendarId).to.equal(calendarId);
      expect(calendars[0].teamId).to.equal(teamId);
      expect(calendars[0].tokenId.toNumber()).to.equal(tokenId);
      expect(calendars[0].tokenUri).to.equal(tokenUri);
      expect(calendars[0].calendarNftUri).to.equal(calendarNftUri);

    });
  });
});
