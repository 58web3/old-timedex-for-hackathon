// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Team {
    struct Member {
        address walletAddress;
        bool acceptStatus;
        string calendarId;
    }

    struct Calendar {
        string calendarId;
        string teamId;
        uint256 tokenId;
        string tokenUri;
        string calendarNftUri;
    }

    string private _teamId;
    string private _teamName;
    mapping(string => Calendar) private _calendars;
    Member[] private _members;

    constructor(
        string memory teamId,
        string memory teamName,
        address[] memory teamMembers
    ) {
        _teamId = teamId;
        _teamName = teamName;

        for (uint256 i = 0; i < teamMembers.length; i++) {
            Member memory member = Member(teamMembers[i], false, "");
            _members.push(member);
        }
    }

    function getMembers() public view returns (Member[] memory) {
        return _members;
    }

    function getLatestTeamNftContentUris()
        public
        view
        returns (Calendar[] memory)
    {
        Calendar[] memory teamCalendars = new Calendar[](_members.length);

        for (uint256 i = 0; i < _members.length; i++) {
            teamCalendars[i] = _calendars[_members[i].calendarId];
        }

        return teamCalendars;
    }

    function updateMember(
        address walletAddress,
        bool acceptStatus,
        string memory calendarId
    ) public {
        for (uint256 i = 0; i < _members.length; i++) {
            if (
                _members[i].walletAddress == walletAddress
            ) {
                _members[i].acceptStatus = acceptStatus;
                _members[i].calendarId = calendarId;
                break;
            }
        }
    }

    function updateMemberCalendar(
        string memory calendarId,
        string memory teamId,
        uint256 tokenId,
        string memory tokenUri,
        string memory calendarNftUri
    ) public {
        Calendar storage calendar = _calendars[calendarId];
        calendar.calendarId = calendarId;
        calendar.teamId = teamId;
        calendar.tokenId = tokenId;
        calendar.tokenUri = tokenUri;
        calendar.calendarNftUri = calendarNftUri;
    }
}
