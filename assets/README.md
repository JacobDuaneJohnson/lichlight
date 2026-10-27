# Lichlight custom art (optional)

The game draws everything procedurally. If you drop PNGs in this folder **and list them in `manifest.json`**,
the game uses them instead. Missing or broken files are skipped silently, so the game never waits on art.

```json
{ "files": ["icon_sword_unique.png", "floor_moss.png"] }
```

File names: lowercase letters, digits, `_` and `-`, ending in `.png`. The loader accepts up to 1200 files.

v0.7.5 shorter prisms live beside the v0.7.3 hall art: skin A keeps `prism_idle` / `dais_stone` (now 16×24), skins B/C/D are `prism_b_*`, `prism_c_*`, `prism_d_*` plus matching daises, `crank_base*`, and `prism_dress_*` (not `floor_*`, so they are not mixed into random floors). The beam is still drawn in code. `beam_contact_bloom_01`–`04` are unchanged.

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

## Sound effects (v0.6.1)

`sfx/sfx.json` maps each Sound Bible cue id (e.g. `cbt_hit_light_01`) to its runtime files in `sfx/`. Variant pools are `<cue>_01 … _NN` (never the same clip twice in a row).
`ui_toggle_01` (ON) and `ui_toggle_02` (OFF) are separate cues. Cues under ~1 s, and loops of 3 s or less, are 16-bit WAV. Longer cues are OGG Vorbis q5, with an AAC `.m4a` copy for browsers without Vorbis. Everything is 48 kHz.
Only P0 + P1 cues that the game actually plays are shipped. To swap in final masters, replace the files under the same names, or rebuild them from `audio/runtime/_placeholder/` with the same conversion settings. If a mapped cue's file is missing, that cue is silent. If `sfx.json` can't be loaded, the game uses its procedural voices.
