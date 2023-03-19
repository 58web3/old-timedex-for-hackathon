# TeamFactory
## Requirement
Team factory as a factory pattern.

Import Team smart contract.

### Contract name
TeamFactory.sol

### State variables
- _teamAddresses: mapping(string => address) private

### Method: createTeam 
#### Parameters
- teamId: string
- teamName: string
- teamMembers: string[]
  
#### Processing Details
1. Create new Team
2. _teamAddresses[team_id] = address of created team
3. Return address of created team


### Method: getTeamAddress 
#### Parameters
- teamId: string
  
#### Processing Details
1. Return _teamAddresses[team_id]




