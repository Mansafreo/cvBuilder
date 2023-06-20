const db = require('../models/db');

// Used to logout the user by clearing the cookie
const clearCookie = (req, res, next) => {
  res.clearCookie('jwt');
  next();
};

// To invalidate the token by adding it to the blacklist in the database
const invalidateToken = async (req, res, next) => {
  const { token } = req.body;
  
  try {
    const isTokenInvalidated = await checkTokenInDB(token);
    
    if (isTokenInvalidated) {
      const isTokenAdded = await addToDB(token);
      
      if (isTokenAdded) {
        next();
      } else {
        res.status(500).json({ status: "error", message: "Failed to add the token to the database" });
      }
    } else {
      res.status(400).json({ status: "error", message: "Token is already invalidated" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ status: "error", message: "Internal server error" });
  }
};

function checkTokenInDB(token) {
  return new Promise((resolve, reject) => {
    const query = "SELECT COUNT(*) AS count FROM invalidatedtokens WHERE token = ?";
    db.query(query, [token], (err, result) => {
      if (err) {
        reject(err);
      } else {
        const tokenCount = result[0]['count'];
        resolve(tokenCount === 0);
      }
    });
  });
}

function addToDB(token) {
  return new Promise((resolve, reject) => {
    const sql = "INSERT INTO invalidatedtokens SET ?";
    db.query(sql, { token: token }, (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve(true);
      }
    });
  });
}

module.exports = {
  clearCookie,
  invalidateToken,
  checkTokenInDB
};
