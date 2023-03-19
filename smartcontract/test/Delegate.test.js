// Delegate.test.js
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Delegate", () => {
  let Delegate, delegate, owner, addr1, addr2, addr3;

  beforeEach(async () => {
    Delegate = await ethers.getContractFactory("Delegate");
    [owner, addr1, addr2, addr3] = await ethers.getSigners();
    delegate = await Delegate.deploy();
    await delegate.deployed();
  });

  describe("delegateSet", () => {
    it("Should set a new delegation", async () => {
      await delegate.connect(addr1).delegateSet(addr2.address);
      const result = await delegate.connect(addr1).delegateGet(addr1.address, [addr2.address]);
      expect(result[0]).to.equal(0); // Unapproved status
    });

    it("Should revert if delegatee is the same as delegator", async () => {
      await expect(delegate.connect(addr1).delegateSet(addr1.address)).to.be.revertedWith("Cannot delegate to yourself");
    });
  });

  describe("delegateApprove", () => {
    beforeEach(async () => {
      await delegate.connect(addr1).delegateSet(addr2.address);
    });

    it("Should approve a delegation", async () => {
      await delegate.connect(addr2).delegateApprove(addr1.address);
      const result = await delegate.connect(addr1).delegateGet(addr1.address, [addr2.address]);
      expect(result[0]).to.equal(1); // Approved status
    });

    it("Should revert if the caller is not the delegatee", async () => {
      await expect(delegate.connect(addr3).delegateApprove(addr1.address)).to.be.revertedWith("You are not the delegatee");
    });

    it("Should revert if the delegation is already approved", async () => {
      await delegate.connect(addr2).delegateApprove(addr1.address);
      await expect(delegate.connect(addr2).delegateApprove(addr1.address)).to.be.revertedWith("Already approved");
    });
  });

  describe("delegateUnapprove", () => {
    beforeEach(async () => {
      await delegate.connect(addr1).delegateSet(addr2.address);
      await delegate.connect(addr2).delegateApprove(addr1.address);
    });

    it("Should unapprove a delegation", async () => {
      await delegate.connect(addr2).delegateUnapprove(addr1.address);
      const result = await delegate.connect(addr1).delegateGet(addr1.address, [addr2.address]);
      expect(result[0]).to.equal(0); // Unapproved status
    });

    it("Should revert if the caller is not the delegatee", async () => {
      await expect(delegate.connect(addr3).delegateUnapprove(addr1.address)).to.be.revertedWith("You are not the delegatee");
    });

    it("Should revert if the delegation is not approved", async () => {
      await delegate.connect(addr2).delegateUnapprove(addr1.address);
      await expect(delegate.connect(addr2).delegateUnapprove(addr1.address)).to.be.revertedWith("Not approved");
    });
  });

  describe("delegateGet", () => {
    beforeEach(async () => {
      await delegate.connect(addr1).delegateSet(addr2.address);
      await delegate.connect(addr2).delegateApprove(addr1.address);
    });

     it("Should return the correct status for a given delegator and delegatees", async () => {
      const result = await delegate.connect(addr1).delegateGet(addr1.address, [addr2.address]);
      expect(result[0]).to.equal(1); // Approved status
    });

    it("Should return the correct status for multiple delegatees", async () => {
      await delegate.connect(addr1).delegateSet(addr3.address);
      await delegate.connect(addr3).delegateApprove(addr1.address);
      const result = await delegate.connect(addr1).delegateGet(addr1.address, [addr2.address, addr3.address]);
      expect(result[0]).to.equal(1); // Approved status for addr2
      expect(result[1]).to.equal(1); // Approved status for addr3
    });
  });
});