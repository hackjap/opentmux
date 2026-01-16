#!/bin/bash
set -e

REPO_URL="https://raw.githubusercontent.com/hackjap/opentmux/main"
TMUX_DIR="$HOME/.tmux"
TMUX_CONF="$HOME/.tmux.conf"
TMUX_CONF_LOCAL="$HOME/.tmux.conf.local"

echo "🚀 Installing Oh My Tmux with custom settings..."

# Check if running from local clone
if [[ -f ".tmux.conf" && -f ".tmux.conf.local" ]]; then
    echo "📁 Local installation detected"
    INSTALL_MODE="local"
else
    echo "🌐 Remote installation mode"
    INSTALL_MODE="remote"
fi

# Backup existing configs
backup_existing() {
    local file=$1
    if [[ -f "$file" && ! -L "$file" ]]; then
        echo "📦 Backing up $file to ${file}.backup"
        mv "$file" "${file}.backup"
    elif [[ -L "$file" ]]; then
        echo "🔗 Removing existing symlink $file"
        rm "$file"
    fi
}

# Install Oh My Tmux
install_oh_my_tmux() {
    if [[ -d "$TMUX_DIR" ]]; then
        echo "✅ Oh My Tmux already installed at $TMUX_DIR"
    else
        echo "📥 Cloning Oh My Tmux..."
        git clone https://github.com/gpakosz/.tmux.git "$TMUX_DIR"
    fi
}

# Install TPM (Tmux Plugin Manager)
install_tpm() {
    local TPM_DIR="$TMUX_DIR/plugins/tpm"
    if [[ -d "$TPM_DIR" ]]; then
        echo "✅ TPM already installed"
    else
        echo "📥 Installing TPM..."
        git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    fi
}

# Setup config files
setup_configs() {
    backup_existing "$TMUX_CONF"
    backup_existing "$TMUX_CONF_LOCAL"

    if [[ "$INSTALL_MODE" == "local" ]]; then
        # Local mode: create symlinks
        local SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        echo "🔗 Creating symlinks..."
        ln -sf "$SCRIPT_DIR/.tmux.conf" "$TMUX_CONF"
        ln -sf "$SCRIPT_DIR/.tmux.conf.local" "$TMUX_CONF_LOCAL"
    else
        # Remote mode: download files
        echo "📥 Downloading .tmux.conf..."
        curl -fsSL "$REPO_URL/.tmux.conf" -o "$TMUX_CONF"
        echo "📥 Downloading .tmux.conf.local..."
        curl -fsSL "$REPO_URL/.tmux.conf.local" -o "$TMUX_CONF_LOCAL"
    fi
}

# Main installation
main() {
    echo ""
    echo "=================================="
    echo "  Oh My Tmux + Custom Settings"
    echo "=================================="
    echo ""

    install_oh_my_tmux
    install_tpm
    setup_configs

    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Start tmux: tmux new -s main"
    echo "   2. Install plugins: press <prefix> + I"
    echo "   3. Reload config: press <prefix> + r"
    echo ""
    echo "💡 Tips:"
    echo "   - Prefix key: Ctrl+b (or Ctrl+a)"
    echo "   - Pane navigation: <prefix> + h/j/k/l"
    echo "   - New window: <prefix> + c"
    echo "   - Split horizontal: <prefix> + -"
    echo "   - Split vertical: <prefix> + |"
    echo ""
}

main "$@"
