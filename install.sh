#!/bin/bash

# =============================================================================
#                           🐱 KITTY INSTALLATION SCRIPT 🐱
# =============================================================================
# Author: Mauro Infante (maurux01)
# Description: Automated installation script for beautiful Kitty terminal config with Grubvox theme
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

# Function to install development tools
install_dev_tools() {
    print_status "Installing development tools..."
    
    if [[ "$OS" == "linux" ]]; then
        # Detect Linux distribution
        if command -v pacman &> /dev/null; then
            print_status "Installing development tools via pacman (Arch Linux)"
            
            # Core development tools
            sudo pacman -S --noconfirm \
                nodejs npm yarn \
                python python-pip \
                git \
                docker docker-compose \
                postgresql mysql mongodb \
                fzf ripgrep ranger \
                htop glances \
                micro vim nano \
                neovim \
                tmux \
                tree \
                wget curl \
                unzip zip \
                jq \
                bat \
                fd \
                exa \
                tldr
            
            # Enable and start services
            print_status "Enabling services..."
            sudo systemctl enable --now docker
            sudo systemctl enable --now postgresql
            sudo systemctl enable --now mysql
            
        elif command -v apt &> /dev/null; then
            print_status "Installing development tools via apt (Ubuntu/Debian)"
            
            # Update package list
            sudo apt update
            
            # Install Node.js and npm
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
            
            # Install other tools
            sudo apt-get install -y \
                yarn \
                python3 python3-pip \
                git \
                docker.io docker-compose \
                postgresql postgresql-contrib \
                mysql-server \
                mongodb \
                fzf ripgrep \
                htop \
                vim nano \
                neovim \
                tmux \
                tree \
                wget curl \
                unzip zip \
                jq \
                bat \
                fd-find \
                exa \
                tldr
            
            # Install ranger
            pip3 install ranger-fm
            
        elif command -v dnf &> /dev/null; then
            print_status "Installing development tools via dnf (Fedora)"
            
            # Install Node.js
            sudo dnf install -y nodejs npm yarn
            
            # Install other tools
            sudo dnf install -y \
                python3 python3-pip \
                git \
                docker docker-compose \
                postgresql postgresql-server \
                mysql mysql-server \
                mongodb \
                fzf ripgrep ranger \
                htop glances \
                vim nano neovim \
                tmux \
                tree \
                wget curl \
                unzip zip \
                jq \
                bat \
                fd-find \
                exa \
                tldr
            
        elif command -v zypper &> /dev/null; then
            print_status "Installing development tools via zypper (openSUSE)"
            
            # Install Node.js
            sudo zypper install -y nodejs npm yarn
            
            # Install other tools
            sudo zypper install -y \
                python3 python3-pip \
                git \
                docker docker-compose \
                postgresql postgresql-server \
                mysql \
                mongodb \
                fzf ripgrep ranger \
                htop glances \
                vim nano neovim \
                tmux \
                tree \
                wget curl \
                unzip zip \
                jq \
                bat \
                fd \
                exa \
                tldr
        else
            print_warning "Could not detect package manager. Please install development tools manually."
        fi
        
        # Install global npm packages
        print_status "Installing global npm packages..."
        npm install -g \
            @vue/cli \
            create-react-app \
            @angular/cli \
            nodemon \
            pm2 \
            serve \
            http-server \
            concurrently \
            typescript \
            ts-node \
            eslint \
            prettier \
            nodemon \
            forever
        
        # Install global Python packages
        print_status "Installing global Python packages..."
        pip3 install \
            django \
            flask \
            fastapi \
            uvicorn \
            requests \
            beautifulsoup4 \
            pandas \
            numpy \
            matplotlib \
            jupyter \
            ipython \
            black \
            flake8 \
            pytest \
            pipenv \
            poetry
        
    elif [[ "$OS" == "macos" ]]; then
        print_status "Installing development tools via Homebrew (macOS)"
        
        if ! command -v brew &> /dev/null; then
            print_error "Homebrew is not installed. Please install it first."
            exit 1
        fi
        
        # Install development tools
        brew install \
            node \
            yarn \
            python \
            git \
            docker docker-compose \
            postgresql \
            mysql \
            mongodb/brew/mongodb-community \
            fzf \
            ripgrep \
            ranger \
            htop \
            glances \
            micro \
            vim \
            neovim \
            tmux \
            tree \
            wget \
            curl \
            jq \
            bat \
            fd \
            exa \
            tldr
        
        # Install global npm packages
        print_status "Installing global npm packages..."
        npm install -g \
            @vue/cli \
            create-react-app \
            @angular/cli \
            nodemon \
            pm2 \
            serve \
            http-server \
            concurrently \
            typescript \
            ts-node \
            eslint \
            prettier \
            nodemon \
            forever
        
        # Install global Python packages
        print_status "Installing global Python packages..."
        pip3 install \
            django \
            flask \
            fastapi \
            uvicorn \
            requests \
            beautifulsoup4 \
            pandas \
            numpy \
            matplotlib \
            jupyter \
            ipython \
            black \
            flake8 \
            pytest \
            pipenv \
            poetry
    fi
    
    print_status "Development tools installation completed!"
}

