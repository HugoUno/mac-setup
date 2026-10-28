#!/bin/bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMP="$(mktemp -d)"
trap 'rm -rf "$TEMP"' EXIT
mkdir -p "$TEMP/Rime/keep.userdb"
printf 'old settings\n' > "$TEMP/Rime/user.yaml"
printf 'private words\n' > "$TEMP/Rime/keep.userdb/data"
bash "$ROOT/restore-rime.sh" "$TEMP/Rime"
cmp "$ROOT/configs/rime/user.yaml" "$TEMP/Rime/user.yaml"
cmp "$ROOT/configs/rime/default.custom.yaml" "$TEMP/Rime/default.custom.yaml"
cmp "$ROOT/configs/rime/squirrel.custom.yaml" "$TEMP/Rime/squirrel.custom.yaml"
grep -q 'old settings' "$TEMP"/Rime.backup.*/user.yaml
grep -q 'private words' "$TEMP/Rime/keep.userdb/data"
bash "$ROOT/restore-rime.sh" "$TEMP/Rime"
[[ $(find "$TEMP" -maxdepth 1 -name 'Rime.backup.*' -type d | wc -l) -eq 2 ]]
mkdir "$TEMP/unsafe"
ln -s "$TEMP/Rime/user.yaml" "$TEMP/unsafe/user.yaml"
if bash "$ROOT/restore-rime.sh" "$TEMP/unsafe"; then
    echo 'FAIL: accepted symlink' >&2
    exit 1
fi
[[ ! -e "$TEMP/unsafe/default.custom.yaml" ]]
if bash "$ROOT/restore-rime.sh" "$TEMP/missing"; then
    echo 'FAIL: accepted missing directory' >&2
    exit 1
fi
echo 'PASS: restore, backup, repeated restore, dictionary preservation, unsafe targets'
