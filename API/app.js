//To require express
const express = require('express');
const app = express();//To initialize express


//Middleware
//static assets
app.use(express.static('./public'));// this is a middleware
app.use(express.urlencoded({extended:false}));// this is a middleware
app.use(express.json());// this is a middleware to parse json data from the body of the request object

//To require the different routes
app.use('/register',require('./routes/register.js'));//For user registration
//This is the route for the login page that will be used to authenticate the user
app.use('/login',require('./routes/auth.js'));//For user login


//To start the server on port 5000
app.listen(5000, (err) => {
    if (err) {
        console.log("Error in running server");
        return;
    }
    else{
    console.log("Server is running on port 5000");
    }
}
);
