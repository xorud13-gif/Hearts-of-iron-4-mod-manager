# HOI4 Mod Manager

[한국어](README.md) | **English**

A program that lets you pick **native DLL and script mods** for Hearts of Iron IV, turn them on and off, and restore the game folder to its original state at any time.
This repository contains **only the mods the developer has judged stable**, and the program downloads and manages them directly from this repository.

- Requirements: Windows 10/11 (.NET Framework 4.8 - included with Windows, nothing to install)
- All you need: the single file `HOI4ModManager.exe` (at the top of this repository)

## Installation

1. Download `HOI4ModManager.exe` and put it in any folder (the desktop or the Downloads folder both work).
2. When you run it, it asks for the **folder to keep the mods in**. The default is `Documents\HOI4 Mod Manager`. An empty folder is recommended; the `mods`, `loader` and `data` folders are created inside it.
3. The mods are downloaded automatically from the repository (GitHub). The game folder is found through Steam automatically; if it is not found, select the folder that contains `hoi4.exe` yourself.
4. In the list, **click the switch to turn on** the mods you want. Click a mod's name to open its description. (The switches are locked while the game is running.)
5. The first time you turn a mod on, a notice appears. **Add `HOI4 Mod Manager Scripts` to your playset in the Paradox launcher.** The mods' script, interface and localisation files live in this local mod; without it in the playset, the in-game parts (decision tab, settings windows, ...) do not show up.
   - It is needed **only once per playset**. After that you just turn mods on and off in this program.
   - If you also use another large mod (an overhaul mod etc.), put `HOI4 Mod Manager Scripts` **below (after)** that mod.

## Updates

| Method | Description |
| :--- | :--- |
| Automatic check | While the program is open it checks the repository for changes **once a day**. To turn it off, clear the `Check automatically once a day` box. It only checks - you still click to download. |
| Manual check | The `Check for updates` button. If there are changes it shows the new and changed mods, and after you confirm it downloads and installs **only the changed files**. |
| Safety | Every downloaded file is checked against the hash in the repository's `manifest.json`. If even one does not match, nothing is changed. |
| Mods that are on | When you install an update, the mods that were on are remembered, then **all mods are turned off and the remembered ones turned on again**, so the changes reach the game folder automatically. If the game is running, this continues as soon as you close the game (or the next time the program starts). |
| The program itself | When a new version exists, it asks whether to replace itself and restart. |

Mod config files you have adjusted (for example `cas_ace.txt`) **keep your settings** across updates.

## Main features

- **Turn mods on/off**: clicking the switch installs/removes the mod in the game folder immediately. If something fails it automatically returns to the previous state.
- **Turn all on / Turn all off**: turns every mod on or off at once (when turning on, mods that cannot be used together are left out).
- **Save setup / Load setup**: saves the combination of mods that are on now under a name and loads it again later (for example: before multiplayer use `Reset all` to get back to the original state, and when you return to single-player restore everything with one `Load setup`). In the pop-up you type the name to save under, pick a saved setup, or delete the ones you no longer need. Saved setups are kept in `data\settings.json`.
- **Several DLL mods at once**: the loader is set up automatically. Only the loader `version.dll` goes in the game folder; everything else is kept in the `mods` folder inside the game folder, split into **`mod`** (mod DLLs, config files) and **`log`** (logs).
- **Scripts as a local mod**: the mods' script, interface and localisation files (`common`, `interface`, `localisation`, ...) are not installed into the game's own folders but into `mods\script` of the game folder as the local mod **`HOI4 Mod Manager Scripts`**, together with `Documents\Paradox Interactive\Hearts of Iron IV\mod\hoi4mm_scripts.mod` so the launcher can find it. This keeps these files from being dropped by large mods that replace whole game folders (just put it below such a mod). Files that an earlier version installed into the game's own folders are moved automatically after the update. Once created (the first time you turn a mod on), this local mod **stays, empty, even when you turn every mod off or reset all** (it does nothing in the game), so its playset entry never goes missing - turning everything off for multiplayer and back on later needs no playset change. To remove it completely, take it out of the launcher playset and delete the `mods\script` folder in the game folder and `Documents\Paradox Interactive\Hearts of Iron IV\mod\hoi4mm_scripts.mod`.
- **Logs are kept for one week**: each mod writes its log straight to `mods\log` (every line starts with a date and time), and the manager automatically cuts the lines older than 7 days off the start of each log. It does not cut while the game is running.
- **Reset all (restore originals)**: turns every mod off, restores the original files that were overwritten, and cleans up mod files that were installed outside the manager. `version.dll` does not exist in the original game, so it is deleted without a backup. The local mod `HOI4 Mod Manager Scripts` is emptied but kept, so turning mods on again needs no playset change.
- **Scan folder**: finds and cleans up mod files and logs in the game folder that were installed outside the manager.
- **Launch game**: starts HOI4 through Steam.
- **Korean / English**: on first start the language follows the Windows display language (Korean Windows -> Korean, anything else -> English). You can change it any time with the language selector at the top right of the window, and **the text that the mods show inside the game (decisions, tooltips, windows, ...) follows the program language too.** If you change it while the game is running, close the game and click `Reapply` for the in-game language to change. (Log files written by the mods are not translated.)

## If something goes wrong

