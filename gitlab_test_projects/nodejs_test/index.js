const express = require('express');
const app = express();
const port = process.env.NODE_PORT || 3000;
app.get('/', function (req, res) {
  res.send('Hello World From Gitlab!');
});
app.listen(port, function () {
  console.log('Listening on port ' + port);
});
