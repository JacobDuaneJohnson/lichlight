# Changelog

All notable changes to Lichlight, newest first. Each version is also published on the [GitHub Releases page](https://github.com/gamedevjake/lichlight/releases).

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and versions follow [Semantic Versioning](https://semver.org/).

## [0.6.1] - 2026-10-25

_Razz's sound effects_

### Added
- **Real sound effects**: Razz's Lichlight sound pack is now in the game. 105 cues from the first two tiers (P0 + P1), 213 sample files, replace the old synth beeps wherever there's a matching sound:
  - **Combat**: light and heavy swings (axes and mauls sound heavier), hits, crits, misses, and bone / armour / flesh hit layers. Also kill confirms, blocks, shield up / break, and a fizzle when you're out of mana.
  - **Spells and projectiles**: cast release, a looping crackle that follows each Fireball, the Fireball impact, Frost Nova, and arrows whizzing and thunking. Cultist and wisp bolts hum while they're in the air, and boss volleys get their own sound.
  - **Enemies**: barks when they notice you (skeletons rattle, ghosts wail), hurt sounds, deaths for grunts, archers, slimes and elites, and attack swings and wind-up tells. Bosses get an intro sting, an enrage roar and a death collapse. Bomber blasts explode.
  - **World**: wooden doors and iron gates, locked doors and chests, chest opening and loot drops, levers, pressure plates and grinding slabs. Also dart, pit and flame traps, the stairs down, pots and crates, torches and secret walls.
  - **Pickups and shop**: gold (rapid pickups climb in pitch), potions, keys, items, rare and unique finds, drinking, the merchant greeting, buying, selling and "can't afford".
  - **Player and feedback**: footsteps on stone, dodge, getting hurt, death and the game-over sting, level up, a floor-entry sting, a low-life warning with a quiet heartbeat, and a chime when Whirlwind or Frost Nova is ready again.
  - **Menus**: clicks, ON / OFF toggles, inventory, pause menu and map open / close, equip sounds (weapon, armour, trinket), the volume slider tick and the new-game confirm.
  - **Ambience**: a quiet looping bed under each floor (stone crypt or wet cave), the shop hearth, and a tense drone near a sleeping boss.

### Changed
- Variations of a sound never play the same clip twice in a row, and most get a slight random pitch change so repeats sound less mechanical.
- Sound On/Off and the SFX volume slider control all of the new sounds. Sound Off is still completely silent, music is still synthesized, and battle music still starts Off.
- A few sounds without a sampled version yet (vines, webs, boss voices, drips and wind, sleeping, eating, examining) keep their synth sounds. If the sound pack can't load (offline or opened as a local file), the game uses the old synth sounds.

### Notes
- These are approved **placeholder** sounds for timing and mix. Final masters will be dropped in later under the same names.

## [0.6.0] - 2026-10-25

_Characters, spell books, vines and wardrobe_

### Added
- **Characters**: keep up to six heroes, each with its own run. The title screen shows who you're playing; **CHARACTERS** lets you play, change the look of, add or delete a hero. Your existing save becomes the first character (WANDERER) automatically, nothing is lost.
- **Character look + wardrobe**: pick skin, hair and cloak colours. What you wear now shows on your hero in the dungeon: armour, helm and boots recolour the sprite, and shields, amulets, rings and your weapon (tinted by rarity) are drawn on top.
- **Spell Books**: skills are no longer handed out by level. Each skill's book is hidden behind a sealed puzzle door (levers, runes or pressure plates). Read it to learn the skill. Fireball can turn up from depth 1, Whirlwind from depth 3 and Frost Nova from depth 6. Existing saves keep every skill their level already unlocked.
- **Fists first**: new heroes start bare-handed. A worn **Rusty Sword** lies beside some old remains in a room near the start, and you pick it up and wield it automatically.
- **Vines** (depth 2+): thick tangles that block corridors. Cut them with any weapon (fists work, slowly), burn them with your torch (USE) or a Fireball, or spin through them with Whirlwind. They never block the way to the stairs.
- **Mushrooms**: clusters grow in damp corners, by water, fog, coffins and niches. Some glow faintly teal or violet.
- **Slow walkers**: Rotting Zombies (depth 4+), Lumbering Skeletons (7+), Brood Spiders (10+) and Goblin Brutes (13+). They lurch slowly and wind up a heavy, telegraphed swing.
- **Item art by rarity**: magic, rare and unique items get their own icons, with recoloured metal, gem studs and a halo on uniques. Each icon is seeded from the item's name and powers, so the same unique always looks the same. Normal items keep the classic art.
- **Custom art loader**: PNGs listed in `assets/manifest.json` replace item icons, floor tiles or wall faces (see `assets/README.md`). The game runs fine without them.
- **More to examine**: statues (idols, knights, saints), offering bowls, coffins, burial niches and ritual sites. Some lines hint at hollow walls or a hidden book nearby.
- **UI DIM** setting (OFF / LOW / MED) fades the HUD, touch buttons and top bar without darkening the dungeon. It's saved with your settings.
- **Unique drops** flash, send out a shockwave and play their own fanfare.
- **First gear in an empty slot** gets a grunt and a drum roll.
- **Puzzle glimmer**: levers, runes, plates, push blocks and open books sparkle faintly.

### Changed
- Examining doors and objects now shows a short thought bubble instead of a long banner message.
- Your thought bubbles stay up longer (about 5s). Bubbles no longer shimmer or ghost while you move.
- Puzzle doors grind open more slowly with a longer rumble. Lever puzzles answer with a distant echo, and the opened door blinks on the map.
- The map (M) is more see-through.
- The depth banner is bigger, stays longer and sits near the top of the screen.
- Early loot is leaner while you're level 1–2: fewer drops, less gold and mostly plain chest gear. Rations and torches can stand in for chest items.
- Enemies hit a little harder, most noticeably on the first floors (+25% at depth 1, easing to +8%).

## [0.5.0] - 2026-10-24

_Shields, amulets, powers, set pieces and puzzles_

### Added
- **Shields**: a new gear slot with 8 bases from Wooden Buckler to Choir Pavise. Shields give Defense and a **chance to block** (capped at 40%). A block stops the whole hit with a clang, but damage over time is never blocked. Shields have durability and wear when you block or get hit.
- **Amulets**: a new gear slot with 8 bases, each with its own built-in bonus. Amulets have durability too.
- **Special powers on gear**: purple tooltip lines. A power can be a barrier that absorbs damage when your life drops low, when you're struck, or when you block. Others are thorns, mana or life on kill, a slowing aura, a fear pulse that makes enemies flee, a longer dodge window, or a bonus to Fireball, Whirlwind or Frost Nova damage.
  - Rares sometimes roll a power.
  - Every unique has a designed set of powers.
- **20 new uniques by Eve**: 10 amulets and 10 shields, each with lore. Three amulets **sense secret walls** while you wear them: nearby cracks glow, ping and show on the map. Several of the original uniques also gained a signature power, and they get it on old saves too.
- **Sleep fades to black**: the screen goes dark, one soft tick plays per hour slept, then it fades back in with you rested.
- **Set pieces**: ritual circles with candles and an altar (sometimes with a little gold), standing pools you can drink from, green and blue fog, coffins, skull piles, cobwebbed corners, broken pillars, rubble, moss, hanging chains, barred windows and crypt niches.
- **Cobwebs across corridors** (depth 2+):
  - They slow you down and burn your torch 3× faster while you're inside them.
  - A lit torch smoulders through a web in about half a second, a Fireball burns one instantly, and two sword hits tear one apart.
  - Webs never fully block the way.
- **Passage puzzles** (depth 3+): stone slabs that seal off part of a floor. You open one of three ways:
  - pull three levers
  - light three cold sconces in order (count the ember marks)
  - push a stone block onto a plate
  
  Every part of the puzzle is always on your side of the slab.
- **Sliding doors**: puzzle slabs grind open slowly, with dust and a rumble, then land with a thud.
- **More door styles**: iron or rusted gates, plus wooden, bone-bound, barred and plain stone doors.
- **Floor and wall variety**: each crypt theme has its own stone colours, with 10 floor and 8 wall patterns (cracks, drains, missing bricks, niches, damp streaks, moss).
- **Bloom**: a soft glow on torches, braziers, candles and your spells. It's lighter on Low lighting.
- **Boss voices**: every boss type has its own intro, attack, hurt, death and signature sounds, slightly re-pitched for each boss.
- **Ambience that changes with depth**: the background drone shifts across five depth tiers, with different drips, distant booms and an occasional faint melody.
- **Triple the thought bubbles** (Eve's lines). New moods cover darkness, running out of potions, after a kill, a boss nearby, cobwebs and puzzles. A line never repeats until at least six others have played.
- **Touch layout editor** (pause → TOUCH CONTROLS): drag any button where you want it, swap sides to put the stick on the right, or reset to default. Your layout is saved.

### Changed
- Opening a secret passage now has a deeper, echoing sound from the space behind the wall.
- The inventory has 7 equipment slots: weapon, shield, helm, armor, boots, ring and amulet.

### Fixed
- **A gate next to a water stream couldn't be opened**: USE kept choosing DRINK instead. Doors, gates, chests and the trader now take priority over drinking. Streams also no longer spawn next to doors, gates or vault and shop doorways.

## [0.4.6] - 2026-10-24

_Sound pass: skill voices, world tells, sparse crypt ambience_

### Added
- **Skills have their own voices.** **Fireball** casts with a fiery whoosh and lands with a deep amber boom. **Whirlwind** makes a spinning, blade-in-the-air rush. **Frost Nova** cracks like ice and rings like glass.
- **A soft puff when a wall torch goes out.** Knocking out a sconce with your weapon, a skill, or an enemy shot makes its own quiet puff and hiss. Your own torch burning out still sounds like it used to.
- **New world sounds.** Chests creak open with a clink of coins. Locked chests and gates rattle. Chest keys ring brightly and Gate Keys ring heavy and iron. A Gate Key turns and the gate grinds open. Blood doors drink with a heartbeat. Secret passages rumble as the stone shifts, and cracked stone crumbles. Glimmering pools chime when you drink. The stairs sound like footsteps going down.
- **Bosses** have a rising toll when they awaken and a roar when they enrage.

### Changed
- **Melee sounds different when you hit and when you miss.** A hit lands with a meaty thud. A miss is just a whoosh of air. Enemies flinch with their own sound, separate from yours when you get hurt.
- **The crypt sounds more alive, but stays quiet.** Torches and braziers crackle softly when you're close and fall silent as you walk away, and you can hear which side they're on. A sputtering torch spits and pops. Near water you hear more drips, with a damp echo, and once in a while a distant splash. Wind is a little stronger in long corridors. Sometimes you'll hear a faint groan or shuffling feet from something that hasn't noticed you yet. Monsters growl less often when they spot you. No two ambient sounds play within half a second of each other.
- **Mix.** Getting hurt and dying are now the loudest sounds. Combat and world sounds sit in the middle, and ambience sits quietly underneath.

Sound Off, the SFX slider and the iOS silent switch work as before. Battle music still starts Off. Saves aren't affected.

## [0.4.5] - 2026-10-24

_Lighting pass: skill glows, livelier torches, glimmering pools_

### Added
- **Glimmering pools.** Now and then a floor holds a rare pool of faintly glowing teal water, with a silver rim and a slow sparkle. It's different from ordinary basins and running water. Most floors have none, and a floor never has more than one. Drink from it with **F** / **USE** (**DRINK GLIMMER**). It restores thirst and gives you **+25% XP for 5 minutes**. Drinking again resets the timer to 5:00. The bonus doesn't stack. Each pool has two drinks. While the bonus is active, a teal **XP+25% m:ss** timer shows on the HUD and in your character stats, and the bonus carries over between saves.
- **Skill-colored light.** Every skill now lights the crypt in its own color. **Fireball** casts a rich amber-orange glow, brighter than ordinary fire, and leaves a short afterglow where it hits. **Whirlwind** throws a warm steel and dusty-gold halo around you while you spin. **Frost Nova** flashes ice cyan instead of the old purple-blue.

### Changed
- **Livelier torches.** Wall torches, braziers and your own torch flicker more noticeably, and each flame now has a small glow of its own. The flicker is smooth, so it doesn't strobe. A sputtering torch wavers much harder before it dies.
- **Richer light colors.** Torchlight is a slightly warmer amber, and cold and magic light is a deeper blue. Brightness is about the same. The **LIGHTING: HIGH / LOW** option still works as before.

## [0.4.4] - 2026-10-24

_Evening playtest: darker crypts, real secret passages_

### Changed
- **Chests open only when you ask.** Click a chest, or press **F** / **USE** next to it. Walking into a chest no longer opens it. Locked chests still need a key.
- **Torches no longer relight themselves.** When your torch burns out you stay in the dark until you press **F** (**USE** on a phone), which lights one spare torch if you have one. A hint tells you when this happens. Torches you pick up also wait for **F**.
- **Darker floors.** There are far fewer lit wall torches (about a quarter as many as before). Braziers are still around as safe spots of light.
- **Smoother lighting.** The light map now renders at full resolution, so shadows are much less blocky. A new **LIGHTING: HIGH / LOW** option in the pause menu switches between full and half resolution (the old look). The default is High on computers and Low on touch screens, and your choice is saved.
- **More secret passages, and they lead somewhere.** Each floor has 1–3 hidden tunnels that link two rooms far apart on the floor, so they work as real shortcuts. Both ends are sealed with cracked stone that you can break from either side. Map Fragments show them on the map.

### Fixed
- **Ghosts and other spirits can't see through walls anymore.** Every monster needs line of sight to notice you. Spirits can still drift through stone, but only toward the spot where they last saw you, and they give up after a few seconds.
- **Anything that hits a lit wall torch puts it out:** melee, Fireball, Whirlwind, Frost Nova, and enemy projectiles. It stays out for the rest of the floor.

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

First public release, playable in your browser at https://gamedevjake.github.io/lichlight/

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

[0.6.1]: https://github.com/gamedevjake/lichlight/releases/tag/v0.6.1
[0.6.0]: https://github.com/gamedevjake/lichlight/releases/tag/v0.6.0
[0.5.0]: https://github.com/gamedevjake/lichlight/releases/tag/v0.5.0
[0.4.6]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.6
[0.4.5]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.5
[0.4.4]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.4
[0.4.3]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.3
[0.4.2]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.2
[0.4.1]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.1
[0.4.0]: https://github.com/gamedevjake/lichlight/releases/tag/v0.4.0
[0.3.2]: https://github.com/gamedevjake/lichlight/releases/tag/v0.3.2
[0.3.1]: https://github.com/gamedevjake/lichlight/releases/tag/v0.3.1
[0.3.0]: https://github.com/gamedevjake/lichlight/releases/tag/v0.3.0
[0.2.0]: https://github.com/gamedevjake/lichlight/releases/tag/v0.2.0
[0.1.1]: https://github.com/gamedevjake/lichlight/releases/tag/v0.1.1
[0.1.0]: https://github.com/gamedevjake/lichlight/releases/tag/v0.1.0
