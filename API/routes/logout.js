const express = require('express');
const { route } = require('./register');
const router = express.Router();

//To get the middleware
const {clearCookie} = require('../controllers/logout');//To get the middleware for clearing the cookie
const {invalidateToken}=require('../controllers/logout');//To get the middleware for invalidating the token

router.get('/', (req, res) => {
    let response={
        status:false,
        message:"This route is forbidden"
    }
    //Get is not safe for logout, so we will use post, this will be forbidden
    res.status(403).json(response);
}
);

router.post('/', clearCookie,invalidateToken,(req, res) => {
    let response={
        status:true,
        message:"User logged out successfully"
    }
    res.status(200).json(response);
}
);

module.exports = router;
