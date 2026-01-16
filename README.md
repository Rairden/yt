# yt

yt is a wrapper around youtube-dl and yt-dlp. I use it to download live streams from twitch, youtube, etc.

Required installs: 
- yt-dlp
- fd
- mediainfo
- mpv

# Usage

I open 20 tabs in a terminal emulator. Start downloading a few live streams with `yt <url>`, then use:

- ctrl + z
- fg

to pause and resume downloads.

The only few flags I use are:

- yt -p
- yt -f
- yt --swap

to pause all and kill all running processes. The --swap flag is sometimes used to interchange the two most recent running and suspended streams.

`yt-rec` is used if you have the Konsole terminal emulator and zsh. To start, run `yt-rec && exit`.

Your TUI is:

```sh
watch -d -n0.5 'yt -r; echo; yt -s'
```

Even if you don't use Konsole/zsh, you can still run this as your TUI:

```sh
alacritty --config-file ~/scratch/alacritty-yt.toml --title yt --command /bin/bash -c 'watch -d "yt -r; echo; yt -s"' & disown
```

I configure KDE for an alacritty window with a title `yt`:

- No titlebar and frame: Force (yes)
- Keep above other windows: Force (yes)

I also set the size/position. It's nice because alacritty-yt.toml has the background 100% transparent, so you only see text.

# hotkeys

I use sxhkd. And assign the F keys to the functions (pause/resume). Edit your sxhkdrc file.

```sh
sudo pacman -S sxhkd
vim ~/.config/sxhkd/sxhkdrc
```

```
F6
    ~/shellProjects/yt/yt --pauseall
F7
    ~/shellProjects/yt/yt --pause-previous
F8
    ~/shellProjects/yt/yt --pause
F9
    ~/shellProjects/yt/yt --resume
F10
    ~/shellProjects/yt/yt --swap
```

# database

```
export VIDINFO_DIRS=/run/media/erik/storage:/tmp/dir2
export YTPATH=/home/erik/yt
```

Set your main working download dir to `YTPATH`. This is where the .db sqlite3 database file lives. And vidinfo accesses this file.  
If your `YTPATH` env variable is not set, the .db file is made in every dir you run vidinfo from (if it finds one video or more).

If you want `vidinfo` to search multiple paths, set your `VIDINFO_DIRS` environment variable. It accepts a colon-separated list of dirs of paths to search. Otherwise, vidinfo only searches the current dir.
