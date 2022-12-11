const htmlString = `
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
<div class="gallery-carousel">
<ul>
<li class="slide selected">
<button><img src="https://i.stack.imgur.com/rC97H.png" alt="hello" /> </button>
</li>
<li class="slide">
<button><img src="https://i.stack.imgur.com/1.png" alt="hello" /> </button>
</li>
<li class="slide">
<button><img src="https://i.stack.imgur.com/2.png" alt="hello" /> </button>
</li>
</ul>
</div>
`;

let cheerio = require('cheerio');
let $ = cheerio.load(htmlString, { decodeEntities: false, withStartIndices: true });
var listItems = $(".gallery-carousel ul li");
listItems.each(function(idx, li) {
    let image=  $(li).find('img').attr('src'); 
    console.log(image);
    // and the rest of your code
});
