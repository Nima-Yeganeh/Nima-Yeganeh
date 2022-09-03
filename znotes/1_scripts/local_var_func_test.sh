#!/bin/bash
var1="AA"
var2="BB"
function func1() {
  var1="XX"
  local var2="YY"
  echo "func1 >> var1=$var1 and var2=$var2"
}
func1
echo "after calling func1 >> var1=$var1 and var2=$var2"
