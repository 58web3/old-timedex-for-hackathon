require('@nomiclabs/hardhat-ethers');
require('@openzeppelin/hardhat-upgrades');
require('@nomiclabs/hardhat-web3');
require("@nomiclabs/hardhat-waffle");


const { setTimeout } = require('timers/promises');

let envFileName = '';
if (process.env.NODE_ENV === 'staging') {
  envFileName = './.env.staging';
} else if (process.env.NODE_ENV === 'production') {
  envFileName = './.env.production';
} else {
  envFileName = './.env.development';
}

require('dotenv').config({ path: envFileName });
const config =process.env;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "localhost",
  networks: {
    localhost: {
      url: 'http://localhost:8545',
      chainId: 31337,
    },
    testnet: {
      url: config.NETWORK_RPC,
      chainId: parseInt(config.CHAIN_ID),
      accounts: config.ADMIN_PRIVATE_KEY ? [config.ADMIN_PRIVATE_KEY] : []
    }
  },
  plugins: [
    // ... your other plugins ...
    "@nomiclabs/hardhat-waffle",
  ],
  solidity: {
    compilers: [
      {
        version: '0.8.19',
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },
  paths: {
    sources: './contracts',
    tests: './test',
    cache: './cache',
    artifacts: './artifacts',
  },
  mocha: {
    timeout: 40000,
  }
};
