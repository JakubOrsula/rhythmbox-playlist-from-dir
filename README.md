# rhythmbox-playlist-from-dir
Create rhythmbox playlist file from directory entries.

Are you tired from creating playlists everytime you move your music? Then this script might be for you.

## usage
1. Run this script in directory containing directories with your music
1. Copy contents of `rhythmbox_partial_playlist.xml`
1. Open your `playlists.xml` file  (find it with `find ~ | fgrep rhythm | fgrep playlist`)
1. Paste immediately after `<rhythmdb-playlists>` tag (doesn't really matter, just don't corrupt existing entries)
1. Make sure rhythmbox isn't running (`killall rhythmbox`) and save it
1. Profit

## other notes
+ don't worry about intendation rhythmbox will do that for you
