const uuid = require('uuid');
const UserSchema = require("../schemas/user");

// Get model using schema
const User = dynamoose.model("User", UserSchema);

const getUserByEmail = async (email) => {
  const searchResult = await User.query("email").eq(email).exec();
  if (searchResult.count == 0) {
    return null;
  }
  return searchResult.toJSON()[0];
};

const getUserByKey = async (userId) => {
  return User.get({ user_id: userId });
};

const createUser = async (userData) => {
  const systemDate = new Date().getTime();
  const userId = uuid.v4();
  const nickname = userData.nickname;
  const walletAddress = userData.wallet_address.toLowerCase();
  const email = userData.email;

  const user = await User.create({
    user_id: userId,
    nickname: nickname,
    wallets: [
      {
        wallet_address: walletAddress,
        wallet_public_key: '',
      }
    ],
    email: email,
    team_ids: [],
    created_at: systemDate,
    created_by: userId,
    updated_at: systemDate,
    updated_by: userId,
    delete_flg: false
  });
  return user;
};

const update = async (user, userId) => {
  const systemDate = new Date().getTime();
  return await User.update({
    user_id: user.user_id,
  }, {
    nonce: user.nonce,
    nickname: user.nickname,
    team_ids: user.team_ids,
    updated_at: systemDate,
    updated_by: userId,
  });
}

module.exports = {
  getUserByKey,
  getUserByEmail,
  createUser,
  update,
  User
};
