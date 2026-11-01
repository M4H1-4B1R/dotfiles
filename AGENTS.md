# AGENTS.md

## What this is

Arch Linux dotfiles managed with **GNU Stow**. Each top-level directory is a stow target mirroring `$HOME`. No build system, no tests, no CI.

**Git remote:** `git@github.com:M4H1-4B1R/dotfiles.git` (`main` branch)

## Structure

- `awesome/` — AwesomeWM config (Lua, uses vicious widgets)
- `suckless/` — DWM + dwmblocks + slstatus (C, has Makefiles)
- `hyprflux/` — Full Hyprland desktop setup (Wayland)
- `bspwm/`, `i3/`, `qtile/`, `river/`, `sway-*`, `oxwm/` — Other WMs
- `scripts/` — Utility scripts (picom toggle, screenshots, power menu, etc.)
- `pkg.txt` — Full Arch package list (system restore manifest)
- `.xinitrc` — Launches awesome via `exec awesome`

## Stow usage

```sh
# From repo root, symlink a target into $HOME:
stow awesome        # symlinks awesome/.config/awesome → ~/.config/awesome
stow -D awesome     # remove symlinks
stow -D awesome -t /custom/path  # target a different directory
```

## AwesomeWM config (current working dir)

**Entry point:** `awesome/.config/awesome/rc.lua`

- **Terminal:** Alacritty | **Editor:** nvim/code | **Browser:** Brave
- **Modkey:** Super (Mod4)
- Theme in `theme.lua` — dark, BlexMono Nerd Font 14, near-black bg (`#040507`)
- Autostart in `autostart.sh` — picom, feh (wallpaper), tray apps, dunst, ibus
- Widgets: CPU%, memory%, kernel version in wibar (via vicious)
- `vicious/` dir is a git submodule placeholder; actual library is system-installed

### Key binds

| Key | Action |
|-----|--------|
| `Mod4+Return` | Terminal |
| `Mod4+Shift+Return` | Rofi |
| `Mod4+b` | Browser |
| `Mod4+p` | Toggle picom |
| `Mod4+w` | Random wallpaper |
| `Mod4+c` | Screenshot (flameshot) |
| `Mod4+x` | Power menu |
| `Mod4+Ctrl+r` | Restart awesome |

## Suckless (C code)

Only subdirectory with a build system:

```sh
cd suckless/dwmblocks && make && sudo make install
cd suckless/slstatus && make && sudo make install
```

## Gotchas

- `pkg.txt` is 1000+ packages — it's a system manifest, not an install script
- No `.editorconfig` or linter — match existing file style when editing
- Shell configs (`.bashrc`, `fish/config.fish`) use aliases that vary by distro (Arch/Debian/Void)
- Wayland configs (`hyprflux/`, `sway-*`, `waybar/`) are separate from X11 configs
- Wallpaper path hardcoded to `/home/abir/walls/` in autostart.sh
