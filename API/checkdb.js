//Database connection
const dotenv = require('dotenv');
dotenv.config({ path: './.env' });//To configure dotenv
// Database connection setup
const mysql = require('mysql');

const db = mysql.createConnection({
  host: process.env.HOST,
  password: process.env.PASSWORD,
  user: process.env.USER,
  database: process.env.DATABASE
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the database');
});

// Function to fetch the list of tables
const getTables = () => {
  return new Promise((resolve, reject) => {
    db.query('SHOW TABLES', (err, results) => {
      if (err) {
        reject(err);
      } else {
        const tables = results.map((row) => Object.values(row)[0]);
        resolve(tables);
      }
    });
  });
};

// Usage example
getTables()
  .then((tables) => {
    console.log('Tables:', tables);
  })
  .catch((err) => {
    console.error('Error fetching tables:', err);
  });
