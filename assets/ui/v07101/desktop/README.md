# Lichlight v0.7.10.1 hotfix — F5: Desktop (PC/Mac) HUD redesign (Trinity)
**Status: PARKED — READY for wire on Jake's GO. Live stays v0.7.10** (`lichlight-site/` untouched; Pack A / Pack B only *read*).
Spec: `/workspace/cryptdelve_loot/lichlight_v07101_next.md` §F5 (+ §F6 slot-assign, §F2 no locked book stubs).
Ref (before): `/workspace/cryptdelve_loot/v07101_refs/desktop_hud_current.png`
Generator: `gen_v07101_desktop_hud.py` (Pillow, fixed seed, re-run byte-identical; asserts binary alpha + palette + roundness). **Run Pack A first** (reads `../v07101_hud_containers/plates|composed`).
Preview: `../v07101_desktop_hud_preview.png` · Zip: `../lichlight_v07101_desktop_hud.zip` · Manifest: `manifest_v07101_desktop_hud.json` (every file + size, layout rects, globe geometry).
Palette: first-pass saturated v0710_ui / Pack A set only (no extras). Solid colours, no gradients, no AA, alpha 0/255. Mocks also contain reused Pack A composed glyph colours.

## Neo one-liner
**Desktop-only HUD (`!touchMode`), replaces `drawD2Panel()`: brass-rimmed HP/MP globes (frame + clip-fill + glass), one bottom bar 9-slice, attack + Q/E + roll + exactly 4 equal spell slots — reuse Pack A composed `hud_<x>_24` plates for attack/roll/potions/spells; bar is fluid width.** No 6–9 lock row, no 1–2–3 mini lock strip, no big "selected skill" box — the selected spell gets `slot_select_ring_30`. F6 fills the 4 slots from the Lich Tome.

## Layout (art px) — L tier (desktop default), HUD band 52 tall
```
y 0..3    globe sockets/globes overhang above the bar (Diablo style)
y 12..51  bar body 40 (desk_bar_9slice_64x40_s16): rows 12..17 brass band (K,B1,B2,B0,K,S2bevel), stone-brick S0/S1 below
y 18..22  XP track (meter_track 5 tall) from x58 to W-58
y 24..47  slot row (all 24×24): keycaps overlap each slot bottom-right at (x+26-kw, y+15)
```
| element | L640 rect (x,y,w,h) | L420 (compact) | anchor |
|---|---|---|---|
| HP socket / globe | 0,0,56,56 / 4,4,48,48 | same | left |
| attack (LMB) | 60,24 | same | left |
| Q heal / E mana | 90,24 / 116,24 | same | left (count badge at x-2,y-2) |
| centre info well | 146,24,**284**×24 | 146,24,**64**×24 | stretches |
| roll (SPC) | 436,24 | 216,24 | right |
| spell 1–4 | 466 / 496 / 526 / 556, y24 (pitch 30) | 246 / 276 / 306 / 336 | right |
| MP socket / globe | 584,0,56 / 588,4,48 | 364,0 / 368,4 | right |
Centre well contents (L640): row1 key ×N · torch ×N + torch meter 40 · RP ×N · `LV n` right; row2 `GATE KEYS n` `FOOD n` left · `I: BAG  T: TOME  M: MAP` right. Compact (<200 wide): row1 key/torch/RP counts, row2 torch meter + `I:BAG`; gate/food go above the bar (as live).

**S tier (canvas-native fallback, VW≈320 game px, HUD 38 tall):** bar body 30 (`desk_bar_9slice_64x30_s16`) at y8, globes 32 (+ `globe_socket_40`) at x2 / W-34, y5; XP floats above bar y1 (x40..W-40, live style); slots 24 pitch 26: attack 38, Q 64, E 88, well 114 (34 wide: key + torch counts), roll 152, spells 180/206/232/258 at W=320. Gate keys / food / bag hint on a text line above the bar.

