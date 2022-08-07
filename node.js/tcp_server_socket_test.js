require('net').createServer(function(socket) {
     // new connection
    socket.on('data', function(data) {
    // got data
    });
    socket.on('end', function(data) {
    // connection closed
    });
    socket.write('Some string');
}).listen(4001);
