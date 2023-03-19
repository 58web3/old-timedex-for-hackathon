const jwt = require('jsonwebtoken');
const UserWalletModel = require("../models/user_wallet");
const UserModel = require("../models/user");
const Web3Util = require("../util/web3");
const UserService = require("./user");

const login = async function (message, signature, walletAddress, res) {

  const userWallet = await UserWalletModel.getUserWalletByWalletAddress(walletAddress);
  if (!userWallet) {
    return res.status(404).json({
      message: 'Not found'
    });
  }
  const user = await UserModel.getUserByKey(userWallet.user_id);
  if (!user?.nonce) {
    return res.status(404).json({
      message: 'Not found'
    });
  }
  const verifySignature = await Web3Util.verifySignature(user.nonce, signature, walletAddress);
  if (!verifySignature) {
    return res.status(400).json({
      message: 'Bad request'
    });
  }

  const token = jwt.sign({
    user_id: user.user_id,
    wallet_address: userWallet.wallet_address,
  }, process.env.SECRET_KEY,
    { expiresIn: parseInt(process.env.EXPIRES_IN) });

  //change nonce 
  await UserService.generateNonce(userWallet.wallet_address, res);
  return token;
};

module.exports = {
  login
};
