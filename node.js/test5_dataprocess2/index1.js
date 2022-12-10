const htmlString = `

<!doctype html>
<html lang="en" prefix="og: http://ogp.me/ns#">
<head>
<meta charset="utf-8">

<title>css</title>

  <meta name="description" content="CSS parser / stringifier">
  <meta property="og:description" content="CSS parser / stringifier">
  <meta property="og:title" content="css">
  <meta property="og:url" content="https://www.npmjs.com/package/css">
  <meta property="og:site_name" content="npm">
  <meta name="keywords" content="css,parser,stringifier,stylesheet">
  <meta name="twitter:card" content="summary">
  <meta name="twitter:url" content="https://www.npmjs.com/package/css">
  <meta name="twitter:title" content="npm: css">
  <meta name="twitter:description" content="CSS parser / stringifier">


<meta http-equiv="cleartype" content="on" />

<meta name="apple-mobile-web-app-capable" content="no">


  <meta name="viewport" content="width=device-width,minimum-scale=1.0,initial-scale=1,user-scalable=yes">

<meta name="x-npm:ga:id" content="UA-47041310-1">
<meta name="x-npm:ga:dimensions" content="{&quot;aboveChrome&quot;:&quot;dimension1&quot;,&quot;belowHeader&quot;:&quot;dimension3&quot;,&quot;packagePage&quot;:&quot;dimension2&quot;}">

<link rel="canonical" href="https://www.npmjs.com/package/css">
<link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="npm">

  <link rel="stylesheet" media="all" href="/static/css/index.css?last-changed&#x3D;92f5f46c6fb6ba8b9da02d18f7fdf4c3">

<!--[if lt IE 9]>
  <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>
<![endif]-->

<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700">

  <script src="/static/js/index.min.js?last-changed&#x3D;cf237eee9cb8227957d17183a3ee5fa2"></script>
  <style>
    .marketing {
margin: 0px;
margin-left: -10px;
margin-bottom: 40px;
padding: 0px 0px;
font-size: 15px;
font-style: normal;
fond-variant: normal;
fort-weight: normal;
background: rgba(0, 0, 0, 0.02);
border-radius: 2px;
border: 1px solid rgba(0, 0, 0, 0.2);
color: rgba(0, 0, 0, 0.4);
text-decoration: none;
letter-spacing: -0.03em;
line-height: 22.5px;
}

.marketing a {
font-weight: 400;
text-decoration: none;
color: #cb3837;
}

.marketing h3 {
display: block;
margin: 0;
padding: 20px 0 10px 0;
font-size: 20px;
font-style: normal;
font-variant: normal;
font-weight: 400;
line-height: 22px;
text-decoration: none;
color: rgba(0, 0, 0, 0.8);
}

.marketing h3 a {
color: rgba(0, 0, 0, 0.8);
}

.marketing h3 a:hover {
color: #cb3837;
}

.marketing p {
line-height: 22.5px;
margin-left: 10px;
margin-right: 10px;
}

.marketing p a {
white-space: nowrap;
}

#marketing-texthed {
margin-left: 10px;
}
  </style>
<link rel="apple-touch-icon" sizes="57x57" href="/static/images/touch-icons/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/static/images/touch-icons/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/static/images/touch-icons/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/static/images/touch-icons/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/static/images/touch-icons/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/static/images/touch-icons/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/static/images/touch-icons/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/static/images/touch-icons/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/static/images/touch-icons/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="/static/images/touch-icons/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png" href="/static/images/touch-icons/favicon-230x230.png" sizes="230x230">
<link rel="icon" type="image/png" href="/static/images/touch-icons/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="/static/images/touch-icons/android-chrome-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="/static/images/touch-icons/coast-228x228.png" sizes="228x228">
<link rel="icon" type="image/png" href="/static/images/touch-icons/favicon-16x16.png" sizes="16x16">
<link rel="manifest" href="/static/images/touch-icons/manifest.json">
<link rel="yandex-tableau-widget" href="/static/images/touch-icons/yandex-browser-manifest.json">
<meta property="og:image" content="https://www.npmjs.com/static/images/touch-icons/open-graph.png">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="msapplication-TileColor" content="#cb3837">
<meta name="msapplication-TileImage" content="/static/images/touch-icons/mstile-144x144.png">
<meta name="msapplication-config" content="/static/images/touch-icons/browserconfig.xml">
<meta name="theme-color" content="#cb3837">

</head>

<body itemscope itemtype="http://schema.org/WebSite" data-crumb="UnbRB6oQBEGbsOTIznMwvVawVjzRZ2gk8nYKqOmmO-P">
<meta itemprop="url" content="https://www.npmjs.com/">


<header class="anonymous   ">
<!-- logo -->
<div class="header-item brand-container">
  <div class="logo-container" id='npm-logo'>
    <a href="/"><svg viewBox="0 0 18 7">
<path fill="#CB3837" d="M0,0v6h5v1h4v-1h9v-6"/>
<path fill="#FFF" d="M1,1v4h2v-3h1v3h1v-4h1v5h2v-4h1v2h-1v1h2v-4h1v4h2v-3h1v3h1v-3h1v3h1v-4"/>
</svg></a>
  </div>
</div>
<!-- /logo -->

<!-- search -->
<div class="header-item header-search-container">
  <form class="site-search" id="npm-search" action="/search" method="get" itemprop="potentialAction" itemscope itemtype="http://schema.org/SearchAction">
    <meta itemprop="target" content="https://www.npmjs.com/search?q={q}">
    <div id="site-search-container">
        <input name="q" value="" type="search" id="site-search" placeholder="find packages" tabindex="1" autocorrect="off" autocapitalize="off" itemprop="query-input" />
    </div>
    <button tabindex="2" type="submit">
      <span class="a11y-only">Search</span>
      <svg viewBox="0 0 34 34" fill="none" stroke="currentColor">
  <ellipse stroke-width="3" cx="16" cy="15" rx="12" ry="12"/>
  <path d="M26 26 l 8 8" stroke-width="3" stroke-linecap="square"/>
</svg>
    </button>
  </form>
</div>


<!-- menu 1 -->
<div class="header-item user-info-container">
  <div class="user-info">
      <ul class="user-info-salutation single">
        <li><a href="/signup">sign up</a> or <a href="/login">log in</a></li>
        <li><a href="/login"><span class="a11y-only">log in</span><svg viewBox="-2765 2857 1080 1080">
<path fill="#986844" d="M-1811.2 3598.5c-.1-4.3-.3-11.3-.8-20.3-.9-15.8-2.7-40.9-6.6-70.7-6.9-52.6-21.6-130.1-52.6-200.4-22.3-50.4-53.5-97.1-90.3-135.2-4.4-20.5-16.7-66.5-43.5-104.8l-5-7.2-54 35.5c-44.5-22.4-91-33.7-138.6-33.7-47.5 0-94.1 11.3-138.6 33.7l-54-35.5-5 7.2c-26.8 38.3-39 84.3-43.5 104.8-36.8 38.1-68 84.8-90.3 135.3-31.1 70.3-45.8 147.8-52.6 200.4-6.1 46.6-7.2 81.6-7.5 93.8 16.6 14 31.3 29.8 46.9 45 17.2 16.7 39.4 28.2 59.1 41.6 1.7 1.1 3.1 2.6 4.2 4.1 15.7 10.4 31 15.4 50.2 19.5 19.2 4.1 35.6 5.6 55.6 7.3 38.7 3.2 77 7.7 115.5 12.6 43.1 5.4 86.5 11.5 130 13.1 41.6 1.5 81.8-9 121.8-19.3 8.9-2.3 17.9-4.5 26.8-6.8.6-4.2 3-8.1 6.7-10.4 40.1-25 81.2-48.2 122-72 5.9-3.5 13.7-1.9 17.9 3.3 9-8.9 17.1-18.2 24.3-27.9l.2-.2.2-.2c1.7-2.6 1.8-2.7 1.5-12.6z"/>
<path fill="#FFF" d="M-1808.7 3494.8c-6.9-53.2-21.8-131.7-53.4-203.2-22.3-50.5-53.5-97.5-90.3-136.1-5.5-24.4-18.2-68.2-44.5-105.7l-10.6-15.1-57.3 37.7c-44.3-21.4-90.6-32.2-137.9-32.2-47.2 0-93.6 10.8-137.9 32.2l-57.3-37.7-10.6 15.1c-26.2 37.5-39 81.2-44.5 105.7-36.7 38.5-67.9 85.5-90.3 136.1-31.6 71.4-46.5 149.9-53.4 203.2-7.5 57.7-7.6 98-7.6 99.7v6.3l3.8 5.1c26 35 62.9 64.7 109.6 88.3 36.9 18.6 80 33.6 128.3 44.4 82.2 18.5 151.8 19 159.5 19h.6c7.7 0 77.3-.5 159.5-19 48.3-10.8 91.4-25.8 128.3-44.4 46.7-23.6 83.6-53.3 109.6-88.3l3.7-5v-6.3c.4-1.8.2-42.3-7.3-99.8zm-118.3 174.3c-34.8 17.6-75.8 31.8-121.8 42.1-80.7 18.1-150.4 18.3-153.4 18.3h-.6c-2.9 0-72.7-.2-153.4-18.3-46-10.3-87-24.5-121.8-42.1-41.7-21.1-74.7-47.2-98-77.6.4-22.5 5.1-167.5 58.6-288.5 21.8-49.3 52.4-94.9 88.5-131.8l1.8-1.9.5-2.6c2.7-13.1 12.9-56.4 36.3-93.4l37.2 24.5-7.3 16.6 22.8-11.9c43.3-22.6 88.7-34.1 135-34.1s91.7 11.5 135 34.1l22.8 11.9-7.3-16.6 37.2-24.5c23.4 37 33.6 80.4 36.3 93.4l.5 2.6 1.8 1.9c36.1 36.9 66.7 82.5 88.5 131.8 53.5 121 58.2 266.1 58.6 288.5-23.2 30.4-56.1 56.5-97.8 77.6zm-163-13c0 30.1-50.4 54.4-112.5 54.4s-112.5-24.4-112.5-54.4c0-30.1 50.4-54.4 112.5-54.4s112.5 24.3 112.5 54.4zm-223.5-65.3c0 12.3-10 22.3-22.3 22.3s-22.3-10-22.3-22.3 10-22.3 22.3-22.3c12.3-.1 22.3 9.9 22.3 22.3zm267.8 0c0 12.3-10 22.3-22.3 22.3s-22.3-10-22.3-22.3 10-22.3 22.3-22.3c12.3-.1 22.3 9.9 22.3 22.3z"/>
</svg></a></li>
      </ul>
  </div> <!-- .user-info -->
</div>
<!-- /menu 1 -->

<!-- menu 2 -->
<div class="header-item header-nav-menu-container">
  <a href="#" id="npm-expansions" class="npm-expansions" data-event-trigger="click" data-event-name="npm-expansions">node package manager</a>

  <div class="nav-menu-container" role="navigation">
    <a class="nav-toggle drop-down-menu-toggle" href="#product-navigation"><span class="a11y-only">Toggle Navigation</span>
      <svg viewBox="0 0 44 44">
  <rect x="4" y="12" fill="currentColor" width="36" height="2"/>
  <rect x="4" y="20" fill="currentColor" width="36" height="2"/>
  <rect x="4" y="28" fill="currentColor" width="36" height="2"/>
</svg>
    </a>


    <div class="drop-down-menu-container" role="menu">
      <nav id="product-navigation" class="product-navigation drop-down-menu">
        <ul class="drop-down-menu-section products-list">
          <li><a id="nav-enterprise-link" href="/npm/enterprise">npm Enterprise</a></li>
          <li><a id="nav-features-link" href="/features" data-event-trigger="click" data-event-name="features-nav-link">features</a></li>
          <li><a id="nav-pricing-link" href="/pricing">pricing</a></li>
          <li><a id="nav-docs-link" href="https://docs.npmjs.com">documentation</a></li>
          <li><a id="nav-support-link" href="/support">support</a></li>
        </ul>
      </nav>
    </div>
  </div>
</div>
<!-- /menu 2 -->



</header>




  <div class="container content">

<div class="content-column">

<h1 class="package-name">
  <a href="/package/css">css</a>
    <i class="icon-public"></i>
</h1>

<form class="star">
  <input type="hidden" name="name" value="css">
  <input id="star-input" type="checkbox" name="isStarred" value="true" >
  <label for="star-input" class="icon-star"></label>
    <input type="hidden" name="crumb" value="UnbRB6oQBEGbsOTIznMwvVawVjzRZ2gk8nYKqOmmO-P"/>
</form>

<div id="readme" class="markdown">
    <h1 class="package-name-redundant"><a id="user-content-css" class="deep-link" href="#css"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>css <a href="https://travis-ci.org/reworkcss/css"><img src="https://travis-ci.org/reworkcss/css.svg?branch=master" alt="Build Status" class="badge badge" /></a></h1>
<p class="package-description-redundant">CSS parser / stringifier.</p>
<h2><a id="user-content-installation" class="deep-link" href="#installation"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Installation</h2>
<pre><code>$ npm install css
</code></pre>
<h2><a id="user-content-usage" class="deep-link" href="#usage"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Usage</h2>
<div class="highlight js"><pre class="editor editor-colors"><div class="line"><span class="source js"><span class="storage type js"><span>var</span></span><span> css </span><span class="keyword operator assignment js"><span>=</span></span><span> </span><span class="meta function-call js"><span class="support function js"><span>require</span></span><span class="meta js"><span class="punctuation definition begin round js"><span>(</span></span><span class="string quoted single js"><span class="punctuation definition string begin js"><span>'</span></span><span>css</span><span class="punctuation definition string end js"><span>'</span></span></span><span class="punctuation definition end round js"><span>)</span></span></span></span><span class="punctuation terminator statement js"><span>;</span></span></span></div><div class="line"><span class="source js"><span class="storage type js"><span>var</span></span><span> obj </span><span class="keyword operator assignment js"><span>=</span></span><span> </span><span class="variable other object js"><span>css</span></span><span class="meta js"><span class="meta delimiter method period js"><span>.</span></span><span class="support function js"><span>parse</span></span><span class="meta js"><span class="punctuation definition begin round js"><span>(</span></span><span class="string quoted single js"><span class="punctuation definition string begin js"><span>'</span></span><span>body { font-size: 12px; }</span><span class="punctuation definition string end js"><span>'</span></span></span><span class="meta delimiter object comma js"><span>,</span></span><span> options</span><span class="punctuation definition end round js"><span>)</span></span></span></span><span class="punctuation terminator statement js"><span>;</span></span></span></div><div class="line"><span class="source js"><span class="variable other object js"><span>css</span></span><span class="meta js"><span class="meta delimiter method period js"><span>.</span></span><span class="entity name function js"><span>stringify</span></span><span class="meta js"><span class="punctuation definition begin round js"><span>(</span></span><span>obj</span><span class="meta delimiter object comma js"><span>,</span></span><span> options</span><span class="punctuation definition end round js"><span>)</span></span></span></span><span class="punctuation terminator statement js"><span>;</span></span></span></div></pre></div>
<h2><a id="user-content-api" class="deep-link" href="#api"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>API</h2>
<h3><a id="user-content-cssparsecode-options" class="deep-link" href="#cssparsecode-options"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>css.parse(code, [options])</h3>
<p>Accepts a CSS string and returns an AST <code>object</code>.</p>
<p><code>options</code>:</p>
<ul>
<li>silent: silently fail on parse errors.</li>
<li>source: the path to the file containing <code>css</code>. Makes errors and source
maps more helpful, by letting them know where code comes from.</li>
</ul>
<h3><a id="user-content-cssstringifyobject-options" class="deep-link" href="#cssstringifyobject-options"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>css.stringify(object, [options])</h3>
<p>Accepts an AST <code>object</code> (as <code>css.parse</code> produces) and returns a CSS string.</p>
<p><code>options</code>:</p>
<ul>
<li>indent: the string used to indent the output. Defaults to two spaces.</li>
<li>compress: omit comments and extraneous whitespace.</li>
<li>sourcemap: return a sourcemap along with the CSS output. Using the <code>source</code>
option of <code>css.parse</code> is strongly recommended when creating a source map.
Specify <code>sourcemap: 'generator'</code> to return the SourceMapGenerator object
instead of serializing the source map.</li>
<li>inputSourcemaps: (enabled by default, specify <code>false</code> to disable) reads any
source maps referenced by the input files when generating the output source
map. When enabled, file system access may be required for reading the
referenced source maps.</li>
</ul>
<h3><a id="user-content-example" class="deep-link" href="#example"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Example</h3>
<div class="highlight js"><pre class="editor editor-colors"><div class="line"><span class="source js"><span class="storage type js"><span>var</span></span><span> ast </span><span class="keyword operator assignment js"><span>=</span></span><span> </span><span class="variable other object js"><span>css</span></span><span class="meta js"><span class="meta delimiter method period js"><span>.</span></span><span class="support function js"><span>parse</span></span><span class="meta js"><span class="punctuation definition begin round js"><span>(</span></span><span class="string quoted single js"><span class="punctuation definition string begin js"><span>'</span></span><span>body { font-size: 12px; }</span><span class="punctuation definition string end js"><span>'</span></span></span><span class="meta delimiter object comma js"><span>,</span></span><span> </span><span class="meta brace curly js"><span>{</span></span><span> source</span><span class="keyword operator js"><span>:</span></span><span> </span><span class="string quoted single js"><span class="punctuation definition string begin js"><span>'</span></span><span>source.css</span><span class="punctuation definition string end js"><span>'</span></span></span><span> </span><span class="meta brace curly js"><span>}</span></span><span class="punctuation definition end round js"><span>)</span></span></span></span><span class="punctuation terminator statement js"><span>;</span></span></span></div><div class="line"><span class="source js"><span> </span></span></div><div class="line"><span class="source js"><span class="storage type js"><span>var</span></span><span> css </span><span class="keyword operator assignment js"><span>=</span></span><span> </span><span class="variable other object js"><span>css</span></span><span class="meta js"><span class="meta delimiter method period js"><span>.</span></span><span class="entity name function js"><span>stringify</span></span><span class="meta js"><span class="punctuation definition begin round js"><span>(</span></span><span>ast</span><span class="punctuation definition end round js"><span>)</span></span></span></span><span class="punctuation terminator statement js"><span>;</span></span></span></div><div class="line"><span class="source js"><span> </span></span></div><div class="line"><span class="source js"><span class="storage type js"><span>var</span></span><span> result </span><span class="keyword operator assignment js"><span>=</span></span><span> </span><span class="variable other object js"><span>css</span></span><span class="meta js"><span class="meta delimiter method period js"><span>.</span></span><span class="entity name function js"><span>stringify</span></span><span class="meta js"><span class="punctuation definition begin round js"><span>(</span></span><span>ast</span><span class="meta delimiter object comma js"><span>,</span></span><span> </span><span class="meta brace curly js"><span>{</span></span><span> sourcemap</span><span class="keyword operator js"><span>:</span></span><span> </span><span class="constant language boolean true js"><span>true</span></span><span> </span><span class="meta brace curly js"><span>}</span></span><span class="punctuation definition end round js"><span>)</span></span></span></span><span class="punctuation terminator statement js"><span>;</span></span></span></div><div class="line"><span class="source js"><span class="variable other object js"><span>result</span></span><span class="meta delimiter period js"><span>.</span></span><span class="support constant dom js"><span>code</span></span><span> </span><span class="comment line double-slash js"><span class="punctuation definition comment js"><span>//</span></span><span> string with CSS</span><span> </span></span></span></div><div class="line"><span class="source js"><span class="variable other object js"><span>result</span></span><span class="meta delimiter period js"><span>.</span></span><span class="variable other js"><span>map</span></span><span> </span><span class="comment line double-slash js"><span class="punctuation definition comment js"><span>//</span></span><span> source map object</span><span> </span></span></span></div></pre></div>
<h3><a id="user-content-errors" class="deep-link" href="#errors"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Errors</h3>
<p>Errors thrown during parsing have the following properties:</p>
<ul>
<li>message: <code>String</code>. The full error message with the source position.</li>
<li>reason: <code>String</code>. The error message without position.</li>
<li>filename: <code>String</code> or <code>undefined</code>. The value of <code>options.source</code> if
passed to <code>css.parse</code>. Otherwise <code>undefined</code>.</li>
<li>line: <code>Integer</code>.</li>
<li>column: <code>Integer</code>.</li>
<li>source: <code>String</code>. The portion of code that couldn't be parsed.</li>
</ul>
<p>When parsing with the <code>silent</code> option, errors are listed in the
<code>parsingErrors</code> property of the <a href="#stylesheet"><code>stylesheet</code></a> node instead
of being thrown.</p>
<p>If you create any errors in plugins such as in
<a href="https://github.com/reworkcss/rework">rework</a>, you <strong>must</strong> set the same
properties for consistency.</p>
<h2><a id="user-content-ast" class="deep-link" href="#ast"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>AST</h2>
<p>Interactively explore the AST with <a href="http://iamdustan.com/reworkcss_ast_explorer/">http://iamdustan.com/reworkcss_ast_explorer/</a>.</p>
<h3><a id="user-content-common-properties" class="deep-link" href="#common-properties"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Common properties</h3>
<p>All nodes have the following properties.</p>
<h4><a id="user-content-position" class="deep-link" href="#position"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>position</h4>
<p>Information about the position in the source string that corresponds to
the node.</p>
<p><code>Object</code>:</p>
<ul>
<li>start: <code>Object</code>:
<ul>
<li>line: <code>Number</code>.</li>
<li>column: <code>Number</code>.</li>
</ul>
</li>
<li>end: <code>Object</code>:
<ul>
<li>line: <code>Number</code>.</li>
<li>column: <code>Number</code>.</li>
</ul>
</li>
<li>source: <code>String</code> or <code>undefined</code>. The value of <code>options.source</code> if passed to
<code>css.parse</code>. Otherwise <code>undefined</code>.</li>
<li>content: <code>String</code>. The full source string passed to <code>css.parse</code>.</li>
</ul>
<p>The line and column numbers are 1-based: The first line is 1 and the first
column of a line is 1 (not 0).</p>
<p>The <code>position</code> property lets you know from which source file the node comes
from (if available), what that file contains, and what part of that file was
parsed into the node.</p>
<h4><a id="user-content-type" class="deep-link" href="#type"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>type</h4>
<p><code>String</code>. The possible values are the ones listed in the Types section below.</p>
<h4><a id="user-content-parent" class="deep-link" href="#parent"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>parent</h4>
<p>A reference to the parent node, or <code>null</code> if the node has no parent.</p>
<h3><a id="user-content-types" class="deep-link" href="#types"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Types</h3>
<p>The available values of <code>node.type</code> are listed below, as well as the available
properties of each node (other than the common properties listed above.)</p>
<h4><a id="user-content-stylesheet" class="deep-link" href="#stylesheet"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>stylesheet</h4>
<p>The root node returned by <code>css.parse</code>.</p>
<ul>
<li>stylesheet: <code>Object</code>:
<ul>
<li>rules: <code>Array</code> of nodes with the types <code>rule</code>, <code>comment</code> and any of the
at-rule types.</li>
<li>parsingErrors: <code>Array</code> of <code>Error</code>s. Errors collected during parsing when
option <code>silent</code> is true.</li>
</ul>
</li>
</ul>
<h4><a id="user-content-rule" class="deep-link" href="#rule"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>rule</h4>
<ul>
<li>selectors: <code>Array</code> of <code>String</code>s. The list of selectors of the rule, split
on commas. Each selector is trimmed from whitespace and comments.</li>
<li>declarations: <code>Array</code> of nodes with the types <code>declaration</code> and <code>comment</code>.</li>
</ul>
<h4><a id="user-content-declaration" class="deep-link" href="#declaration"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>declaration</h4>
<ul>
<li>property: <code>String</code>. The property name, trimmed from whitespace and
comments. May not be empty.</li>
<li>value: <code>String</code>. The value of the property, trimmed from whitespace and
comments. Empty values are allowed.</li>
</ul>
<h4><a id="user-content-comment" class="deep-link" href="#comment"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>comment</h4>
<p>A rule-level or declaration-level comment. Comments inside selectors,
properties and values etc. are lost.</p>
<ul>
<li>comment: <code>String</code>. The part between the starting <code>/*</code> and the ending <code>*/</code>
of the comment, including whitespace.</li>
</ul>
<h4><a id="user-content-charset" class="deep-link" href="#charset"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>charset</h4>
<p>The <code>@charset</code> at-rule.</p>
<ul>
<li>charset: <code>String</code>. The part following <code>@charset</code>.</li>
</ul>
<h4><a id="user-content-custom-media" class="deep-link" href="#custom-media"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>custom-media</h4>
<p>The <code>@custom-media</code> at-rule.</p>
<ul>
<li>name: <code>String</code>. The <code>--</code>-prefixed name.</li>
<li>media: <code>String</code>. The part following the name.</li>
</ul>
<h4><a id="user-content-document" class="deep-link" href="#document"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>document</h4>
<p>The <code>@document</code> at-rule.</p>
<ul>
<li>document: <code>String</code>. The part following <code>@document</code>.</li>
<li>vendor: <code>String</code> or <code>undefined</code>. The vendor prefix in <code>@document</code>, or
<code>undefined</code> if there is none.</li>
<li>rules: <code>Array</code> of nodes with the types <code>rule</code>, <code>comment</code> and any of the
at-rule types.</li>
</ul>
<h4><a id="user-content-font-face" class="deep-link" href="#font-face"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>font-face</h4>
<p>The <code>@font-face</code> at-rule.</p>
<ul>
<li>declarations: <code>Array</code> of nodes with the types <code>declaration</code> and <code>comment</code>.</li>
</ul>
<h4><a id="user-content-host" class="deep-link" href="#host"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>host</h4>
<p>The <code>@host</code> at-rule.</p>
<ul>
<li>rules: <code>Array</code> of nodes with the types <code>rule</code>, <code>comment</code> and any of the
at-rule types.</li>
</ul>
<h4><a id="user-content-import" class="deep-link" href="#import"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>import</h4>
<p>The <code>@import</code> at-rule.</p>
<ul>
<li>import: <code>String</code>. The part following <code>@import</code>.</li>
</ul>
<h4><a id="user-content-keyframes" class="deep-link" href="#keyframes"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>keyframes</h4>
<p>The <code>@keyframes</code> at-rule.</p>
<ul>
<li>name: <code>String</code>. The name of the keyframes rule.</li>
<li>vendor: <code>String</code> or <code>undefined</code>. The vendor prefix in <code>@keyframes</code>, or
<code>undefined</code> if there is none.</li>
<li>keyframes: <code>Array</code> of nodes with the types <code>keyframe</code> and <code>comment</code>.</li>
</ul>
<h4><a id="user-content-keyframe" class="deep-link" href="#keyframe"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>keyframe</h4>
<ul>
<li>values: <code>Array</code> of <code>String</code>s. The list of “selectors” of the keyframe rule,
split on commas. Each “selector” is trimmed from whitespace.</li>
<li>declarations: <code>Array</code> of nodes with the types <code>declaration</code> and <code>comment</code>.</li>
</ul>
<h4><a id="user-content-media" class="deep-link" href="#media"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>media</h4>
<p>The <code>@media</code> at-rule.</p>
<ul>
<li>media: <code>String</code>. The part following <code>@media</code>.</li>
<li>rules: <code>Array</code> of nodes with the types <code>rule</code>, <code>comment</code> and any of the
at-rule types.</li>
</ul>
<h4><a id="user-content-namespace" class="deep-link" href="#namespace"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>namespace</h4>
<p>The <code>@namespace</code> at-rule.</p>
<ul>
<li>namespace: <code>String</code>. The part following <code>@namespace</code>.</li>
</ul>
<h4><a id="user-content-page" class="deep-link" href="#page"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>page</h4>
<p>The <code>@page</code> at-rule.</p>
<ul>
<li>selectors: <code>Array</code> of <code>String</code>s. The list of selectors of the rule, split
on commas. Each selector is trimmed from whitespace and comments.</li>
<li>declarations: <code>Array</code> of nodes with the types <code>declaration</code> and <code>comment</code>.</li>
</ul>
<h4><a id="user-content-supports" class="deep-link" href="#supports"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>supports</h4>
<p>The <code>@supports</code> at-rule.</p>
<ul>
<li>supports: <code>String</code>. The part following <code>@supports</code>.</li>
<li>rules: <code>Array</code> of nodes with the types <code>rule</code>, <code>comment</code> and any of the
at-rule types.</li>
</ul>
<h3><a id="user-content-example-1" class="deep-link" href="#example-1"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Example</h3>
<p>CSS:</p>
<div class="highlight css"><pre class="editor editor-colors"><div class="line"><span class="source css"><span class="meta selector css"><span class="entity name tag css"><span>body</span></span><span> </span></span><span class="meta css"><span class="punctuation section begin css"><span>{</span></span></span></span></div><div class="line"><span class="source css"><span class="meta css"><span>  </span><span class="meta property-name css"><span class="support type property-name css"><span>background</span></span></span><span class="meta property-value css"><span class="punctuation separator key-value css"><span>:</span></span><span> </span><span class="constant other color rgb-value css"><span class="punctuation definition constant css"><span>#</span></span><span>eee</span></span><span class="punctuation terminator rule css"><span>;</span></span></span></span></span></div><div class="line"><span class="source css"><span class="meta css"><span>  </span><span class="meta property-name css"><span class="support type property-name css"><span>color</span></span></span><span class="meta property-value css"><span class="punctuation separator key-value css"><span>:</span></span><span> </span><span class="constant other color rgb-value css"><span class="punctuation definition constant css"><span>#</span></span><span>888</span></span><span class="punctuation terminator rule css"><span>;</span></span></span></span></span></div><div class="line"><span class="source css"><span class="meta css"><span class="punctuation section end css"><span>}</span></span></span></span></div></pre></div>
<p>Parse tree:</p>
<div class="highlight json"><pre class="editor editor-colors"><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span>  </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>type</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>stylesheet</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span>  </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>stylesheet</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>    </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>rules</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure array json"><span class="punctuation definition array begin json"><span>[</span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>      </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>        </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>type</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>rule</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>        </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>selectors</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure array json"><span class="punctuation definition array begin json"><span>[</span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>          </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>body</span><span class="punctuation definition string end json"><span>&quot;</span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>        </span><span class="punctuation definition array end json"><span>]</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>        </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>declarations</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure array json"><span class="punctuation definition array begin json"><span>[</span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>          </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>type</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>declaration</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>property</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>background</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>value</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>#eee</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>position</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>start</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>line</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>2</span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>column</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>3</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>end</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>line</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>2</span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>column</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>19</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>            </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>          </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span><span class="punctuation separator array json"><span>,</span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>          </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>type</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>declaration</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>property</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>color</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>value</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>#888</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>position</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>start</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>line</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>3</span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>column</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>3</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>end</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>line</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>3</span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>                </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>column</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>14</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>              </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>            </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>          </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>        </span><span class="punctuation definition array end json"><span>]</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span>        </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>position</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>          </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>start</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>line</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>1</span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>column</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>1</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>          </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>          </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>end</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="meta structure dictionary json"><span class="punctuation definition dictionary begin json"><span>{</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>line</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>4</span></span><span class="punctuation separator dictionary json"><span>,</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>            </span><span class="string quoted double json"><span class="punctuation definition string begin json"><span>&quot;</span></span><span>column</span><span class="punctuation definition string end json"><span>&quot;</span></span></span><span class="meta structure dictionary json"><span class="punctuation separator dictionary key-value json"><span>:</span></span><span> </span><span class="constant numeric json"><span>2</span></span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>          </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>        </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>      </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure array json"><span>    </span><span class="punctuation definition array end json"><span>]</span></span></span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span class="meta structure dictionary json"><span>  </span></span><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></span></span></div><div class="line"><span class="source json"><span class="meta structure dictionary json"><span class="punctuation definition dictionary end json"><span>}</span></span></span></span></div></pre></div>
<h2><a id="user-content-license" class="deep-link" href="#license"><svg aria-hidden="true" class="deep-link-icon" height="16" version="1.1" width="16"><path d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>License</h2>
<p>MIT</p>

</div>

</div>

<div class="sidebar">

  <div class="promotion" data-promotion-id="727" data-promotion-spot="packagePage"><div class="marketing">
<h3 id="marketing-texthed">
<a href="https://www.npmjs.com/enterprise" title="npm Enterprise">We &hearts; your boss</a></h3>

<p>Selectively mirror the npm registry inside your firewall. Filter packages based on security, licensing, code quality and more. Build awesome stuff faster. <a href="https://www.npmjs.com/enterprise" title="npm Enterprise" target="_blank">Try npm Enterprise for free…</a></p></div></div>

  <div class="autoselect-wrapper npm-install icon-download">
    <input type="text" value="npm install css" readonly>
    <p><a href="/package/css/tutorial">how? learn more</a></p>
  </div>

<ul class="box">

    <li class="last-publisher">
        <a href="/~conradz">
          <img src="https://s.gravatar.com/avatar/fd7d11f362ff8f83a6cc98d471597614?size&#x3D;100&amp;default&#x3D;retro" alt="conradz" />
          <span>conradz</span>
        </a>
        published
        <span data-date="2015-06-17T15:58:00.368Z" data-date-format="relative">
          2015-06-17T15:58:00.368Z
        </span>
    </li>

  <li>
    <strong>2.2.1</strong>
    is the latest
      of 23 releases
  </li>

    <li>
      <a href="https://github.com/reworkcss/css">github.com/reworkcss/css</a>
    </li>


    <li>
        <a href="http://spdx.org/licenses/MIT">MIT</a>
        <img class="osi" alt="Licensed on OSI-approved terms" src="/static/images/osi.svg">®
    </li>

</ul>

  <h3 title='collaborators'>
    Collaborators
    <small><a href="/package/css/access">list</a></small>
  </h3>

  <ul class="humans collaborators">
      <li>
          <a href="/~tjholowaychuk" rel="tipsy" title="tjholowaychuk">
              <img src="https://s.gravatar.com/avatar/f1e3ab214a976a39cfd713bc93deb10f?size&#x3D;100&amp;default&#x3D;retro" alt="tjholowaychuk">
          </a>
      </li>
      <li>
          <a href="/~jonathanong" rel="tipsy" title="jonathanong">
              <img src="https://s.gravatar.com/avatar/6e33cc0412b61cc01daac23c8989003c?size&#x3D;100&amp;default&#x3D;retro" alt="jonathanong">
          </a>
      </li>
      <li>
          <a href="/~jongleberry" rel="tipsy" title="jongleberry">
              <img src="https://s.gravatar.com/avatar/6e33cc0412b61cc01daac23c8989003c?size&#x3D;100&amp;default&#x3D;retro" alt="jongleberry">
          </a>
      </li>
      <li>
          <a href="/~conradz" rel="tipsy" title="conradz">
              <img src="https://s.gravatar.com/avatar/fd7d11f362ff8f83a6cc98d471597614?size&#x3D;100&amp;default&#x3D;retro" alt="conradz">
          </a>
      </li>
      <li>
          <a href="/~necolas" rel="tipsy" title="necolas">
              <img src="https://s.gravatar.com/avatar/992c9c162c4c62ec0e2621b4f2206533?size&#x3D;100&amp;default&#x3D;retro" alt="necolas">
          </a>
      </li>
      <li>
          <a href="/~anthonyshort" rel="tipsy" title="anthonyshort">
              <img src="https://s.gravatar.com/avatar/66a084a22668f2489f0536455d9b16da?size&#x3D;100&amp;default&#x3D;retro" alt="anthonyshort">
          </a>
      </li>
      <li>
          <a href="/~ianstormtaylor" rel="tipsy" title="ianstormtaylor">
              <img src="https://s.gravatar.com/avatar/e7f4e4b1d3b381e70f864bc7f8b4493e?size&#x3D;100&amp;default&#x3D;retro" alt="ianstormtaylor">
          </a>
      </li>
      <li>
          <a href="/~moox" rel="tipsy" title="moox">
              <img src="https://s.gravatar.com/avatar/2f6c2dcd4ba8fc44f1e7f0b2ed3d587d?size&#x3D;100&amp;default&#x3D;retro" alt="moox">
          </a>
      </li>
      <li>
          <a href="/~clintwood" rel="tipsy" title="clintwood">
              <img src="https://s.gravatar.com/avatar/dc36215428b39b6105f7304d5b0705b1?size&#x3D;100&amp;default&#x3D;retro" alt="clintwood">
          </a>
      </li>
      <li>
          <a href="/~lydell" rel="tipsy" title="lydell">
              <img src="https://s.gravatar.com/avatar/5c71c1e01b788547b09d4201323ca916?size&#x3D;100&amp;default&#x3D;retro" alt="lydell">
          </a>
      </li>
      <li>
          <a href="/~slexaxton" rel="tipsy" title="slexaxton">
              <img src="https://s.gravatar.com/avatar/7ea369b9b67a85f638af2e0f5d708d2d?size&#x3D;100&amp;default&#x3D;retro" alt="slexaxton">
          </a>
      </li>


  </ul>

  <h3>Stats</h3>
  <ul class="box">

      <li>
        <strong class="pretty-number daily-downloads">114334</strong>
        downloads in the last day
      </li>
      <li>
        <strong class="pretty-number weekly-downloads">518737</strong>
        downloads in the last week
      </li>
      <li>
        <strong class="pretty-number monthly-downloads">2547182</strong>
        downloads in the last month
      </li>

      <li id="issues" data-ghapi="https://api.github.com/repos/reworkcss/css">
        <span class="original">Have an issue? <a href="https://github.com/reworkcss/css/issues">File it.</a></span>
          <span class="enhanced" style="display:none">
            <a href="https://github.com/reworkcss/css/issues"></a> on GitHub
          </span>
      </li>

      <li id="pull_requests" style="display:none">
        <a href="https://github.com/reworkcss/css/pulls"></a> on GitHub
      </li>

  </ul>

      <h3>Try it out</h3>
      <ul class="box">
        <li class="runkit"><a href="https://runkit.com/npm/css" target="_blank">Test css in your browser.</a></li>
      </ul>


<h3>Keywords</h3>
<p class="list-of-links">
      <a href="/browse/keyword/css">css</a>,
      <a href="/browse/keyword/parser">parser</a>,
      <a href="/browse/keyword/stringifier">stringifier</a>,
      <a href="/browse/keyword/stylesheet">stylesheet</a>
</p>

<h3>Dependencies (4)</h3>
<p class="list-of-links">
        <a href="/package/source-map">source-map</a>,
        <a href="/package/source-map-resolve">source-map-resolve</a>,
        <a href="/package/urix">urix</a>,
              <a href="/package/inherits">inherits</a>
</p>

  <h3><a href="/browse/depended/css">Dependents (482)</a></h3>
  <p class="list-of-links dependents">

        <a href="/package/pxtorem2">pxtorem2</a>,

        <a href="/package/gulp-spriter-ny">gulp-spriter-ny</a>,

        <a href="/package/got-google-fonts">got-google-fonts</a>,

        <a href="/package/filter-css">filter-css</a>,

        <a href="/package/allscribe">allscribe</a>,

        <a href="/package/clairvoyance">clairvoyance</a>,

        <a href="/package/tt-template-cli">tt-template-cli</a>,

        <a href="/package/grunt-css-variables">grunt-css-variables</a>,

        <a href="/package/railgun-core">railgun-core</a>,

        <a href="/package/extract-css-block-webpack-plugin">extract-css-block-webpack-plugin</a>,

        <a href="/package/gulp-avoidfoit">gulp-avoidfoit</a>,

        <a href="/package/css-revealer">css-revealer</a>,

        <a href="/package/apply-css">apply-css</a>,

        <a href="/package/transformers">transformers</a>,

        <a href="/package/grunt-csssplit">grunt-csssplit</a>,

        <a href="/package/css-should">css-should</a>,

        <a href="/package/markup-transformer">markup-transformer</a>,

        <a href="/package/px2rem-reloaded">px2rem-reloaded</a>,

        <a href="/package/cansei">cansei</a>,

        <a href="/package/grunt-smartrev">grunt-smartrev</a>,

        <a href="/package/planemo">planemo</a>,

        <a href="/package/gulp-css-gsub">gulp-css-gsub</a>,

        <a href="/package/jimdo-protect-cms-linter">jimdo-protect-cms-linter</a>,

        <a href="/package/gulp-cmd-packer">gulp-cmd-packer</a>,

        <a href="/package/domino.css">domino.css</a>,

        <a href="/package/css-isolate">css-isolate</a>,

        <a href="/package/gulp-css-connoisseur">gulp-css-connoisseur</a>,

        <a href="/package/ancss">ancss</a>,

        <a href="/package/cassis">cassis</a>,

        <a href="/package/css-statistics">css-statistics</a>,

        <a href="/package/audero-lsg">audero-lsg</a>,

        <a href="/package/coatroom">coatroom</a>,

        <a href="/package/so-search">so-search</a>,

        <a href="/package/gulp-css-sandbox">gulp-css-sandbox</a>,

        <a href="/package/addons-validator">addons-validator</a>,

        <a href="/package/gulp-css-variables">gulp-css-variables</a>,

        <a href="/package/encapsulate-css">encapsulate-css</a>,

        <a href="/package/webfont-dl">webfont-dl</a>,

        <a href="/package/react-native-styles">react-native-styles</a>,

        <a href="/package/shrthnd">shrthnd</a>,

        <a href="/package/encapsulate">encapsulate</a>,

        <a href="/package/gulp-ngm-datauri">gulp-ngm-datauri</a>,

        <a href="/package/jsmb-cmd-transport">jsmb-cmd-transport</a>,

        <a href="/package/css-asset-rebaser">css-asset-rebaser</a>,

        <a href="/package/gulp-winify">gulp-winify</a>,

        <a href="/package/mpt-loader">mpt-loader</a>,

        <a href="/package/multi-sprite">multi-sprite</a>,

        <a href="/package/css-selector-prefixer">css-selector-prefixer</a>,

        <a href="/package/ember-component-css-withbp">ember-component-css-withbp</a>,
                <a href="/package/jsonresume-theme-onepage-fr">jsonresume-theme-onepage-fr</a>,
      <a href="/browse/depended/css">and more</a>
  </p>

<script type="application/ld+json">
  {
    "@context": "http://schema.org",
    "@type": "SoftwareApplication",
    "name": "css",
    "description": "CSS parser / stringifier",
    "url": "https://www.npmjs.com/package/css",
    "keywords": "css,parser,stringifier,stylesheet",
    "applicationCategory": "DeveloperApplication",
    "offers": {
       "@type": "Offer",
       "price": "0.00"
    }
  }
</script>

  <div class="hiring-container" data-template="sidebar"></div>
</div>


  </div>

<footer class="pane bg-npm-navy-1">

  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <h3 class="h4 type-npm-pastel-3">You Need Help</h3>
        <hr class="divider-1">
        <ul class="list-unstyled h6 em-default">
          <li class="pbl"><a class="type-neutral-11" href="https://docs.npmjs.com">Documentation</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/support">Support / Contact Us</a></li>
          <li class="pbl"><a class="type-neutral-11" href="http://status.npmjs.org/">Registry Status</a></li>
          <li class="pbl"><a class="type-neutral-11" href="https://github.com/npm/www/issues">Website Issues</a></li>
          <li class="pbl"><a class="type-neutral-11" href="https://github.com/npm/npm/issues">CLI Issues</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/policies/security">Security</a></li>
        </ul>
      </div>

      <div class="col-md-6 col-md-offset-1">
        <h3 class="h4 type-npm-pastel-3">About npm</h3>
        <hr class="divider-1">
        <ul class="list-unstyled h6 em-default">
          <li class="pbl"><a class="type-neutral-11" href="/about">About npm, Inc</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/jobs">Jobs</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/npm-weekly">npm Weekly</a></li>
          <li class="pbl"><a class="type-neutral-11" href="http://blog.npmjs.org">Blog</a></li>
          <li class="pbl"><a class="type-neutral-11" href="https://twitter.com/npmjs">Twitter</a></li>
          <li class="pbl"><a class="type-neutral-11" href="https://github.com/npm">GitHub</a></li>
        </ul>
      </div>

      <div class="col-md-6 col-md-offset-1">
        <h3 class="h4 type-npm-pastel-3">Legal Stuff</h3>
        <hr class="divider-1">
        <ul class="list-unstyled h6 em-default">
          <li class="pbl"><a class="type-neutral-11" href="/policies/terms">Terms of Use</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/policies/conduct">Code of Conduct</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/policies/disputes">Package Name Disputes</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/policies/privacy">Privacy Policy</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/policies/receiving-reports">Reporting Abuse</a></li>
          <li class="pbl"><a class="type-neutral-11" href="/policies/">Other policies</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div class="txt-c container">
    <a class="npm-loves-you type-neutral-11" href="/">
      npm loves you
    </a>
  </div>
</footer>
<!-- menu 1 -->
<script defer src="/static/js/vendor.min.js?last-changed&#x3D;4f11297f0c65f43ca5e0cc8f80a17c5e"></script>
<script defer async src="https://cdn.optimizely.com/js/3318080746.js"></script>
<script defer async src='//img.en25.com/i/elqCfg.min.js'></script><!-- Eloqua -->
</body>
</html>

<!-- pid&#x3D;7934 de2155967ff4d6f1b24736652257aff5ecb9805c https://www.npmjs.com www-13-west.internal.npmjs.com  -->

`;

