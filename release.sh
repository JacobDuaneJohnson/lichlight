#!/usr/bin/env bash
# Publish a new Lichlight version.
#   ./release.sh <version> <notes.md> "<short title>" [--dry-run]
# Example:
#   ./release.sh 0.3.2 notes/0.3.2.md "Faster torches"
# Does: bump VERSION in index.html + README, write version.json (read by the in-game update check), prepend CHANGELOG.md, commit, annotated tag,
#       push main + tag, create the GitHub release (marked Latest), wait for the Pages build.
# Copy the new build into index.html (e.g. cp ../dungeon/index.html .) BEFORE running this.
set -euo pipefail
cd "$(dirname "$0")"
VER="${1:-}"; NOTES="${2:-}"; TITLE="${3:-}"; DRY="${4:-}"
REPO="gamedevjake/lichlight"
die() { echo "release.sh: $*" >&2; exit 1; }
[[ "$VER" =~ ^[0-9]+\.[0-9]+\.[0-9]+(\.[0-9]+)?$ ]] || die "version must look like 1.2.3 or 1.2.3.4 (no leading v)"
[[ -f "$NOTES" ]] || die "notes file not found: $NOTES"
[[ -n "$TITLE" ]] || die "give a short title as the 3rd argument"
TAG="v$VER"; DATE="$(date +%F)"
[[ "$(git rev-parse --abbrev-ref HEAD)" == "main" ]] || die "not on main"
git rev-parse -q --verify "refs/tags/$TAG" >/dev/null && die "tag $TAG already exists"
grep -q "^const VERSION = '" index.html || die "VERSION constant not found in index.html"
OLD_VER="$(sed -n "s/^const VERSION = '\\([^']*\\)';/\\1/p" index.html | head -1)"
[[ -n "$OLD_VER" ]] || die "could not read the current VERSION"
grep -q "^## \[$VER\]" CHANGELOG.md && die "CHANGELOG.md already has $VER"
command -v gh >/dev/null || die "gh CLI not installed"

# 1. bump the version shown in the game and README
sed -i "s/^const VERSION = '[^']*';/const VERSION = '$VER';/" index.html
sed -i "s/^Current version: \*\*v[0-9.]*\*\*/Current version: **$TAG**/" README.md
printf '{"version":"%s"}\n' "$VER" > version.json   # players on older builds see an "Update available" prompt
grep -q "^const VERSION = '$VER';" index.html && grep -q "\"$VER\"" version.json || die "VERSION / version.json mismatch"
# The suite pins the live version. Rewrite that pin, and don't let 0.7.10 swallow 0.7.10.1.
if [[ -n "${OLD_VER:-}" && "$OLD_VER" != "$VER" ]]; then
  python3 - "$OLD_VER" "$VER" <<'PY'
import pathlib, re, sys
old, new = sys.argv[1:]
pat = re.compile(re.escape(old) + r'(?![0-9.])')
for p in pathlib.Path('tests').glob('*.html'):
    s = p.read_text()
    t = pat.sub(new, s)
    if t != s:
        p.write_text(t)
PY
fi
# 2. prepend the notes to CHANGELOG.md (above the newest entry) + add the link reference
python3 - "$VER" "$DATE" "$TITLE" "$NOTES" <<'PY'
import sys, re
ver, date, title, notes = sys.argv[1:]
body = open(notes).read().strip()
s = open('CHANGELOG.md').read()
entry = f"## [{ver}] - {date}\n\n_{title}_\n\n{body}\n\n"
i = s.find('\n## [')
s = s[:i + 1] + entry + s[i + 1:] if i >= 0 else s.rstrip() + '\n\n' + entry
ref = f"[{ver}]: https://github.com/gamedevjake/lichlight/releases/tag/v{ver}\n"
m = re.search(r'^\[\d+\.\d+\.\d+\]: ', s, re.M)
s = s[:m.start()] + ref + s[m.start():] if m else s.rstrip() + '\n\n' + ref
open('CHANGELOG.md', 'w').write(s)
PY
git --no-pager diff --stat
if [[ "$DRY" == "--dry-run" ]]; then echo "dry run: changes left uncommitted (git checkout -- . to undo)"; exit 0; fi
# 3. commit, tag, push
git add -u; git add CHANGELOG.md version.json
git commit -m "Release $TAG: $TITLE"
git tag -a "$TAG" --cleanup=verbatim -F "$NOTES"   # verbatim keeps the "### Added" headings
git push origin main
git push origin "$TAG"
# 4. GitHub release (Latest)
gh release create "$TAG" --repo "$REPO" --title "$TAG - $TITLE" --notes-file "$NOTES" --latest
# 5. wait for GitHub Pages to build this commit
SHA="$(git rev-parse HEAD)"
for i in $(seq 1 40); do
  st="$(gh api "repos/$REPO/pages/builds/latest" --jq '.status + " " + .commit' 2>/dev/null || true)"
  case "$st" in "built $SHA") echo "Pages built $SHA"; break;; "errored $SHA") die "Pages build errored";; esac
  sleep 10
done
echo "Released $TAG: https://github.com/$REPO/releases/tag/$TAG"
echo "Tip: copy index.html + version.json back to your working copy (e.g. ../dungeon) so both stay identical."
