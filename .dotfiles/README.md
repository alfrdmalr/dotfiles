# dotfiles
keep config files in source control

The intention of this README is to provide a verbose overview of the packages
I've installed or use as part of my workflow. It also serves as documentation 
for myself when changing my setup or performing some uncommon operation.

# Setup


# Scripts

# Packages
## alacritty
_Terminal emulator_. Using because text looks crisp, it's pretty fast, and works
ootb how I expect.

Config: [`.config/alacritty/alacritty.yml`](./.config/alacritty/alacritty.yml)

## bspwm
_Window manager_. Mostly use some hybrid of automatic/manual tiling.

Config: [`.config/bspwm/bspwmrc`](./.config/bspwm/bspwmrc)

## feh
_Image viewer_. Used to view images (woah) and set wallpaper.

### Setting wallpaper
`feh --bg-[fill | center | scale | tile | max] [path]`. I mostly use fill and 
`--no-xinerama` to span one image across all monitors. Can assign different
wallpapers to individual monitors like `feh --bg-fill [path1] [path2] [path3]`

## nvim
_Text editor_. Using nvim over vim for features like native lsp.

Config: [`.config/nvim/init.vim`](./.config/nvim/init.vim). See also [vim](#vim)

## picom
_Compositor_. Used for transparency, blur, drop shadows, etc. Running as a
daemon on startup.

Config: [`.config/picom/picom.conf`](./.config/picom/picom.conf)

## polybar
_Status bar_. Use to display time/network/hardware usage/volume/wm info.

Config: [`.config/polybar/`](./.config/polybar)

## rofi
_Menu_. Use globally to run applications/switch windows, using in scripts to
emulate dmenu (`rofi -dmenu`).

Config: [`.config/rofi/config.rasi`](./.config/rofi/config.rasi)

## sxhkd
_Hotkey daemon_. Handles global hotkeys as well as wm-specific hotkeys.

Config [`.config/sxhkd/sxhkdrc`](./.config/sxhkd/sxhkdrc)

## udiskie
_Automounter_. For simple handling of removable storage. Mounts to `/run/media/$USER` - can unmount
with `udiskie-umount [path]`

## vim
_Text editor_. Using [nvim](#nvim) these days, but I try to keep as much of the config as 
possible inside .vimrc in case I can't use nvim for whatever reason.

Config [`.vimrc`](./.vimrc)

## wal
_Palette generator_. (Now `pywal`.) Use to generate colorschemes from an image;
use in concert with `feh` to set both image/colorscheme at once.

No particular config, but I do save some colorscheme `.json` files to
[`.config/wal/colorschemes`](./.config/wal/colorschemes) to be loaded with `wal
-n --theme [path]` (`-n` for "no wallpaper")

## yay
_Package manager_. Thin convenience wrapper around pacman.
