#!/bin/bash

echo "Files only in dirA:"
comm -23 <(ls dirA | sort) <(ls dirB | sort)

echo "Files only in dirB:"
comm -13 <(ls dirA | sort) <(ls dirB | sort)

echo "Files with same name but different content:"
for f in $(comm -12 <(ls dirA | sort) <(ls dirB | sort))
do
  cmp -s dirA/$f dirB/$f || echo "$f differs"
done
