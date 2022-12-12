const {execSync} = require('child_process');
const FILE_LOCATION = 'url.txt';
const fs2 = require('fs');
const filePath = 'log.html';
const fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
function fetchTitle(url, onComplete = null) {
    request(url, function (error, response, body) {
        var output = url;
        if (!error && response.statusCode === 200) {
            var $ = cheerio.load(body);
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
            var title = title.replace('؟',' ');
            var title = title.replace('?',' ');
            var title = title.replace(' |','');
            var title = title.replace('Tasnim','')
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            console.log(title);
            var lead = $('.lead').text();
            console.log(lead);
            var story = $('.story').text();
            var story = story.replace('-','  ');            
            console.log(story);
            var category = $('.service').text();
            var category = category.replace('-','  ');            
            console.log(category);
            var datetime = $('.time').text();
            var datetime = datetime.replace('-','  ');            
            console.log(datetime);
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
            writeLine('<p dir="rtl">');
            writeLine(lead);
            writeLine('</p>');
            writeLine('<p dir="rtl">');
            writeLine(story);
            writeLine('</p>');
            writeLine('<p dir="rtl">');
            writeLine(category);
            writeLine('</p>');
            writeLine('<p dir="rtl">');
            writeLine(datetime);
            writeLine('</p>');
            
            var logger = fs2.createWriteStream(FILE_LOCATION, {
                flags: 'a'
            })
            var writeLine = (line) => logger.write(`\n${line}`);
            writeLine(url);

            

        } else {
            console.log(`Error = ${error}, code = ${response.statusCode}`);
        }
    });
}

// fetchTitle("https://www.tasnimnews.com/fa/news/2819200");
let id = 2819220;
while (id < 2819260) {
    console.log(id);
    let new_url = "https://www.tasnimnews.com/fa/news/"+id;
    fs2.readFile(FILE_LOCATION, function (err, data) {
        if (err) throw err;
        if(data.indexOf(new_url) >= 0){
            console.log(new_url+' >> done')
        } else {
            console.log(new_url+' >> not done')
            fetchTitle(new_url);
        }
    });
    id++;
}