# Ask user if they want to install development tools
echo ""
echo -e "${CYAN}================================${NC}"
echo -e "${CYAN}   🛠️  DEVELOPMENT TOOLS SETUP   ${NC}"
echo -e "${CYAN}================================${NC}"
echo ""
echo "This installer can also install development tools for frontend and backend development."
echo ""
echo "The following tools will be installed:"
echo "  🟢 Core: Node.js, npm, yarn, Python, pip, Git"
echo "  🟢 Frontend: Vue CLI, React CLI, Angular CLI"
echo "  🟢 Backend: Django, Flask, FastAPI, nodemon, pm2"
echo "  🟢 Database: PostgreSQL, MySQL, MongoDB"
echo "  🟢 DevOps: Docker, Docker Compose"
echo "  🟢 Tools: fzf, ripgrep, ranger, htop, micro, vim, neovim"
echo "  🟢 Utilities: bat, fd, exa, tldr, tmux"
echo ""
read -p "Do you want to install development tools? (y/N): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    install_dev_tools
else
    print_status "Skipping development tools installation"
fi

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
echo -e "\033[38;2;131;165;152m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    🐱 Welcome to Kitty! 🐱                    ║"
echo "║                                                              ║"
echo "║  🎨 Theme: Grubvox with nerdfont support                    ║"
echo "║  🖥️  Font: JetBrains Mono Nerd Font                          ║"
echo "║  🎯 Features: Powerline tabs, custom shortcuts               ║"
echo "║  🌙 7 beautiful themes available                             ║"
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
    sed -i '/^# === GRUVBOX LIGHT/,/^# === ROSE-PINE MAIN/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === ROSE-PINE MAIN/,/^# === TOKYO NIGHT DARK/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === TOKYO NIGHT DARK/,/^# === CATPPUCCIN MOCHA/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === CATPPUCCIN MOCHA/,/^# === DRACULA/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === DRACULA/,/^# === NORD/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
    sed -i '/^# === NORD/,/^# === USAGE NOTES/s/^#//' "$KITTY_CONFIG" 2>/dev/null || true
}

# Function to uncomment a specific theme
uncomment_theme() {
    local theme_start="$1"
    local theme_end="$2"
    sed -i "/^# === $theme_start/,/^# === $theme_end/s/^#//" "$KITTY_CONFIG"
}

case "$1" in
    "gruvbox"|"gruvbox-dark")
        comment_all_themes
        echo "🟫 Switched to Grubvox Dark theme"
        ;;
    "gruvbox-light")
        comment_all_themes
        uncomment_theme "GRUVBOX LIGHT" "ROSE-PINE MAIN"
        echo "🟨 Switched to Grubvox Light theme"
        ;;
    "rose-pine"|"main")
        comment_all_themes
        uncomment_theme "ROSE-PINE MAIN" "TOKYO NIGHT DARK"
        echo "🎨 Switched to Rose Pine theme"
        ;;
    "tokyo"|"tokyo-night")
        comment_all_themes
        uncomment_theme "TOKYO NIGHT DARK" "CATPPUCCIN MOCHA"
        echo "🌃 Switched to Tokyo Night theme"
        ;;
    "catppuccin"|"mocha")
        comment_all_themes
        uncomment_theme "CATPPUCCIN MOCHA" "DRACULA"
        echo "☕ Switched to Catppuccin Mocha theme"
        ;;
    "dracula")
        comment_all_themes
        uncomment_theme "DRACULA" "NORD"
        echo "🧛 Switched to Dracula theme"
        ;;
    "nord")
        comment_all_themes
        uncomment_theme "NORD" "USAGE NOTES"
        echo "❄️ Switched to Nord theme"
        ;;
    "list"|"themes")
        echo "🎨 Available themes:"
        echo "  gruvbox/gruvbox-dark - Grubvox Dark (default)"
        echo "  gruvbox-light        - Grubvox Light"
        echo "  rose-pine/main       - Rose Pine"
        echo "  tokyo/tokyo-night    - Tokyo Night Dark"
        echo "  catppuccin/mocha     - Catppuccin Mocha"
        echo "  dracula              - Dracula"
        echo "  nord                 - Nord"
        echo ""
        echo "Usage: $0 {theme_name}"
        ;;
    *)
        echo "❌ Unknown theme: $1"
        echo ""
        echo "🎨 Available themes:"
        echo "  gruvbox/gruvbox-dark - Grubvox Dark (default)"
        echo "  gruvbox-light        - Grubvox Light"
        echo "  rose-pine/main       - Rose Pine"
        echo "  tokyo/tokyo-night    - Tokyo Night Dark"
        echo "  catppuccin/mocha     - Catppuccin Mocha"
        echo "  dracula              - Dracula"
        echo "  nord                 - Nord"
        echo ""
        echo "Usage: $0 {theme_name}"
        echo "       $0 list        - Show all available themes"
        exit 1
        ;;
