const hre = require('hardhat');
const ethers = hre.ethers;

let envFileName = '';
if (process.env.NODE_ENV === 'staging') {
  envFileName = '../.env.staging';
} else if (process.env.NODE_ENV === 'production') {
  envFileName = '../.env.production';
} else {
  envFileName = '../.env.development';
}
require('dotenv').config({ path: envFileName });
const config = process.env;

const main = async () => {
  console.log(`Deploy start`);
  // admin wallet private key
  const accounts = await hre.ethers.getSigners();
  const adminWalletAddress = accounts[0].address;
  console.log("Admin wallet address: " + adminWalletAddress);

  // =========================
  const name = config.NFT_NAME;
  const symbol = config.NFT_SYMBOL;
  // confirm max supply
  const maxSupply = config.NFT_MAX_SUPPLY;

  CalendarNFT = await ethers.getContractFactory('CalendarNFT');
  calendarNFT = await upgrades.deployProxy(CalendarNFT, [
    name, symbol, maxSupply
  ]);
  await calendarNFT.deployed();

  console.log(`Calendar NFT address: ${calendarNFT.address.toLowerCase()}`);

  // =========================
  const TeamFactory = await ethers.getContractFactory('TeamFactory');
  const teamFactory = await TeamFactory.deploy();
  await teamFactory.deployed();

  console.log(`TeamFactory address: ${teamFactory.address.toLowerCase()}`);

  // CalendarIndexer
  const CalendarIndexer = await ethers.getContractFactory('CalendarIndexer');
  const calendarIndexer = await CalendarIndexer.deploy();
  await calendarIndexer.deployed();

  console.log(`CalendarIndexer address: ${calendarIndexer.address.toLowerCase()}`);

  // ==========================
  // Add indexer to TeamFactory
  await calendarNFT.setTeamFactory(teamFactory.address.toLowerCase());
  console.log(`Set TeamFactory finished`);

  // Add indexer to CalendarNFT
  await calendarNFT.setCalendarIndexer(calendarIndexer.address.toLowerCase());
  console.log(`Set CalendarIndex finished`);

  // ==========================
  // Deploy Delegate contract
  const Delegate = await ethers.getContractFactory('Delegate');
  const delegate = await Delegate.deploy();
  await delegate.deployed();

  console.log(`Delegate address: ${delegate.address.toLowerCase()}`);

  // ==========================
  console.log(`Deploy end`);
};

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
