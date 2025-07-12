# 🐱 MyKittyDots - Beautiful Kitty Terminal Configuration

<div align="center">

![Kitty Terminal](https://img.shields.io/badge/Kitty-Terminal-000000?style=for-the-badge&logo=kitty&logoColor=white)
![Grubvox Theme](https://img.shields.io/badge/Theme-Grubvox%20with%20Nerdfont-ebdbb2?style=for-the-badge)
![Cross Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-1793d1?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

*A stunning Kitty terminal configuration with Grubvox theme and nerdfont support*

[![Installation](https://img.shields.io/badge/Installation-Automated-brightgreen?style=for-the-badge)](install.sh)
[![Contributing](https://img.shields.io/badge/Contributing-Welcome-success?style=for-the-badge)](CONTRIBUTING.md)
[![Changelog](https://img.shields.io/badge/Changelog-Keep%20a%20Changelog-orange?style=for-the-badge)](CHANGELOG.md)

</div>

---

## ✨ Features

- 🎨 **Grubvox theme** - Beautiful retro-inspired color scheme with nerdfont support
- 🖥️ **JetBrains Mono Nerd Font** - Crisp, readable font with icons
- 🎯 **Powerline tabs** - Elegant tab bar with slanted design
- ⚡ **Custom shortcuts** - Intuitive keyboard navigation
- 🌙 **Multiple themes** - 7 beautiful themes including Grubvox, Rose Pine, Tokyo Night, Catppuccin, Dracula, and Nord
- 🔧 **Easy customization** - Well-documented configuration
- 🚀 **Performance optimized** - GPU-accelerated rendering

## 🎨 Color Palette

The configuration uses the beautiful Grubvox color palette:

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#282828` | Main background |
| Foreground | `#ebdbb2` | Text color |
| Selection | `#504945` | Selected text background |
| Accent | `#83a598` | URLs, borders |
| Red | `#cc241d` | Errors, warnings |
| Green | `#98971a` | Success, git additions |
| Yellow | `#d79921` | Warnings, git modifications |
| Blue | `#458588` | Info, git deletions |

## 🚀 Quick Installation

### Automated Installation (Recommended)

```bash
# Clone the repository
git clone https://github.com/maurux01/mykittydots.git
cd mykittydots

# Run the installation script
chmod +x install.sh
./install.sh
```

The installation script will:
- ✅ Install Kitty terminal (if not already installed)
- ✅ Download and install JetBrains Mono Nerd Font
- ✅ Copy configuration files to `~/.config/kitty/`
- ✅ Create theme switcher and welcome scripts
- ✅ Set up desktop entry (Linux)

### Manual Installation

1. **Install Kitty terminal:**
   ```bash
   # Arch Linux
   sudo pacman -S kitty
   
   # Ubuntu/Debian
   curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
   
   # Fedora
   sudo dnf install kitty
   
   # macOS (with Homebrew)
   brew install kitty
   ```

2. **Install JetBrains Mono Nerd Font:**
   ```bash
   # Download and install the font
   mkdir -p ~/.local/share/fonts
   cd ~/.local/share/fonts
   curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -o JetBrainsMono.zip
   unzip JetBrainsMono.zip "*.ttf"
   rm JetBrainsMono.zip
   fc-cache -fv
   ```

3. **Copy configuration:**
   ```bash
   mkdir -p ~/.config/kitty
   cp kitty.conf ~/.config/kitty/
   ```

4. **Restart Kitty:**
   ```bash
   kitty
   ```

## 🎮 Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close tab |
| `Ctrl+Shift+Enter` | New window |
| `Ctrl+Shift+Arrow` | Navigate tabs |
| `Ctrl+Shift+1-9` | Go to specific tab |
| `Ctrl+Shift+Plus/Minus` | Change font size |
| `Ctrl+Shift+0` | Reset font size |
| `Ctrl+Shift+C` | Copy to clipboard |
| `Ctrl+Shift+V` | Paste from clipboard |
| `Ctrl+Shift+O` | Toggle layout |

## 🌙 Theme Switching

The configuration includes seven beautiful themes:

### Grubvox Dark (Default)
- Retro-inspired dark theme with warm colors
- Perfect for long coding sessions
- Excellent contrast and readability

### Grubvox Light
- Light variant of the Grubvox theme
- Great for bright environments

### Rose Pine
- Beautiful dark theme with soft colors
- Ideal for creative work

### Tokyo Night Dark
- Modern dark theme with blue accents
- Great for night coding

### Catppuccin Mocha
- Warm dark theme with pastel colors
- Easy on the eyes

### Dracula
- Classic dark theme with vibrant colors
- High contrast and readability

### Nord
- Clean and minimal dark theme
- Arctic-inspired colors

### Switch Themes

```bash
# Use the theme switcher script
~/.config/kitty/theme-switcher.sh gruvbox        # Grubvox Dark (default)
~/.config/kitty/theme-switcher.sh gruvbox-light  # Grubvox Light
~/.config/kitty/theme-switcher.sh rose-pine      # Rose Pine
~/.config/kitty/theme-switcher.sh tokyo-night    # Tokyo Night Dark
~/.config/kitty/theme-switcher.sh catppuccin     # Catppuccin Mocha
~/.config/kitty/theme-switcher.sh dracula        # Dracula
~/.config/kitty/theme-switcher.sh nord           # Nord
~/.config/kitty/theme-switcher.sh list           # Show all available themes
```

## 🔧 Customization

### Colors
Edit `~/.config/kitty/kitty.conf` to modify colors:

```conf
# Main colors
background #282828
foreground #ebdbb2
selection_background #504945

# Terminal colors (16 colors)
color0 #282828
color1 #cc241d
# ... more colors
```

### Font
Change the font by modifying:

```conf
font_family Your Preferred Font
font_size 12.0
```

### Window Appearance
Customize window behavior:

```conf
window_padding_width 15
window_border_width 2
window_border_color #504945
```

## 📁 File Structure

```
mykittydots/
├── kitty.conf          # Main configuration file
├── install.sh          # Automated installation script
├── README.md           # This file
├── LICENSE             # MIT License
├── CONTRIBUTING.md     # Contributing guidelines
├── CHANGELOG.md        # Version history and changes
├── .gitignore          # Git ignore rules
└── .editorconfig       # Editor configuration
```

After installation, additional files are created in `~/.config/kitty/`:
- `welcome.sh` - Welcome message script
- `theme-switcher.sh` - Theme switching utility
- `kitty.desktop` - Desktop entry (Linux)

## 🎯 Integration with Neovim

This configuration is designed to work perfectly with your Neovim setup:

- **Color consistency** - Beautiful Grubvox theme
- **Font compatibility** - Uses the same JetBrains Mono Nerd Font
- **Terminal integration** - Proper 24-bit color support

## 📞 Support

### Getting Help

If you encounter any issues or have questions:

1. **Check the [Troubleshooting](#-troubleshooting) section** above
2. **Search existing issues** on GitHub
3. **Create a new issue** with detailed information:
   - Your operating system and version
   - Kitty terminal version
   - Steps to reproduce the problem
   - Error messages (if any)

### Community

- **GitHub Issues**: [Report bugs or request features](https://github.com/maurux01/mykittydots/issues)
- **GitHub Discussions**: [Ask questions and share tips](https://github.com/maurux01/mykittydots/discussions)
- **Contributing**: [Help improve the project](CONTRIBUTING.md)

## 🐛 Troubleshooting

### Font Not Loading
```bash
# Update font cache
fc-cache -fv

# Restart your system or logout/login
```

### Theme Not Applying
```bash
# Restart Kitty
pkill kitty
kitty

# Or reload configuration
kitty @ set-colors --all ~/.config/kitty/kitty.conf
```

### Colors Not Working
```bash
# Check if your terminal supports 24-bit colors
echo -e "\033[38;2;255;0;0mRed\033[0m"

# If you see red text, 24-bit colors are supported
```

### Configuration Not Loading
```bash
# Check if Kitty is reading the config
kitty --config ~/.config/kitty/kitty.conf
```

### Theme Switcher Not Working
```bash
# Check if the script exists and is executable
ls -la ~/.config/kitty/theme-switcher.sh
chmod +x ~/.config/kitty/theme-switcher.sh

# Test theme switching
~/.config/kitty/theme-switcher.sh list
```

### Installation Issues
```bash
# Check Kitty installation
which kitty
kitty --version

# Check font installation
fc-list | grep -i "jetbrains"

# Verify configuration directory
ls -la ~/.config/kitty/
```

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

### Quick Start for Contributors

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'feat: add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/mykittydots.git
cd mykittydots

# Test the installation script
./install.sh

# Test theme switching
~/.config/kitty/theme-switcher.sh list
```

For detailed information, see [CONTRIBUTING.md](CONTRIBUTING.md).

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes and releases.

## �� Acknowledgments

- **Grubvox theme** - Beautiful retro-inspired color scheme
- **JetBrains Mono** - Excellent programming font
- **Nerd Fonts** - Icon font support
- **Kitty Terminal** - Fast, feature-rich terminal emulator

---

<div align="center">

**Made with ❤️ by [Mauro Infante](https://github.com/maurux01)**

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/maurux01)
[![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/maurux01)

</div>