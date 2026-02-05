#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 logfile"
  exit 1
fi

if [ ! -r "$1" ]; then
  echo "Error: File does not exist or is not readable."
  exit 1
fi

date=$(date +%F)
report="logsummary_$date.txt"

total=$(wc -l < "$1")
info=$(grep -c " INFO " "$1")
warn=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")
last_error=$(grep " ERROR " "$1" | tail -1)

{
echo "Total entries: $total"
echo "INFO messages: $info"
echo "WARNING messages: $warn"
echo "ERROR messages: $error"
echo "Most recent ERROR:"
echo "$last_error"
} > "$report"

cat "$report"
