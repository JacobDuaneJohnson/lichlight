# Releasing a new Lichlight build

Every build that goes live gets a version number and a published list of changes, so testers can see what's different.

## Version numbers

`MAJOR.MINOR.PATCH` (for example `0.3.1`):

- **PATCH** (`0.3.1` → `0.3.2`): tuning and bug fixes.
- **MINOR** (`0.3.x` → `0.4.0`): new features or content.
- **MAJOR**: reserved for 1.0 and later big milestones.

The game shows its version from a single constant at the top of the script in `index.html`:

```js
const VERSION = '0.3.1';
```

## Steps

1. Copy the tested build into this repo: `cp /workspace/dungeon/index.html .` (run the full test suite first).
2. Write player-facing notes in a markdown file using `### Added`, `### Changed`, and `### Fixed` sections, in plain language for testers.
3. Run:

   ```sh
   ./release.sh 0.3.2 notes-0.3.2.md "Short title"
   ```

   Add `--dry-run` as a 4th argument to preview the edits without committing.

`release.sh` then does the following:

- bumps `VERSION` in `index.html` and the "Current version" line in `README.md`
- writes `version.json` (`{"version":"X.Y.Z"}`). When the game launches or comes back from the background, it compares this file with its own `VERSION` and offers an **Update** button if a newer build is live.
- adds the notes to the top of `CHANGELOG.md` with today's date
- commits, creates an annotated tag `vX.Y.Z`, and pushes `main` and the tag
- runs `gh release create vX.Y.Z --latest` with the same notes
- waits until GitHub Pages has built the new commit

Afterwards, copy `index.html` and `version.json` back to your working copy (for example `/workspace/dungeon`) so the two stay identical.

Links:

- Releases: https://github.com/JacobDuaneJohnson/lichlight/releases
- Changelog: https://github.com/JacobDuaneJohnson/lichlight/blob/main/CHANGELOG.md
