var buf = new Buffer.from('Hello World!');
var buf = new Buffer.from('8b76fde713ce', 'base64');
// var buf = new Buffer.from(1024);
buf[20] = 56;
var str = buf.toString();
var str = buf.toString('base64');
var buffer = new Buffer.from('this is the string in my buffer');
var slice = buffer.slice(10, 20);

// Copy a buffer
var buffer = new Buffer.from('this is the string in my buffer');
// var slice = new Buffer.from(10);
var targetStart = 0,
    sourceStart = 10,
    sourceEnd = 20;
buffer.copy(slice, targetStart, sourceStart, sourceEnd);