## Fluid width + scale rule (fullscreen + windowed)
Live canvas: `SCALE = floor(min(w,h)·dpr/170)` → VH ≈ 170–180 game px, VW ≈ 300–430. The L tier (52 tall) would eat ~29 % of that, so **draw the desktop HUD at its own integer HUD scale `k`** (DOM overlay like the touch HUD, or a 2nd canvas / `ctx.setTransform(k/SCALE…)` pass):
```
vw, vh = viewport in device px
k      = floor(min(vw / 420, vh * 0.15 / 52))            # HUD ≤ 15 % of height, min layout 420 art
if k >= 2:  tier L;  BAR_W = floor(vw / k)  (bar chrome spans the FULL width)
            LW = min(BAR_W, 760)  -> layout above with W = LW, group centred: margin = (BAR_W - LW) / 2
            left cluster fixed (globe 4, attack 60, Q 90, E 116); right cluster anchored to LW (roll = LW-204, spells LW-174 + 30i, MP globe LW-52)
            well.x = 146, well.w = (LW - 204) - 6 - 146   (284 @640, 64 @420)
else:       tier S at canvas SCALE (W = VW)
```
Examples: 1920×1080 → k3, 640 art · 1280×720 → k2, 640 · 1366×768 → k2, 683 · 2560×1440 → k4, 640 · 3440×1440 → k4, bar 860 / layout 760 centred · 1024×768 window → k2, 512 · 800×600 → S tier.
**Globe diameter never scales except by k; the 4 slots stay equal and fixed (24·k); only the centre well and the side margins grow/shrink.** Recompute on `resize()`. NN only (`image-rendering: pixelated`, `imageSmoothingEnabled=false`).

## Size → CSS / device box (NN integer)
| piece | art | ×2 (phone if ever reused / 720p) | ×3 (desktop 1080p) | ×4 (1440p) |
|---|---|---|---|---|
| globe L | 48 | 96 (`globe_*_96` shipped) | 144 | 192 |
| globe S | 32 | 64 (`globe_*_64` shipped) | 96 | 128 |
| globe socket | 56 / 40 | 112 / 80 (shipped) | 168 / 120 | 224 / 160 |
| spell / attack / potion / roll slot | 24 | 48 (Pack A `hud_*_48`) | 72 (Pack A `hud_*_72`) | 96 |
| select ring | 30 | 60 (shipped) | 90 | 120 |
| keycap | 9 tall | 18 (shipped `_x18`) | 27 | 36 |
| HUD band L / bar body | 52 / 40 | 104 / 80 | 156 / 120 | 208 / 160 |
| HUD band S / bar body | 38 / 30 | 76 / 60 | 114 / 90 | — |

## Files
### `globes/` (masters 32 + 48, NN ×2 = 64 + 96 for every variant)
| file | use |
|---|---|
| `globe_{hp,mp}_frame_<n>` | **wire this**: K outline → brass rim lit TL (B3 hi, 4 rivets) → K → empty face (HP `R0`, MP `M0`, BR glass shadow `S0`). Centre clear for text |
| `globe_face_mask_<n>` | clip target (opaque W1 = face pixels). Face radius **12** (32) / **19** (48), centre n/2 |
| `globe_{hp,mp}_{full,half,empty}_<n>` | preview samples (frame + liquid + glass), no baked numbers |
| `globe_{hp,mp}_rim_<n>` | rim-only overlay (transparent face) if Neo draws face + liquid procedurally first |
| `globe_glass_<n>` | specular lozenge (W2 + W1 core), draw last, same for HP/MP |
| `globe_socket_<n+8>` | brass collar behind the globe (4 px ring), ties the globe into the bar top edge; gets clipped by screen bottom |
| `globe_fill_levels_strip_48` | QA strip 0/25/50/75/100 % |
**Fill rule (matches live drawOrb, solid colours):** face-local `top = round(c + fr − f·2·fr)`; rows ≥ top inside the face = liquid HP `R3` / MP `M1`; right curvature band (dx > 0.25·fr, outer 2 px@48 / 1 px@32) `R2` / `M0`; row `top` = surface line `R4` / `M2`. Then `globe_glass`, then number centred (3×5 font ×2 at 48, ×1 at 32, W1 with K 1-px shadow). Draw order: socket → frame → liquid (clip face mask) → glass → text.

