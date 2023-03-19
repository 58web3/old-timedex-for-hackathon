global.dynamoose = require('../../src/init_dynamoose');

jest.mock('uuid');
const uuid = require("uuid");
const UserModel = require("../../src/models/user");
const testUserId = "user12345";

describe("Success", () => {
  test('getUserByKey result is null', async () => {
    UserModel.User.get = jest.fn((condition) => {
      return null;
    });

    const user = await UserModel.getUserByKey(testUserId);
    expect(user).toBeNull();
  });

  test('getUserByKey result is not null', async () => {
    const userData = { user_id: testUserId, wallet_address: 'wallet0123' };

    UserModel.User.get = jest.fn((condition) => {
      return userData;
    });
    const user = await UserModel.getUserByKey(testUserId);
    expect(user.user_id).toBe(testUserId);
  })

  test('createUser', async () => {
    const userData = {
      wallet_address: 'walletAddress12345'
    };

    UserModel.User.create = jest.fn((userData) => {
      return { user_id: testUserId, wallet_address: 'wallet01234' };
    })

    const idTokenUser = {
      wallets: [
        {
          public_key: "123456"
        }
      ]
    }

    const user = await UserModel.createUser(userData, idTokenUser);
    expect(user.user_id).toBe(testUserId);
  });

  test('updateUser', async () => {
    const updateUserData = {
      wallets: [
        {
          wallet_address: 'updateWalletAddress00001',
          wallet_public_key: 'updateWalletPublicKey00001'
        }
      ],
    }

    UserModel.User.update = jest.fn((userId, userData) => {
      return { user_id: testUserId, ...updateUserData };
    })

    const user = await UserModel.update(testUserId, updateUserData);
    expect(user.user_id).toBe(testUserId);
    expect(user.wallets[0].wallet_address).toBe(updateUserData.wallets[0].wallet_address);
    expect(user.wallets[0].wallet_public_key).toBe(updateUserData.wallets[0].wallet_public_key);
  });
});
