const path=require('path');
const envPath=path.resolve(__dirname,'../.env');
//Database connection
const dotenv = require('dotenv');
dotenv.config({ path: envPath });//To configure dotenv
// This is a script for connecting the API to the database:
const mysql = require('mysql');
// Function to establish the database connection
function createConnection() {
 try{
  const connection = mysql.createConnection({
    host: process.env.HOST,
    password: process.env.PASSWORD,
    user:  process.env.USER,
    database: process.env.DATABASE
  });
  return connection;
 }
 catch(err){
    console.log(err);
    console.log("Error in connecting to database");
    return;
 }
}

module.exports = createConnection;
