const TransactionService = require("../services/transaction");

const sendTransaction = async function (req, res) {
  try {
    // get parameter
    const rawTransaction = req.body.raw_transaction;
    const type = req.body.type;
  
    const result = await TransactionService.sendTransaction(rawTransaction, type, res);
  
    if (result.statusCode >= 400) {
      return result;
    }
  
    res.status(200).json({
      message: "Success",
      ...result,
    });
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

module.exports = {
  sendTransaction,
};
