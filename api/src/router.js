const express = require("express");
const router = express.Router();
const user = require("./controllers/user");
const wallet = require("./controllers/wallet");
const login = require("./controllers/login");
const team = require("./controllers/team");
const calendar = require("./controllers/calendar");
const booking = require("./controllers/booking");
const transaction = require("./controllers/transaction");


const { validator } = require("./middlewares/validator");
const { verifyJwt } = require("./middlewares/verify_jwt");
const validates = require("./validates/validates");

// User
router.get(
  "/user/:user_id",
  verifyJwt,
  user.getUserByKey
);
router.post(
  "/user",
  validator(validates.createUser),
  user.createUser
);
router.put(
  "/user/:user_id",
  validator(validates.updateUser),
  verifyJwt,
  user.updateUser
);
router.put(
  "/user/:user_id/delegator",
  validator(validates.createDelegator),
  verifyJwt,
  user.createDelegator
);

// Wallet
router.get(
  "/wallet/:wallet_address/user_id",
  wallet.getUserIdByWalletAddress
);
router.get(
  "/wallet/:wallet_address/nft",
  verifyJwt,
  wallet.getAllNFTs
);

// Auth
router.post(
  "/auth/generate-nonce",
  validator(validates.generateNonce),
  user.generateNonce
);

router.post(
  "/auth/login",
  validator(validates.login),
  login.login
);


// Team
router.post(
  "/team",
  verifyJwt,
  validator(validates.createTeam),
  team.create
);

router.get(
  "/team",
  verifyJwt,
  team.getTeams
);

router.get(
  "/team/:team_id",
  verifyJwt,
  team.getByKey
);

router.put(
  "/team/:team_id",
  verifyJwt,
  validator(validates.updatedTeam),
  team.update
);

// Calendar
router.get(
  "/calendar",
  verifyJwt,
  calendar.get
)

// Calendar
router.get(
  "/calendar/:calendar_id",
  verifyJwt,
  calendar.getForUser
)

router.post(
  "/calendar",
  verifyJwt,
  validator(validates.createCalendar),
  calendar.create
)

router.post(
  "/calendar/:calendar_id/booking",
  verifyJwt,
  validator(validates.createBooking),
  booking.create
)

router.post(
  "/calendar/:calendar_id/publish",
  verifyJwt,
  validator(validates.publish),
  calendar.publish
);

router.post(
  "/send/transaction",
  verifyJwt,
  validator(validates.sendTransaction),
  transaction.sendTransaction
);

module.exports = router;
