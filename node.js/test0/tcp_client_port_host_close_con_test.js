var net = require('net');
var port = 80;
var host = 'www.google.com';
var conn = net.createConnection(port, host);
conn.on('data', function(data) {
    console.log('some data has arrived')
});
conn.write('some string over to you!');
conn.on('close', function() {
    console.log('connection closed');
});
