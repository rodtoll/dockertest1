"use strict";

const express = require('express');  
const uuid = require('uuid');  
const os = require('os');

let app = express();

let hostname = os.hostname();

var returnError = false;

app.get("/guid", (req, res) => {  
    res.json({ "guid": uuid.v4(), "container": hostname, "latest": "stuff3" });
});

app.get("/health", (req, res) => {
    if(returnError) {
       res.status(500).send("Error happened!");
    } else {
       res.send("Healthy!");
    }
});

app.get("/error", (req,res) => {
    returnError = !returnError;
    res.status(200).send("Set error state to: "+returnError);
});

app.listen(9000, () => {  
    console.log("listening on port 9000");
});
