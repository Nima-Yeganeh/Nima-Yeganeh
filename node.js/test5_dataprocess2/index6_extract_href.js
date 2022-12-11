var request = require('request');
var cheerio = require('cheerio');
var searchTerm = 'screen+scraping';
var url = 'http://www.bing.com/search?q=' + searchTerm;
request(url, function(err, resp, body){
  $ = cheerio.load(body);
  links = $('a'); //jquery get all hyperlinks
  $(links).each(function(i, link){
    console.log($(link).attr('href'));
  });
});
