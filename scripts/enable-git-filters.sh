#!/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ROOT="$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel)"
ZIPPEY="$ROOT/scripts/zippey.py"

git -C "$ROOT" config diff.zip "unzip -c -a"
git -C "$ROOT" config filter.zippey.clean "$ZIPPEY e"
git -C "$ROOT" config filter.zippey.smudge "$ZIPPEY d"

git -C "$ROOT" rm -r :/
git -C "$ROOT" checkout HEAD -- :/
