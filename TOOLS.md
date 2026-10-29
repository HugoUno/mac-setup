# Hugo 的 Mac 工具清單

> 每個工具都附上一句話說明和官網連結，方便你了解用途並按需求挑選。

---

## CLI 工具

| 工具               | 說明                                               | 連結                                        |
| ---------------- | ------------------------------------------------ | ----------------------------------------- |
| **git**          | 版本控制系統                                           | https://git-scm.com/                      |
| **wget**         | 從網路下載檔案                                          | https://www.gnu.org/software/wget/        |
| **curl**         | HTTP 請求工具，測 API、下載檔案都靠它                          | https://curl.se/                          |
| **jq**           | 終端機裡的 JSON 處理器，解析、過濾、格式化 JSON                    | https://jqlang.github.io/jq/              |
| **fd**           | `find` 的現代替代品，語法更簡單、速度更快                         | https://github.com/sharkdp/fd             |
| **ripgrep** (rg) | `grep` 的現代替代品，搜尋速度極快，自動忽略 .gitignore             | https://github.com/BurntSushi/ripgrep     |
| **bat**          | `cat` 的替代品，自帶語法高亮、行號、Git diff 標記                 | https://github.com/sharkdp/bat            |
| **eza**          | `ls` 的替代品，有顏色、圖示、Git 狀態、樹狀顯示                     | https://github.com/eza-community/eza      |
| **fzf**          | 模糊搜尋工具，快速找檔案、搜歷史指令、選分支                           | https://github.com/junegunn/fzf           |
| **zoxide**       | `cd` 的替代品，會記住你常去的目錄，輸入部分名稱就能跳過去                  | https://github.com/ajeetdsouza/zoxide     |
| **htop**         | 互動式系統資源監視器，看 CPU、記憶體、程序                          | https://htop.dev/                         |
| **tree**         | 用樹狀圖顯示目錄結構                                       | https://mama.indstate.edu/users/ice/tree/ |
| **tldr**         | `man` 的簡化版，用實際範例教你怎麼用指令                          | https://tldr.sh/                          |
| **gh**           | GitHub 官方 CLI，在終端機裡開 PR、看 Issue、Review Code      | https://cli.github.com/                   |
| **mas**          | Mac App Store 的 CLI 工具，讓腳本能自動安裝 App Store 上的 App | https://github.com/mas-cli/mas            |

---

## 開發語言 & 版本管理

| 工具          | 說明                                                | 連結                             |
| ----------- | ------------------------------------------------- | ------------------------------ |
| **Node.js** | JavaScript 執行環境，用於後端開發、CLI 工具、自動化等（透過 fnm 管理版本）   | https://nodejs.org/            |
| **fnm**     | Node.js 版本管理器，比 nvm 快很多，用 Rust 寫的                 | https://github.com/Schniz/fnm  |
| **Python**  | 通用程式語言，擅長資料科學、自動化、Web 開發（透過 pyenv 管理版本）           | https://www.python.org/        |
| **pyenv**   | Python 版本管理器，輕鬆切換不同 Python 版本                     | https://github.com/pyenv/pyenv |
| **Go**      | Google 開發的程式語言，擅長網路服務和 CLI 工具                     | https://go.dev/                |
| **rustup**  | Rust 工具鏈管理器，安裝 Rust 編譯器和 cargo 套件管理               | https://rustup.rs/             |
| **Temurin** | Eclipse 基金會的 OpenJDK 發行版，免費的 Java 執行環境            | https://adoptium.net/          |
| **Deno**    | JavaScript/TypeScript 執行環境，內建 TypeScript 支援，安全性更好 | https://deno.com/              |

---

## 字體

| 字體                           | 說明                                | 連結                                             |
| ---------------------------- | --------------------------------- | ---------------------------------------------- |
| **MesloLGS Nerd Font**       | Powerlevel10k 官方推薦字體，包含完整的圖示集     | https://github.com/romkatv/powerlevel10k#fonts |
| **Fira Code Nerd Font**      | 支援連字（ligature）的程式字體，`!=` 會顯示成 `≠` | https://github.com/tonsky/FiraCode             |
| **JetBrains Mono Nerd Font** | JetBrains 出的等寬字體，為長時間閱讀程式碼設計      | https://www.jetbrains.com/lp/mono/             |
| **LXGW WenKai Mono TC** | 支持繁體中文的等寬字體，終端機顯示中文內容用      | https://github.com/lxgw/LxgwWenKai             |

> **為什麼要裝 Nerd Font？**
> Powerlevel10k 的 prompt 會用到大量圖示（Git 分支符號、資料夾圖示等），一般字體沒有這些字元。Nerd Font 把這些圖示打包進字體裡，裝了才能正常顯示。

---

## 核心 GUI App — 開發工具

| App                    | 說明                                                   | 連結                                              |
| ---------------------- | ---------------------------------------------------- | ----------------------------------------------- |
| **Ghostty**            | 新一代高效能終端機，用 Zig 寫的，啟動快、渲染流暢、設定簡單                     | https://ghostty.org/                            |
| **OrbStack**           | 輕量的 Docker 容器與 Linux 虛擬機管理工具 | https://orbstack.dev/                           |
| **Visual Studio Code** | 微軟的程式碼編輯器，外掛生態系最豐富                                   | https://code.visualstudio.com/                  |
| **Sublime Text**       | 輕量快速的程式碼編輯器，啟動快、回應迅速，適合快速編輯                          | https://www.sublimetext.com/                    |
|                        |                                                      |                                                 |

