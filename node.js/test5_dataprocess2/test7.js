const filePath = 'log.html';
const fs = require('fs');
var request = require('request');
var cheerio = require('cheerio');
function fetchTitle(url, onComplete = null) {
    request(url, function (error, response, body) {
        var output = url;   // default to URL       
        if (!error && response.statusCode === 200) {
            var $ = cheerio.load(body);
            //var title = $('title').text();            
            //vconsole.log(title);
            //var image = $().find('.*').find('img').attr('src'); 
            //console.log(image);
            links = $('a'); //jquery get all hyperlinks
            $(links).each(function(i, link){
                console.log($(link).attr('image'));
            });
        } else {
            console.log(`Error = ${error}, code = ${response.statusCode}`);
        }
    });
}

let id = 2819220;
while (id < 2819221) {
//    console.log(id);
    // let value = fetchTitle("https://www.tasnimnews.com/fa/news/"+id);
    fetchTitle("https://www.tasnimnews.com/fa/news/"+id);
    id++;
}