esac

# Reload Kitty configuration
if command -v kitty &> /dev/null; then
    kitty @ set-colors --all "$KITTY_CONFIG"
fi
EOF

chmod +x "$KITTY_CONFIG_DIR/theme-switcher.sh"

# Create development aliases and scripts
print_status "Creating development scripts and aliases..."

# Create development aliases file
cat > "$KITTY_CONFIG_DIR/dev-aliases.sh" << 'EOF'
#!/bin/bash

# Development aliases for Kitty terminal

# Git shortcuts
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline"
alias gb="git branch"
alias gco="git checkout"
alias gcb="git checkout -b"

# Node.js shortcuts
alias dev="npm run dev"
alias build="npm run build"
alias test="npm test"
alias start="npm start"
alias install="npm install"

# Docker shortcuts
alias dc="docker-compose"
alias dps="docker ps"
alias dex="docker exec -it"
alias dlogs="docker logs"
alias dstop="docker stop"
alias drm="docker rm"

# Database shortcuts
alias psql-dev="psql -h localhost -U postgres -d dev_db"
alias mysql-dev="mysql -u root -p"
alias mongo-dev="mongo localhost:27017/dev_db"

# Development tools
alias serve="python3 -m http.server"
alias py="python3"
alias pip="pip3"

# File navigation
alias ll="exa -la"
alias la="exa -a"
alias lt="exa --tree"
alias cat="bat"

# System shortcuts
alias h="history"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."

# Kitty shortcuts
alias kitty-themes="~/.config/kitty/theme-switcher.sh list"
alias kitty-gruvbox="~/.config/kitty/theme-switcher.sh gruvbox"
alias kitty-light="~/.config/kitty/theme-switcher.sh gruvbox-light"
alias kitty-dracula="~/.config/kitty/theme-switcher.sh dracula"

echo "🚀 Development aliases loaded!"
echo "📋 Available shortcuts:"
echo "  Git: gs, ga, gc, gp, gl, gb, gco, gcb"
echo "  Node: dev, build, test, start, install"
echo "  Docker: dc, dps, dex, dlogs, dstop, drm"
echo "  Database: psql-dev, mysql-dev, mongo-dev"
echo "  Kitty: kitty-themes, kitty-gruvbox, kitty-light, kitty-dracula"
EOF

chmod +x "$KITTY_CONFIG_DIR/dev-aliases.sh"

# Create project templates
print_status "Creating project templates..."

mkdir -p "$HOME/.config/kitty/templates"

# Frontend project template
cat > "$HOME/.config/kitty/templates/frontend-project.sh" << 'EOF'
#!/bin/bash

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi

echo "🚀 Creating frontend project: $PROJECT_NAME"

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize git
git init

# Create package.json
cat > package.json << 'PACKAGE_EOF'
{
  "name": "'$PROJECT_NAME'",
  "version": "1.0.0",
  "description": "Frontend project",
  "main": "index.js",
  "scripts": {
    "dev": "echo 'Add your dev script here'",
    "build": "echo 'Add your build script here'",
    "test": "echo 'Add your test script here'",
    "start": "echo 'Add your start script here'"
  },
  "keywords": [],
  "author": "",
  "license": "MIT"
}
PACKAGE_EOF