### `bar/`
| file | use |
|---|---|
| `desk_bar_9slice_64x40_s16` (L) / `_64x30_s16` (S) | slices **L16 R16 T6 B0**, centre 32 repeats (brick + rivet period 32). Edge caps = brass corner brackets at the two screen edges. Canvas: draw caps, tile centre 32 px columns |
| `desk_bar_sample_{320x30,420x40,640x40}` | reference widths |
| `center_well_9slice_12_s4` + `_sample_282x24` | sunken info well (K TL shadow, S2 BR lip, S0 fill) |
| `meter_track_9slice_12x5_s3` | XP + torch track (rounded corners, brass end studs) |
| `meter_fill_{xp,torch,torch_warn}_9slice_6x3_s1` | 3-row fills: XP B3/B2/B1 · torch B3/R4/R3 · warn R5/R4/R2 (alternate with torch for the live blink) |
| `xp_track_sample_282x5_60pct`, `torch_meter_sample_40x5_70pct` | samples |

### `slots/` — Pack A aligned (only frames/rings/keycaps are new)
| file | use |
|---|---|
| `slot_spell_idle_{24,32}` (+48/64) | = Pack A `plate_round_*_mana_idle` (renamed copy for the desk set) |
| `slot_spell_selected_{24,32}` | brighter brass rim (B3/B1) + lit mana face — frame-only for Neo-composed glyphs |
| `slot_select_ring_30` / `_38` (+60/76) | 3 px ring (K + brass, lit TL) drawn at slot (−3,−3) **before** the slot; marks the active/selected spell |
| `slot_spell_empty_{24,32}` | **empty = assign from Tome**: stone plate, dashed parchment ring + small brass plus. Not a lock, not a book stub (F2) |
| `slot_spell_disabled_{24,32}` | = Pack A disabled (cooldown / no mana / not yet usable) |
| `slot_weapon_idle_{24,32}` / `slot_weapon_down_{24,32}` | = Pack A blood / down plates; Neo draws the equipped weapon icon on top (mock uses Pack A `hud_attack_24_idle`) |
| `keycap_{1,2,3,4,q,e,spc,lmb,i,m}_<w>x9` (+ ×2 `x18`), `keycap_blank_9slice_9x9_s3` | binding badges; use live bindings (LMB is a mock assumption) |
| `count_badge_sample_7x9` | potion count chip (K rim, S0 fill, W1 digits) at slot (−2,−2) |
**Spell glyphs:** use Pack A `composed/hud_<skill>_24_idle|down` (fireball, spin, frost_nova, spectral_clone, ethereal_shield, ethereal_shift, hellmouth) ×k (`_48`/`_72` exist). Cooldown: dim with face-mask rgba or swap to `slot_spell_disabled` + glyph; not baked.

### `mocks/`
`desk_hud_mock_640x200_1x` + `_1280x400_x2` (L640, 1280 CSS) · `desk_hud_strip_640x52_1x` (HUD band only) · `desk_hud_mock_420x180_1x` + `_840x360_x2` (compact windowed) · `desk_hud_mock_canvas_320x180_1x` + `_1280x720_x4` (S tier). Example slots: fireball · whirlwind/spin (**selected**) · frost nova · empty; HP 60/100, MP 25/40, XP 60 %.

## Weak spots
1. **L tier needs a HUD scale `k` independent of the game canvas SCALE** (DOM overlay or second draw pass) — biggest Neo plumbing item. S tier is the fallback at canvas SCALE and is tight (centre well only fits key/torch counts).
2. Key / torch / RP icons in mocks are 8×8 stand-ins — keep the live `KEY_ICON`, `TORCH_ICON`, `ICONS.rp`. Floor in mocks is a placeholder.
3. Spell glyphs are Pack A's 16 px glyphs on 24 plates; the 32 slot frames have no composed 32 glyph (use 24 ×k instead).
4. Low-HP pulse, cooldown pie, "not enough mana" tint are procedural (not shipped).
5. Numbers on globes are only baked into mocks (Neo `drawText`); at S tier ×1 font is small but matches live.
6. Count badge + keycaps overlap plate rims slightly by design (Diablo-style); if Jake wants cleaner plates, move keycaps under the slot (needs +6 px band height).
