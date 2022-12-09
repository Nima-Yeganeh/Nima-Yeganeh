// Here is a case where we present some simple code that blocks the event loop.

var open = false;
setTimeout(function() {
    open = true;
}, 1000)
while(!open) {
    // wait
    return console.log('done!')
}
console.log('opened!');
