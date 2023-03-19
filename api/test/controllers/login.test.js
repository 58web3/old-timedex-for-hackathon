const request = require("supertest");
const app = require("../../src/app");
const { mockRequest, mockResponse } = require("../util/util")

jest.mock('../../src/services/login');
const LoginService = require("../../src/services/login");
const UserService = require("../../src/services/user");
const LoginController = require("../../src/controllers/login");

const testPublicKey = 'publicKey';
const testUserId = 'user12345';
const loginUrl = `/v1/login`;

describe("Success", () => {
  test("login(GET API: /login) 200", async () => {
    const req = mockRequest();
    req.user = { wallets: [{ public_key: testPublicKey }] };
    const res = mockResponse();
    UserService.getUserWalletByPublicKey = jest.fn((publicKey) => {
      return { user_id: testUserId };
    });
    LoginService.login = jest.fn((userId, res) => {
      return [{}];
    });
    await LoginController.login(req, res);
    expect(res.statusCode).toBe(200);
  });
});

