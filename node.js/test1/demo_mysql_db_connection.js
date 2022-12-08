var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "wordpress",
  password: "wordpress"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
