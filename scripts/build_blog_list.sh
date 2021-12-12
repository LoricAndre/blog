#!/usr/bin/env bash

LIST="public/posts/list.html"

echo "<ul>" > $LIST

for f in $(ls md/posts/); do
    if [[ $f != list.md ]]; then
        echo "Processing post $f"
        name="$(echo $f | sed 's/\(.*\)\.md/\1/')"
        echo "<li><a href=\"$name.html\">$name</a></li>" >> $LIST
    fi
done

echo "</ul>" >> $LIST