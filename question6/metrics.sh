#!/bin/bash

words=$(tr -cs 'A-Za-z' '\n' < input.txt)

echo "Longest word:"
echo "$words" | awk '{print length, $0}' | sort -nr | head -1

echo "Shortest word:"
echo "$words" | awk '{print length, $0}' | sort -n | head -1

echo "Average word length:"
echo "$words" | awk '{sum+=length} END {print sum/NR}'

echo "Unique words:"
echo "$words" | sort | uniq | wc -l
