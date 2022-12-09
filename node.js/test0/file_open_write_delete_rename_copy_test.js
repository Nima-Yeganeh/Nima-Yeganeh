// fs.open() method opens a new file or creates a new empty file if it does not exist in the specified path.
// It takes the second parameter which acts as a flag such as w for writing, w+ for reading and writing, etc. Code:
const fs = require('fs');
fs.open('file.txt', 'w', (err, file) => {
    if (err) {
        throw err;  
    }
    console.log('Saved!');
});

// To delete a file, we can use fs.unlink() method.

fs.unlink('copyfile.txt', (err) => {
    if (err) {
        throw err;
    }
    console.log('File deleted!');
});

// fs.writeFile() method allows you to create or replace files with the content.
// If a file exists, it will replace the content with the provided content and if the file does not exist, it will create it.

fs.writeFile('file.txt', 'Hello World!', (err) => {
    if (err) {
        throw err;
    }
    console.log('Saved!');
});

// fs.appendFile() method appends the provided content at the end of the file.

fs.appendFile('file.txt', ' Hello World - Second part updated!', (err) => {
    if (err) {
        throw err;
    }
    console.log('Updated!');
});

// To rename a file, we can use the fs.rename() method.

fs.rename('file.txt', 'newfile.txt', (err) => {
    if (err) {
        throw err;
    }
    console.log('File Renamed!');
});

// You can also copy files using the fs.copy() method.

fs.copyFile('newfile.txt', 'copyfile.txt', (err) => {
    if (err) {
        throw err;
    }
    console.log('File is copied!');
});

