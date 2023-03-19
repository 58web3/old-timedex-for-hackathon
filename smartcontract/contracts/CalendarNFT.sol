// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./CalendarIndexer.sol";

contract CalendarNFT is
    ERC721URIStorageUpgradeable,
    ERC721EnumerableUpgradeable,
    ERC721BurnableUpgradeable,
    OwnableUpgradeable,
    CalendarIndexer
{
    using CountersUpgradeable for CountersUpgradeable.Counter;
    using Strings for uint256;

    CountersUpgradeable.Counter private _tokenIdCounter;
    uint256 private TOTAL_SUPPLY;
    address private _calendarIndexer;
    address private _teamFactory;

    function initialize(
        string memory name,
        string memory symbol,
        uint256 totalSupply
    ) public initializer {
        __ERC721_init(name, symbol);
        __ERC721URIStorage_init();
        __ERC721Enumerable_init();
        __ERC721Burnable_init();
        __Ownable_init();
        TOTAL_SUPPLY = totalSupply;
    }

    function mint(
        address to,
        string memory tokenUri
    ) public returns (uint256 tokenId) {
        require(to != address(0), "Invalid address");
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= TOTAL_SUPPLY, "Max supply reached");
        _safeMint(to, tokenId);

        _tokenIdCounter.increment();
        return tokenId;
    }

    function setTokenUri(
        uint256 tokenId,
        string memory tokenUri,
        string memory calendarNFTUri
    ) public onlyOwner {
        _setTokenURI(tokenId, tokenUri);
    }

    function publish(
        address to,
        string memory calendarId,
        string memory tokenUri,
        string memory calendarNftUri,
        string[] memory teamIds
    ) public {
        Calendar memory calendar = getCalendar(calendarId);
        uint256 tokenId;
        if (bytes(calendar.calendarId).length == 0) {
            tokenId = mint(to, tokenUri);
        } else {
            _setTokenURI(calendar.tokenId, tokenUri);
            tokenId = calendar.tokenId;
        }
        ICalendarIndexer(_calendarIndexer).addOrUpdateCalendar(
            calendarId,
            "",
            tokenId,
            tokenUri,
            calendarNftUri
        );

        for (uint256 i = 0; i < teamIds.length; i++) {
            address teamAddr = ITeamFactory(_teamFactory).getTeamAddress(
                teamIds[i]
            );

            if (address(teamAddr) != address(0)) {
                ITeam(teamAddr).updateMemberCalendar(
                    calendarId,
                    teamIds[i],
                    tokenId,
                    tokenUri,
                    calendarNftUri
                );
                ITeam(teamAddr).updateMember(msg.sender, true, calendarId);
            }
        }
    }

    function getTotalSupply() public view returns (uint256) {
        return TOTAL_SUPPLY;
    }

    function tokenURI(
        uint256 tokenId
    )
        public
        view
        override(ERC721URIStorageUpgradeable, ERC721Upgradeable)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 _interfaceId
    )
        public
        view
        virtual
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
        returns (bool)
    {
        return super.supportsInterface(_interfaceId);
    }

    function _burn(
        uint256 tokenId
    )
        internal
        virtual
        override(ERC721Upgradeable, ERC721URIStorageUpgradeable)
    {
        super._burn(tokenId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    )
        internal
        virtual
        override(ERC721Upgradeable, ERC721EnumerableUpgradeable)
    {
        super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
    }

    function setCalendarIndexer(address calendarIndexer) public onlyOwner {
        _calendarIndexer = calendarIndexer;
    }

    function setTeamFactory(address teamFactory) public onlyOwner {
        _teamFactory = teamFactory;
    }
}

interface ITeamFactory {
    function getTeamAddress(
        string memory teamId
    ) external view returns (address);
}

interface ITeam {
    function updateMemberCalendar(
        string memory calendarId,
        string memory teamId,
        uint256 tokenId,
        string memory tokenUri,
        string memory calendarNftUri
    ) external;

    function updateMember(
        address walletAddress,
        bool acceptStatus,
        string memory calendarId
    ) external;
}

interface ICalendarIndexer {
    function addOrUpdateCalendar(
        string calldata calendarId,
        string calldata teamId,
        uint256 tokenId,
        string calldata tokenUri,
        string calldata calendarNftUri
    ) external;
}
