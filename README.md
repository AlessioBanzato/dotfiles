# dotfiles

Personal Linux dotfiles and other stuff like [fonts](https://github.com/AlessioBanzato/dotfiles/tree/main/.local/share/fonts) and [wallpapers](https://github.com/AlessioBanzato/dotfiles/tree/main/Pictures/Wallpapers).

There is also an `install.sh` script that creates symlinks and does a rebuild of the fonts' cache.

## Branches

I tried to separate general configs from theme customizations. The `main` branch contains all general configs, while the other branches are dedicated to different themes (`light`, `dracula`, ...).

## Repo structure (directories only)

```
.dotfiles
├── .config
│   ├── alacritty
│   ├── doom
│   ├── hypr
│   ├── neofetch
│   ├── rofi
│   └── waybar
│       └── scripts
├── .local
│   └── share
│       └── fonts
│           └── JetBrainsMono
└── Pictures
    └── Wallpapers
```
