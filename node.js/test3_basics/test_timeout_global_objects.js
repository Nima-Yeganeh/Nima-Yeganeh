function printHello() {
    console.log( "Hello, World!");
}
 
// Now call above function after 2 seconds
var timeoutObj = setTimeout(printHello, 2000);
console.log(__dirname);
console.log(__filename);
