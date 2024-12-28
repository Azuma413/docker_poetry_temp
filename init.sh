#!/bin/bash
if [ ! -f "pyproject.toml" ]; then
    echo "pyproject.toml が見つかりません。初期化します..."
    poetry init -n --name "replace_me" --dependency "streamlit"
fi

if [ ! -f "poetry.lock" ]; then
    echo "poetry.lock が見つかりません。lock ファイルを生成します..."
    poetry lock
fi

poetry install
exec "$@"