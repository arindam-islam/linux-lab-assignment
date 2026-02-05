#!/bin/bash

pass_all=0
fail_one=0

while IFS=',' read roll name m1 m2 m3
do
  fail=0
  for m in $m1 $m2 $m3
  do
    [ "$m" -lt 33 ] && fail=$((fail+1))
  done

  if [ "$fail" -eq 0 ]; then
    echo "$name passed all subjects"
    pass_all=$((pass_all+1))
  elif [ "$fail" -eq 1 ]; then
    echo "$name failed in exactly one subject"
    fail_one=$((fail_one+1))
  fi
done < marks.txt

echo "Passed all subjects: $pass_all"
echo "Failed in exactly one subject: $fail_one"
