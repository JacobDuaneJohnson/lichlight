# Lichlight v0.7.10.1 hotfix — Pack B: tabbed satchel (F1) + Lich Tome inner tabs (F3) (Trinity)
**Status: PARKED — READY for wire on Jake's GO.** Live satchel / `lichlight-site/` untouched; existing packs only *read*.
Spec: `/workspace/cryptdelve_loot/lichlight_v07101_next.md` §F1, §F3 (+ §F2 empty Tome state art).
Generator: `gen_v07101_satchel_tabs.py` (Pillow, fixed seed, re-run byte-identical; asserts binary alpha + palette).
Run **Pack A first** (tab icons read `../v07101_hud_containers/glyphs/`).
Preview: `../v07101_satchel_tabs_preview.png` · Zip: `../lichlight_v07101_satchel_tabs.zip` · Manifest: `manifest_v07101_satchel_tabs.json` (all numbers below are in it).
Palette: first-pass saturated v0710_ui set + **3 extras** for the Lich Tome accent only: `G0 #4a004a` · `G1 #8b008b` · `G2 #ff80ff` (= v0710_tome magenta mg0/mg1/mg_hl). Solid, no gradients, no AA, alpha 0/255.
All sizes are **1× art pixels** — scale with integer NN: **×2 on phones** (420-wide reference shell = 840×356 CSS, fits a 390px-tall landscape phone; reflow width per the rule below), **×3 on desktop** (1260×534).

## Layout (art px) — rev 6:58 (Jake): **frame spans the screen width; everything reflows**
```
y 0..17   tab strip (STRIP_H 18)     tabs STRETCH to fill the strip: idle at y=2 (16 tall) · selected at y=0 (23 tall, overlaps panel frame)
y 18..177 main panel 420×160          frame 5px + padding 8px  ->  content box x13 y13 w394 h134 (panel coords)
          body = 394×108 · footer row = last 20px (buttons 20 tall, 4px gaps, CLOSE always right-aligned)
```
**Width-fluid rule for Neo:** `PANEL_W = floor((viewport_css_w − safe_left − safe_right) / scale)` (scale ×2 phones, ×3 desktop/tablet),
content `CW = PANEL_W − 26`. Inventory grid columns `= floor((CW − STAT_W_min(150) − 6 − 12 + 6) / 30)`, stat panel takes the rest.
Reference build is **PANEL_W 420** (S25 Ultra landscape 3120×1440 @ DPR 3.5 → 891 CSS → ×2 = 840 CSS = 2940 device px, ~60–120px side margins).
Tab order L→R: **Character · Inventory · Consumables · Notes · Lich Tome · Map**. Tabs start x=6, 1px gap, strip width 414.

## 1. Main panel (`frame/`)
| file | size | use |
|---|---|---|
| `satchel_panel_9slice_24_s8` (+ `satchel_panel_{tl,t,tr,l,c,r,bl,b,br}_8`) | 24×24, slice 8 | `border-image: url(..) 8 fill / 16px` @×2 (24px @×3). Frame = K · brass (lit TL) · brass · stone bevel · K, fill `#3e3430`, brass corner rivets |
| `satchel_panel_sample_420x160` | 420×160 | reference full-width landscape (S25 Ultra); 9-slice to any width |
| `satchel_panel_sample_200x160` | 200×160 | portrait-phone width (use icon tabs) |
Padding inside frame: **8px** (vs ~2–3px live) → content 394×134 at 420 wide.

