#!/bin/bash
wget https://moz.com/top500/pages/csv
cat csv | cut -d '"' -f2 > url_list

export http_proxy=http://proxy:3128
export https_proxy=http://proxy:3128

while true; do
  for i in `cat url_list`; do
    if [ $(( ( RANDOM % 6 )  + 1 )) -gt 3 ]
    then
      echo $i
      curl -s $i > /dev/null
    fi
  done
done
