var http = require('http');
var server = http.createServer();
server.on('request', function(req, res) {
    res.end('Hello World! This is a test...');
});
server.listen(8080);
