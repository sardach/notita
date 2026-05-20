#!/usr/bin/env bash
set -euo pipefail

project_dir="$(
  CDPATH=
  cd -- "$(dirname -- "$(readlink -f -- "$0")")"
  pwd
)"

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/applications"
mkdir -p "$HOME/.local/share/icons/hicolor/scalable/apps"

if [ ! -x "$project_dir/.venv/bin/python" ]; then
  python3 -m venv --system-site-packages "$project_dir/.venv"
fi

if ! "$project_dir/.venv/bin/python" - <<'PY' >/dev/null 2>&1
import tkinterdnd2
PY
then
  if ! "$project_dir/.venv/bin/python" -m pip install tkinterdnd2; then
    printf '%s\n' "Aviso: no se pudo instalar tkinterdnd2; Notita funcionara sin arrastrar imagenes." >&2
  fi
fi

ln -sfn "$project_dir/notita" "$HOME/.local/bin/notita"
cp "$project_dir/desktop/notita.desktop" "$HOME/.local/share/applications/notita.desktop"
cp "$project_dir/assets/notita.svg" "$HOME/.local/share/icons/hicolor/scalable/apps/notita.svg"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true
fi
