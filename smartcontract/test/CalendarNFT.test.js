const chai = require('chai');
const { solidity } = require('ethereum-waffle');

chai.use(solidity);
const expect = chai.expect;

describe("CalendarNFT", function () {
  let owner;
  let user1;
  let user2;
  let calendarNFT;

  beforeEach(async function () {
    [owner, user1, user2] = await ethers.getSigners();

    const CalendarNFT = await ethers.getContractFactory('CalendarNFT', user1);
    calendarNFT = await upgrades.deployProxy(CalendarNFT, [
      "name", "symbol", 2
    ]);
    await calendarNFT.deployed();
  });

  describe("mint", function () {
    it("should fail if the address to is invalid", async function () {
      await expect(
        calendarNFT.mint(
          ethers.constants.AddressZero,
        )
      ).to.be.revertedWith("");
    });
  });

  describe("setTokenUri", function () {
    it("should fail if the caller is not the owner", async function () {
      await expect(
        calendarNFT.connect(user1).setTokenUri(0, "newTokenUri", "newCalendarNFTUri")
      ).to.be.revertedWith("");
    });
  })
});
