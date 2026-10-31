# Lichlight v0.7.10.1 hotfix — Pack A: round HUD containers (Trinity)
**Status: PARKED — READY for wire on Jake's GO.** Live stays **v0.7.10**; `lichlight-site/` and every existing pack
(`v0710_ui`, `v0710_braziers`, `v0710_tome`, …) untouched — they are only *read* for reused glyphs.
Spec: `/workspace/cryptdelve_loot/lichlight_v07101_next.md` §B1 (+ light/examine/pull add-on), §B2, §B3.
Generator: `gen_v07101_hud_containers.py` (Pillow, fixed seed, re-run = byte-identical; asserts binary alpha 0/255,
every own pixel in the first-pass v0710 palette, plate roundness/symmetry, pause/map square bbox).
Preview: `../v07101_hud_containers_preview.png` · Zip: `../lichlight_v07101_hud_containers.zip` · Manifest: `manifest_v07101_hud_containers.json`
Style: first-pass **saturated** v0710_ui palette (stone / brass / blood / mana / leather / parchment / steel), solid colours, no AA, no gradients.

## Neo one-liner
Put a round plate under **every** HUD control. Easiest: swap each `.btn` background for the single pre-composed PNG
`composed/hud_<slot>_<sz>_{idle|down}.png` (plate + glyph baked, `image-rendering:pixelated`, `background-size:100% 100%`
on a **square** box). Or layer `plates/plate_round_<sz>_<state>.png` + `glyphs/btn_<slot>_<sz>_*.png` yourself.
Drop the CSS circle / rounded-square bg and the tiled stone texture currently showing behind the bare icons.
**Never non-uniform stretch** — every box must be square (pause/map 36×30 → square).

## B1 — plates (`plates/`)  `plate_round_<16|24|32|48|56|64>_<state>.png`
True circles drawn at native 1× density (not ×2 half-grid like the old optional `v0710_ui/hud/plate_*` discs):
K outline → brass rim (1px @16, 2px @24/32, 3px @48+; lit top-left, B3 highlight, 4 brass rivets at N/E/S/W on ≥32)
→ K inner ring → face with 1–2px top-left light / bottom-right shade crescent.
| state | face | rim | use |
|---|---|---|---|
| `idle` | stone `#2a2220` | brass lit TL | default (roll, satchel, pause, map, light, examine, pull) |
| `down` | blood `#341a18` | brass **inverted** (lit BR) | any pressed slot (matches v0710 plate_down language) |
| `disabled` | dark stone | grey stone rim | locked skill / tome book slot / cooldown |
| `blood_idle` | blood `#4a2a24` | brass | attack, heal (live red tint) |
| `mana_idle` | mana `#1a2a5a` | brass | skills (fireball/spin/frost + 4 tome spells), mana (live blue tint) |

## Glyphs (`glyphs/`) — all 16 masters, `16` = 1×, `24` = 16 centred, `32` = ×2, `48` = ×3; `_idle` (= bare name) + `_down` (brass rim)
| glyph | what | note |
|---|---|---|
| `btn_satchel_*` (**B2**) + alias `btn_backpack_*` (byte-identical copies) | leather messenger satchel, strap arc, flap + brass buckle | fixes missing icon after satchel rename — Neo: point the id/path at `btn_satchel_*` (alias kept for any old `backpack` path) |
| `btn_pause_*` (**B3**) | 2 parchment bars, true-square 16 master | redraw; old 8×8 masters NOT reused |
| `btn_map_*` (**B3**) | square 3-panel folded map + blood X + dotted route, 10×10 footprint | redraw; not wide |
| `btn_light_*` | = `v0710_ui/menu/icons/icon_light_*` (lit torch) under HUD `btn_` naming | uses v0710 add-on extra `OR #e07828` flame |
| `btn_examine_*` | = `icon_examine_*` (eye) | |
| `btn_pull_*` (**new**) | steel lever w/ blood knob on stone base + brass hook-arrow | readable at 16 |
| `btn_{pause,map,satchel,backpack}_mini10_{idle,down}` | 10×10 minis | only for the 16px plate |
| `icon_character_16/32(_down)` | knight helm | used by Pack B Character tab |

## Composed (`composed/`)  `hud_<slot>_<sz>_{idle|down}.png`
`24` = `plate_round_24` + 16 glyph centred (1× density) · `48` = ×2 · `72` = ×3 (same pixel density, no mixing).
`_down` = `plate_round_24_down` + glyph `_down`, glyph nudged 1px down (pressed). Accent slots also ship `_stone_idle`.
`16`/`32` = `plate_round_16` + mini10 — **pause, map, satchel(/backpack)** only.
Slots: attack, roll, fireball, spin, frost_nova, spectral_clone, ethereal_shield, ethereal_shift, hellmouth, heal, mana,
satchel (+ backpack alias), pause, map, light, examine, pull, locked (disabled plate + v0710 padlock).
Reused glyphs (unchanged sources): v0710_ui `hud/btn_*_16` (attack/roll/fireball/spin/frost_nova/heal/mana),
v0710_tome `skill_*_16` (4 tome spells, `_down` = brass rim recolour), v0710_ui `menu/icons/icon_{light,examine,locked}_16`.
Composed PNGs assert into shared palette ∪ exact colours of those source glyphs.

## Size → live CSS box (Neo)
| live slot | CSS box | use | integer fit notes |
|---|---|---|---|
| attack `#bAtk` | 88×88 | `hud_attack_72` (or `plate_round_48`×2 ≈ 96 + `btn_attack_32`) | 24-art at 88 CSS = ×11 device px @DPR3 (exact) |
| roll `#bRoll`, skills `#bS1–S3`, tome spell slots | 56×56 | `hud_<skill>_48` (or `plate_round_32`×2 + `btn_*_32`) | 56 CSS = 24×7 @DPR3 |
| heal `#bHP`, mana `#bMP`, satchel `#bInv` | 46×46 | `hud_{heal,mana,satchel}_48` (= `plate_round_24`×2 + `btn_*_24`) | recommend box **48×48** (exact ×2) — 46 is non-integer |
| light / examine / pull (context USE slots) | ~46×46 (same family) | `hud_{light,examine,pull}_48`; plates 24/32/48 shipped | same as above |
| pause `#tPause`, map `#tMap` | 36×30 → **make 32×32 square** | `hud_{pause,map}_32` (mini ×2) or `hud_*_24` in 32 | **stop non-uniform stretch** (preserve aspect / `object-fit:contain`) |
| locked / cooldown skill | as slot | `hud_locked_48` or `plate_round_*_disabled` under padlock | |
Pressed: swap `_idle`→`_down` (or keep `.btn.down` brightness filter on `_idle`). Hit targets unchanged except the suggested 46→48 and 36×30→32×32 squares.

## Checks run
binary alpha on every PNG · every plate/new glyph pixel in v0710 first-pass palette · plates mirror/transpose symmetric with empty corners (round, not rounded-square) at 16+ · pause/map bbox square · re-run byte-identical (sha256 compared) · only new `v07101_*` paths written.

## Weak spots
- `btn_pull_*_down`: brass-rim recolour merges the 2px hook-arrow into a brass blob — reads fine as "pressed", less crisp than idle.
- Satchel at 16 (mini10) is a tiny bag silhouette; reads as "bag" but the buckle is 1–2px. Prefer `hud_satchel_48`.
- Composed 24 art on a 46px box or DPR 2 attack box is non-integer — use the suggested square boxes.
