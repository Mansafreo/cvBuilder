const path=require('path');
const envPath=path.resolve(__dirname,'../.env');
//Database connection
const dotenv = require('dotenv');
dotenv.config({ path: envPath });//To configure dotenv
//To require mysql
const mysql = require('mysql');
//JWT token
const jwt = require('jsonwebtoken');
//To require bcrypt
const bcrypt = require('bcrypt');

//To connect to mysql
const db = mysql.createConnection({
    host: process.env.HOST,
    password: process.env.PASSWORD,
    user:  process.env.USER,
    database: process.env.DATABASE
});

// console.log(process.env.HOST);

db.connect((err) => {
    if (err) {
        console.log(err);
        console.log("Error in connecting to database");
        return;
    }
    else {
        console.log("Connected to database");
    }
});

const verifyJWT = (req, res, next) => {
    let response = {
        status: "success",
        message: "Data received"
    };
    const authHeader = req.headers.authorization;
    if(!authHeader){
        next();//To go to the next middleware if the authorization header is not present
    }
    const token1 = authHeader.split(' ')[1];
    jwt.verify(token1, process.env.ACCESS_TOKEN_SECRET, (err, decoded) => {
        if (err) {
            response.status = "error";
            response.message = "Token not verified";
            return res.status(403).json(response);
        }
        req.username = decoded.username;
        response.status = "success";
        response.message = "Token successfully verified";
        response.username = decoded.username;
        return res.status(200).json(response);
    }
    );
}

const login = (req, res) => {
    let response = {
        status: "success",
        message: "Data received"
    };
    //This is the login function to verify the user if there is no token
}


module.exports={login,verifyJWT};