#!/bin/bash

mkdir -p "$1/backup"

for f in "$1"/*
do
  [ -f "$f" ] && mv "$f" "$1/backup/" &
  echo "Started background process with PID: $!"
done

wait
echo "All background processes completed."
