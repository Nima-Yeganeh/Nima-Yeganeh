const filePath = 'log.html';
const fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
function fetchTitle(url, onComplete = null) {
    request(url, function (error, response, body) {
        var output = url;   // default to URL       
        if (!error && response.statusCode === 200) {
            var $ = cheerio.load(body);
            // console.log(`URL = ${url}`);

            var title = $("head > title").text().trim();
            var title = title;
            var title = title.replace('Title','');
            var title = title.replace('-','  ');
            var title = title.replace('تسنیم',' ');
            var title = title.replace('|',' ');
            var title = title.replace('-',' ');
            var title = title.replace('؛',' ');
            var title = title.replace('|',' ');
            var title = title.replace('+',' ');
            var title = title.replace('/',' ');
            var title = title.replace(':',' ');
            var title = title.replace('!',' ');
            // var title = title.replace('.',' ');
            var title = title.replace('؟',' ');
            var title = title.replace('?',' ');
            var title = title.replace(' |','');

            var title = title.replace('Tasnim','')
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
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
            console.log(title);
            // console.log(`Title = ${title}`);
            // output = `[${title}](${url})`;
        } else {
            console.log(`Error = ${error}, code = ${response.statusCode}`);
        }
        // console.log(`output = ${output} \n\n`);
        // if (onComplete) onComplete(output);
    });
}

// fetchTitle("https://www.tasnimnews.com/fa/news/2819200");

let id = 2819200;
while (id < 2819240) {
//    console.log(id);
    // let value = fetchTitle("https://www.tasnimnews.com/fa/news/"+id);
    fetchTitle("https://www.tasnimnews.com/fa/news/"+id);
    id++;
}
