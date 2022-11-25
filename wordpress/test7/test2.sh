      wp plugin install sg-cachepress --activate;
      wp sg optimize dynamic-cache disable;
      wp sg optimize file-cache disable;
      wp sg optimize autoflush-cache disable;
      wp sg optimize purge-rest-cache disable;
      wp sg optimize mobile-cache disable;
      wp sg optimize html disable;
      wp sg optimize js disable;
      wp sg optimize js-async disable;
      wp sg optimize combine-js disable;
      wp sg optimize css disable;
      wp sg optimize combine-css disable;
      wp sg optimize querystring disable;
      wp sg optimize emojis disable;
      wp sg optimize backup-media disable;
      wp sg optimize lazyload disable;
      wp sg optimize webp disable;
      wp sg optimize resize-images disable;
      wp sg optimize web-fonts disable;
      wp sg optimize fix-insecure-content disable;
      wp sg optimize preload-combined-css disable;
      wp sg database-optimization disable;

      wp core update;
      wp core update-db;
      wp disable-comments settings --types=all;

      wp plugin install wordpress-seo --activate;
      wp rewrite structure %postname%;
