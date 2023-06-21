const dotenv = require('dotenv');
const path = require('path');
const envPath = path.resolve(__dirname, '../.env');
dotenv.config({ path: envPath });

const mysql = require('mysql');
const connection = mysql.createConnection({
  host: process.env.HOST,
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: process.env.DATABASE
});

connection.connect((error) => {
  if (error) {
    console.log('Error connecting to the database.');
  } else {
    console.log('Connected to the database.');
  }
});

connection.on('error', (error) => {
  console.log('Database connection error:', error);
});

// Handle query errors
connection.on('error', (error) => {
  console.log('Query error:', error);
});

module.exports = connection;
