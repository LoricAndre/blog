#!/usr/bin/env bash

for f in "$(ls md)"; do
  make "$(echo $f | sed 's/\(.*\)\.md/public\/\1.html/')"
done
