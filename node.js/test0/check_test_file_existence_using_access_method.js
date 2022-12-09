const fs = require('fs');
const path = './sample-file.txt';
fs.access(path, fs.F_OK, (err) => {
    if (err) {
        console.error(err);
        return;
    } else {
        return console.log('OK!');
    }
});
