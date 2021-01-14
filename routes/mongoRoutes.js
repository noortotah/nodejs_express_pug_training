var express = require('express');
var fs = require('fs');

var router = express.Router();
var mongo = require('mongodb');
var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017";


router.get('/create-db', (req, res, next) => {

  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    console.log("Database created!");
    db.close();
  });
});

router.get('/create-collection', (req, res, next) => {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("usersFromW3school");
    dbo.createCollection("customers", function(err, res) {
      if (err) throw err;
      console.log("Collection created!");
      db.close();
    });
  });
  res.send('collection created');
})

router.get('/insert-to', (req, res, next) => {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("usersFromW3school");
    var myobj = { name: "Not ME Inc", address: "Hway 7" };
    dbo.collection("customers").insertOne(myobj, function(err, res) {
      if (err) throw err;
      console.log("1 document inserted");
      db.close();
    });
  });
})


router.get('/insert/josn-users', (req, res, next) => {
  MongoClient.connect(url, function(err, db) {
    if (err) throw err;
    var dbo = db.db("usersFromW3school");
    let users;
    fs.readFile('users_array.json', 'utf8', (err, data) => {     
      users =  JSON.parse(data) ;
      dbo.collection("users").insertMany(users, function(err, res) {
        if (err) throw err;
        console.log("josn documents were inserted");
        db.close();
      });

    });

    res.end('done');
   
  });
})

module.exports = router;