# Create basic structure
mkdir -p src/{components,pages,utils,styles}
mkdir -p public
mkdir -p docs

# Create README
cat > README.md << 'README_EOF'
# '$PROJECT_NAME'

Frontend project created with MyKittyDots.

## Getting Started

1. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

2. Start development server:
   \`\`\`bash
   npm run dev
   \`\`\`

## Project Structure

- \`src/components/\` - React components
- \`src/pages/\` - Page components
- \`src/utils/\` - Utility functions
- \`src/styles/\` - CSS/SCSS files
- \`public/\` - Static assets
- \`docs/\` - Documentation

## Available Scripts

- \`npm run dev\` - Start development server
- \`npm run build\` - Build for production
- \`npm run test\` - Run tests
- \`npm start\` - Start production server
README_EOF

# Create .gitignore
cat > .gitignore << 'GITIGNORE_EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Production builds
dist/
build/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE files
.vscode/
.idea/
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db

# Logs
logs
*.log

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# Dependency directories
jspm_packages/

# Optional npm cache directory
.npm

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity
GITIGNORE_EOF

echo "✅ Frontend project '$PROJECT_NAME' created successfully!"
echo "📁 Project structure:"
echo "  ├── src/"
echo "  │   ├── components/"
echo "  │   ├── pages/"
echo "  │   ├── utils/"
echo "  │   └── styles/"
echo "  ├── public/"
echo "  ├── docs/"
echo "  ├── package.json"
echo "  ├── README.md"
echo "  └── .gitignore"
echo ""
echo "🚀 Next steps:"
echo "  cd $PROJECT_NAME"
echo "  npm install"
echo "  npm run dev"
EOF

chmod +x "$HOME/.config/kitty/templates/frontend-project.sh"

# Backend project template
cat > "$HOME/.config/kitty/templates/backend-project.sh" << 'EOF'
#!/bin/bash

PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi

echo "🚀 Creating backend project: $PROJECT_NAME"

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize git
git init

# Create package.json
cat > package.json << 'PACKAGE_EOF'
{
  "name": "'$PROJECT_NAME'",
  "version": "1.0.0",
  "description": "Backend project",
  "main": "index.js",
  "scripts": {
    "dev": "nodemon index.js",
    "start": "node index.js",
    "test": "echo 'Add your test script here'"
  },
  "keywords": [],
  "author": "",
  "license": "MIT",
  "dependencies": {
    "express": "^4.18.2",
    "cors": "^2.8.5",
    "dotenv": "^16.3.1"
  },
  "devDependencies": {
    "nodemon": "^3.0.1"
  }
}
PACKAGE_EOF

# Create basic structure
mkdir -p src/{routes,controllers,models,middleware,utils,config}
mkdir -p tests
mkdir -p docs

# Create main server file
cat > index.js << 'INDEX_EOF'
const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to '$PROJECT_NAME' API!' });
});

app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong!' });
});

// 404 handler
app.use('*', (req, res) => {
  res.status(404).json({ error: 'Route not found' });
});

app.listen(PORT, () => {
  console.log(\`🚀 Server running on port \${PORT}\`);
  console.log(\`📱 Health check: http://localhost:\${PORT}/health\`);
});
INDEX_EOF

# Create .env file
cat > .env << 'ENV_EOF'
PORT=3000
NODE_ENV=development
DATABASE_URL=postgresql://localhost:5432/dev_db
JWT_SECRET=your-secret-key-here
ENV_EOF

# Create .env.example
cat > .env.example << 'ENV_EXAMPLE_EOF'
PORT=3000
NODE_ENV=development
DATABASE_URL=postgresql://localhost:5432/dev_db
JWT_SECRET=your-secret-key-here
ENV_EXAMPLE_EOF

# Create README
cat > README.md << 'README_EOF'
# '$PROJECT_NAME'

Backend project created with MyKittyDots.

## Getting Started

1. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

2. Set up environment variables:
   \`\`\`bash
   cp .env.example .env
   # Edit .env with your configuration
   \`\`\`

3. Start development server:
   \`\`\`bash
   npm run dev
   \`\`\`

## Project Structure

- \`src/routes/\` - API routes
- \`src/controllers/\` - Route controllers
- \`src/models/\` - Data models
- \`src/middleware/\` - Custom middleware
- \`src/utils/\` - Utility functions
- \`src/config/\` - Configuration files
- \`tests/\` - Test files
- \`docs/\` - Documentation

## Available Scripts

- \`npm run dev\` - Start development server with nodemon
- \`npm start\` - Start production server
- \`npm test\` - Run tests

## API Endpoints

- \`GET /\` - Welcome message
- \`GET /health\` - Health check

## Environment Variables

- \`PORT\` - Server port (default: 3000)
- \`NODE_ENV\` - Environment (development/production)
- \`DATABASE_URL\` - Database connection string
- \`JWT_SECRET\` - JWT secret key
README_EOF

# Create .gitignore
cat > .gitignore << 'GITIGNORE_EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Logs
logs
*.log

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/

# IDE files
.vscode/
.idea/
*.swp
*.swo

# OS files
.DS_Store
Thumbs.db

# Optional npm cache directory
.npm

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity
GITIGNORE_EOF

echo "✅ Backend project '$PROJECT_NAME' created successfully!"
echo "📁 Project structure:"
echo "  ├── src/"
echo "  │   ├── routes/"
echo "  │   ├── controllers/"
echo "  │   ├── models/"
echo "  │   ├── middleware/"
echo "  │   ├── utils/"
echo "  │   └── config/"
echo "  ├── tests/"
echo "  ├── docs/"
echo "  ├── index.js"
echo "  ├── package.json"
echo "  ├── .env"
echo "  ├── .env.example"
echo "  ├── README.md"
echo "  └── .gitignore"
echo ""
echo "🚀 Next steps:"
echo "  cd $PROJECT_NAME"
echo "  npm install"
echo "  npm run dev"
EOF

chmod +x "$HOME/.config/kitty/templates/backend-project.sh"

# Create desktop entry for Linux
if [[ "$OS" == "linux" ]]; then
    print_status "Creating desktop entry..."
    cat > "$KITTY_CONFIG_DIR/kitty.desktop" << EOF
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

    # Copy to applications directory if possible
    if [[ -d "$HOME/.local/share/applications" ]]; then
        cp "$KITTY_CONFIG_DIR/kitty.desktop" "$HOME/.local/share/applications/"
        print_status "Desktop entry created in ~/.local/share/applications/"
    fi
fi

# Final success message
echo ""
print_status "🎉 Installation completed successfully!"
echo ""
echo -e "${CYAN}================================${NC}"
echo -e "${CYAN}   🎨 GRUBVOX THEME INSTALLED 🎨   ${NC}"
echo -e "${CYAN}================================${NC}"
echo ""
echo "📁 Configuration files installed in: $KITTY_CONFIG_DIR"
echo "🎨 Theme: Grubvox with nerdfont support"
echo "🖥️  Font: JetBrains Mono Nerd Font"
echo ""
echo "🚀 To start using your new terminal:"
echo "   kitty"
echo ""
echo "🎨 To switch themes:"
echo "   ~/.config/kitty/theme-switcher.sh {theme_name}"
echo "   ~/.config/kitty/theme-switcher.sh list"
echo ""
echo "📋 Available themes:"
echo "   • gruvbox (default) - Grubvox Dark"
echo "   • gruvbox-light - Grubvox Light"
echo "   • rose-pine - Rose Pine"
echo "   • tokyo-night - Tokyo Night"
echo "   • catppuccin - Catppuccin Mocha"
echo "   • dracula - Dracula"
echo "   • nord - Nord"
echo ""
echo "🛠️  Development tools installed:"
echo "   • Node.js, npm, yarn"
echo "   • Python, pip"
echo "   • Git"
echo "   • Docker, Docker Compose"
echo "   • PostgreSQL, MySQL, MongoDB"
echo "   • Vue CLI, React CLI, Angular CLI"
echo "   • Django, Flask, FastAPI"
echo "   • Development utilities (fzf, ripgrep, ranger, etc.)"
echo ""
echo "📝 Useful aliases loaded:"
echo "   • Git: gs, ga, gc, gp, gl, gb, gco, gcb"
echo "   • Node: dev, build, test, start, install"
echo "   • Docker: dc, dps, dex, dlogs, dstop, drm"
echo "   • Database: psql-dev, mysql-dev, mongo-dev"
echo ""
echo "🎯 Project templates available:"
echo "   • ~/.config/kitty/templates/frontend-project.sh <name>"
echo "   • ~/.config/kitty/templates/backend-project.sh <name>"
echo ""
echo "🌟 Enjoy your beautiful development environment!" 