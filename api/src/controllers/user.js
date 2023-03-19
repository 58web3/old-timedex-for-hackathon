const UserService = require("../services/user");
const UserWalletService = require("../services/user_wallet");

const getUserByKey = async function (req, res) {
  try {
    // get parameter
    const userId = req.params.user_id;

    // call service method
    const user = await UserService.getUserByKey(userId);
    if (!user)
      return res.status(404).json({ "message": "Not Found" });

    // return response
    return res.status(200).json(user);
  } catch (e) {
    logger.error(e);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

const createUser = async function (req, res) {
  try {
    // get parameter
    const requestBody = req.body;

    const result = await UserService.createUser(requestBody);

    if (result.statusCode >= 400) {
      return result;
    }

    // return response
    res.status(201).json({
      message: "Success",
      id_info: {
        "key": "user_id",
        "value": result
      }
    });
  } catch (e) {
    logger.error(e);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

const updateUser = async function (req, res) {
  try {
    // get parameter
    const userId = req.params.user_id;

    if (req.user_id !== userId) {
      return res.status(403).json({ message: 'Forbidden' });
    }

    const userData = {
      nickname: req.body.nickname,
      email: req.body.email
    }
    const result = await UserService.updateUser(userData, userId, res);

    if (result.statusCode >= 400) {
      return result;
    }

    // return response
    res.status(200).json({
      message: "Success",
      id_info: {
        "key": "user_id",
        "value": result
      }
    });
  } catch (e) {
    logger.error(e);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

const createDelegator = async function (req, res) {
  try {
    // get parameter
    const userId = req.params.user_id;

    if (req.user_id !== userId) {
      return res.status(403).json({ message: 'Forbidden' });
    }
    const delegators = req.body.delegators;
    
    const result = await UserService.createDelegator(delegators, userId, res);

    if (result.statusCode >= 400) {
      return result;
    }

    // return response
    res.status(200).json({
      message: "Success"
    });
  } catch (e) {
    logger.error(e);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}

const generateNonce = async function (req, res) {
  try {
    // get parameter
    const requestBody = req.body;
    const walletAddress = requestBody.wallet_address;

    const result = await UserService.generateNonce(walletAddress, res);

    if (result.statusCode >= 400) {
      return result;
    }

    // return response
    res.status(200).json({
      nonce: result
    });
  } catch (e) {
    logger.error(e);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}

module.exports = {
  getUserByKey,
  createUser,
  updateUser,
  createDelegator,
  generateNonce
};
