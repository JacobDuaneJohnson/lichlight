# Lichlight v0.7.10.1 F7 — Necro respawn tombstone + map death marker

**Status: PARKED READY** (Oct 30, 2026). Live stays **v0.7.10**. Nothing here is wired, and nothing under `lichlight-site/` was touched. Ship only after Jake GOes the full v0.7.10.1 hotfix.
Spec: `cryptdelve_loot/lichlight_v07101_next.md` §F7.

## Files (RGBA PNG, transparent bg, binary alpha 0/255, NN only)
| File | Size | Use |
|---|---|---|
| `tombstone_16.png` (= `prop_tombstone_16.png` = `env_tombstone.png`) | 16×16 | **Master** floor prop (tile footprint, like `brazier_*`) |
| `tombstone_32.png` (= `prop_tombstone_32.png`) | 32×32 | Exact NN ×2 of the 16 master. No new detail |
| `tombstone_12.png` (= `prop_tombstone_12.png`) | 12×12 | Player/engine scale. Hand-redrawn, not a downscale |
| `tombstone_b_16.png` / `tombstone_b_32.png` (+ `prop_` aliases) | 16 / 32 | Optional variant B: flat shoulders, carved X, crack. 32 = NN ×2 |
| `map_icon_death.png` (**primary**) = `map_icon_tombstone.png` | 8×8 | Map / minimap last-death marker (v077 grid) |
| `map_icon_death_16.png` = `map_icon_tombstone_16.png` | 16×16 | NN ×2 of the 8×8 for denser UI or 16px map cells |
| `v07101_tombstone_preview.png` (also at `lichlight_art/`) | — | Preview: 1×, ×4, ×8 on floor_damp_01, all sizes, map icon on dark and light cells, mock map |
| `manifest.json` | — | Files, sizes, alpha bboxes, sha1, palette |
| `gen_v07101_tombstone.py` | — | Generator |
Zip: `lichlight_art/lichlight_v07101_tombstone.zip`.

## Look
- **A (default):** a small upright headstone with a rounded top. It has a carved dark cross, a **1px necro-teal glint** in the cross (the tie-in to the Necro Potion), and a damp teal-lichen pixel at the slab foot and on the base. It sits on a wider plinth. Light comes from the left (torch side `#828690` edge) and the right side is shadowed `#24222A`. Mostly stone greys.
- **B (optional):** flat-shouldered slab with a chunky carved X, a hairline crack top-right, more lichen, and the same teal glint. Use it to vary repeated deaths.
- **Map marker:** a mini headstone with a **pale-bone Latin cross** (`#C8E4D0`, the v078 skull bone) and a full near-black `#0C0A0E` outline. It reads on both the dark `#241A22` and light `#828690` map cells (checked in the preview).

## Footprint / anchor
- 16 master alpha bbox: x 2–13, y 2–14 (12×13). There is a 2px transparent side margin and a 1px bottom margin, like the brazier (bbox to y14). It will not bleed into neighbouring tiles.
- 12: bbox x 1–10, y 1–11 (bottom row used, so the plinth sits on the anchor).
- Draw **bottom-centre on the death tile**, the same as env props: `x = tileX*16 + 8 - w/2`, `y = tileY*16 + 16 - h` (×2 for the 32). Y-sort with the other props so the player can walk in front of or behind it.

## Neo wiring (on GO)
1. When the player dies and **Necro Resurrect** fires, push `{type:'tombstone', tileX, tileY, variant}` to the floor's **persistent entity list**. Do **not** regenerate the dungeon. Keep enemies, loot and floor state.
2. **Keep earlier stones permanent** (preferred). Each death adds a stone. Pick a variant deterministically, e.g. `variant = deathCount % 2 ? 'b' : 'a'`. Skip spawning a stone if one is already on that tile.
3. Tombstones are **non-blocking decor** (suggested). If you make them solid, give them a 1-tile collider like the braziers. They have no interaction. An optional Examine line could be "Here you fell. The Choir remembers."
4. **Map:** keep a single `lastDeath = {floor, tileX, tileY}`. Draw `map_icon_death.png` centred on that cell, above floor and fog and below the player arrow, at integer scale with `imageSmoothingEnabled = false`. Use ×1 on 8px cells and the `_16` glyph (or ×2) on 16px cells. **Move it on each new death.** Older stones stay in the world but get no map marker (optional: draw older ones at 50% alpha).
5. Lifetime is the same as other floor markers or entities: it persists across Resurrect and clears on run end.

## Palette (11 colours; generator asserts on save)
- Stone/iron (env props + v077): outline `#0C0A0E`, carving `#16161C`, shadow `#24222A`, deep `#32343A` (in palette, unused), mid `#484652`, light `#5A5C64`, highlight `#828690`
- Necro teal (v078 Necro Potion): lichen `#24464C`, mid `#167068` (in palette, unused), glint `#2EB8A0`
- Bone (v078 skull mark): `#C8E4D0` (map icon cross only)

## Checks (asserted in the generator)
Binary alpha with clean transparent pixels (0,0,0,0) · palette-only colours · exact sizes · 32 == NN×2(16) byte-wise · aliases byte-identical · fixed seed with a deterministic zip, so a re-run is byte-identical.

## Weak spots
- **12×12:** the cross is only 4px wide and the teal glint is a single pixel. It reads as a headstone, but the cross is soft at true 1×.
- **Map 8×8:** the cross arm touches the outline on both sides (the 4px interior leaves no room for more). The headstone silhouette and the bone cross carry the read, but at 1× it can look like a "white plus on a stone" more than a carved stone.
- The teal glint is deliberately tiny. It ties to the Necro Potion, but players may not notice it.
- The floor preview uses `lichlight_art/env/floor_damp_01.png`. It is not checked against other biomes' floors, though the near-black outline should hold.
- The `_16` map glyph is a plain NN ×2 with no extra detail.

## Rebuild
`python3 gen_v07101_tombstone.py` gives byte-identical PNGs, preview, manifest and zip.
