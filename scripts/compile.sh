#!/usr/bin/env bash

for f in $(ls $@); do
  if [[ $f != posts ]] && [[ $f != list.md ]]; then
    html="$(echo $f | sed 's/\(.*\)\.md/public\/\1.html/')"
    echo "Checking $html for changes..."
    make $html
  fi
done