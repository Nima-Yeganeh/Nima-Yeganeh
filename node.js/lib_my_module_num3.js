var counter1 = 0;
var onePublicMethod = function() {
    return 'you already called this function ' + (++ counter1) + ' times';
};
var counter2 = 0;
var anotherPublicMethod = function() {
    return 'you already called this function ' + (++ counter2) + ' times';
}
module.exports = {
    functionA: onePublicMethod,
    functionB: anotherPublicMethod
};
