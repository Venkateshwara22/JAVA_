const express = require('express');
const router = express.Router();
const{Posts}=require('../models')//we got then table in which we want to 
                                    //enter data from first post request

router.get('/',async (req, res) => {
  const listOfPosts = await Posts.findAll();
  res.json(listOfPosts);
});

router.post("/",async(req,res)=>{
const post=req.body;
await Posts.create(post);//created data in the similar format avaiable in the Posts file
res.json(post);
});

module.exports = router;
