const UserModel = require("../models/user");
const UserWalletModel = require("../models/user_wallet");
const UserNFTModel = require("../models/user_nft");
const DelegatorModel = require("../models/delegator");

const moment = require('moment-timezone')
moment.tz.setDefault('Asia/Tokyo')

const getUserByKey = async (userId) => {
  const dbUser = await UserModel.getUserByKey(userId);
  if (!dbUser) {
    return null;
  }

  return {
    user_id: dbUser.user_id,
    nickname: dbUser.nickname,
    email: dbUser.email,
    team_ids: dbUser.team_ids,
    created_at: dbUser.created_at,
    created_by: dbUser.created_by,
    updated_at: dbUser.updated_at,
    updated_by: dbUser.updated_by,
    delete_flg: dbUser.delete_flg
  };
}

const createUser = async (userData) => {
  const walletAddress = userData.wallet_address;
  let user = await UserWalletModel.getUserWalletByWalletAddress(walletAddress.toLowerCase());

  if (!user) {
    user = await UserModel.createUser(userData);
    await UserWalletModel.createUserWallet(user.user_id, walletAddress.toLowerCase(), '');
  }

  return user.user_id;
}

const updateUser = async (userData, userId, res) => {
  const user = await UserModel.getUserByKey(userId);

  if (!user) {
    return res.status(404).json({ message: 'Not Found' });
  }

  user.nickname = userData.nickname;
  user.email = userData.email;

  await UserModel.update(user, userId);
  return user.user_id;
}

const createDelegator = async (delegators, userId, res) => {
  const user = await UserModel.getUserByKey(userId);
  if (!user) return res.status(404).json({ message: "Not Found" });

  // Gets the user IDs associated with a list of delegators' wallet addresses
  // and removes any null or undefined values from the resulting array.
  const delegatedToUsers = (await Promise.all(delegators.map(async (walletAddress) => {
    const userWallet = await UserWalletModel.getUserWalletByWalletAddress(walletAddress);
    return userWallet?.user_id;
  }))).filter((element) => element !== null && element !== undefined);

  const delegator = await DelegatorModel.upsert({
    user_id: userId,
    delegate_from_users: [],
    delegate_to_users: delegatedToUsers
  }, userId);

  for (const _userId of delegatedToUsers) {

    const delegator = await DelegatorModel.getByKey(_userId);
    if (!delegator) {
      await DelegatorModel.upsert({
        user_id: _userId,
        delegate_from_users: [userId]
      }, userId);
    } else {
      const delegatedFromUser = !delegator.delegate_from_users?.includes(userId)
        ? [...delegator.delegate_from_users, userId]
        : delegator.delegate_from_users;

      delegator.delegate_from_users = delegatedFromUser;
      await DelegatorModel.upsert(delegator, userId);
    }
  }
  return delegator;
}

const generateNonce = async (walletAddress, res, length = 24) => {
  let nonce = '';
  const characters = '0123456789';
  const charactersLength = characters.length;
  for (let i = 0; i < length; i++) {
    nonce += characters.charAt(Math.floor(Math.random() * charactersLength));
  }

  const userWallet = await UserWalletModel.getUserWalletByWalletAddress(walletAddress);
  if (!userWallet) {
    return res.status(404).json({
      message: 'Not found'
    });
  }
  const user = await UserModel.getUserByKey(userWallet?.user_id);
  if (!user) {
    return res.status(404).json({
      message: 'Not found'
    });
  }

  user.nonce = nonce;
  await UserModel.update(user, user.user_id);
  return nonce;
}

const getUserWalletByPublicKey = async (publicKey) => {
  return await UserWalletModel.getUserWalletByPublicKey(publicKey)
}

const getUserNFTs = async (userId, tokenAddresses) => {
  return await UserNFTModel.getUserNFTs(userId, tokenAddresses)
}

module.exports = {
  getUserByKey,
  createUser,
  updateUser,
  generateNonce,
  createDelegator,
  getUserWalletByPublicKey,
  getUserNFTs
};

