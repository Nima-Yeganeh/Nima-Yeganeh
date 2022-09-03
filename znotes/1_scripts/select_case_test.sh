#!/bin/bash
PS3="Your country:"
select COUNTRY in Germany France USA "United Kingdom" Quit
do
  case $REPLY in
    1)
      echo "german"
      ;;
    2)
      echo "french"
      ;;
    3)
      echo "american"
      ;;
    4)
      echo "british"
      ;;
    5)
      echo "quit"
      break
      ;;
    *)
      echo "invalid"
      ;;
  esac
done
