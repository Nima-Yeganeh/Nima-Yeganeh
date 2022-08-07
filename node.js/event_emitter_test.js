var EventEmitter = require('events').EventEmitter,
    util = require('util');

    // Here is the MyClass constructor:
var MyClass = function(option1, option2) {
    this.option1 = option1;
    this.option2 = option2;
    }

util.inherits(MyClass, EventEmitter);

MyClass.prototype.someMethod = function() {
    this.emit('custom event', 'some arguments');
}

var myInstance = new MyClass(1, 2);
myInstance.on('custom event', function() {
    console.log('got a custom event!');
});
