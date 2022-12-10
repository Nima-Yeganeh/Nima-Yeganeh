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
            var title = title.replace('Tasnim','')
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            var title = title.replace('  ',' ');
            
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

// fetchTitle("https://github.com/aharshac/KandyCpp");
// fetchTitle("https://www.collaborizm.com/");
fetchTitle("https://www.tasnimnews.com/fa/news/2819213");
