# Changelog

All notable changes to Lichlight, newest first. Each version is also published on the [GitHub Releases page](https://github.com/JacobDuaneJohnson/lichlight/releases).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org/).

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

[0.3.1]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.3.1
[0.3.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.3.0
[0.2.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.2.0
[0.1.1]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.1.1
[0.1.0]: https://github.com/JacobDuaneJohnson/lichlight/releases/tag/v0.1.0
