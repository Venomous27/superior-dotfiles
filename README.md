<h1 align="center">【 venomous's dotfiles 】</h1>

<div align="center"> 

![](https://img.shields.io/github/last-commit/Venomous27/superior-dotfiles?&style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/Venomous27/superior-dotfiles?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/Venomous27/superior-dotfiles?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

</div>
<!--thanks end4 for these badges https://github.com/end-4 -->

A simple and beautiful Hyprland daily driver desktop environment, built for seamless tiling and powered by a dynamic proxy theme engine.

---

## 🤖 The Story Behind This Rice

> *"I knew exactly what I wanted, but I didn't have the time to learn how to code a desktop environment from scratch."*

Let's be real: I am completely packed with school and studies right now. I needed a rock-solid, incredibly gorgeous **working machine**, not a new coding hobby. Because of that, **these dotfiles were built entirely using AI.**

I directed the workflows, ironed out the functionality, and let AI handle the heavy lifting. I am absolutely thrilled with the results, and it proves you don't need to waste weeks writing configuration code manually to get a powerful, tailored Linux setup.

---

## 📸 Previews & Media Showcase

### 🎥 Live Video Demos

Watch the system in action, showcasing smooth transitions and layout switches:

## 🎨 Dynamic Theme Switching Proxy  
https://github.com/user-attachments/assets/59f5cff9-f70b-4cf1-b9a6-e852cd3c47f0

## 🪟 Tiling & Scrolling Layout Toggle 
https://github.com/user-attachments/assets/32b297fb-f3bd-44a6-8e2d-ea367441ad02

---

### 🖼️ System Screenshots

Closer looks at individual application themes and terminal workflows:

### Adding soon 

---

## ✨ Key Features

* **Dual Workflow Modes:** Seamlessly switch between traditional automatic window tiling and fluid layout scrolling modes inside Hyprland.
* **Proxy-Based Theme Switching:** Swap the visual aesthetics of the entire desktop on the fly. The underlying engine instantly copies theme-specific proxy overrides directly into the active application configs.
* **All-in-One Rofi Menu Suite:** A collection of custom Rofi scripts covering the app launcher, theme switcher, wallpaper changer, and a power menu (shutdown/reboot/sleep/logout), plus a clipboard history picker and an emoji/kaomoji/math-symbol/Nerd Font glyph picker.
* **Stow Managed:** Zero copy-pasting cluttering up your machine. Everything lives in one place and symlinks instantly.

---

## 🚨 Crucial Architecture & Core Software

> ⚠️ **Important:** The theme switcher relies on a strict application ecosystem. It injects specific proxy configs dynamically into the target software below. **If these specific apps are missing, the theme switcher script — and other parts of the setup — will fail to apply themes or function properly.**

> **Platform note:** This setup targets **Arch Linux / CachyOS** specifically. Install everything below before stowing any config.

| Role | Component | Description | Why it's mandatory |
|---|---|---|---|
| **Compositor** | [Hyprland](https://hypr.land/) | Dynamic Wayland tiling window manager | Core window manager accepting dynamic reloads. |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal emulator | Custom configurations are written dynamically to its theme profiles. |
| **File Manager** | [Thunar](https://docs.xfce.org/xfce/thunar/start) | Lightweight file manager | The hardcoded target file manager for system UI paths. |
| **Symlinks** | [GNU Stow](https://www.gnu.org/software/stow/) | Manages dotfiles using symbolic links | Required to map these configurations into your `$HOME`. |
| **App Launcher** | [Rofi-Wayland](https://github.com/lbonn/rofi) | Wayland-compatible launcher and menu system | The core menu handler executing the theme selection menu. |
| **Status Bar** | [Wayle](https://wayle.app/guide/getting-started) | Highly customizable Wayland status bar | Displays live system/theme state and reflects proxy changes. |
| **Wallpaper Engine** | [awww](https://codeberg.org/LGFae/awww) | Animated wallpaper daemon for Wayland | Drives wallpaper transitions tied to each theme swap. |
| **Color Generation** | [Matugen](https://github.com/InioX/matugen) | Material You color schemes from wallpapers | Generates the palettes the proxy engine injects into app configs. |
| **Brightness** | [Brightnessctl](https://github.com/Hummer12007/brightnessctl) | CLI display brightness control | Powers brightness keybinds. |
| **Screenshot Editing** | [Satty](https://github.com/gabm/Satty) | Screenshot annotation tool for Wayland | Handles the annotate/edit step of the screenshot workflow. |
| **Screenshot Capture** | [Hyprshot](https://github.com/Gustash/Hyprshot) | Screenshot utility built for Hyprland | Handles the capture step of the screenshot workflow. |
| **Clipboard** | [wl-clipboard](https://github.com/bugaevc/wl-clipboard) | Wayland clipboard utilities (`wl-copy`/`wl-paste`) | Required for clipboard actions across the desktop. |
| **System Info** | [Fastfetch](https://github.com/fastfetch-cli/fastfetch) | Fast system information tool | Used in the terminal welcome layout. |
| **Shell** | [Zsh](https://www.zsh.org/) | Feature-rich Unix shell | Default shell targeted by the terminal configs. |
| **Idle Daemon** | [Hypridle](https://github.com/hyprwm/hypridle) | Idle daemon for Hyprland | Triggers lock/sleep behavior. |
| **Screen Locker** | [Hyprlock](https://github.com/hyprwm/hyprlock) | GPU-accelerated screen locker | Provides the themed lock screen. |
| **Desktop Portal** | [xdg-desktop-portal-hyprland](https://github.com/hyprwm/xdg-desktop-portal-hyprland) | XDG portal backend for Hyprland | Enables screen sharing, screenshots, and desktop integration. |
| **XDG Utilities** | [xdg-utils](https://www.freedesktop.org/wiki/Software/xdg-utils/) | Utilities like `xdg-open` | Handles opening files/URLs from the desktop environment. |
| **Sound System** | PulseAudio *(or PipeWire + `pipewire-pulse`)* | PulseAudio-compatible audio server | Volume mixer keys and audio scripts rely on this control interface. |

---
 
## 🧩 Hyprland Plugins
 
On top of the base dependencies above, this setup optionally uses the official **[hyprscrolling](https://github.com/hyprwm/hyprland-plugins/tree/main/hyprscrolling)** plugin — the PaperWM-style scrolling layout that powers the "layout scrolling" workflow mode mentioned in [Key Features](#-key-features).
 
Plugins are managed through `hyprpm`, Hyprland's built-in plugin manager, so no manual compiling is needed.
 
### Install & Enable `hyprscrolling`
 
```bash
# Update hyprpm's plugin headers to match your installed Hyprland version
hyprpm update
 
# Add the official hyprland-plugins repo (contains hyprscrolling)
hyprpm add https://github.com/hyprwm/hyprland-plugins
 
# Enable the plugin
hyprpm enable hyprscrolling
 
# Load enabled plugins into the running session
hyprpm reload
```
 
> ⚠️ **Version matching:** `hyprpm` builds plugins against your exact installed Hyprland version. If you update Hyprland, run `hyprpm update` again afterward or the plugin will fail to load until it's rebuilt.
 
You can confirm it's active anytime with:
 
```bash
hyprpm list
```

---

## ⚠️ Important Note on Auto-Generated Files

Because this setup relies on a dynamic theme-switching engine, the primary runtime configuration files are handled as proxies.

When looking through the repository or your local `~/.config/`, you will notice this banner at the top of active application profiles:

```text
#################################################################
#           AUTO-GENERATED BY THEME SWITCHER PROXY              #
#                                                               #
#  DO NOT EDIT THIS FILE DIRECTLY. IT WILL BE OVERWRITTEN.      #
#  MAKE CHANGES IN THE THEME PALETTES FOLDER INSTEAD.           #
#################################################################
```

If you see this banner, edit the corresponding file in the theme palettes folder instead — direct edits will be wiped on the next theme switch.

---

## 🚀 Installation

### 1. Install Dependencies

Install everything listed in the [Core Software](#-crucial-architecture--core-software) table manually for now — some packages live in the official repos (`pacman`) and others in the AUR (`yay`/`paru`), so a one-liner would be misleading.

> 🦥 I'm too lazy to write out a full install command right now — might add a proper install script in the future. For now, go through the table above and install each package manually.

### 2. Back Up Existing Configs

> ⚠️ **Why this step matters:** GNU Stow will **not** overwrite files that already exist at the target location. If you already have configs sitting in `~/.config/` (e.g. `hypr`, `kitty`, `waybar`, `rofi`, `thunar`), Stow will detect the conflict and simply refuse to symlink — it exits without an error and without doing anything, so it can look like the install "worked" when nothing actually got linked. Move your existing configs out of the way first so Stow has a clean target to symlink into.

```bash
mkdir -p ~/.config-backup
mv ~/.config/{hypr,kitty,waybar,rofi,thunar} ~/.config-backup/ 2>/dev/null
```

### 3. Clone the Repository

```bash
git clone https://github.com/Venomous27/superior-dotfiles.git ~/superior-dotfiles
cd ~/superior-dotfiles
```

### 4. Deploy with Stow

```bash
stow cava fastfetch gtk-3.0 hypr kitty rofi themes xsettingsd zsh wayle matugen icons gtk-themes
```

### 5. Verify & Launch

Restart Hyprland (or reboot), then confirm everything loaded:

```bash
hyprctl reload
```
---

*Built with plenty of AI assistance and zero regrets. 🚀*
