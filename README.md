# Mac 新機設定指南

> 適用於 macOS Sequoia (15.x) 以上，Apple Silicon (M 系列晶片)。
> 參考來源：[doggy8088/awesome-mbp-for-developers](https://github.com/doggy8088/awesome-mbp-for-developers)

## 快速開始

```bash
# 1. 下載此資料夾（或 git clone）
# 2. 編輯 Brewfile，將不需要的 App 項目前加上 # 註解
# 3. 執行一鍵安裝
bash setup.sh
```

`setup.sh` 會先提醒你檢查安裝清單，確認後才安裝 Homebrew、`Brewfile` 中未註解的套件、Oh My Zsh 和外掛。可安全重複執行。

> **按需求選裝，不必全部安裝。** 安裝前請編輯 `Brewfile`，在不需要的項目前加上 `#`；Mac App Store 區段中的 LINE 和 Amphetamine 也可取消。

確認提示預設為「否」，直接按 Enter 會結束，方便先修改清單再重新執行。若直接使用 `brew bundle install`，不會出現此提示，請先自行檢查 `Brewfile`。

> 📖 **不認識某個工具？** 查看 [TOOLS.md](./TOOLS.md)，裡面有每個工具的詳細說明和官網連結。

---

## 第一階段：必備工具

### 1. Xcode Command Line Tools

macOS 開發的基礎，`setup.sh` 會自動處理。

```bash
xcode-select --install
```

### 2. Homebrew

macOS 套件管理器，安裝 CLI 工具和 GUI App 都靠它。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. 終端機

| App | 說明 |
|-----|------|
| **Ghostty** | 新一代高效能終端機，啟動快、渲染流暢 |

安裝後建議設定字體為 **MesloLGS NF**（Nerd Font），Powerlevel10k 才能正確顯示圖示。


#### Ghostty 常用設定

`setup.sh` 會透過 `configure-ghostty.sh` 套用 `configs/ghostty.conf`。
只想設定 Ghostty（已安裝 Ghostty 和 Brewfile 中的 Meslo Nerd Font）時：

```bash
bash configure-ghostty.sh
```

此組合以日常開發為主，可依喜好調整：

- Catppuccin Latte / Mocha 隨 macOS 明暗模式切換。
- MesloLGS Nerd Font Mono、14 pt，支援 Powerlevel10k 圖示。
- 水平 12 / 垂直 10 的留白、80% 不透明度與背景模糊。
- 儲存視窗狀態、50 MB 捲動緩衝（不是行數）。
- 左 Option 作為 Alt，方便 shell 按字移動；右 Option 保留 macOS 輸入功能。

| 快捷鍵 | 功能 |
| --- | --- |
| Cmd+D / Cmd+Shift+D | 向右 / 向下分割 |
| Cmd+Option+方向鍵 | 切換分割區 |
| Cmd+Shift+Enter | 放大 / 還原目前分割區 |
| Ctrl+` | 顯示 / 隱藏頂部 40% 高度快速終端機（Ghostty 在前景時） |
| Cmd+Shift+, | 重新載入設定 |
| Cmd+, | 編輯設定 |

設定寫入 `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty`。
套用前會驗證語法；若內容不同，原檔會備份到同目錄的 `backup.XXXXXXXX/config.ghostty`。
重複執行且內容相同時不會新增備份。若偵測到 XDG 路徑或舊版 `config` 檔，
腳本會停止並提示先整合，以免兩份設定互相覆蓋。此腳本會以 repo 的版本取代目前設定，
因此自訂內容請先合併回 `configs/ghostty.conf`。

套用後在 Ghostty 按 **Cmd+Shift+,**；視窗狀態等選項可能需開新視窗或重新啟動。
快速終端機目前使用 App 內快捷鍵。若想在其他 App 中也能呼叫，可將設定改為
`keybind = global:ctrl+grave_accent=toggle_quick_terminal`，並依 macOS 提示授予 Ghostty 輔助使用權限。
想取消透明效果可設定 `background-opacity = 1` 與 `background-blur = false`。

還原時，把所需備份複製回 `config.ghostty`，再重新載入即可。
設定語意參考 [Ghostty 官方設定文件](https://ghostty.org/docs/config/reference)。

### 4. Shell 環境

- **Oh My Zsh** — Zsh 設定框架
- **Powerlevel10k** — 美觀又快速的 prompt 主題
- **zsh-autosuggestions** — 根據歷史紀錄自動建議指令
- **zsh-syntax-highlighting** — 指令語法高亮

設定完成後執行 `p10k configure` 進行主題初始設定。

### 5. Obsidian（選裝）

Markdown 筆記工具，本地優先，支援雙向連結。

### 6. Claude（選裝）

Claude AI 桌面版。

---

## 第二階段：開發環境

### 容器與虛擬化

| App | 說明 |
|-----|------|
| **OrbStack** | 輕量的 Docker 容器與 Linux 虛擬機管理工具 |

### Git 設定

```bash
# 複製範例設定並修改
cp configs/.gitconfig.example ~/.gitconfig
# 修改 name 和 email
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### 程式語言環境

| 語言 | 工具 | 安裝方式 |
|------|------|----------|
| **Node.js** | fnm（版本管理器）| `fnm install --lts` |
| **Python** | pyenv（版本管理器）| `pyenv install 3.12` |
| **Go** | Homebrew 直裝 | 已透過 Brewfile 安裝 |
| **Rust** | rustup | `rustup-init`（setup.sh 會處理）|
| **Java** | Temurin (OpenJDK) | 已透過 Brewfile 安裝 |
| **Deno** | Homebrew 直裝 | 已透過 Brewfile 安裝 |

### 現代 CLI 工具

這些工具取代了傳統指令，更快、更好用：

| 傳統指令 | 現代替代 | 說明 |
|---------|---------|------|
| `find` | **fd** | 更快更直覺的檔案搜尋 |
| `grep` | **ripgrep** (rg) | 極快的文字搜尋 |
| `cat` | **bat** | 語法高亮 + 行號 |
| `ls` | **eza** | 顏色、圖示、Git 狀態 |
| `cd` | **zoxide** | 記住常去目錄，輸入部分名稱即可跳過去 |
| `man` | **tldr** | 用範例教你怎麼用指令 |

其他好用工具：

| 工具 | 說明 |
|------|------|
| **fzf** | 模糊搜尋，快速找檔案、歷史指令 |
| **jq** | 終端機裡解析、過濾 JSON |
| **htop** | 系統資源監視器 |
| **tree** | 樹狀圖顯示目錄結構 |
| **gh** | GitHub CLI，操作 PR、Issue |

---

## 第三階段：日常 App

> **按需求選裝，不必全部安裝。** 安裝前請編輯 `Brewfile`，在不需要的項目前加上 `#`；Mac App Store 區段中的 LINE 和 Amphetamine 也可取消。

| App | 說明 |
|-----|------|
| **Google Chrome** | 瀏覽器 |
| **Arc** | Arc 瀏覽器 |
| **Slack** | 團隊通訊 |
| **Discord** | 社群通訊 |
| **Telegram** | 即時通訊 |
| **LINE** | 即時通訊（透過 Mac App Store 安裝）|

---

## 第四階段：系統增強

> **按需求選裝，不必全部安裝。** 安裝前請編輯 `Brewfile`，在不需要的項目前加上 `#`；Mac App Store 區段中的 LINE 和 Amphetamine 也可取消。

### 鍵盤與輸入

| App | 說明 |
|-----|------|
| **鼠鬚管 Squirrel（Rime）** | 中文輸入法；[本機設定與還原方式](configs/rime/README.md) |
| **Karabiner-Elements** | 鍵盤重新對應（CapsLock → Ctrl、自訂快捷鍵）|

### 螢幕管理

| App | 說明 |
|-----|------|
| **BetterDisplay** | 外接螢幕管理，調整解析度、亮度 |

### 系統工具

| App | 說明 |
|-----|------|
| **AppCleaner** | 完整移除 App（清掉殘留設定檔、快取）|
| **IINA** | macOS 原生風格影片播放器 |
| **Stats** | 選單列即時監控 CPU / 記憶體 / 網路 / 電池（免費）|
| **Ice** | 選單列圖示管理（免費版 Bartender）|
| **AlDente** | 電池健康管理，設定充電上限延長壽命 |
| **CleanShot X** | 進階截圖（標註、捲動截圖、錄影）付費一次買斷 |
| **Amphetamine** | 防止螢幕休眠（透過 Mac App Store 安裝）|

---

## 第五階段：macOS 系統偏好設定

執行腳本自動套用開發者常用設定：

```bash
bash macos-defaults.sh
```

主要設定包括：
- **Finder**：顯示隱藏檔、顯示副檔名、路徑列、資料夾置頂
- **Dock**：自動隱藏、移除延遲、隱藏最近使用 App
- **鍵盤**：快速按鍵重複、關閉自動修正 / 大寫 / 智慧引號
- **外觀**：捲軸僅在捲動時顯示，避免通用控制切換裝置時造成視窗跳動
- **截圖**：存至 ~/Screenshots、PNG 格式、移除陰影
- **其他**：預設存磁碟（非 iCloud）、停用網路磁碟 .DS_Store

---

## 第六階段：dotfiles 管理

建議用 Git 管理你的設定檔（.zshrc、.gitconfig 等），這樣換電腦時可以快速還原。

本資料夾的 `configs/` 提供了範例：
- `configs/.zshrc.example` — zsh 設定範例
- `configs/.gitconfig.example` — git 設定範例

```bash
# 複製範例到家目錄
cp configs/.zshrc.example ~/.zshrc
cp configs/.gitconfig.example ~/.gitconfig
# 記得修改 .gitconfig 裡的 name 和 email
```

---

## Finder 常用快捷鍵

| 快捷鍵                | 功能              |
| ------------------ | --------------- |
| `Cmd + Shift + .`  | 顯示 / 隱藏隱藏檔案     |
| `Cmd + Shift + G`  | 前往資料夾路徑         |
| `Cmd + Option + V` | 移動檔案（剪下貼上）      |
| `Cmd` + 拖曳         | 強制跨磁碟移動         |
| 四指向上滑              | Mission Control |

---

## 檔案結構

```
mac-setup/
├── README.md              ← 你正在看的這份指南
├── setup.sh               ← 一鍵安裝腳本（可重複執行）
├── Brewfile               ← Homebrew 套件清單
├── configure-ghostty.sh    ← 單獨套用 Ghostty 設定（備份原檔）
├── macos-defaults.sh      ← macOS 系統偏好設定
├── restore-rime.sh        ← 還原鼠鬚管設定（先備份）
└── configs/
    ├── rime/             ← 本機鼠鬚管設定快照與還原說明
    ├── .zshrc.example     ← zsh 設定範例
    ├── .gitconfig.example ← git 設定範例
    └── ghostty.conf       ← Ghostty 常用設定
```

