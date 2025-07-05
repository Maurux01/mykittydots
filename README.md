# 🐱 MyKittyDots - Beautiful Kitty Terminal Configuration

<div align="center">

![Kitty Terminal](https://img.shields.io/badge/Kitty-Terminal-000000?style=for-the-badge&logo=kitty&logoColor=white)
![Dark Themes](https://img.shields.io/badge/Themes-7%20Dark%20Themes-eb6f92?style=for-the-badge)
![Cross Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS-1793d1?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

*A stunning Kitty terminal configuration with beautiful dark themes and custom enhancements*

[![Installation](https://img.shields.io/badge/Installation-Automated-brightgreen?style=for-the-badge)](install.sh)
[![Contributing](https://img.shields.io/badge/Contributing-Welcome-success?style=for-the-badge)](CONTRIBUTING.md)
[![Changelog](https://img.shields.io/badge/Changelog-Keep%20a%20Changelog-orange?style=for-the-badge)](CHANGELOG.md)

</div>

---

## ✨ Features

- 🎨 **Beautiful dark color schemes** - Eye-friendly colors for long coding sessions
- 🖥️ **JetBrains Mono Nerd Font** - Crisp, readable font with icons
- 🎯 **Powerline tabs** - Elegant tab bar with slanted design
- ⚡ **Custom shortcuts** - Intuitive keyboard navigation
- 🌙 **Multiple dark themes** - 7 beautiful dark themes including Main, Moon, Tokyo Night, Catppuccin, Dracula, Gruvbox, and Nord
- 🔧 **Easy customization** - Well-documented configuration
- 🚀 **Performance optimized** - GPU-accelerated rendering

## 🎨 Color Palette

The configuration uses beautiful dark color palettes optimized for coding:

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#191724` | Main background |
| Foreground | `#e0def4` | Text color |
| Selection | `#31748f` | Selected text background |
| Accent | `#c4a7e7` | URLs, borders |
| Red | `#eb6f92` | Errors, warnings |
| Green | `#9ccfd8` | Success, git additions |
| Yellow | `#f6c177` | Warnings, git modifications |
| Blue | `#31748f` | Info, git deletions |

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

The configuration includes seven beautiful dark themes:

### Main Theme (Default)
- Beautiful dark theme with soft colors
- Perfect for long coding sessions

### Moon Theme
- Darker variant of the main theme
- Ideal for low-light conditions

### Tokyo Night Dark
- Modern dark theme with blue accents
- Great for night coding

### Catppuccin Mocha
- Warm dark theme with pastel colors
- Easy on the eyes

### Dracula
- Classic dark theme with vibrant colors
- High contrast and readability

### Gruvbox Dark
- Retro-inspired dark theme
- Warm and comfortable

### Nord
- Clean and minimal dark theme
- Arctic-inspired colors

### Switch Themes

```bash
# Use the theme switcher script
~/.config/kitty/theme-switcher.sh main        # Main Theme (default)
~/.config/kitty/theme-switcher.sh moon        # Moon Theme
~/.config/kitty/theme-switcher.sh tokyo       # Tokyo Night Dark
~/.config/kitty/theme-switcher.sh catppuccin  # Catppuccin Mocha
~/.config/kitty/theme-switcher.sh dracula     # Dracula
~/.config/kitty/theme-switcher.sh gruvbox     # Gruvbox Dark
~/.config/kitty/theme-switcher.sh nord        # Nord
~/.config/kitty/theme-switcher.sh list        # Show all available themes

## 🔧 Customization

### Colors
Edit `~/.config/kitty/kitty.conf` to modify colors:

```conf
# Main colors
background #191724
foreground #e0def4
selection_background #31748f

# Terminal colors (16 colors)
color0 #26233a
color1 #eb6f92
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
window_border_color #31748f
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

- **Color consistency** - Beautiful dark themes
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

# Restart your system
sudo reboot
```

### Colors Not Displaying
```bash
# Check if your terminal supports true color
echo -e "\x1b[38;2;255;100;100mTRUECOLOR\x1b[0m"
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

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting a Pull Request.

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

## 🙏 Acknowledgments

- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/) for the amazing terminal emulator
- [JetBrains Mono](https://www.jetbrains.com/lp/mono/) for the excellent font
- [Nerd Fonts](https://www.nerdfonts.com/) for the icon support
- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/) for the amazing terminal emulator

---

<div align="center">

**⭐ If you find this project useful, please give it a star! ⭐**

Made with ❤️ by [maurux01](https://github.com/maurux01)

</div>

## 📞 Support

If you have any questions or need help:

- 🐛 [Report an issue](https://github.com/maurux01/mykittydots/issues)
- 💬 [Start a discussion](https://github.com/maurux01/mykittydots/discussions)
- 📧 Contact: [@maurux01](https://github.com/maurux01)

---

<div align="center">

**Made with ❤️ by [Mauro Infante](https://github.com/maurux01)**

*Enjoy your beautiful terminal! 🐱✨*

</div>