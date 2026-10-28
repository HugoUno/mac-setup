#!/bin/bash
# Apply only the Ghostty preset; no package installation or shell changes.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="${SCRIPT_DIR}/configs/ghostty.conf"
CONFIG_DIR="${HOME}/Library/Application Support/com.mitchellh.ghostty"
TARGET="${CONFIG_DIR}/config.ghostty"
if [[ "$(uname -s)" != Darwin ]]; then
    echo "此腳本僅支援 macOS。" >&2
    exit 1
fi
# Avoid silently loading two independent configurations.
for candidate in "${XDG_CONFIG_HOME:-${HOME}/.config}/ghostty/config" "${XDG_CONFIG_HOME:-${HOME}/.config}/ghostty/config.ghostty" "${CONFIG_DIR}/config"; do
    if [[ -e "$candidate" ]]; then
        echo "偵測到其他 Ghostty 設定：$candidate；請先整合後再執行。" >&2
        exit 1
    fi
done
GHOSTTY="/Applications/Ghostty.app/Contents/MacOS/ghostty"
if [[ ! -x "$GHOSTTY" ]]; then
    GHOSTTY="${HOME}/Applications/Ghostty.app/Contents/MacOS/ghostty"
fi
if [[ ! -x "$GHOSTTY" ]]; then
    echo "請先安裝 Ghostty：brew install --cask ghostty" >&2
    exit 1
fi
"$GHOSTTY" +validate-config --config-file="$SOURCE"
mkdir -p "$CONFIG_DIR"
if [[ -e "$TARGET" ]] && cmp -s "$SOURCE" "$TARGET"; then
    echo "Ghostty 設定已是最新。"
    exit 0
fi
if [[ -e "$TARGET" || -L "$TARGET" ]]; then
    BACKUP_DIR="$(mktemp -d "${CONFIG_DIR}/backup.XXXXXXXX")"
    cp -pL "$TARGET" "${BACKUP_DIR}/config.ghostty"
    echo "原設定已備份：${BACKUP_DIR}/config.ghostty"
fi
# Atomic replacement also avoids modifying a symlink's original target.
TEMP_CONFIG="$(mktemp "${CONFIG_DIR}/.config.XXXXXXXX")"
trap 'rm -f "$TEMP_CONFIG"' EXIT
cp "$SOURCE" "$TEMP_CONFIG"
mv -f "$TEMP_CONFIG" "$TARGET"
echo "已套用：$TARGET"
echo "在 Ghostty 按 Cmd+Shift+, 重新載入；視窗相關選項請開新視窗。"
