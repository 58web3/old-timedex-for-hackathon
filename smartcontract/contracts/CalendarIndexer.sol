// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CalendarIndexer {
    struct Calendar {
        string calendarId;
        string teamId;
        uint256 tokenId;
        string tokenUri;
        string calendarNftUri;
    }

    mapping(string => Calendar) private _calendars;
    mapping(string => Calendar[]) private _teamCalendars;

    function addOrUpdateCalendar(
        string calldata calendarId,
        string calldata teamId,
        uint256 tokenId,
        string calldata tokenUri,
        string calldata calendarNftUri
    ) external {
        Calendar memory newCalendar = Calendar(
            calendarId,
            teamId,
            tokenId,
            tokenUri,
            calendarNftUri
        );
        _calendars[calendarId] = newCalendar;
        _teamCalendars[teamId].push(newCalendar);
    }

    function getCalendar(string memory calendarId)
        public
        view
        returns (Calendar memory)
    {
        return _calendars[calendarId];
    }
}