---

## 日常 App

> **按需求選裝，不必全部安裝。** 安裝前請編輯 `Brewfile`，在不需要的項目前加上 `#`；Mac App Store 區段中的 LINE 和 Amphetamine 也可取消。

| App | 說明 | 連結 |
|-----|------|------|
| **Claude** | Anthropic 的 AI 助手桌面版 | https://claude.ai/ |
| **Obsidian** | Markdown 筆記工具，本地優先，支援雙向連結和知識圖譜 | https://obsidian.md/ |
| **Google Chrome** | Google 瀏覽器 | https://www.google.com/chrome/ |
| **Arc** | 新世代瀏覽器，側邊欄分頁管理、內建分割畫面 | https://arc.net/ |
| **Slack** | 團隊通訊工具 | https://slack.com/ |
| **Discord** | 社群通訊工具，開發者社群和開源專案常用 | https://discord.com/ |
| **Telegram** | 即時通訊，速度快、支援大檔案傳送 | https://telegram.org/ |
| **LINE** | LINE 通訊軟體（透過 Mac App Store 安裝） | https://line.me/ |

---

## 系統增強工具

> **按需求選裝，不必全部安裝。** 安裝前請編輯 `Brewfile`，在不需要的項目前加上 `#`；Mac App Store 區段中的 LINE 和 Amphetamine 也可取消。

| App                    | 說明                                                       | 價格       | 連結                                                 |
| ---------------------- | -------------------------------------------------------- | -------- | -------------------------------------------------- |
| **鼠鬚管 Squirrel（Rime）** | 支援倉頡、注音、拼音等方案的中文輸入法；[我的設定與還原說明](configs/rime/README.md) | 免費開源 | https://rime.im/ |
| **Karabiner-Elements** | 鍵盤重新對應工具。可以把 CapsLock 改成 Ctrl、自訂複雜快捷鍵，Windows 鍵盤接 Mac 必備 | 免費       | https://karabiner-elements.pqrs.org/               |
| **BetterDisplay**      | 外接螢幕管理，調整解析度、亮度、HDR。尤其對非 Apple 螢幕很有用                     | 免費/Pro   | https://github.com/waydabber/BetterDisplay         |
| **AppCleaner**         | 完整移除 App，會找出並清掉殘留的 plist、快取、支援檔案                         | 免費       | https://freemacsoft.net/appcleaner/                |
| **IINA**               | macOS 原生風格的影片播放器，支援手勢、觸控列、子母畫面                           | 免費       | https://iina.io/                                   |
| **Stats**              | 在選單列即時顯示 CPU / 記憶體 / 網路 / 磁碟 / 電池監控                      | 免費開源     | https://github.com/exelban/stats                   |
| **Ice**                | 選單列圖示管理器，把太多的選單列圖示收起來（Bartender 的免費替代品）                  | 免費       | https://github.com/jordanbaird/Ice                 |
| **AlDente**            | 電池健康管理，可以設定充電上限（例如限制在 80%）來延長電池壽命                        | 免費/Pro   | https://apphousekitchen.com/                       |
| **CleanShot X**        | 進階截圖工具，支援標註、捲動截圖、錄影、GIF、OCR                              | 付費（一次買斷） | https://cleanshot.com/                             |
| **Amphetamine**        | 防止螢幕休眠 / 系統睡眠，可設定排程和觸發條件（透過 Mac App Store 安裝）            | 免費       | https://apps.apple.com/app/amphetamine/id937984704 |

---

## Shell 環境

| 工具 | 說明 | 連結 |
|------|------|------|
| **Oh My Zsh** | Zsh 的設定框架，統一管理外掛和主題 | https://ohmyz.sh/ |
| **Powerlevel10k** | 美觀又極快的 Zsh prompt 主題，支援 Git 狀態、語言版本顯示 | https://github.com/romkatv/powerlevel10k |
| **zsh-autosuggestions** | 根據歷史紀錄自動建議指令，按右箭頭即可補全 | https://github.com/zsh-users/zsh-autosuggestions |
| **zsh-syntax-highlighting** | 輸入指令時即時語法高亮，打錯字會變紅色 | https://github.com/zsh-users/zsh-syntax-highlighting |

---

## 可選工具

以下工具在 Brewfile 中已註解，取消註解即可安裝。

| 工具 | 說明 | 連結 |
|------|------|------|
| **Alacritty** | GPU 加速的終端機，用 YAML 設定，效能極好。macOS 上需要自行簽署 | https://alacritty.org/ |
| **1Password** | 密碼管理器，跨平台同步，支援 CLI 和瀏覽器擴充 | https://1password.com/ |
| **Bitwarden** | 開源免費的密碼管理器 | https://bitwarden.com/ |
| **BetterTouchTool** | 觸控板手勢自訂 + 自動化工具，可以設定各種觸控手勢 | https://folivora.ai/ |
| **VLC** | 萬用影片播放器，幾乎支援所有格式 | https://www.videolan.org/ |
