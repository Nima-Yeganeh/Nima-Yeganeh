#!/bin/bash
if [[ $# -ne 2 ]]
then
  echo "run >> with 2 args >> sig + pid"
fi
case "$1" in
  1)
    kill -SIGHUP $2
    ;;
  2)
    kill -SIGINT $2
    ;;
  15)
    kill -15 $2
    ;;
  *)
    echo "not done!"
    ;;
esac
