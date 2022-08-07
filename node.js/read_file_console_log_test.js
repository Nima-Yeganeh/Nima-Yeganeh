// Option 1
const fs = require('fs');
fs.readFile('./lorem.txt', (err, data) => {
    if(err) {
        return console.log('Error occurred while reading file');
    }
    console.log(data.toString());
});

// Option 2
const data = fs.readFileSync('./lorem.txt'); console.log(data.toString());
