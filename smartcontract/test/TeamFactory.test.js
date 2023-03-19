const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TeamFactory", function() {
  let teamFactory;
  let team;

  it("should create a team", async function() {
    const [member1, member2] = await ethers.getSigners();

    const TeamFactory = await ethers.getContractFactory("TeamFactory");
    teamFactory = await TeamFactory.deploy();
    await teamFactory.deployed();

    const tx = await teamFactory.createTeam("TeamId", "TeamName", [member1.address, member2.address]);
    const receipt = await tx.wait();

    expect(receipt.status).to.equal(1);
  });
});
