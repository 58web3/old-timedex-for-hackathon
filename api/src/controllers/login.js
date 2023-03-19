const LoginService = require("../services/login");
const UserService = require("../services/user");

const login = async function (req, res) {
  try {
    // get parameter
    const message = req.body.message;
    const signature = req.body.signature;
    const walletAddress = req.body.wallet_address;

    // call service method
    const result = await LoginService.login(message, signature, walletAddress, res);
    
    if (result.statusCode >= 400) {
      return result;
    }

    res.status(200).json({
      message: "Success",
      jwt: result
    });
  } catch (e) {
    logger.error(e);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

module.exports = {
  login,
};
