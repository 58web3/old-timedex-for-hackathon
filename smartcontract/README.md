# smart contract 

### Install Hardhat & Run Unit Testing

```
yarn add install --save-dev hardhat

```

Start hardhat node
```

yarn hardhat node

```


Run test 
```
//Execute hardhat on local project

npx hardhat compile

npx hardhat test

//if requred
npx hardhat clean

```

Run deploy test

```
NODE_ENV=development npx hardhat run scripts/migrate-deploy.js


```

## Deploy to testnet
### Change .env config in smartcontract/.env.development
- Set `ADMIN_PRIVATE_KEY` = Your wallet private key 
- Change Network settings
- Change NFT settings

### Run deploy 
```
yarn migrate:testnet
```