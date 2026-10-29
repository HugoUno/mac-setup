# =============================================================================
# Brewfile — Mac 新機套件清單
# 使用方式: brew bundle install --file=./Brewfile
# 日常 App 與系統增強工具按需求選裝，不必全部安裝。
# 安裝前請將不需要的 cask / mas 項目加上 # 註解（含 LINE、Amphetamine）。
# 直接執行 brew bundle 不會逐項詢問，會安裝所有未註解項目。
# =============================================================================

# =============================================================================
# CLI 工具
# =============================================================================
brew "git"                # 版本控制
brew "wget"               # 下載檔案
brew "curl"               # HTTP 請求工具
brew "jq"                 # JSON 處理（終端機裡解析、過濾 JSON）
brew "fd"                 # find 的現代替代品，更快更直覺
brew "ripgrep"            # grep 的現代替代品，搜尋速度極快
brew "bat"                # cat 的替代品，有語法高亮和行號
brew "eza"                # ls 的替代品，有顏色、圖示、Git 狀態
brew "fzf"                # 模糊搜尋工具，快速找檔案、歷史指令
brew "zoxide"             # cd 的替代品，記住常去的目錄
brew "htop"               # 系統資源監視器（CPU、記憶體、程序）
brew "tree"               # 用樹狀圖顯示目錄結構
brew "tldr"               # man 的簡化版，用範例教你怎麼用指令
brew "gh"                 # GitHub 官方 CLI，操作 PR、Issue
brew "mas"                # Mac App Store CLI，讓腳本自動安裝 App Store App

# =============================================================================
# 開發語言 & 版本管理
# =============================================================================
brew "fnm"                # Node.js 版本管理器（比 nvm 快）
brew "pyenv"              # Python 版本管理器
brew "go"                 # Go 語言
brew "rustup"             # Rust 工具鏈管理器
brew "deno"               # Deno JavaScript/TypeScript 執行環境

# =============================================================================
# 字體（Powerlevel10k 必須搭配 Nerd Font）
# =============================================================================
cask "font-meslo-lg-nerd-font"       # Powerlevel10k 官方推薦字體
cask "font-fira-code-nerd-font"      # 支援連字的程式字體
cask "font-jetbrains-mono-nerd-font" # JetBrains 出的等寬字體

# =============================================================================
# 核心 GUI App — 開發工具
# =============================================================================
cask "ghostty"            # 新一代高效能終端機，啟動快、渲染流暢
cask "orbstack"           # 輕量的 Docker 容器與 Linux 虛擬機管理工具
cask "visual-studio-code" # VS Code 程式碼編輯器
cask "sublime-text"       # Sublime Text 程式碼編輯器
cask "temurin"            # Eclipse Temurin (OpenJDK) Java 執行環境

# =============================================================================
# 日常 App（按需求選裝，不必全部安裝）
# =============================================================================
cask "claude"             # Claude AI 桌面版
cask "obsidian"           # Markdown 筆記工具
cask "google-chrome"      # Google Chrome 瀏覽器
cask "arc"                # Arc 瀏覽器
cask "slack"              # Slack 團隊通訊
cask "discord"            # Discord 社群通訊
cask "telegram"           # Telegram 即時通訊

# =============================================================================
# 系統增強工具（按需求選裝，不必全部安裝）
# =============================================================================
cask "squirrel-app"         # 鼠鬚管（Rime）中文輸入法
cask "karabiner-elements"  # 鍵盤重新對應（CapsLock 改 Ctrl、自訂快捷鍵）
cask "betterdisplay"       # 外接螢幕管理，調整解析度、亮度
cask "appcleaner"          # 完整移除 App（清掉殘留設定檔、快取）
cask "iina"                # macOS 原生風格影片播放器
cask "stats"               # 選單列即時監控 CPU/記憶體/網路/電池（免費開源）
cask "jordanbaird-ice"     # 選單列圖示管理器（免費版 Bartender）
cask "aldente"             # 電池健康管理，設定充電上限延長電池壽命
cask "cleanshot"           # 進階截圖工具（標註、捲動截圖、錄影，付費一次買斷）

# =============================================================================
# Mac App Store（需要已登入 App Store + 安裝 mas CLI）
# =============================================================================
mas "Amphetamine", id: 937984704     # 防止螢幕休眠 / 系統睡眠
mas "LINE", id: 539883307            # LINE 通訊軟體

# =============================================================================
# 可選（取消註解即可安裝）
# =============================================================================
# cask "alacritty"          # GPU 加速終端機（需要自行簽署）
# cask "1password"          # 1Password 密碼管理器
# cask "bitwarden"          # Bitwarden 密碼管理器（免費開源）
# cask "bettertouchtool"    # 觸控板手勢自訂 & 自動化
# cask "vlc"                # VLC 萬用影片播放器
