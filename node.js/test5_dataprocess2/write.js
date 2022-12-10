var filePath = 'log.html';
var fs = require('fs');
fs.unlinkSync(filePath);
var logger = fs.createWriteStream(filePath, {
  flags: 'a'
})
logger.write('<p dir="rtl">')
var writeLine = (line) => logger.write(`\n${line}`);
writeLine('Data written to a new line');
writeLine('</p>');
