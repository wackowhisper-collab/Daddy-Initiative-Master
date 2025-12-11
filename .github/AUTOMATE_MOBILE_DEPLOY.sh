
#!/usr/bin/env bash
set -e
REPO="wackowhisper-collab/MasterRepo"
TMP="$PWD/mobile_tmp"

if ! gh auth status > /dev/null 2>&1; then
  echo "Run: gh auth login"
  exit 1
fi

gh repo create "$REPO" --public --confirm || true
rm -rf "$TMP" && mkdir -p "$TMP"
cp -r ./* "$TMP"
cd "$TMP"
git init || true
git remote add origin "git@github.com:wackowhisper-collab/MasterRepo.git" || true
git add .
git commit -m "Add mobile app + EAS CI" || true
git branch -M main
git push -u origin main || true

echo "Pushed mobile app. Open Actions to run EAS build."
