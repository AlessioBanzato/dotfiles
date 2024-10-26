# dotfiles

Personal Linux dotfiles and other stuff like [fonts](https://github.com/AlessioBanzato/dotfiles/tree/main/.local/share/fonts) and [wallpapers](https://github.com/AlessioBanzato/dotfiles/tree/main/Pictures/Wallpapers).

There is also an `install` script that creates symlinks and does a rebuild of the fonts' cache.

## Running `install` script

```bash
chmod +x install
./install
```

## Repo structure (directories only)

```
.dotfiles/
├── .config
│   ├── alacritty
│   ├── doom
│   ├── hypr
│   ├── neofetch
│   └── waybar
├── .local
│   └── share
│       └── fonts
│           └── JetBrainsMono
└── Pictures
    └── Wallpapers
```
