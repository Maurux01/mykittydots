#!/bin/bash

# =============================================================================
#                           🐱 KITTY INSTALLATION SCRIPT 🐱
# =============================================================================
# Author: Mauro Infante (maurux01)
# Description: Automated installation script for beautiful Kitty terminal config
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${CYAN}================================${NC}"
    echo -e "${CYAN}   🐱 KITTY INSTALLATION 🐱   ${NC}"
    echo -e "${CYAN}================================${NC}"
}

print_header

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root"
   exit 1
fi

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
else
    print_error "Unsupported operating system: $OSTYPE"
    exit 1
fi

print_status "Detected OS: $OS"

# Check if Kitty is installed
if ! command -v kitty &> /dev/null; then
    print_warning "Kitty terminal is not installed. Installing..."
    
    if [[ "$OS" == "linux" ]]; then
        # Detect Linux distribution
        if command -v pacman &> /dev/null; then
            print_status "Installing Kitty via pacman (Arch Linux)"
            sudo pacman -S kitty --noconfirm
        elif command -v apt &> /dev/null; then
            print_status "Installing Kitty via apt (Ubuntu/Debian)"
            curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
        elif command -v dnf &> /dev/null; then
            print_status "Installing Kitty via dnf (Fedora)"
            sudo dnf install kitty
        elif command -v zypper &> /dev/null; then
            print_status "Installing Kitty via zypper (openSUSE)"
            sudo zypper install kitty
        else
            print_error "Could not detect package manager. Please install Kitty manually."
            exit 1
        fi
    elif [[ "$OS" == "macos" ]]; then
        print_status "Installing Kitty via Homebrew (macOS)"
        if ! command -v brew &> /dev/null; then
            print_error "Homebrew is not installed. Please install it first."
            exit 1
        fi
        brew install kitty
    fi
else
    print_status "Kitty is already installed"
fi

# Create Kitty config directory
KITTY_CONFIG_DIR="$HOME/.config/kitty"
print_status "Creating Kitty config directory: $KITTY_CONFIG_DIR"
mkdir -p "$KITTY_CONFIG_DIR"

# Copy configuration file
print_status "Installing Kitty configuration..."
cp kitty.conf "$KITTY_CONFIG_DIR/"

# Install JetBrains Mono Nerd Font
print_status "Installing JetBrains Mono Nerd Font..."

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Download and install the font
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
FONT_ZIP="$FONT_DIR/JetBrainsMono.zip"

print_status "Downloading JetBrains Mono Nerd Font..."
curl -L "$FONT_URL" -o "$FONT_ZIP"

print_status "Extracting font files..."
cd "$FONT_DIR"
unzip -o "$FONT_ZIP" "*.ttf" > /dev/null 2>&1 || true

# Clean up
rm -f "$FONT_ZIP"

# Update font cache
if command -v fc-cache &> /dev/null; then
    print_status "Updating font cache..."
    fc-cache -fv
fi

# Create a beautiful welcome message
print_status "Creating welcome script..."
cat > "$KITTY_CONFIG_DIR/welcome.sh" << 'EOF'
#!/bin/bash

# Welcome message for Kitty terminal
echo -e "\033[38;2;196;167;231m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    🐱 Welcome to Kitty! 🐱                    ║"
echo "║                                                              ║"
echo "║  🎨 Theme: Rose-pine inspired                                ║"
echo "║  🖥️  Font: JetBrains Mono Nerd Font                          ║"
echo "║  🎯 Features: Powerline tabs, custom shortcuts               ║"
echo "║  🌙 7 beautiful dark themes available                        ║"
echo "║                                                              ║"
echo "║  📋 Useful shortcuts:                                        ║"
echo "║     Ctrl+Shift+T: New tab                                    ║"
echo "║     Ctrl+Shift+W: Close tab                                  ║"
echo "║     Ctrl+Shift+Enter: New window                             ║"
echo "║     Ctrl+Shift+Arrow: Navigate tabs                          ║"
echo "║     Ctrl+Shift+Plus/Minus: Change font size                  ║"
echo "║                                                              ║"
echo "║  🎨 Theme switching: theme-switcher.sh {theme_name}          ║"
echo "║  🌟 Enjoy your beautiful terminal!                           ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"
EOF



chmod +x "$KITTY_CONFIG_DIR/welcome.sh"

# Create a theme switcher script
print_status "Creating theme switcher..."
cat > "$KITTY_CONFIG_DIR/theme-switcher.sh" << 'EOF'
#!/bin/bash

# Theme switcher for Kitty terminal
KITTY_CONFIG="$HOME/.config/kitty/kitty.conf"

# Function to comment out all theme sections
comment_all_themes() {
    sed -i '/^# === ROSE-PINE MOON/,/^# === TOKYO NIGHT/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === TOKYO NIGHT/,/^# === CATPPUCCIN MOCHA/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === CATPPUCCIN MOCHA/,/^# === DRACULA/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === DRACULA/,/^# === GRUVBOX DARK/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === GRUVBOX DARK/,/^# === NORD/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === NORD/,/^# === USAGE NOTES/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
}

