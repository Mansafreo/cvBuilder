//This is the route for the registration page that will be used to register the user
const express=require('express');
const router=express.Router();//To require express
router.use(express.urlencoded({extended:false}));// this is a middleware --> to parse url encoded data from the body of the request object

//MiddleWare
const {register}=require('../controllers/register.js');//To require the register middleware


router.post('/',register,(req,res)=>{
    res.end();
}
);

router.get('/',(req,res)=>{
    //To send a forbidden status code
    res.status(403).send("<h1>Forbidden</h1>");
}
);

module.exports=router;

