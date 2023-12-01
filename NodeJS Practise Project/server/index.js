const express = require ('express')
const app = express()
const cors = require("cors");

app.use(express.json());
app.use(cors());
const db = require('./models')
//Routers
const postRouter=require('./routes/Posts')
app.use("/posts", postRouter);

db.sequelize.sync().then(()=>{ //code to check whether the tables exists or not
    app.listen(3001, ()=>{
        console.log("Server running on port 3001");
    });
});

