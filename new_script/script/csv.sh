#!/bin/bash

[ $# != 1 ] && { echo "Argument error." ; exit 1 ; }

raw=$(cat "$1")
time=($(cat "$1" | head -n -2 | grep -v out-of-order | sed "s/^.* \([0-9.]\+\)-.*$/\1/g"))
throughput=($(cat "$1" | head -n -2 | grep -v out-of-order | sed "s/^.*Bytes \+\([0-9.]\+\).*$/\1/g"))
raw=$(echo "$raw" | head -n -2 | grep -v out-of-order | sed "s/ bits\/sec / Bbits\/sec /g")
postfix=( $(echo "$raw" | sed "s/^.* \([BKM]\?\)bits\/sec.*$/\1/g") )
lr=( $(echo "$raw" | sed "s/^.*(\(.*\)).*$/\1/g" | sed "s/nan/100/g") )

echo ${#time[@]}, ${#throughput[@]}, ${#postfix[@]}, ${#lr[@]}

for ((i=0;i<${#time[@]};i++));
do
  if [ "${postfix[i]}" == "K" ]; then
    throughput[i]=$(echo "scale=2; ${throughput[i]}/1000" | bc)
  fi
  if [ "${postfix[i]}" == "B" ]; then
    throughput[i]=$(echo "scale=2; ${throughput[i]}/1000000" | bc)
  fi
  
  lr[i]=${lr[i]/%\%/}
done

echo > $1.csv
for ((i=0;i<${#time[@]};i++));
do
  echo ${time[i]} ${throughput[i]} ${lr[i]} >> $1.csv
done

exit 0
