var https = require('https'),
    fs = require('fs');
var options = {
    key: fs.readFileSync('./private_key.pem'),
    cert: fs.readFileSync('./certificate.pem')
};
https.createServer(options, function(req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World!');
}).listen(4000);
