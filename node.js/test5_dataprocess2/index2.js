const axios = require("axios");
const cheerio = require("cheerio");

axios
  .get("https://blog.logrocket.com/")
  .then((response) => {
    const $ = cheerio.load(response.data);

    const featuredArticles = $(".listfeaturedtag .padlr10");

    for (let i = 0; i < featuredArticles.length; i++) {
      let postTitleWrapper = $(featuredArticles[i]).find(".card-title")[0],
        postTitle = $(postTitleWrapper).text();

      let authorWrapper = $(featuredArticles[i]).find(".post-name a")[0],
        author = $(authorWrapper).text();

      let postDescWrapper = $(featuredArticles[i]).find(".card-text")[0],
        postDesc = $(postDescWrapper).text();

      let postLinkWrapper = $(featuredArticles[i]).find(".card-title > a")[0],
        postLink = $(postLinkWrapper).attr("href");

      // console.log("\n++++++");
      console.log(`${postTitle} by [${author}]`);
      console.log(`${postDesc}`);
      console.log("\n" + `Read More - ${postLink}`);
      console.log("\n----\n\n");
    }
  })
  .catch((err) => console.log("Fetch error " + err));
