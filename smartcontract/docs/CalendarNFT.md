# Calendar NFT
## Requirement
ERC-721: Non-Fungible Token Standard

Contract inherits
- `@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol`
- `@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol`
- `@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol`
- `@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol`
- `@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol`
- `@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol`

Import CalendarIndexer.sol

### Contract name
CalendarNFT.sol

### State variables
- TOTAL_SUPPLY: uint256 private
- _tokenIdCounter: CountersUpgradeable.Counter private
- _calendarIndexer: address private
- _teamFactory: address private

### Constructor
#### Parameters
- name: string
- symbol: string
- totalSupply: uint256

#### Processing Details
```
Call ERC721(name, symbol)
Set TOTAL_SUPPLY = totalSupply
```

### Method: mint 
#### Parameters
- to: address
- tokenUri: string
- calendarNFTContentUri: string

#### Processing Details
1. Use _tokenIdCounter.current() to get current Token ID
2. If Token ID > TOTAL_SUPPLY, throw `Max supply reached` error.
3. Call _safeMint(to, tokenId) to mint
4. Call _setTokenURI(tokenId, tokenURI) to store token URI.
5. Call CalendarIndexer.addOrUpdateCalendar method

### Method: tokenUri 
#### Parameters
- tokenId: uint256

#### Processing Details
Return tokenUri ERC721URIStorage.tokenURI(tokenId)

### Method: setTokenUri 
#### Parameters
- tokenId: uint256
- tokenUri: string
- calendarNFTUri: string

#### Processing Details
- Call ERC721URIStorage._setTokenURI(tokenId, tokenUri)


### Method: publish 
#### Parameters
- tokenId: uint256
- teamIds: string[]

#### Processing Details
1. Loop teamIds
2. Call Team.updateMemberCalendar method

### Method: setCalendarIndexer 
Only owner can call
#### Parameters
- calendarIndexer: address
  
#### Processing Details
1. Set this._calendarIndexer = calendarIndexer