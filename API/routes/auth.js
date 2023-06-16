//This is the route for the login page that will be used to authenticate the user
const express=require('express');
const router=express.Router();//To require express
router.use(express.urlencoded({extended:false}));// this is a middleware --> to parse url encoded data from the body of the request object

//MiddleWare
const {login, verifyJWT}=require('../controllers/login.js');//To require the login middleware


router.post('/',verifyJWT,login,(req,res)=>{
    res.end();
}
);

router.get('/',(req,res)=>{
    //To send a forbidden status code
    res.status(403).send("<h1>Forbidden</h1>");
}
);

module.exports=router;