# Function to uncomment a specific theme
uncomment_theme() {
    local theme_start="$1"
    local theme_end="$2"
    sed -i "/^# === $theme_start/,/^# === $theme_end/s/^#//" "$KITTY_CONFIG"
}

case "$1" in
    "main"|"rose-pine")
        comment_all_themes
        echo "🎨 Switched to Rose-pine Main theme"
        ;;
    "moon"|"rose-pine-moon")
        comment_all_themes
        uncomment_theme "ROSE-PINE MOON" "TOKYO NIGHT"
        echo "🌙 Switched to Rose-pine Moon theme"
        ;;
    "tokyo"|"tokyo-night")
        comment_all_themes
        uncomment_theme "TOKYO NIGHT" "CATPPUCCIN MOCHA"
        echo "🌃 Switched to Tokyo Night theme"
        ;;
    "catppuccin"|"mocha")
        comment_all_themes
        uncomment_theme "CATPPUCCIN MOCHA" "DRACULA"
        echo "☕ Switched to Catppuccin Mocha theme"
        ;;
    "dracula")
        comment_all_themes
        uncomment_theme "DRACULA" "GRUVBOX DARK"
        echo "🧛 Switched to Dracula theme"
        ;;
    "gruvbox"|"gruvbox-dark")
        comment_all_themes
        uncomment_theme "GRUVBOX DARK" "NORD"
        echo "🟫 Switched to Gruvbox Dark theme"
        ;;
    "nord")
        comment_all_themes
        uncomment_theme "NORD" "USAGE NOTES"
        echo "❄️ Switched to Nord theme"
        ;;
    "list"|"themes")
        echo "🎨 Available themes:"
        echo "  main/rose-pine     - Rose-pine Main (default)"
        echo "  moon/rose-pine-moon - Rose-pine Moon (darker)"
        echo "  tokyo/tokyo-night  - Tokyo Night Dark"
        echo "  catppuccin/mocha   - Catppuccin Mocha"
        echo "  dracula            - Dracula"
        echo "  gruvbox/gruvbox-dark - Gruvbox Dark"
        echo "  nord               - Nord"
        echo ""
        echo "Usage: $0 {theme_name}"
        ;;
    *)
        echo "❌ Unknown theme: $1"
        echo ""
        echo "🎨 Available themes:"
        echo "  main/rose-pine     - Rose-pine Main (default)"
        echo "  moon/rose-pine-moon - Rose-pine Moon (darker)"
        echo "  tokyo/tokyo-night  - Tokyo Night Dark"
        echo "  catppuccin/mocha   - Catppuccin Mocha"
        echo "  dracula            - Dracula"
        echo "  gruvbox/gruvbox-dark - Gruvbox Dark"
        echo "  nord               - Nord"
        echo ""
        echo "Usage: $0 {theme_name}"
        echo "       $0 list        - Show all available themes"
        exit 1
        ;;
esac

# Send signal to reload Kitty configuration
pkill -USR1 kitty 2>/dev/null || true
echo "✅ Theme applied! Restart Kitty if changes don't appear immediately."
EOF

chmod +x "$KITTY_CONFIG_DIR/theme-switcher.sh"

# Create desktop entry for easy access
if [[ "$OS" == "linux" ]]; then
    print_status "Creating desktop entry..."
    mkdir -p "$HOME/.local/share/applications"
    
    cat > "$HOME/.local/share/applications/kitty.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Kitty Terminal
Comment=Fast, feature-rich, GPU based terminal emulator
Exec=kitty
Icon=utilities-terminal
Terminal=false
Categories=System;TerminalEmulator;
EOF
fi

# Final instructions
echo
print_status "Installation completed successfully! 🎉"
echo
echo -e "${CYAN}Next steps:${NC}"
echo "1. Restart Kitty terminal or run: kitty"
echo "2. If fonts don't load properly, restart your system"
echo "3. Use the theme switcher: $KITTY_CONFIG_DIR/theme-switcher.sh"
echo
echo -e "${CYAN}Theme switching:${NC}"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh main        # Rose-pine Main (default)"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh moon        # Rose-pine Moon (darker)"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh tokyo       # Tokyo Night Dark"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh catppuccin  # Catppuccin Mocha"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh dracula     # Dracula"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh gruvbox     # Gruvbox Dark"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh nord        # Nord"
echo "  $KITTY_CONFIG_DIR/theme-switcher.sh list        # Show all themes"
echo

echo
echo -e "${CYAN}Configuration file:${NC} $KITTY_CONFIG_DIR/kitty.conf"
echo
print_status "Enjoy your beautiful Kitty terminal! 🐱✨" 