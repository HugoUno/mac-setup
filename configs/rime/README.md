# 鼠鬚管本機設定

2026-10-28（Asia/Taipei）從本機 `~/Library/Rime` 整理。來源是 Squirrel 0.18／Rime 1.11.2；當時沒有自訂 `.custom.yaml`，因此把 `build/default.yaml`、`build/squirrel.yaml` 的有效設定轉成可攜式 patch，不搬編譯快取。

## 包含內容

- `default.custom.yaml`：原有的八個輸入方案、每頁 5 個候選字、切換鍵、標點與按鍵設定。
- `squirrel.custom.yaml`：系統配色 `native`、Lucida Grande 21 點、候選窗外觀與各 App 的中英文模式設定。未使用的預設配色表沿用新安裝版本。
- `user.yaml`：原有選項狀態與上次選用的倉頡五代 `cangjie5`；移除建置時間及方案使用時間。

方案清單為 `luna_pinyin`、`luna_pinyin_simp`、`luna_pinyin_fluency`、`bopomofo`、`bopomofo_tw`、`cangjie5`、`stroke`、`terra_pinyin`。方案與標準詞典由鼠鬚管提供，未在此重複打包。若未來版本缺少方案，請依 [Rime 官方安裝說明](https://rime.im/download/) 補裝。

不包含學習詞庫（`*.userdb`）、同步資料、裝置識別資訊（`installation.yaml`）與編譯快取；這份包只還原設定，不還原學習詞彙。

## 新 Mac 安裝與還原

1. 執行 repo 的 `bash setup.sh`，或只安裝輸入法：`brew install --cask squirrel-app`。
2. 必要時登出再登入，在「系統設定 → 鍵盤 → 輸入方式」加入鼠鬚管，啟用一次以建立 `~/Library/Rime`。
3. 切換到其他輸入法，結束 Squirrel 程序，再從 repo 根目錄執行：

   ```bash
   bash restore-rime.sh
   ```

4. 重新啟動鼠鬚管，從輸入法選單選「重新部署」。確認倉頡五代、注音及候選窗外觀。若程序無法重新啟動，可登出再登入。

還原工具會先把即將覆寫的舊檔存到 `~/Library/Rime.backup.XXXXXX/`，再複製上述三個設定檔；不清空資料夾，也不更動詞庫。回復時先停止 Squirrel，再從該備份目錄把舊檔複製回 `~/Library/Rime/`；若某個設定檔原本不存在，移除本次新增的該檔，最後重新部署。

一般安裝流程只安裝輸入法並提示還原方式，不自動覆寫正在使用的設定。

## 打包與檢查

在 repo 根目錄執行，產生可帶到另一台 Mac 的設定包：

```bash
mkdir -p backups
tar -czf backups/rime-settings.tar.gz restore-rime.sh configs/rime
bash tests/rime.sh
```

解壓縮後，在解壓縮目錄執行 `bash restore-rime.sh`。壓縮包不進 Git，文字設定已納入版本管理。之後若修改本機設定，需更新這裡的快照再重新打包；此包不會自動追蹤本機變更。

已驗證：在暫存目錄還原、舊設定備份、重複執行、保留詞庫、拒絕符號連結與不存在的目標。未在全新 Mac 或新版鼠鬚管完成實際輸入測試。

參考：[Homebrew 套件名稱](https://formulae.brew.sh/cask/squirrel-app)、[Rime 用戶資料說明](https://github.com/rime/home/wiki/UserData)。
