const http = require("http");
const hostname = "localhost";
const port = 3000;
const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader("Content-Type", "text/html");
    switch (req.url) {
        case "/home":
            res.writeHead(200);
            res.end("This is Home page");
            break;
        case "/about":
            res.writeHead(200);
            res.end("This is About page");
            break;
        default:
            res.writeHead(200);
            res.end("Welcome!");
            break;
    }
});
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});
