var tls = require('tls'),
    fs = require('fs'),
    port = 4000,
    host = 'localhost',
    options = {
        key : fs.readFileSync('./private_key.pem'),
        cert : fs.readFileSync('./certificate.pem')
};

var client = tls.connect(port, host, options, function() {
    console.log('connected');
    console.log('authorized: ' + client.authorized);
    client.on('data', function(data) {
        client.write(data); // just send data back to server
    });
});
