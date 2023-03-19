# Delegate

### Contract name
Delegate.sol

### Struct

```
struct Delegation {
    address delegator;
    address delegatee;
    DelegateStatus status;
}

```

```

enum DelegateStatus { Unapproved, Approved }
mapping(address => mapping(address => Delegation)) private delegations;

```

### Constructor
None


### Method: delegateSet
#### Parameters
- address delegatee
#### Processing Details
- Sets a new delegation for the sender (msg.sender) with the specified delegatee.
- The initial status of the delegation is set to Unapproved.

### Method: delegateApprove
#### Parameters
- address delegator

#### Processing Details
- Approves the delegation for the specified delegator.
- Requires the caller (msg.sender) to be the delegatee of the delegation.
- Requires the delegation status to be Unapproved.
- Sets the delegation status to Approved.

### Method: delegateUnapprove
#### Parameters
- address delegator

#### Processing Details
- Unapproves the delegation for the specified delegator.
- Requires the caller (msg.sender) to be the delegatee of the delegation.
- Requires the delegation status to be Approved.
- Sets the delegation status to Unapproved.

### Method: delegateGet
#### Parameters
- address delegator
- address[] memory delegatees

#### Processing Details
- Returns an array of DelegateStatus for the specified delegator and delegatees.
- The returned array contains the status of each delegatee in the delegatees array for the given delegator.