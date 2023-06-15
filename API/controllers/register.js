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

const register = async (req, res, next) => {
    let response = {
      status: "success",
      message: "Data received"
    };
  
    const { user, email, password } = req.body;
  
    try {
      //To check whether that email already exists
      const exist = await checkEmailExists(email);
      if (exist) {
        response.status = "error";
        response.message = "This Emails is already in use";
        return res.status(409).json(response);
      }
      //To check if the user already exists
      const existUser = await checkUserExists(user);
        if (existUser) {
            response.status = "error";
            response.message = "This user already exists";
            return res.status(409).json(response);
        }
        //To insert the data into the database
        const insertData = await insertUser(user, email, password);
        if (insertData) {
            response.status = "success";
            response.message = "User registered successfully";
            //To create a token
            const token = jwt.sign({ user: user }, process.env.ACCESS_TOKEN_SECRET);
            response.token = token;
            return res.status(200).json(response);
        }
     
      res.status(200).json(response);
      next();

    } catch (err) {
      console.log(err);
      response.status = "error";
      response.message = "Error in checking if the user already exists";
      res.status(500).json(response);
      next();
    }
  };
  //To insert the data into the database
    async function insertUser(username, email, password) {
        let generatedID = generateID(username);
        let hashedPassword = await bcrypt.hash(password, 10);//To hash the password
        password = hashedPassword;
        return new Promise((resolve, reject) => {
            db.query('INSERT INTO users SET ?', {userID:generatedID,username: username, email: email, password: password }, (err, result) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(true);
                }
            });
        });
    }

    //To check if the user already exists
    async function checkUserExists(username) {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM users WHERE username = ?', [username], (err, result) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(result.length > 0);
                }
            });
        });
    }

    //To check whether that email already exists
    async function checkEmailExists(email) {
    return new Promise((resolve, reject) => {
      db.query('SELECT * FROM users WHERE email = ?', [email], (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result.length > 0);
        }
      });
    });
  }
  
  function generateID(username){
    console.log(username);
    let userID = 0;
    for (let i = 0; i < username.length; i++) {
      const charCode = username.charCodeAt(i);
      userID += charCode * Math.pow(31, i);
    }
    return userID.toString();
  }

module.exports = { register };
  