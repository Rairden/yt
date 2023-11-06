# yt

yt is a wrapper around youtube-dl and yt-dlp. I use it to download live streams from twitch, youtube, etc.

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
alacritty --config-file ~/scratch/alacritty-yt.yml --title yt --command /bin/bash -c 'watch -d "yt -r; echo; yt -s"' & disown
```

I configure KDE for an alacritty window with a title `yt`:

- No titlebar and frame: Force (yes)
- Keep above other windows: Force (yes)

I also set the size/position. But it's nice because alacritty-yt.yml has the background 100% transparent, so you only see text.
