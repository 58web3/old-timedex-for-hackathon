// SPDX-License-Identifier: MIT
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("CalendarIndexer", function () {
  let calendarIndexer;

  beforeEach(async () => {
    const CalendarIndexer = await ethers.getContractFactory("CalendarIndexer");
    calendarIndexer = await CalendarIndexer.deploy();
    await calendarIndexer.deployed();
  });

  it("should add a new calendar", async function () {
    const calendarId = "cal-123";
    const teamId = "team-456";
    const tokenId = 123;
    const tokenUri = "http://example.com/token";
    const calendarNftUri = "http://example.com/calendarNft";

    await calendarIndexer.addOrUpdateCalendar(calendarId, teamId, tokenId, tokenUri, calendarNftUri);

    const calendar = await calendarIndexer.getCalendar(calendarId);
    expect(calendar.teamId).to.equal(teamId);
    expect(calendar.tokenId.toNumber()).to.equal(tokenId);
    expect(calendar.tokenUri).to.equal(tokenUri);
    expect(calendar.calendarNftUri).to.equal(calendarNftUri);
  });

  it("should update an existing calendar", async function () {
    const calendarId = "cal-123";
    const teamId = "team-456";
    const tokenId = 123;
    const tokenUri = "http://example.com/token";
    const calendarNftUri = "http://example.com/calendarNft";

    await calendarIndexer.addOrUpdateCalendar(calendarId, teamId, tokenId, tokenUri, calendarNftUri);

    const newTeamId = "team-789";
    const newTokenId = 456;
    const newTokenUri = "http://example.com/token2";
    const newCalendarNftUri = "http://example.com/calendarNft2";

    await calendarIndexer.addOrUpdateCalendar(calendarId, newTeamId, newTokenId, newTokenUri, newCalendarNftUri);

    const calendar = await calendarIndexer.getCalendar(calendarId);
    expect(calendar.teamId).to.equal(newTeamId);
    expect(calendar.tokenId.toNumber()).to.equal(newTokenId);
    expect(calendar.tokenUri).to.equal(newTokenUri);
    expect(calendar.calendarNftUri).to.equal(newCalendarNftUri);
  });
});
