const rpcUrl = process.env.SHIBUYA_RPC;
const Web3 = require("web3");
const web3 = new Web3(rpcUrl);

const ERC20_TOKEN_ADDRESS = "0x12345678901234567890012345678901234567890";
const ERC20_TOKEN_AMOUNT = "10.15";

const sendTransaction = async function (rawTransaction, type, res) {
  const result = null;
  await web3.eth
    .sendSignedTransaction(rawTransaction)
    .on("receipt", (receipt) => {
      console.log(receipt);
      result = receipt;
    });
  return {
    token_address: ERC20_TOKEN_ADDRESS,
    token_amount: ERC20_TOKEN_AMOUNT,
  };
};

module.exports = {
  sendTransaction,
};
