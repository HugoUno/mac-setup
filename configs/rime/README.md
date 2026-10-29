# Hugo 的鼠鬚管 Squirrel（Rime）設定

這是我自用的鼠鬚管設定備份，用來在重裝或換 Mac 時還原熟悉的輸入環境。

**最近同步：2026-10-29（Asia/Taipei）**，來源為這台 Mac 的 `~/Library/Rime/`。本次直接比對本機的兩個 `.custom.yaml` 與 `user.yaml`；設定內容與既有快照一致，保留先前移除 iTerm2 專用設定的調整，並略過自動產生的建置時間。

最初版本於 2026-10-28 從 Squirrel 0.18／Rime 1.11.2 的有效設定整理成可攜式 patch。本專案以我的偏好為準，並非適合所有人的通用預設。

## 備份檔案

| 檔案 | 用途 |
| --- | --- |
| [default.custom.yaml](default.custom.yaml) | 輸入方案、候選字數、方案選單、中英文切換鍵、標點與按鍵設定 |
| [squirrel.custom.yaml](squirrel.custom.yaml) | 候選窗配色、字型、外觀與各 App 的輸入模式設定 |
| [user.yaml](user.yaml) | 選項狀態與上次選用的方案；不保留建置時間 |

## 我的輸入偏好

- 上次選用方案：**倉頡五代（`cangjie5`）**。
- 方案清單：`luna_pinyin`、`luna_pinyin_simp`、`luna_pinyin_fluency`、`bopomofo`、`bopomofo_tw`、`cangjie5`、`stroke`、`terra_pinyin`。
- 每頁 **5 個候選字**。
- 候選窗：`native` 配色、Lucida Grande **21 點**；註解與標籤為 18 點，圓角 10。
- 保留各 App 的設定，例如 Terminal、Xcode、VS Code 的 `ascii_mode: true`，Chrome 與 Telegram 的 `inline: true`。iTerm2 已不在本專案安裝清單，對應規則也不再收錄。

### 快捷鍵

以下按鍵及觸發條件取自這份設定：

| 按鍵 | 設定行為 |
| --- | --- |
| Ctrl+`、Ctrl+Shift+`、F4 | 開啟方案選單 |
| 左 Shift | `inline_ascii` |
| 右 Shift | `commit_text` |
| Caps Lock | `clear`；另保留 `good_old_caps_lock: true` |
| Ctrl+Shift+1 | 切換到下一個方案 |
| Ctrl+Shift+2 | 切換中英文模式（`ascii_mode`） |
| Ctrl+Shift+3 | 切換全形／半形（`full_shape`） |
| Ctrl+Shift+4 | 切換簡化選項（`simplification`） |
| Ctrl+Shift+5 | 切換擴充字集（`extended_charset`） |
| `-`／`=` | 候選選單顯示時向上／向下翻頁 |

### 選項狀態

`user.yaml` 保存這次快照的原始值：

```yaml
ascii_punct: true
extended_charset: false
full_shape: false
simplification: false
zh_hans: true
zh_hant_tw: false
previously_selected_schema: cangjie5
```

不同輸入方案使用的選項可能不同；以上是保存值，實際輸出請在使用的方案中確認。鼠鬚管使用期間可能自動更新 `user.yaml`，因此它不是固定不變的偏好檔。

## 新 Mac 安裝與還原

1. 在專案的 `Brewfile` 保留 `cask "squirrel-app"` 再執行 `bash setup.sh`，或單獨安裝：

   ```bash
   brew install --cask squirrel-app
   ```

2. 必要時登出再登入。在「系統設定 → 鍵盤 → 輸入方式」加入鼠鬚管，啟用一次以建立 `~/Library/Rime`。
3. 切換到其他輸入法，結束 Squirrel 程序，再於專案根目錄執行：

   ```bash
   bash restore-rime.sh
   ```

4. 重新啟動鼠鬚管，從輸入法選單選「重新部署」。若程序無法重新啟動，可登出再登入。
5. 確認倉頡五代、每頁 5 個候選字、候選窗外觀與常用快捷鍵。

方案與標準詞典由鼠鬚管提供，這裡只保存設定。若新安裝缺少某個方案，先依 [Rime 官方安裝說明](https://rime.im/download/) 補裝，再重新部署。

`setup.sh` 只安裝輸入法並提示還原方式；個人設定透過 `restore-rime.sh` 手動套用。

## 備份與回復

還原腳本會先把即將覆寫的三個舊檔存至 `~/Library/Rime.backup.XXXXXX/`，再複製本專案設定，不清空目標資料夾，也不更動學習詞庫。

要回復原設定：

1. 切換至其他輸入法並結束 Squirrel。
2. 將該備份目錄中的舊檔複製回 `~/Library/Rime/`。
3. 若某個設定檔原本不存在，移除本次新增的該檔。
4. 重新啟動鼠鬚管並執行「重新部署」。

## 設定備份的範圍

儲存庫目前公開，這裡保存可供換機還原的設定：

- 不包含學習詞庫（`*.userdb`）與個人輸入記錄。
- 不包含同步資料、裝置資訊（`installation.yaml`）或編譯快取（`build/`）。
- 不包含自動產生的建置與方案使用時間。

因此這不是完整使用者資料備份；學習詞彙需另外自行保存。

## 後續更新與攜帶

本機設定變更後，將 `default.custom.yaml`、`squirrel.custom.yaml` 的修改同步回此目錄；若需要更新上次方案與選項狀態，再整理 `user.yaml`，移除自動時間欄位。更新同步日期後提交，避免直接上傳整個 `~/Library/Rime`。這份快照不會自動追蹤本機變更。

若需要離線攜帶，在專案根目錄執行：

```bash
mkdir -p backups
tar -czf backups/rime-settings.tar.gz restore-rime.sh configs/rime
bash tests/rime.sh
```

解壓縮後，在解壓縮目錄執行 `bash restore-rime.sh`。壓縮包不進 Git，文字設定已納入版本管理。

驗證範圍：YAML 可解析、快照與本機設定比對、暫存目錄還原、舊檔備份、重複還原、保留詞庫、拒絕符號連結與不存在的目標。未在全新 Mac 上進行實際輸入測試。

參考：[Rime 用戶資料說明](https://github.com/rime/home/wiki/UserData)。