## 2. Tab strip (`tabs/`)
| file | size | notes |
|---|---|---|
| `tab_<name>_{idle,hover,disabled}_<w>x16` | widths (stretched to the 420 frame): character 73 · inventory 73 · consumables 81 · notes 56 · lich_tome 72 · map 48 | baked 3×5 labels, centred; for other widths use the blank 9-slice + CSS text, or stretch the baked tab's middle |
| `tab_<name>_selected_<w>x23` | same widths | lighter face = panel fill, **no bottom edge**; place at strip y=0 so its last 5 rows cover the panel's top frame → tab joins the panel. Draw selected **after** the panel + other tabs |
| `tab_blank_{idle,hover,disabled}_9slice_12x16_s4`, `tab_blank_selected_9slice_12x23_s4` | 12 wide | slice 4 L/R/top; bottom 1 (idle) / 0 (selected); for CSS text labels |
| `tab_icon_<name>_{idle,hover,disabled}_26x20`, `tab_icon_<name>_selected_26x27` | 26×20 / 26×27 | compact / portrait strip (6×26+5 = 161 wide); icons: helm, satchel, heal flask, notes book, lich tome, map. Strip height 22, idle at y=2 |
States: idle (dark stone, tan text) · hover (brass rim, bright text) · selected (gold text, panel-coloured face) · disabled (grey, no shadow — e.g. Lich Tome before it's found).

## 3. Content chrome (`content/`)
| tab | pieces (size) | layout in 394×134 |
|---|---|---|
| Character | `char_equip_frame_126x66` (4×2 slots), `char_stats_inset_262x66`, `char_stats_strip_9slice_24x22_s8` + `_sample_394x22` | equip left, stats right (6px gap), stat strip below (y+74), footer REST · GATE · CLOSE |
| Inventory (**rev 6:58 — full width**) | `inv_grid_frame_216x96` (**7×3 = 21 slots** visible, scroll for more), stat panel `inv_stats_panel_9slice_12_s4` + rarity header band `inv_stats_header_{common,magic,rare,unique}_9slice_24x17_s6` + rule `inv_stats_rule_9slice_12x3_s4`; samples `inv_stats_panel_{rarity}_sample_172x108`; slots `slot_{idle,hover,sel,new,unique,disabled}_24` (+ `_9slice_12_s4`) | grid left at (0,0); **stat panel 172×108 at x=222** (was 130); lines: name centred on band (y7), type/rarity + LV (y20), rule (y28), 3 two-column stat rows DMG/SPD · CRIT/RANGE · PIERCE/REQ at 9px pitch (y34; col 2 at panel mid+4), compare line (y62), rule (y70), unique effect 2 lines (y76), lore (y96). Footer: SORT · MARK ALL SEEN · DROP ALL (left) — EQUIP · DROP · CLOSE (right). Mock-only item art: `mock_item_unique_bow_spine_16` |
| Consumables | `cons_chip_{idle,hover,sel,empty}_60x28` (+ 9slice 12 s4) | 5 per row at 420 (cols = floor((CW+7)/67)), 7px gaps, 2 rows; 16 icon at (6,6), count text at x+28; detail inset at y+72; footer USE · CLOSE |
| Notes | `notes_parchment_9slice_18_s6` + `_sample_394x102` | ink text `#4a2a18`, 10px inset; footer CLOSE NOTES · CLOSE |
| Lich Tome | see §F3 (`tome_tabs/`); legacy `tome_inset_9slice_18_s6` + `_sample_394x102`, `tome_page_slot_{idle,sel,locked}_28` | |
| Map | `map_viewport_9slice_18_s6` + `_sample_394x102` | K well — draw the live map canvas inside (inset 4px); footer CLOSE |
Generic sunken well: `inset_9slice_12_s4`. Slot pitch **30px** (24 slot + 6 gap; live ≈ 2–3px gaps).

## 4. Buttons (`buttons/`) — all **20 tall** (live-equivalent 16), states idle / hover / down / disabled
| button | size | face | behaviour (Neo) |
|---|---|---|---|
| `btn_close` | 56×20 | danger | **dismiss the whole satchel** (every tab) — always footer right |
| `btn_close_notes` | 80×20 | danger | **Notes tab only**: leave Notes and return to the previously open tab; satchel stays open |
| `btn_sort` (⇅) | 52×20 | stone | Inventory sort (kind > rarity > level) |
| `btn_mark_seen` (✓) | 80×20 | stone | clears `new` pips; `_disabled` when nothing new |
| `btn_drop_all` | 60×20 | danger | keep live confirm |
| `btn_rest`, `btn_gate` | 52×20 | stone | Character footer (gate count: CSS text or blank 9-slice) |
| `btn_equip` / `btn_use` | 52×20 | brass | Inventory detail / Consumables |
| `btn_drop` | 52×20 | danger | Inventory detail |
| `btn_close_x` | 20×20 | danger | optional compact close (portrait icon-tab layout, top-right of strip) |
| `btn20_{brass,danger,stone}_{state}_9slice_12_s4` | 12, slice 4 | | any other label with CSS text |

## F3 — Lich Tome inner tabs (`tome_tabs/`)  (Tome tab content area 394×134)
```
content y 0..11   inner strip (12): idle sub-tabs at y=1 (11 tall) · selected at y=0 (16 tall, covers 4px inset rim)
content y 12..107 sub-tab body 394×96 (tome_sub_inset_<sub>)        y 114..133 footer (CLOSE)
```
| file | size | notes |
|---|---|---|
| `tome_tab_{spells,recipes,enchantments}_{idle,hover,disabled}_<w>x11` / `_selected_<w>x16` | spells 35 · recipes 39 · enchantments 59 | order: Spells · Recipes · Enchantments; x0=4, 1px gap, strip 139 wide → **~120px free for more tabs** (use the blank 9-slice) |
| `tome_tab_blank_{idle,hover,disabled}_9slice_12x11_s4`, `tome_tab_blank_selected_9slice_12x16_s4` | 12 | future sub-tabs with CSS text |
| `tome_sub_inset_{spells,recipes,enchantments}_9slice_18_s6` + `_sample_394x96` | 18 / 394×96 | same leather inset, accent rim per sub-tab: spells magenta · recipes brass · enchantments mana; brass corner studs |
| `tome_page_slot_{idle,sel,locked}_28` (`content/`) | 28 | Spells grid: 7 pages, 34px pitch, starts x15 y8 of body; detail text below |
| `tome_list_row_{idle,hover,sel,locked}_378x20` (+ `_9slice_12_s4`) | 378×20 | Recipes / Enchantments list: 18px icon well at left, text at x+24, 4px row gap, 8px side inset; 3 rows visible (scroll more) |
| `tome_empty_state_394x108` | 394×108 | **Empty Tome (F2)**: Tome acquired, nothing unlocked → no inner tabs, this panel fills content above the footer. Torn-page stubs on the spine, ragged top/bottom, faint lock watermark; Neo text centred from y≈58 (e.g. "THE LICH TOME / ITS PAGES HAVE BEEN TORN OUT.") in ink `#4a2a18` |
| `tome_empty_parchment_9slice_18_s6` + `_sample_378x84` | 18 / 378×84 | per-sub-tab empty state (e.g. "No recipes yet") inside a body; `border-image-repeat: round` keeps the ragged edge chunky |
Text colours: sub-tab selected / headings `G2 #ff80ff`, body `PS`, locked `S4`.

## Inventory stat mock (Jake 6:40, rev 6:58 full width)
Send-ready: `../v07101_inventory_stats_mock.png` (1308×626: 420×178 satchel ×3, Inventory tab, **Spine of the First Lich** selected, stats filled). Also in the zip.
Removed with the reflow: `inv_grid_frame_126x96`, `inv_stats_panel_*_130x108` and every 288/262-wide sample (regenerated at 420/394).

## Galaxy S25 Ultra mock — LANDSCAPE, full width (Jake 6:54 / 6:58)
Send-ready: `../v07101_inventory_stats_mock_s25ultra.png` (native **3120×1440**): 420×178 satchel at **1 art px = 7 device px** (= CSS ×2 @ DPR 3.5) → **2940×1246** device px; left margin 120 (camera cut-out), right 60, centred between status bar (84) and gesture bar (56).
Optional portrait Neo pieces (not used in any mock): `frame/satchel_panel_portrait_sample_192x328`, `content/inv_grid_frame_portrait_156x96`, `content/inv_stats_panel_unique_portrait_sample_166x128` (192-wide shell with icon tabs, 5×3 grid, full-width stat panel).

## Mocks (`mock/`, 420×178 each, all landscape, shown ×2 in preview + Inventory ×3 vs Jake's cramped screenshot)
`satchel_mock_{character,inventory,consumables,notes,lich_tome,map}` + F3 `satchel_mock_lich_tome_{recipes,enchantments,empty}`.

## Weak spots
- 3×5 baked text at ×2 is ~10 CSS px tall — readable pixel text but small; if Jake wants bigger labels, use the blank tab / button 9-slices with CSS text (or ×3 on tablets/desktop).
- Labelled tabs are baked at the 420 reference widths; at other frame widths use blank tab 9-slices + CSS labels (or icon tabs below ~280 art px).
- Selected-tab join is a hard butt-joint with the panel frame (no curved flare) — reads clean at ×2/×3.
