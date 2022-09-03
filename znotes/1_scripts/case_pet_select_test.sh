#!/bin/bash
echo -n "pet? "
read PET
case "$PET" in
  dog)
    echo "dog!"
    ;;
  cat|Cat)
    echo "cat!"
    ;;
  fish|"African Turtle")
    echo "fish!"
    ;;
  *)
    echo "unknown!"
esac
