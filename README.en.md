# HOI4 Mod Manager (shared edition)

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
- **Logs are kept for one week**: each mod writes its log straight to `mods\log` (every line starts with a date and time), and the manager automatically cuts the lines older than 7 days off the start of each log. It does not cut while the game is running.
- **Reset all (restore originals)**: turns every mod off, restores the original files that were overwritten, and cleans up mod files that were installed outside the manager. `version.dll` does not exist in the original game, so it is deleted without a backup.
- **Scan folder**: finds and cleans up mod files and logs in the game folder that were installed outside the manager.
- **Launch game**: starts HOI4 through Steam.
- **Korean / English**: on first start the language follows the Windows display language (Korean Windows -> Korean, anything else -> English). You can change it any time with the language selector at the top right of the window, and **the text that the mods show inside the game (decisions, tooltips, windows, ...) follows the program language too.** If you change it while the game is running, close the game and click `Reapply` for the in-game language to change. (Log files written by the mods are not translated.)

## If something goes wrong

- **Your antivirus warns about it**: this is an unsigned program made by an individual, and the mods are `version.dll` files (proxy DLLs) that hook into the game, so some antivirus programs (including Windows Defender) may flag them falsely. Add an exception only if you judge it trustworthy. The hashes (SHA-256) of the distributed files are in `manifest.json`.
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
| **Logistics Strike Friendly-Fire Guard** | Stops the spread damage of logistics strikes from landing on the infrastructure and railways of yourself, allies and neutrals. |
| **Auto Trade** | Automatically imports resource shortfalls through trade and cleans up over-imports, blocked routes and inefficient deals. Per-resource targets, priorities and bans are tuned in a settings window under the decisions tab. |
| **Auto Medal Award** | Automatically awards medals (field citations) to division officers with political power. A settings window under the decisions tab tunes the political power floor, ranks and bans per division template name and per general / field marshal, the medal priority order (with each medal's bonuses shown) and the division order. |
| **Subject Annexation Construction Fix** | Fixes buildings under construction in a subject's states stalling (no progress, factories still tied up) after you annex the subject. Right after annexation or a state owner change, orphaned construction lines are unlinked so they continue as ordinary constructions (progress and factories kept). |
| **Border Conflict No-Combat Defeat Guard** | Stops border wars (Chinese warlord conflicts and ones added by other mods) from ending at once without a battle because no division passed the game's path test. Selects again so the war starts and the units get the game's 14 days to arrive. |
| **Border Conflict Commander** | Stops the game from taking any general or field marshal away from their army when a border conflict starts. One dedicated commander picked in the settings window leads every border conflict, and divisions are taken from that commander's army first. |
| **Single Faction Front in Peacetime** | Merges the borders of the countries of one faction into a single front in peacetime too, so you can deploy divisions along it at once. Starting a war with only some countries of the faction no longer splits the front. |
| **Party Popularity Tooltip Sources** | Shows the guarantee (independence guarantee) drift lines in the party popularity tooltip one per line with their names, instead of bare numbers run together. Text only. |
| **Level-by-Level Railway Construction** | When a railway raises the level by 2 or more, raises the whole route one level at a time instead of finishing one section after another, so the railway helps supply while it is being built. |
| **Core State Resistance Clear** | When you make an occupied state a core state, removes its resistance and compliance the next day, so it leaves the resistance (F6) and compliance (F7) map modes at once. |
