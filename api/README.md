# RE:NFT API
## Prerequisites
- Git 2.xx.xx
- Node.js (latest LTS version) 16.xx.xx
- Yarn 1.22.xx
- [DynamoDB Local](https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/DynamoDBLocal.html) (for localhost develop)
- Create Google project for calendar: [quickstart](https://developers.google.com/calendar/api/quickstart/nodejs?hl=ja)
  - Create OAuth2.0 client ID
  - Download Oauth Client json file to `/api/credentials.json`

# Setup
## Change environment variable file
- Development environment(For yarn start) : `.env`
- Development environment(For Docker) : `.env.development`


## Install nodemon to automatically restart Node.js applications
```
yarn global add nodemon
```

# Run API server

## Install node_modules files
```
yarn install 
```

## Start API Server
```
yarn start
```

### Access
```
http://localhost:8888/
```

### Test
```
yarn test
```
