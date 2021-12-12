#!/usr/bin/env bash

LIST="public/posts/list.html"

echo "<ul>" > $LIST

for f in $(ls md/posts/); do
    if [[ $f != list.md ]]; then
        echo "Processing post $f"
        html="$(echo $f | sed 's/\(.*\)\.md/public\/blog\/\1.html/')"
        echo "<li><a href=\"$html\">$f</a></li>" >> $LIST
    fi
done

echo "</ul>" >> $LIST