#!/usr/bin/env bash
# Usage: ./scripts/new-problem.sh <topic-folder> <id-slug>
# Example: ./scripts/new-problem.sh 02-two-pointers 0125-valid-palindrome
set -euo pipefail
TOPIC="$1"; NAME="$2"
DEST="problems/$TOPIC/$NAME"
[ -d "$DEST" ] && { echo "already exists: $DEST"; exit 1; }
mkdir -p "$DEST"
cp _template/* "$DEST/"

# Python module name: 0125-valid-palindrome -> valid_palindrome (must be unique per problem)
PY="$(echo "$NAME" | sed -E 's/^[0-9]+-//; s/-/_/g')"
mv "$DEST/problem.py" "$DEST/$PY.py"
mv "$DEST/test_problem.py" "$DEST/test_$PY.py"
sed -i "s/from problem import/from $PY import/" "$DEST/test_$PY.py"

# PHP namespace: 0125-valid-palindrome -> P125ValidPalindrome
NS="P$(echo "$NAME" | sed -E 's/-(.)/\U\1/g; s/^0*//')"
sed -i "s/NeetCode\\\\Template/NeetCode\\\\$NS/" "$DEST/solution.php" "$DEST/SolutionTest.php"
echo "created $DEST"
