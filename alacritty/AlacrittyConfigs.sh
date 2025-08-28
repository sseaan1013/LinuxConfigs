#!/bin/bash

# install alacritty
if command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y alacritty
elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm alacritty
else
    echo "Package manager not supported. Install Alacritty manually."
fi

# make alacrity directory
mkdir -p $HOME/.config/alacritty

# --- Variables ---
REPO_URL="https://github.com/sseaan1013/LinuxConfigs.git"
TARGET_DIR="$HOME/.config/alacritty"
TMP_DIR="/tmp/toml_repo"

# --- Make config directory ---
mkdir -p "$TARGET_DIR"

# --- Clone or update repo ---
if [ -d "$TMP_DIR/.git" ]; then
    echo "Updating repo..."
    git -C "$TMP_DIR" pull --rebase
else
    echo "Cloning repo..."
    git clone "$REPO_URL" "$TMP_DIR"
fi

# --- Copy TOML files (with backup if overwrite) ---
echo "Copying TOML files..."
for file in "$TMP_DIR"/*.toml; do
    if [ -f "$file" ]; then
        base=$(basename "$file")
        if [ -f "$TARGET_DIR/$base" ]; then
            echo "Backing up existing $base to $base.bak"
            mv "$TARGET_DIR/$base" "$TARGET_DIR/$base.bak"
        fi
        cp "$file" "$TARGET_DIR/"
    fi
done

echo "✅ Done! Configs are in $TARGET_DIR"