let cheerio = require('cheerio');

// Cheerio has a weird root selector.
// If we try to use the * css selector then it won't
// match comments outside of an html element
const getChildrenFromCheerioRoot = (cheerioInstance) => {
  const root = cheerioInstance.root();

  // Filter out non integer keys in root
  const rootKeys = Object.keys(root).filter(n => n % 1 == 0);

  const rootChildren = rootKeys.map(key => {
    return root[key].children;
  });

  return rootChildren[0];
};

// Recursively get comments from a Cheerio node
const getComments = (a, node) => {
  if(node.type === "comment") {
    return a.concat([node.data]);
  } else if(node.type==="tag" && node.children && node.children.length>0) {
    return a.concat(node.children.reduce(getComments, []));
  } else {
    return a;
  }
};

const getCommentPositions = (str, commentsArray) => {
  // Track the last position we found. We have to go in order
  // because we're making sure to deal with potential duplicates
  // at different positions.
  let lastEndPosition = 0;

  return commentsArray.reduce((a,v,i) => {

    const searchString = '<!--' + v + '-->';
    const startSearchPosition = str.indexOf(searchString, lastEndPosition);
    const endSearchPosition = startSearchPosition + searchString.length;

    // Move forward
    lastEndPosition = startSearchPosition;

    // console.log('LOOKING FOR: ' + searchString);
    // console.log('Found starting at: ' + startSearchPosition);
    // console.log('Found ending at: ' + endSearchPosition);

    return a.concat([{
      content: v,
      start: startSearchPosition,
      end: endSearchPosition
    }]);
  }, []);
}

