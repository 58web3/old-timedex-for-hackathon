### Method: create
#### Parameters
- teamData: An object containing team_name, team_description, and team_members.
- userId: The ID of the user creating the team.

#### Processing Details
1. Create a new team using the TeamModel.create() method with teamData and userId as arguments.
2. Define the ABI (Application Binary Interface) for the contract function "createTeam".
3. Create an ethers Interface using the ABI.
4. Encode the contract function with the team data (team_id, team_name, and wallet addresses of team members) using the ethers Interface.
5. Get the wallet address of the user by calling UserWalletModel.getUserWalletByUserId() with userId as an argument.
6. Return the team_id and transaction data object containing data, from, to, gasLimit, and gasPrice.

### Method: getTeams
#### Parameters
- userId: The ID of the user whose teams need to be retrieved.

#### Processing Details
1. Get the user details by calling UserModel.getUserByKey() with userId as an argument.
2. Get the teams associated with the user by calling TeamModel.getTeams() with user.team_ids as an argument.
3. Map the retrieved teams to an array of team objects with relevant properties.
4. Return the array of team objects.



### Method: getByKey
#### Parameters
- teamId: The ID of the team to be retrieved.

#### Processing Details
1. Get the team details by calling TeamModel.getByKey() with teamId as an argument.
2. Return the retrieved team object.

### Method: update
### Parameters
- teamData: An object containing team_id, team_name, team_description, and team_members.
- userId: The ID of the user updating the team.
- res: Response object used to send the response back to the client.

#### Processing Details
1. Get the team details by calling getByKey() with teamData.team_id as an argument.
2. If the team is not found, return a 404 status with a 'Not found' message using the response object.
3. If the user is not the creator of the team, return a 403 status with a 'Forbidden' message using the response object.
4. Update the team properties with the new data if provided.
5. Update the team details in the database by calling TeamModel.update() with the updated team and userId as arguments.
6. Return the updated team object.

### Method: updateTeamMembers
#### Parameters
- teamId: The ID of the team whose members need to be updated.
- membersData: An array of member objects.
- userId: The ID of the user updating the team members.

#### Processing Details
1. Get the team details by calling getByKey() with teamId as an argument.
2. If the team is not found, throw an "Team not found" error.
3. If the user is not the creator of the team, throw a "Forbidden" error.
4. Update the team_members property of the team object with the new membersData.
5. Update the team details in the database by calling TeamModel.update() with the updated team and userId as arguments.
6. Return the updated team object.

### Method: updateMemberStatus
#### Parameters
- teamId: The ID of the team whose member status needs to be updated.
- memberId: The ID of the member whose status needs to be updated.
- newStatus: The new status for the member, either 'Approved' or 'Unapproved'.
- userId: The ID of the user updating the member status.

#### Processing Details
1. Get the team details by calling getByKey() with teamId as an argument.
2. If the team is not found, throw an "Team not found" error.
3. If the user is not the creator of the team, throw a "Forbidden" error.
4. Find the index of the member in the team_members array using the memberId.
5. If the member is not found, throw a "Member not found" error.
6. Check if the newStatus is 'Approved' or 'Unapproved', otherwise throw an "Invalid status" error.
7. Update the status of the member in the team_members array.
8. Update the team details in the database by calling TeamModel.update() with the updated team and userId as arguments.
9. Return the updated team object.

### Method: updateBlockchainData
#### Parameters
- teamId: The ID of the team whose blockchain data needs to be updated.
- userId: The ID of the user updating the blockchain data.

#### Processing Details
1. Get the team details by calling getByKey() with teamId as an argument.
2. If the team is not found, throw an "Team not found" error.
3. Define the ABI (Application Binary Interface) for the contract function "updateTeam".
4. Create an ethers Interface using the ABI.
5. Encode the contract function with the team data (team_id, team_name, and wallet addresses of team members) using the ethers Interface.
6. Get the wallet address of the user by calling UserWalletModel.getUserWalletByUserId() with userId as an argument.
7. Return the team_id and transaction data object containing data, from, to, gasLimit, and gasPrice.