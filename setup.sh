#!/bin/bash
# =============================================================================
# setup.sh — Mac 新機一鍵安裝腳本
# 使用方式: bash setup.sh
# 冪等設計，可安全重複執行
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 顏色輸出
info()  { printf "\033[1;34m[INFO]\033[0m  %s\n" "$1"; }
ok()    { printf "\033[1;32m[OK]\033[0m    %s\n" "$1"; }
warn()  { printf "\033[1;33m[WARN]\033[0m  %s\n" "$1"; }

# =============================================================================
# Step 1: Xcode Command Line Tools
# =============================================================================
if xcode-select -p &>/dev/null; then
    ok "Xcode Command Line Tools 已安裝"
else
    info "安裝 Xcode Command Line Tools..."
    xcode-select --install
    # 等待安裝完成
    until xcode-select -p &>/dev/null; do
        sleep 5
    done
    ok "Xcode Command Line Tools 安裝完成"
fi

# =============================================================================
# Step 2: Homebrew
# =============================================================================
if command -v brew &>/dev/null; then
    ok "Homebrew 已安裝"
    info "更新 Homebrew..."
    brew update
else
    info "安裝 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Apple Silicon 需要額外設定 PATH
    if [[ "$(uname -m)" == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    ok "Homebrew 安裝完成"
fi

# =============================================================================
# Step 3: 透過 Brewfile 安裝所有套件
# =============================================================================
info "透過 Brewfile 安裝套件（這會花一些時間）..."
brew bundle install --file="${SCRIPT_DIR}/Brewfile"
ok "Brew bundle 安裝完成"

# =============================================================================
# Step 4: Oh My Zsh
# =============================================================================
if [[ -d "${HOME}/.oh-my-zsh" ]]; then
    ok "Oh My Zsh 已安裝"
else
    info "安裝 Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ok "Oh My Zsh 安裝完成"
fi

# =============================================================================
# Step 5: Oh My Zsh 外掛 & 主題
# =============================================================================
ZSH_CUSTOM="${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}"

# Powerlevel10k
if [[ -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]]; then
    ok "Powerlevel10k 已安裝"
else
    info "安裝 Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "${ZSH_CUSTOM}/themes/powerlevel10k"
    ok "Powerlevel10k 安裝完成"
fi

# zsh-autosuggestions
if [[ -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]]; then
    ok "zsh-autosuggestions 已安裝"
else
    info "安裝 zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
    ok "zsh-autosuggestions 安裝完成"
fi

# zsh-syntax-highlighting
if [[ -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]]; then
    ok "zsh-syntax-highlighting 已安裝"
else
    info "安裝 zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting \
        "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
    ok "zsh-syntax-highlighting 安裝完成"
fi

# =============================================================================
# Step 6: 版本管理工具初始化（fnm & pyenv）
# =============================================================================
ZSHRC="${HOME}/.zshrc"

# fnm 初始化
if ! grep -q "fnm env" "${ZSHRC}"; then
    info "在 .zshrc 中添加 fnm 初始化..."
    echo "" >> "${ZSHRC}"
    echo "# fnm (Node.js 版本管理器)" >> "${ZSHRC}"
    echo "eval \"\$(fnm env --use-on-cd)\"" >> "${ZSHRC}"
    ok "fnm 初始化完成"
else
    ok "fnm 已在 .zshrc 中初始化"
fi

# pyenv 初始化
if ! grep -q "pyenv init" "${ZSHRC}"; then
    info "在 .zshrc 中添加 pyenv 初始化..."
    echo "# pyenv (Python 版本管理器)" >> "${ZSHRC}"
    echo "eval \"\$(pyenv init -)\"" >> "${ZSHRC}"
    echo "eval \"\$(pyenv init --path)\"" >> "${ZSHRC}"
    ok "pyenv 初始化完成"
else
    ok "pyenv 已在 .zshrc 中初始化"
fi

# =============================================================================
# Step 7: Rust 工具鏈初始化
# =============================================================================
if command -v rustc &>/dev/null; then
    ok "Rust 工具鏈已安裝"
else
    info "初始化 Rust 工具鏈..."
    rustup-init -y --no-modify-path
    ok "Rust 工具鏈安裝完成"
fi

# =============================================================================
# Step 8: 字體提醒
# =============================================================================
echo ""
info "========================================="
info " 字體已透過 Homebrew 安裝"
info " 請在終端機偏好設定中將字體改為："
info "   MesloLGS NF（Powerlevel10k 推薦）"
info "========================================="
echo ""

# =============================================================================
# Step 9: macOS 系統偏好設定
# =============================================================================
read -rp "是否套用 macOS 系統偏好設定？(y/N) " apply_defaults
if [[ "${apply_defaults}" =~ ^[Yy]$ ]]; then
    info "套用 macOS 系統偏好..."
    bash "${SCRIPT_DIR}/macos-defaults.sh"
    ok "macOS 系統偏好設定完成"
else
    warn "已略過 macOS 系統偏好（之後可執行: bash macos-defaults.sh）"
fi

# =============================================================================
# 完成
# =============================================================================
echo ""
info "========================================="
info " 安裝完成！"
info "========================================="
echo ""
info "後續步驟："
info "  1. 重新啟動終端機（或執行: exec zsh）"
info "  2. 設定 Powerlevel10k: p10k configure"
info "  3. 在終端機設定中將字體改為 MesloLGS NF"
info "  4. 開啟 iTerm2 / Ghostty 並設為預設終端機"
info "  5. 開啟 Karabiner-Elements 設定鍵盤對應"
info "  6. 檢查並自訂 ~/.zshrc（可參考 configs/.zshrc.example）"
echo ""
