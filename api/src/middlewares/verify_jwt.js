const jwt = require('jsonwebtoken');
const UserModel = require('../models/user');

module.exports.verifyJwt = async function (req, res, next) {
    try {
        if (req.headers.authorization) {
            const parseToken = req.headers.authorization.split(' ');
            if (parseToken[0] === 'Bearer' && parseToken[1]) {
                const decoded = jwt.verify(parseToken[1], process.env.SECRET_KEY);
                const user = await UserModel.getUserByKey(decoded.user_id);
                if (user) {
                    req.user_id = decoded.user_id;
                    return next();
                }
                return res.status(401).json({
                    message: 'Unauthorized'
                });
            }
        }
    } catch (e) {
        console.error(e);
    }
    return res.status(401).json({ message: 'Unauthorized' });
}