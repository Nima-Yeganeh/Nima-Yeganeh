const FILE_LOCATION = 'url.txt';
const fs2 = require('fs');
fs2.readFile(FILE_LOCATION, function (err, data) {
    if (err) throw err;
    if(data.indexOf('http://google.com') >= 0){
        console.log('done')
    } else {
        console.log('not done')
    }
});
