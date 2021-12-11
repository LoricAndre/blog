#!/usr/bin/env bash

for f in $(ls md); do
  html="$(echo $f | sed 's/\(.*\)\.md/public\/\1.html/')"
  echo "Checking $html for changes..."
  make $html
done
