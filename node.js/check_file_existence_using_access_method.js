const fs = require('fs');
const path = './config.js';
fs.access(path, fs.F_OK, (err) => {
    if (err) {
        console.error(err);
        return;
    } else {
        return console.log('OK!');
    }
});
