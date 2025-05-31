# dotfiles
keep config files in source control

The intention of this README is to provide a verbose overview of the packages
I've installed or use as part of my workflow. It also serves as documentation 
for myself when changing my setup or performing some uncommon operation.

## Setup
I use a bare git repository 
(as described in [this post](https://www.atlassian.com/git/tutorials/dotfiles))
located in `$HOME/.dotfiles`.

### The gist
- create the `$HOME/.dotfiles` directory: (`git init --bare $HOME/.dotfiles`)
- alias `dot` to tell git where we're storing changes and where to look for
  changes: `/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME`. Use
  `dot` as a drop-in for `git` to interact with this repo.
- hide files from git by default: `dot --local status.showUntrackedFiles no`
  (when creating new files, need to manually track them with `dot add [file]`)

### Cloning:
```
git clone --bare [repo url] $HOME/.dotfiles
```

To apply the changes once the repo's been pulled down:
```
dot checkout
```

This will likely have conflicts with existing files that already exist,
like `.xinitrc` or `.bashrc`. Either rename them and merge manually after
checkout or nuke them and replace with the checkout.

## Scripts

## Reference
Commands/tools I always forget and need infrequently.

### Disk Imaging
Use `dd`

## Packages
### alacritty (TODO remove)
_Terminal emulator_. Using because text looks crisp, it's pretty fast, and works
ootb how I expect.

Config: [`.config/alacritty/alacritty.yml`](./.config/alacritty/alacritty.yml)

### bspwm
_Window manager_. Mostly use some hybrid of automatic/manual tiling.

Config: [`.config/bspwm/bspwmrc`](./.config/bspwm/bspwmrc)

### dbeaver
_SQL client_. View databases, has reasonable options for read-only and "safe"
mode with transactions.

### feh
_Image viewer_. Used to view images (woah) and set wallpaper.

#### Setting wallpaper
`feh --bg-[fill | center | scale | tile | max] [path]`. I mostly use fill and 
`--no-xinerama` to span one image across all monitors. Can assign different
wallpapers to individual monitors like `feh --bg-fill [path1] [path2] [path3]`

### firefox
_Browser_. Browse internet pages and such.

### fonts
- `ttf-fira-code`
- `ttf-iosevka`

### fzf
_Fuzzy finder_. Dependency for some custom scripts and [n]vim commands.

### glow
_Markdown Viewer_. TUI for viewing markdown - decent middle ground between raw
text and html.

### mpv
_media player_. Plays video/audio with no config: `mpv [my-file]`.

### ncpamixer
_Audio mixer_. Console-based mixer for Pulse Audio (used to use pavucontrol -
trying this out)

### nvim
_Text editor_. Using nvim over vim for features like native lsp.

Config: [`.config/nvim/init.vim`](./.config/nvim/init.vim). See also [vim](#vim)

#### Language Server Configuration
Language servers must be provided separately; the method depends on the
language
- typescript
    - `tsserver`: managed via system package manager at
      `typescript-language-server` (AUR) 

### obsidian
_Note taking_. "Knowledge in the world."

### paru
_Package Manager_. AUR helper

### picom
_Compositor_. Used for transparency, blur, drop shadows, etc. Running as a
daemon on startup.

Config: [`.config/picom/picom.conf`](./.config/picom/picom.conf)

### polybar
_Status bar_. Use to display time/network/hardware usage/volume/wm info.

### playerctl
_Media controller_. Allow play/pause/skip media via mediakeys
 
### pulseaudio
_Sound system_. Layer between ALSA and applications - see ncpamixer.
Should run automatically - run manually with `pulseaudio` and as a daemon with
`pulseaudio --daemonize`

Config: [`.config/polybar/`](./.config/polybar)

### redshift
_Color temperature control_. Simple configuration based on location and
brightness/time ranges.

Config: [`.config/redshift.conf`](./config/redshift.conf)

### ripgrep
_Search tool/pattern matching_. Use with `rg`. Dependency for some custom
scripts and vim commands.

### rofi
_Menu_. Use globally to run applications/switch windows, using in scripts to
emulate dmenu (`rofi -dmenu`).

Config: [`.config/rofi/config.rasi`](./.config/rofi/config.rasi)

### slack-desktop
_Communications_

### steam
_Gaming Library_.

### sxhkd
_Hotkey daemon_. Handles global hotkeys as well as wm-specific hotkeys.

Config [`.config/sxhkd/sxhkdrc`](./.config/sxhkd/sxhkdrc)

### xclip
_Clipboard interface_.

### termdown
_CLI timer_. Run `termdown 5m` for a 5 minute timer.
When it's done, it will just...end - can chain it into 
another program to notify that the timer has ended. For example:
```
termdown 10m && mpv ~/audio/music/twewy/02\ Twister.mp3
```

### vim
_Text editor_. Using [nvim](#nvim) these days, but I try to keep as much of the config as 
possible inside .vimrc in case I can't use nvim for whatever reason.

Config [`.vimrc`](./.vimrc)

### wal
_Palette generator_. (Now `pywal`.) Use to generate colorschemes from an image;
use in concert with `feh` to set both image/colorscheme at once.

No particular config, but I do save some colorscheme `.json` files to
[`.config/wal/colorschemes`](./.config/wal/colorschemes) to be loaded with `wal
-n --theme [path]` (`-n` for "no wallpaper")

### wezterm
_Terminal emulator_.

Config: [.wezterm.lua](.wezterm.lua)
