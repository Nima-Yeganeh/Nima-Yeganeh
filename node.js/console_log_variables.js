console.log("Hello");

var a = {1: true, 2: false};
console.log(a);

var a = {1: true, 2: false};
console.log('This is a number: %d, and this is a string: %s, and this is an object outputted as JSON: %j', 42, 'Hello', a);

console.warn("Warning!");

var util = require('util');
util.log('Hello');

var util = require('util');
var a = {1: true, 2: false};
console.log(util.inspect(a));
