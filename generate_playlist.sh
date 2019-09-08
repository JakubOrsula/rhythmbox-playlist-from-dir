#!/bin/sh
## generate rhythmbox playlist from folders in directory
fout="rhythmbox_partial_playlist.xml"
echo -n "" > $fout;
exec >> $fout;
for dir in *; do
        if [[ -d "$dir" ]]; then
                printf "<playlist name=\"%s\" show-browser=\"true\" browser-position=\"180\" search-type=\"search-match\" type=\"automatic\" sort-key=\"Artist\" sort-direction=\"0\">\n" "$dir";
                echo "<conjunction>";
                printf "<equals prop=\"type\">song</equals>\n";
                echo "<subquery>";
                echo "<conjunction>";
                printf "<like prop=\"location\">%s</like>\n" "$dir";
                echo "</conjunction>";
                echo "</subquery>";
                echo "</conjunction>";
                echo "</playlist>";
                fi
done

