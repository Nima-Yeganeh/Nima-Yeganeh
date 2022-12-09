const express = require('express');
const bodyParser = require('body-parser');
const mysql = require("mysql");
const mongo = require("mongodb");
const app = express();
const router = express.Router();
const pool = mysql.createPool({
 connectionLimit: 100,
 host: "localhost",
 user: "root",
 password: "",
 database: "database_name",
 debug: false,
});
const url = "mongodb://localhost:27017/";

pool.query("SELECT * from LIMIT 10", (err, rows) => {
 if (err) {
   console.log("error occurred during the connection.");
 }
 //console.log(rows[0]);
});

//mongo.connect(url, { useNewUrlParser: true }, (err, db) => {
//  if (err) {
//    console.log(err);
//    process.exit(0);
//  }
//  console.log("database connected!");
//  var dbo = db.db("test");
//  dbo.createCollection("customers", (err, result) => {
//    if (err) {
//      console.log(err);
//      process.exit(0);
//    }
//    console.log("collection created!");
//    db.close();
//  });
// });

//mongo.connect(url, { useNewUrlParser: true }, (err, db) => {
//  if (err) {
//    console.log(err);
//    process.exit(0);
//  }
//  console.log("database connected!");
//  db.close();
// });

router.use((req, res, next) => {
  console.log('Time:', Date.now());
  next();
});

router.get('/home', (req,res) => {
  res.send('Hello World, This is home router');
});

router.get('/profile', (req,res) => {
  res.send('Hello World, This is profile router');
});

router.get('/login', (req,res) => {
  res.send('Hello World, This is login router');
});

router.get('/logout', (req,res) => {
  res.send('Hello World, This is logout router');
});

app.use(bodyParser.json());
app.use((err, req, res, next) => {
  res.status(500).send('Something broke!')
});
app.use('/', router);
app.listen(process.env.port || 3000);
console.log('Web Server is listening at port '+ (process.env.port || 3000));
