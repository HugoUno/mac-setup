#!/bin/bash
# 使用方式：bash restore-rime.sh [目標 Rime 目錄]
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-${HOME}/Library/Rime}"
FILES=(default.custom.yaml squirrel.custom.yaml user.yaml)

if [[ $# -gt 1 || ! -d "$TARGET" || -L "$TARGET" ]]; then
    echo "請指定已存在、非符號連結的 Rime 目錄；先安裝並啟用鼠鬚管。" >&2
    exit 1
fi
TARGET="$(cd "$TARGET" && pwd -P)"
if [[ "$TARGET" == "$(cd "${HOME}/Library" && pwd -P)/Rime" ]] && pgrep -x Squirrel >/dev/null; then
    echo "請切換到其他輸入法並結束 Squirrel 程序後，再還原設定。" >&2
    exit 1
fi
for file in "${FILES[@]}"; do
    if [[ ! -f "$SCRIPT_DIR/configs/rime/$file" || -L "$TARGET/$file" || ( -e "$TARGET/$file" && ! -f "$TARGET/$file" ) ]]; then
        echo "設定來源缺失或目標不是一般檔案：${file}；未變更任何設定。" >&2
        exit 1
    fi
done

# 先完成所有舊設定的備份，再開始覆寫。
BACKUP="$(mktemp -d "${TARGET}.backup.XXXXXX")"
for file in "${FILES[@]}"; do
    if [[ -f "$TARGET/$file" ]]; then
        cp -p "$TARGET/$file" "$BACKUP/$file"
    fi
done
echo "舊設定備份：$BACKUP"
for file in "${FILES[@]}"; do
    cp "$SCRIPT_DIR/configs/rime/$file" "$TARGET/$file"
done
echo "設定已複製。重新啟動鼠鬚管，從輸入法選單執行『重新部署』。"
