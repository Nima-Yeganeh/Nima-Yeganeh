const axios = require("axios");
const cheerio = require("cheerio");

axios
  .get("https://www.tasnimnews.com/fa/news/2819220")
  .then((response) => {
    const $ = cheerio.load(response.data);
      let postTitleWrapper = $();
        postTitle = $(postTitleWrapper).text();
      console.log(postTitle);
      console.log(postTitleWrapper);
  })
  .catch((err) => console.log("Fetch error " + err));
