var dgram = require('dgram');
var client = dgram.createSocket('udp4');
var message = new Buffer.from('this is a message');
client.send(message, 0, message.length, 4000, 'localhost');
client.send('test!', 0, message.length, 4000, 'localhost', function() {
    // you can reuse the buffer now
});
client.close();
