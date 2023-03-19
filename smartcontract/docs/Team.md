# Team
Manage team 

### Contract name
Team.sol

### Struct: Member
- walletAddress: string
- acceptStatus: bool
- calendarId: string

### State variables
- _teamId: string private
- _teamName: string private
- _calendars: mapping(string => Calendar) private
- _members: Member[] private

### Constructor
#### Parameters
- teamId: string
- teamName: string
- teamMembers: string[]

#### Processing Details
1. Set this._teamId = teamId
2. Set this._teamName = teamName
3. Loop teamMembers as teamMemberWalletAddress
  3.1. Create new Member as member
  3.2. Set member.walletAddress = teamMemberWalletAddress
  3.3. Push member to _members

### Method: getMembers 
#### Parameters
  
#### Processing Details
1. return _members

### Method: getLatestTeamNftContentUris 
#### Parameters
  
#### Processing Details
1. Create a new array as teamCalendars
2. Loop _members
3. Use _calendars[member.calendarId] to get Calendar object
4. Add Calendar object to teamCalendars
5. Return teamCalendars

### Method: updateMember
#### Parameters
- walletAddress: address
- acceptStatus: bool
- calendarId: string

#### Processing Details
1. Loop _members
2. If member.walletAddress = walletAddress, update member info
   1. Set member.calendarId = calendarId
   2. Set member.acceptStatus = acceptStatus

### Method: updateMemberCalendar 
#### Parameters
- calendarId: string
- teamId: string
- tokenId: uint256
- tokenUri: string
- calendarNftUri: string

#### Processing Details
- Get _calendars[calendarId] as calendar
- Set calendar.calendarId = calendarId
- Set calendar.teamId = teamId
- Set calendar.tokenId = tokenId
- Set calendar.tokenUri = tokenUri
- Set calendar.calendarNftUri = calendarNftUri