- **Your antivirus warns about it**: this is an unsigned program made by an individual, and the mods are `version.dll` files (proxy DLLs) that hook into the game, so some antivirus programs (including Windows Defender) may flag them falsely. Add an exception only if you judge it trustworthy. The hashes (SHA-256) of the distributed files are in `manifest.json`.
- **The decision tab or a mod's settings window does not show up in the game**: check that `HOI4 Mod Manager Scripts` is in your launcher playset and below any other large mod. If it is not in the list, turn a mod on in this program and reopen the launcher.
- **The update check fails**: check your internet connection. A failed automatic check is skipped silently and retried a few hours later.
- **You want to change the install folder**: turn all mods off, close the program, delete `%APPDATA%\HOI4ModManager\install_folder.txt` and run it again - it asks for the folder again (everything is downloaded again into the new folder).
- The activity log is shown in the lower part of the program and kept in `data\manager.log` in the install folder.

## Notes

- **Single-player only**: to overcome the limits of Workshop mods, these mods work by changing how the game itself runs, so correct operation in multiplayer is not guaranteed. Use them in single-player only.

## Included mods

The `Mod list` button in the program shows the full description of every mod. Below are the titles and a short summary of the mods this repository provides.

| Mod | Summary |
| :--- | :--- |
| **Auto Ace Pilot Assignment** | Automatically assigns waiting ace pilots to empty air wings, and immediately replaces and reassigns them when an ace is killed or a new one is promoted. |
| **Manual Precision Front Drag** | When you draw a front by right-click dragging along a border, stops the front from flipping to the other side at state boundaries or rivers, and creates it exactly over the dragged range. |
| **Front Split / Vanish Guard** | When fronts change (for example a third country at peace with you occupies enemy territory), stops your front orders from splitting off onto or moving to a peaceful country's front, and stops your hand-drawn front from vanishing when it is cut up. |
| **Air Wing Ace Generation Expansion** | Makes every damaging air wing operation (close air support, strategic bombing, logistics strikes, ...) get the same ace roll as naval combat on every sortie. |
| **Logistics Strike Friendly-Fire Guard** | Stops the spread damage of logistics strikes from landing on the infrastructure and railways of yourself, allies and neutrals. Bombing that did no damage is not counted toward the enemy bombing war support penalty. |
| **Auto Trade** | Automatically imports resource shortfalls through trade and cleans up over-imports, blocked routes and inefficient deals. Per-resource targets, priorities and bans are tuned in a settings window under the decisions tab. |
| **Auto Medal Award** | Automatically awards medals (field citations) to division officers with political power. A settings window under the decisions tab tunes the political power floor, ranks and bans per division template name and per general / field marshal, the medal priority order (with each medal's bonuses shown) and the division order. Medals added by other mods are shown with the game's own names and effect texts. |
| **Subject Annexation Construction Fix** | Fixes buildings under construction in a subject's states stalling (no progress, factories still tied up) after you annex the subject. Right after annexation or a state owner change, orphaned construction lines are unlinked so they continue as ordinary constructions (progress and factories kept). |
| **Border Conflict No-Combat Defeat Guard** | Stops border wars (Chinese warlord conflicts and ones added by other mods) from ending at once without a battle because no division passed the game's path test. Selects again so the war starts and the units get the game's 14 days to arrive. |
| **Border Conflict Commander** | Stops the game from taking any general or field marshal away from their army when a border conflict starts. One dedicated commander picked in the settings window leads every border conflict, and the divisions that commander holds are sent in first. |
| **Single Faction Front in Peacetime** | Merges the borders of the countries of one faction into a single front in peacetime too, so you can deploy divisions along it at once. Starting a war with only some countries of the faction no longer splits the front. |
| **Party Popularity Tooltip Sources** | Shows the guarantee (independence guarantee) drift lines in the party popularity tooltip one per line with their names, instead of bare numbers run together. Text only. |
| **Level-by-Level Railway Construction** | When a railway raises the level by 2 or more, raises the whole route one level at a time instead of finishing one section after another, so you get the supply improvement even while it is being built. |
| **Core State Resistance Clear** | When you make an occupied state a core state, removes its resistance and compliance the next day, so it leaves the resistance (F6) and compliance (F7) map modes at once. |
| **Nearest Divisions on Front Split** | When a front order splits in two, picks the divisions sent to the new front nearest first by the real path over your own land instead of the straight line on the map, so divisions across a sea or lake are no longer taken first. |
| **Translation Duplicate Key Fix** | When a translation mod ships the same text twice (an English copy and the translation) and the game shows the English one, reads the playset's translation files at every game start and makes the game use the translation. Ambiguous cases (two different translations) are left alone. |
| **Railway Guns Stay on Land** | Keeps railway guns assigned to an army on the railway and spread along the front instead of sailing across the sea (and being sunk) or drifting to the rear. Places reached through railway still being captured are followed by rail once the capture ends, and with more guns than places they share places instead of moving back. Only places no railway reaches, such as islands, are reached by sea. |
| **Spearhead Reaches the Drawn Line** | When you draw a spearhead and attack, units no longer stop one province short of the line: they attack up to the provinces you drew. |
| **Unlimited Military Factories per Line** | Lets every production line of equipment made by military factories take up to 999 military factories, including equipment with a built-in cap (super-heavy howitzers, self-propelled super-heavy howitzers, land cruisers). Equipment files are not touched. |
| **Call to Arms Fix** | When you send a call to arms or a join request to a country already fighting on your side (a subject, a faction member or a co-belligerent) for a war against a country that joined the enemy side later, the button works but the request silently disappears; this mod makes the request go through and the country join when it accepts. |
| **MIO Auto Assign** | Once, when a new game starts, gives every country's equipment designs (in production or not) that have no design team one of the country's Military Industrial Organizations: the production line's manufacturer if it has one, otherwise the MIO with the most traits raising that equipment's combat stats; production lines without a manufacturer then get their design's design team. |
