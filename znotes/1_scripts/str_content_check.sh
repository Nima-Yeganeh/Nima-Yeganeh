#!/bin/bash
read -p "str1? " str1
content="linux"
echo "checking $content in input str1"
if [[ "$str1" == *"$content"* ]]
then
  echo "$content in content"
else
  echo "$content not in content"
fi
