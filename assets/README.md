# Lichlight custom art (optional)

The game draws everything procedurally. If you drop PNGs in this folder **and list them in `manifest.json`**,
the game uses them instead. Missing or broken files are skipped silently, so the game never waits on art.

```json
{ "files": ["icon_sword_unique.png", "floor_moss.png"] }
```

File names: lowercase letters, digits, `_` and `-`, ending in `.png`. Up to 400 files.

| Kind | File name | Size | Notes |
|---|---|---|---|
| Item icon (any rarity) | `icon_<type>.png` | 12×12 (any square size is scaled to 12×12, nearest-neighbour) | used for **normal** items of that type |
| Item icon by rarity | `icon_<type>_<rarity>.png` | 12×12 | rarity = `magic`, `rare` or `unique` |
| One named item | `icon_<type>_<rarity>_<name>.png` | 12×12 | name in snake_case, e.g. `icon_sword_unique_grief.png`. A partial name also matches (`..._unique_grief` matches "Grief's Edge"). |
| Floor tile | `floor_<anything>.png` | exactly 16×16 | mixed into ~70% of floor tiles |
| Wall face | `wall_face_<anything>.png` | exactly 16×16 | mixed into ~70% of visible wall faces |

`<type>` is one of: `sword`, `axe`, `maul`, `staff`, `armor`, `helm`, `shield`, `amulet`, `ring`, `boots`.

Use transparent backgrounds for icons, a hard 1px dark outline (`#1a1020`) and the 16-colour feel of the
built-in art. Pixel art only: no anti-aliasing, it's scaled up with nearest-neighbour.

Without a matching file, magic / rare / unique items get a generated icon (recoloured metal, gem studs,
a halo on uniques) seeded from the item's name and powers, so the same unique always looks the same.