// Load up cheerio with our html string
let $ = cheerio.load(htmlString, { decodeEntities: false, withStartIndices: true });

// Gets an ordered list of all comments
const comments = getChildrenFromCheerioRoot($).reduce(getComments, []);

// Finds the positions of the comments
const commentsWithPositions = getCommentPositions(htmlString, comments);

console.log(commentsWithPositions);
/* 

OUTPUT:

[ 
  { content: '[if lt IE 9]>\n  <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.min.js"></script>\n<![endif]',
    start: 1454,
    end: 1576 },
  { content: ' logo ', start: 5105, end: 5118 },
  { content: ' /logo ', start: 5417, end: 5431 },
  { content: ' search ', start: 5433, end: 5448 },
  { content: ' menu 1 ', start: 6265, end: 6280 },
  { content: ' .user-info ', start: 8775, end: 8794 },
  { content: ' /menu 1 ', start: 8802, end: 8818 },
  { content: ' menu 2 ', start: 8820, end: 8835 },
  { content: ' /menu 2 ', start: 10158, end: 10174 },
  { content: ' menu 1 ', start: 106528, end: 106543 },
  { content: ' Eloqua ', start: 106796, end: 106811 },
  { content: ' pid&#x3D;7934 de2155967ff4d6f1b24736652257aff5ecb9805c https://www.npmjs.com www-13-west.internal.npmjs.com  ',
    start: 106829,
    end: 106946 }
]


*/
