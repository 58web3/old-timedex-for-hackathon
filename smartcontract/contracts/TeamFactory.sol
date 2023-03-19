// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Team.sol";

contract TeamFactory {
    mapping(string => address) private _teamAddresses;

    function createTeam(string memory teamId, string memory teamName, address[] memory teamMembers) public returns (address) {
        Team newTeam = new Team(teamId, teamName, teamMembers);
        _teamAddresses[teamId] = address(newTeam);
        return address(newTeam);
    }

    function getTeamAddress(string memory teamId) public view returns (address) {
        return _teamAddresses[teamId];
    }
}
