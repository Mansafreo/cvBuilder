const path=require('path');
const envPath=path.resolve(__dirname,'../.env');
//Database connection
const dotenv = require('dotenv');
dotenv.config({ path: envPath });//To configure dotenv
//JWT token
const jwt = require('jsonwebtoken');
//To require the database connection
const db = require('../models/db');
//require bcrypt
const bcrypt = require('bcrypt');
//To require the function to check if the token is blacklisted
const {checkTokenInDB}=require('../controllers/logout');

//Function to verify JWT
const verifyJWT = (req, res, next) => {
    let response = {
        status: "success",
        message: "Data received"
    };
    const authHeader = req.headers.authorization;
    //To check if the token exists
    if (!authHeader || authHeader.split(' ')[1] === undefined || authHeader.split(' ')[1] === "") {
        return next();//To go to the next middleware
    }
    const token1 = authHeader.split(' ')[1];
    //To check if the token is blacklisted
    const blacklisted=checkTokenInDB(token1);
    if(blacklisted){
        response.status = "error";
        response.message = "Token lifetime expired";
        response.data = {
            token: token1
        }
        return res.status(403).json(response);
    }
    //To check if the token is expired
    if(isTokenExpired(token1)){
        response.status = "error";
        response.message = "Token expired";
        response.data = {
            token: token1
        }
        return res.status(403).json(response);
    }
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

const login =async (req, res) => {
    let response = {
        status: "success",
        message: "Data received"
    };
    //This is the login function to verify the user if there is no token
    const { username, password} = req.body;
    //To check if the user exists
    //check if the username is an email
    if(username.includes('@')){
        const exist = await checkEmailExists(username);
        if (!exist) {
            response.status = "error";
            response.message = "Email does not exist";
            return res.status(404).json(response);
        }
        //To check if the password is correct
        const correct = await checkEmailDetails(username, password);
        if (!correct) {
            response.status = "error";
            response.message = "Incorrect password";
            return res.status(401).json(response);
        }
    }
    else{
    const exist = await checkUserExists(username);
    if (!exist) {
        response.status = "error";
        response.message = "User does not exist";
        response.data={
            username:username,
        }
        return res.status(404).json(response);
    }
      //To check if the password is correct
      const correct = await checkUsernameDetails(username, password);
      if (!correct) {
          response.status = "error";
          response.message = "Incorrect password";
          return res.status(401).json(response);
      }
    }
    //To create a token
    const accessToken = jwt.sign({ username: username }, process.env.ACCESS_TOKEN_SECRET, { expiresIn: process.env.TOKEN_EXPIRY_TIME});
    response.status = "success";
    response.message = "User successfully logged in";
    response.accessToken = accessToken;
    return res.status(200).json(response);
}

function isTokenExpired(token) {
    try {
      const decodedToken = jwt.decode(token,process.env.ACCESS_TOKEN_SECRET, { complete: true });
      const expirationTime = new Date(decodedToken.exp * 1000); // Convert expiration timestamp to milliseconds
      const currentTime = new Date();
      return currentTime > expirationTime;
    } catch (error) {
      // Handle invalid or malformed token
      return true;
    }
}

function checkUsernameDetails(username, password) {
    return new Promise((resolve, reject) => {
        const query = "SELECT * FROM users WHERE username = ?";
        db.query(query, [username], (err, result) => {
            if (err) {
                reject(err);
            }
            else {
                if (result.length > 0) {
                    bcrypt.compare(password, result[0].password, (err, res) => {
                        if (err) {
                            reject(err);
                        }
                        else {
                            if (res) {
                                resolve(result);
                            }
                            else {
                                resolve(false);
                            }
                        }
                    });
                }
                else {
                    resolve(false);
                }
            }
        });
    });
}

function checkUserExists(username) {
    return new Promise((resolve, reject) => {
        const query = "SELECT * FROM users WHERE username = ?";
        db.query(query, [username], (err, result) => {
            if (err) {
                reject(err);
            }
            else {
                if (result.length > 0) {
                    resolve(true);
                }
                else {
                    resolve(false);
                }
            }
        });
    });
}

function checkEmailExists(email) {
    return new Promise((resolve, reject) => {
        const query = "SELECT * FROM users WHERE email = ?";
        db.query(query, [email], (err, result) => {
            if (err) {
                reject(err);
            }
            else {
                if (result.length > 0) {
                    resolve(true);
                }
                else {
                    resolve(false);
                }
            }
        });
    });
}

function checkEmailDetails(email, password) {
    return new Promise((resolve, reject) => {
        const query = "SELECT * FROM users WHERE email = ?";
        db.query(query, [email], (err, result) => {
            if (err) {
                reject(err);
            }
            else {
                if (result.length > 0) {
                    bcrypt.compare(password, result[0].password, (err, res) => {
                        if (err) {
                            reject(err);
                        }
                        else {
                            if (res) {
                                resolve(result);
                            }
                            else {
                                resolve(false);
                            }
                        }
                    });
                }
                else {
                    resolve(false);
                }
            }
        });
    });
}

module.exports={login,verifyJWT};