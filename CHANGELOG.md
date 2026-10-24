# Changelog

All notable changes to Lichlight, newest first. Each version is also published on the [GitHub Releases page](https://github.com/JacobDuaneJohnson/lichlight/releases).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org/).

## [0.4.3] - 2026-10-24

_No more torch farming from sconces_

### Fixed
- Wall torches can no longer be taken from their sconces. Walking up to or clicking a lit wall torch used to add it to your torch count, which let you farm torches. Now clicking a lit wall torch (or swinging at it) knocks it out, and **F** / **USE** at a lit wall torch or brazier relights your own torch without putting the wall torch out. You can still relight an empty sconce from your own torch. Torches lying on the floor are picked up as before.

## [0.4.2] - 2026-10-24

_Depth 1 playtest fixes_

### Changed
- **Floors 1–3 are livelier.** Fewer empty rooms on the first three floors: about 8% are quiet, down from 22%. The first two rooms past the start always have monsters, and early packs are a little bigger. Deeper floors are unchanged.
- **Cheaper spells.** Fireball costs 4 mana (was 5) and Whirlwind costs 8 (was 9). Frost Nova stays at 14.
- **Easier-to-read inventory.** The bag, stats, item details, lore, and tooltips use larger text, especially on computer screens. On phones, the stats list scrolls instead of getting cut off.
- **Clicking a wall torch or a breakable prop** now walks you up to it and swings, instead of trying to walk into the wall. The cursor turns red over them.

### Fixed
- Knocking out wall torches was unreliable. Any melee swing (click or J) while you're next to a lit wall torch and facing it now puts it out.

## [0.4.1] - 2026-10-24

_Gate Keys on the floor_

### Changed
- Most iron gates now have a **Gate Key** lying somewhere on the same floor, so vaults aren't locked away unless you happen to find the trader.

## [0.4.0] - 2026-10-24

_Feature Brief v1: bigger crypts, survival, shop, doors and traps_

### Added
- **Bigger floors.** Each floor has about 1.7 times as many rooms. Some rooms are quiet now, so the extra space doesn't mean wall-to-wall monsters.
- **Explored map.** Press **M** (or Tab) on a computer, or tap the ⌗ button on a phone, to see the part of the current floor you've explored. It shows doors, water, and the trader.
- **Map Fragments.** These are very rare. Collect 4 and use them from your bag to reveal the whole floor, including hidden walls and traps.
- **Sealed doors and vaults.** Stone doors open with a puzzle in the room: pull levers in the colour order painted on the door, touch runes in the order carved on it, or stand on every pressure plate. Iron gates need a **Gate Key**, which is separate from chest keys. Vaults behind them hold good loot.
- **Blood doors.** The boss room is sealed by a blood door that costs 15% of your max life to open. It never kills you; if you're too hurt, it refuses until you heal.
- **Traps in narrow corridors.** Pitfalls, dart traps, collapsing ceilings, rolling stones, and fire jets. Each one flashes a warning first, so you have time to roll.
- **Breakable props.** Barrels, urns, bone piles, and chained skeletons break apart when you hit them, and sometimes drop gold, a potion, a ration, or a map fragment. Floors are also damper: more puddles, mould, and running water.
- **Torches.** Hit a wall torch to knock it out. Walk up to a lit torch or brazier and press **F** / **USE** to relight your own torch, or use a lit torch on an empty sconce to relight it.
- **Survival.** New Food, Water, and Rest bars. When one runs low you move slower. When one is empty you slowly lose life, but that alone never kills you. Eat rations from your bag, drink from stone basins and running water, and **REST** for 1 to 8 hours in a quiet room with no enemies nearby. 6 to 8 hours is a full rest. You start with 2 rations.
- **The Hollow Pedlar.** A rare crypt shop, usually on the floor right after a boss. Sell backpack items, repair everything at once, and buy potions, rations, and Gate Keys.
- **Satchels and backpacks.** The Bone King and later bosses can drop bags that add 5 or 10 bag slots (40 max).
- **Drop All.** A **DROP ALL** button in the bag drops every backpack item after you confirm "Drop all items?". Shift+click skips the confirm. Equipped gear is never dropped.
- **Boss parley.** Walking up to a boss now pauses for a short exchange before the fight, with three replies to pick from. **BEGIN** (or Esc / Enter) always starts the fight.
- **Thought bubbles.** Every so often your hero, or more rarely a monster, has something to say.
- **Ambient sound.** Crackling torches, dripping water, wind in the corridors, and growls when monsters spot you.
- **Battle music option.** The combat track is now **Off** by default. Turn it on with **BATTLE MUSIC** in the menu.
- **Skill keys.** On a computer, **1 / 2 / 3** now cast a skill toward the mouse instead of switching skills. **F1 to F3** (or clicking a skill box on the bottom bar) still pick the right-click skill. Pause → **SKILL KEYS** lets you choose which skill each key and right-click casts.
- New keys: **F** to use or interact, **R** to eat, **Z** to rest. On phones, a **USE** button appears when you're next to something you can use.

### Changed
- **Stand in place is now Ctrl.** Hold Ctrl and you stay put. Ctrl+left-click attacks toward the cursor without moving. Shift no longer does this; Shift+click is a normal click.
- Loot never lands inside a wall anymore, including monster drops, gold, potions, uniques, and Drop All.
- Restyled menus and panels in stone, parchment, bone, and iron.
- Smoother torch and brazier flicker, and a cool glow over water.

### Fixed
- Items dropped next to a wall could end up stuck in the wall where you couldn't reach them.

## [0.3.2] - 2026-10-24

_Update prompt_

### Added
- **Update prompt.** When a newer build of Lichlight is live, the game tells you when it launches or when you come back to it. Tap **Update** to reload into the latest version (your saved progress stays). Tap **Later** to keep playing; you will be asked again next time you return to the game.
- If you are in the middle of a run, the prompt waits until you pause, take the stairs, die, or return to the title screen, so it never interrupts a fight.

## [0.3.1] - 2026-10-24

_Rarer keys and version display_

### Changed
- **Keys are rarer.** There are now about 3 keys for every 4 locked chests, so you can't open every chest and each key matters.
  - Champions drop a key 12% of the time (it was 30%), and only one champion key can drop per floor.
  - Cracked tiles and bricks hide keys less often. Sometimes there's gold, a torch, or nothing behind them instead.
  - Every floor still gives you a chance to find a key.

### Added
- The version number now shows in the top-right corner of the title screen and pause menu, with a **What's new** link to these release notes.
- A changelog listing what changed in each version.

## [0.3.0] - 2026-10-24

_Level requirements, durability and Repair Potions_

### Added
- **Level requirements on gear.** Every item now has a required level.
  - Gear from floors 1-2 is always level 1. Deeper and rarer gear needs a higher level. Boss uniques have a set requirement based on the boss's floor, so they may need a few more levels.
  - Tooltips show **Required Level: N**, in red if you're too low.
  - Gear you can't wear yet is tinted red in your bag with its level shown, and the EQUIP button says "Requires level N".
- **Durability.** Weapons and armor wear out. Rings don't.
  - Weapons wear as you land hits, and armor wears as you take hits. A normal weapon lasts a few floors.
  - Tooltips show **Durability: current / max**.
  - A yellow warning icon appears at 25%. Below 10% the icon turns red and you get a one-time warning: "Your ___ is about to break!"
- **Items shatter at 0 durability.** They're gone for good, with a glassy shatter sound, "___ shattered!" text, and shards left on the floor. If your weapon shatters, you fight with your fists until you equip another one.
- **Repair Potions** (orange flask). They're the only way to repair gear.
  - They're picked up automatically and stack. You'll find them lying on the floor, in chests, and on champions, and rarely from regular monsters. Every boss drops one.
  - To repair: open your bag, select the potion, then tap any worn item (equipped or in your backpack). It's restored to full durability. **CANCEL** or Esc backs out.
  - New characters start with one. Your count shows in the HUD.

### Saves
- Old saves keep working. Your gear gets level requirements and full durability when you load, and anything you're already wearing stays equipped.

## [0.2.0] - 2026-10-24

_Monsters, bosses, darkness, chests and Diablo-style controls_

### Added
- **30 monster types**, each with its own behavior, plus tougher champion versions.
- **20 bosses**, one every 5th floor, ending with Oswin, the Bone King, on floor 100. After that they come back as stronger "+1", "+2" versions. Each boss has its own attack patterns and gets more dangerous as it loses health.
- **Screenshake** on big hits, with an Off / Low / Full setting in the pause menu.
- **Darkness and light.**
  - You start with only a faint glow.
  - Torches light up the area for about 85 seconds. You can carry up to 5 spares, and a meter shows how much is left.
  - Wall sconces and braziers light rooms, and walls block light.
  - Some unique rings give off magic light.
  - The minimap only shows places you've explored.
- **Locked chests and hidden keys.** There are 1-3 locked chests per floor, holding magic and rare gear. Keys are hidden under cracked floor tiles and behind cracked bricks. Hit them or roll into them to break them.
- **Click or tap to pick up gear.** Gold, potions, keys, and torches are still picked up automatically.
  - On a computer, hover over an item to see its stats compared with what you're wearing. On a phone, press and hold it.
  - If your backpack is full, you'll see a message and the item stays on the ground.
- **NEW tags** on freshly looted items, with a counter on the bag button and a **MARK ALL SEEN** button.
- **Diablo 2-style computer controls.**
  - Click to walk (it finds a path around walls), and click an enemy to attack it. Shift+click attacks in place.
  - Right-click casts your selected skill. Choose the skill with 1/2/3 or F1-F3.
  - Space dodge-rolls toward the cursor. Tab opens the map, and holding Alt shows item labels.
  - Hovering over an enemy shows its health bar. There's a new gauntlet cursor.
  - A new bottom HUD shows life and mana orbs, a potion belt, skills, an XP bar, keys, and torches.
  - Touch controls are unchanged.

### Changed
- **Loot rebalance.**
  - Regular monsters and champions drop only gold, potions, and the occasional normal item.
  - Magic and rare gear comes from chests and bosses.
  - Only bosses drop uniques. Each boss always drops one unique plus rare gear.
- On a computer, Shift no longer dodge-rolls (it's now attack in place). Use Space or K to roll.

### Fixed
- Click-to-walk no longer gets stuck on wall corners, and any walk in progress is cancelled when you take the stairs.

## [0.1.1] - 2026-10-24

_README and how to play_

### Added
- A README on GitHub covering the story, how to load the game on iPhone, Android, and computers, how to play, and the full controls.

## [0.1.0] - 2026-10-24

_First public release_

First public release, playable in your browser at https://jacobduanejohnson.github.io/lichlight/

### Added
- **Lichlight**, a retro pixel-art dungeon crawler. Beneath drowned Vaelmoor, King Oswin Hollowmere sold his soul to the Pale Choir, and now the Bone King waits below.
- Endless randomly generated crypt floors, with champions and a boss guarding the stairs every 5th floor.
- **Mobile-first controls** in landscape: a floating joystick, an auto-aiming attack button, a dodge roll that makes you briefly invulnerable, and the skills Fireball, Whirlwind, and Frost Nova, plus life and mana potions. Keyboard controls work on computers.
- **Diablo-style loot** in four rarities: white normal, blue magic, yellow rare, and gold unique. Named uniques each come with their own lore.
- An inventory where you can equip, drop, and compare items, plus a **SORT** button.
- **Music.** Ambient and combat tracks crossfade, and boss fights get more intense music. The pause menu has sound and music toggles and volume sliders.
- **Autosave** every time you reach a new floor. Choose **Continue** on the title screen to resume.
- **iPhone support.** It plays in Safari, Add to Home Screen gives you fullscreen with its own icon, sound starts on your first tap, and the layout works around the notch. Android has a fullscreen button.
- Hosted on GitHub Pages.

[0.4.3]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.4.3
[0.4.2]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.4.2
[0.4.1]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.4.1
[0.4.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.4.0
[0.3.2]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.3.2
[0.3.1]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.3.1
[0.3.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.3.0
[0.2.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.2.0
[0.1.1]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.1.1
[0.1.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.1.0
