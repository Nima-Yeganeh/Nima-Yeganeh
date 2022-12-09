/**
 * setImmediate() and process.nextTick()
 */
setImmediate(() => {
    console.log("1st Immediate");
  });
  
  setImmediate(() => {
    console.log("2nd Immediate");
  });
  
  process.nextTick(() => {
    console.log("1st Process");
  });
  
  process.nextTick(() => {
    console.log("2nd Process");
  });
  
  // First event queue ends here
  console.log("Program Started");
  
  