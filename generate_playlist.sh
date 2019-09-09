#!/bin/sh
## generate rhythmbox playlist from folders in directory

## url encode taken from pure bash bible
urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}


fout="rhythmbox_partial_playlist.xml"
echo -n "" > $fout;
exec >> $fout;
for dir in *; do
        if [[ -d "$dir" ]]; then
		dir_escaped=$(urlencode_safe='/' urlencode "$dir")
                printf "<playlist name=\"%s\" show-browser=\"true\" browser-position=\"180\" search-type=\"search-match\" type=\"automatic\" sort-key=\"Artist\" sort-direction=\"0\">\n" "$dir";
                echo "<conjunction>";
                printf "<equals prop=\"type\">song</equals>\n";
                echo "<subquery>";
                echo "<conjunction>";
                printf "<like prop=\"location\">%s</like>\n" "$dir_escaped";
                echo "</conjunction>";
                echo "</subquery>";
                echo "</conjunction>";
                echo "</playlist>";
                fi
done
