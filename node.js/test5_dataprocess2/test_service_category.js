const filePath = 'log.html';
const fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
function fetchTitle(url, onComplete = null) {
    request(url, function (error, response, body) {
        var output = url;   // default to URL       
        if (!error && response.statusCode === 200) {
            var $ = cheerio.load(body);
            var title = $('.service').text();
            var title = title.replace('-','  ');            
            console.log(title);
            fs.existsSync(filePath, function(exists) {
                if(exists) {
                    fs.unlinkSync(filePath);
                } else {
                    var logger = fs.createWriteStream(filePath, {
                        flags: 'a'
                    })    
                }
            });
            var logger = fs.createWriteStream(filePath, {
                flags: 'a'
            })
            logger.write('<p dir="rtl">');
            var writeLine = (line) => logger.write(`\n${line}`);
            writeLine(title);
            writeLine('</p>');
        } else {
            console.log(`Error = ${error}, code = ${response.statusCode}`);
        }
    });
}

let id = 2819220;
while (id < 2819231) {
//    console.log(id);
    // let value = fetchTitle("https://www.tasnimnews.com/fa/news/"+id);
    fetchTitle("https://www.tasnimnews.com/fa/news/"+id);
    id++;
}
