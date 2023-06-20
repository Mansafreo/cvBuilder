// Used to connect to the database

//To set the environment variables
const dotenv = require('dotenv');//To require dotenv
const path = require('path');//To require path
const envPath = path.resolve(__dirname, '../.env');//To set the path of the .env file
dotenv.config({ path: envPath }); // To configure dotenv
//To require mysql
const mysql = require('mysql');
//To connect to mysql
const connection = mysql.createConnection({
  host:process.env.HOST,
  user:process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE
});

try {
connection.connect((error) => {
  if (error) {
    console.log('Error connecting to the database.');
    throw error;
  } else {
    console.log('Connected to the database.');
  }
});
} catch (error) {
    console.log(error);
}

module.exports = connection;
