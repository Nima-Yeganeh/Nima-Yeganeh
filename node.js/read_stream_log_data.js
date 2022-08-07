var fs = require('fs'); // get the fs module
var readStream = fs.createReadStream('/etc/passwd');
readStream.on('data', function(data) {
    console.log(data);
});
readStream.on('end', function() {
    console.log('file ended');
});
