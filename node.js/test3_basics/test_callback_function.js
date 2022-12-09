/**
 * Callback Function
 */
function myAsync(a, b, callback) {
    setTimeout(function () {
      callback(a + b);
    }, 100);
  }
  console.log("Before Asynchronous Call");
  
  myAsync(10, 20, function (result) {
    console.log("Sum: " + result);
  });
  console.log("After Asynchronous Call");
  
  