// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {
    enum DelegateStatus { Unapproved, Approved }

    struct Delegation {
        address delegator;
        address delegatee;
        DelegateStatus status;
    }

    // delegator => delegatee => Delegation
    mapping(address => mapping(address => Delegation)) private delegations;

    function delegateSet(address delegatee) public {
        require(delegatee != msg.sender, "Cannot delegate to yourself");

        delegations[msg.sender][delegatee] = Delegation({
            delegator: msg.sender,
            delegatee: delegatee,
            status: DelegateStatus.Unapproved
        });
    }

    function delegateApprove(address delegator) public {
        require(delegations[delegator][msg.sender].delegatee == msg.sender, "You are not the delegatee");
        require(delegations[delegator][msg.sender].status == DelegateStatus.Unapproved, "Already approved");

        delegations[delegator][msg.sender].status = DelegateStatus.Approved;
    }

    function delegateUnapprove(address delegator) public {
        require(delegations[delegator][msg.sender].delegatee == msg.sender, "You are not the delegatee");
        require(delegations[delegator][msg.sender].status == DelegateStatus.Approved, "Not approved");

        delegations[delegator][msg.sender].status = DelegateStatus.Unapproved;
    }

    function delegateGet(address delegator, address[] memory delegatees) public view returns (DelegateStatus[] memory) {
        uint256 delegateesCount = delegatees.length;
        DelegateStatus[] memory statuses = new DelegateStatus[](delegateesCount);

        for (uint256 i = 0; i < delegateesCount; i++) {
            statuses[i] = delegations[delegator][delegatees[i]].status;
        }

        return statuses;
    }
}
