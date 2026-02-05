#!/bin/bash

> vowels.txt
> consonants.txt
> mixed.txt

tr -cs 'A-Za-z' '\n' < input.txt | while read w
do
  lw=$(echo "$w" | tr 'A-Z' 'a-z')

  if [[ $lw =~ ^[aeiou]+$ ]]; then
    echo "$w" >> vowels.txt
  elif [[ $lw =~ ^[^aeiou]+$ ]]; then
    echo "$w" >> consonants.txt
  elif [[ $lw =~ ^[^aeiou].*[aeiou] ]]; then
    echo "$w" >> mixed.txt
  fi
done
