# Calendar Indexer
## Requirement
Record calendar information and make it searchable

### Contract name
CalendarIndexer.sol

### Struct: Calendar
- calendarId: string
- teamId: string
- tokenId: uint256
- tokenUri: string
- calendarNftUri

### State variables
- _calendars: mapping(string => Calendar) private
- _teamCalendars: mapping(string => Calendar[]) private

### Method: addOrUpdateCalendar 
#### Parameters
- calendarId: string
- teamId: string
- tokenId: uint256
- tokenUri: string
- calendarNftUri
  
#### Processing Details
1. Create new Calendar object
2. _calendars[calendarId] = Calendar object

### Method: getCalendar 
#### Parameters
- calendarId: string

#### Processing Details
1. Use _calendars[calendarId] to get Calendar object and return

