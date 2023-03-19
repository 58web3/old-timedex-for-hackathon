# timedex

### Run Frontend (FlutterApp)
[See ./frontend/README.md](./frontend/README.md)

### Run API
[See ./api/README.md](./api/README.md)

### Run Smart Contract
[See ./smartcontract/README.md](./smartcontract/README.md)

### Run Frontend/API/Dynamolocal DB for development
```
docker-compose -f up

//Run Background
docker-compose -f up -d

```


### Run DynamoLocal DB for development
```
docker-compose -f docker-compose-dynamolocal.yml up

//Run Background
docker-compose -f docker-compose-dynamolocal.yml up -d

```
You can see dynamodb-admin on 'http://localhost:8001'


### Licensing
Business Source License 1.1 (BUSL-1.1) 
