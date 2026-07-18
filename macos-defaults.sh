#!/bin/bash
# =============================================================================
# macos-defaults.sh — 開發者常用 macOS 系統偏好設定
# 使用方式: bash macos-defaults.sh
# 大部分設定需要登出或重新啟動才會生效
# =============================================================================

set -euo pipefail

info() { printf "\033[1;34m[設定]\033[0m %s\n" "$1"; }

# 先關閉系統設定，避免覆蓋我們的設定
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true

# =============================================================================
# 一般 UI/UX
# =============================================================================
info "展開儲存面板（預設）"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

info "展開列印面板（預設）"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

info "預設儲存到磁碟（而非 iCloud）"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

info "關閉自動修正"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

info "關閉自動大寫"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

info "關閉智慧破折號"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

info "關閉智慧引號"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

info "關閉雙空格自動句號"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

info "使用 24 小時制"
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

info "僅在捲動時顯示捲軸（避免通用控制切換輸入裝置時跳動）"
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# =============================================================================
# 鍵盤
# =============================================================================
info "設定快速按鍵重複速率"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

info "啟用完整鍵盤控制（Tab 切換所有對話框按鈕）"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

info "關閉按住按鍵選字（啟用按鍵重複）"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# =============================================================================
# Finder
# =============================================================================
info "顯示隱藏檔案"
defaults write com.apple.finder AppleShowAllFiles -bool true

info "顯示所有副檔名"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

info "顯示路徑列"
defaults write com.apple.finder ShowPathbar -bool true

info "顯示狀態列"
defaults write com.apple.finder ShowStatusBar -bool true

info "排序時資料夾置頂"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

info "預設使用列表檢視"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

info "關閉更改副檔名警告"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

info "標題列顯示完整路徑"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

info "搜尋預設為目前資料夾"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# =============================================================================
# Dock
# =============================================================================
info "設定 Dock 圖示大小為 48 像素"
defaults write com.apple.dock tilesize -int 48

info "啟用 Dock 自動隱藏"
defaults write com.apple.dock autohide -bool true

info "移除自動隱藏延遲"
defaults write com.apple.dock autohide-delay -float 0

info "加速自動隱藏動畫"
defaults write com.apple.dock autohide-time-modifier -float 0.3

info "顯示最近使用的 App"
defaults write com.apple.dock show-recents -bool true

info "使用縮放效果最小化視窗"
defaults write com.apple.dock mineffect -string "scale"

# =============================================================================
# Mission Control
# =============================================================================
info "加速 Mission Control 動畫"
defaults write com.apple.dock expose-animation-duration -float 0.1

info "不自動重新排列 Space"
defaults write com.apple.dock mru-spaces -bool false

# =============================================================================
# 截圖
# =============================================================================
info "設定截圖儲存位置為 ~/Screenshots"
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

info "設定截圖格式為 PNG"
defaults write com.apple.screencapture type -string "png"

info "關閉截圖陰影"
defaults write com.apple.screencapture disable-shadow -bool true

# =============================================================================
# 其他
# =============================================================================
info "停用網路磁碟上的 .DS_Store"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

info "停用 USB 磁碟上的 .DS_Store"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

info "關閉當機回報對話框"
defaults write com.apple.CrashReporter DialogType -string "none"

info "顯示 ~/Library 資料夾"
chflags nohidden ~/Library

info "顯示 /Volumes 資料夾"
sudo chflags nohidden /Volumes 2>/dev/null || true

# =============================================================================
# 套用變更
# =============================================================================
info "重新啟動相關程式..."
for app in "Finder" "Dock" "SystemUIServer"; do
    killall "${app}" &>/dev/null || true
done

echo ""
info "完成！部分設定需要登出或重新啟動才會生效。"
