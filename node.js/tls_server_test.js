var tls = require('tls');
    fs = require('fs');
    options = {
        key : fs.readFileSync('./private_key.pem'),
        cert : fs.readFileSync('./certificate.pem')
};
tls.createServer(options, function(s) {
    s.pipe(s);
}).listen(4000);
