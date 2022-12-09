var counter = 0;
var onePrivateMethod = function() {
    return counter;
};
var onePublicMethod = function() {
    onePrivateMethod();
    return 'you already called this module ' + counter + ' times';
};
module.exports = onePublicMethod;
