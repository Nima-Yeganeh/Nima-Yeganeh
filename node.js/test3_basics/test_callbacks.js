/**
 * Callbacks
 */
function sum(number) {
    console.log('Total: ' + number);
  }
  
  function calculator(num1, num2, callback) {
    let total = num1 + num2;
    callback(total);
  }
  
  calculator(10, 20, sum);
  
  