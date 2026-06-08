#!/bin/bash
# Installs the performance-review Claude Code skill as a symlink.
# Run once after cloning. Re-run to update the symlink if the repo moves.

set -e

SKILL_FILE="$(cd "$(dirname "$0")" && pwd)/commands/performance-review.md"
COMMANDS_DIR="$HOME/.claude/commands"
TARGET="$COMMANDS_DIR/performance-review.md"

mkdir -p "$COMMANDS_DIR"

if [ -L "$TARGET" ] || [ -f "$TARGET" ]; then
  rm "$TARGET"
fi

ln -s "$SKILL_FILE" "$TARGET"
echo "Installed: $TARGET -> $SKILL_FILE"
echo "Invoke with /performance-review in any Claude Code session."
