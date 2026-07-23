# Among Us Access

**Screen-reader accessibility for Among Us (PC / Steam).**

Among Us Access makes Among Us playable with a screen reader. Everything a sighted player sees on screen — menus, your surroundings, tasks, roles, sabotages, meetings, the end-of-game screen — is spoken aloud or turned into a sound cue.

The headline feature: **every task minigame on The Skeld is genuinely playable by ear.** You do the task yourself with sound — you are not just teleported through it.

It speaks through [Tolk](https://github.com/dkager/tolk), so it uses **NVDA** if NVDA is running, otherwise SAPI / the system voice.

---

## Download & install

1. Go to the [**Releases**](../../releases) page and download the latest `Among-Us-Access.zip`.
2. Extract the zip anywhere (your Downloads folder is fine).
3. Make sure **Among Us is closed**, then run **`Install.bat`**. It finds your Among Us folder automatically and copies the mod in. When it says **DONE!**, you're finished.
4. Start **NVDA**, then launch Among Us from Steam. A few seconds later you should hear **"Among Us Accessibility Mod loaded"**.

Everything you need is bundled — the mod **and** the framework it runs on (BepInEx). You do not download anything else.

To remove it later, run **`Uninstall.bat`** from the same folder. It puts the game back exactly as it was; nothing about Among Us itself is ever changed.

> The full guide — every feature, every key, and how to play each task by ear — is in **`README.txt`** inside the download. Press **H** in a round at any time to hear your status.

---

## What it does

- **Play every Skeld task by ear** — wiring, shields, asteroids, garbage, O2, reactor, swipe card, calibrate distributor, and the rest, each with its own sound design.
- **Get around the ship** — scan your surroundings, point to the nearest task, find bodies, and hear the room you're in.
- **Turn-by-turn directions** — pick a task or any room and get walked there one leg at a time ("Down, 7 meters" … "Now right, 4 meters"), following the corridors instead of pointing straight through walls. It reroutes on its own if you wander off or a door is sabotaged shut.
- **Full status on one key** — colour, role, room, task progress, players alive, and cooldowns.
- **Meetings & voting** — who called the meeting and whose body, player names read aloud, and each vote announced as it's cast.
- **Sabotages** — announced with where to fix them, deadly ones with a live countdown, and every fix playable by ear.
- **Impostor tools** — a proximity radar that tells you who can see you (silence = safe to kill or vent), an accessible sabotage map, and vent navigation that names where each vent leads.
- **Special roles** — Scientist, Tracker, Detective, Guardian Angel, Shapeshifter, Phantom, and Viper all have spoken ability state and cues.
- **Menus, lobby, hosting, colour picker, and the end-of-game screen** — all navigable and spoken.

---

## Quick key reference

| Key | What it does |
| --- | --- |
| Left / Right | Move between menu buttons and options |
| Enter | Activate / select |
| Tab | Scan your surroundings (or repeat state inside a minigame) |
| H | Your full status (colour, role, room, tasks, cooldown) |
| T | Point to the nearest unfinished task |
| U | Point to the nearest dead body |
| P | Living players in your current room |
| Y | Locate nearest task (crew) / sabotage (impostor) |
| X / Z | Choose a destination to be walked to (tasks, then rooms) |
| I | Start walking there — turn-by-turn directions |
| C | Jump to the chat input box |
| B | Sabotage map (impostor) / task list (crew) |
| G | Toggle the proximity radar (who can see you) |
| J | Tracker: read your target's direction and distance |
| L | Colour picker (in a lobby) |
| O | Game settings & rules (host can edit) |
| K | Host: manage players (kick / ban) |
| N | Toggle automatic room-entry announcements |
| M | Pause menu (Resume / Leave Game) |
| F | Your role ability (the game's own key) |

All keys can be rebound in the config file. See `README.txt` for the details and for how to play each task.

---

## Notes

- Focused on **The Skeld** — every task and sabotage there is accessible. Other maps aren't fully covered yet.
- **Freeplay** (the main-menu practice mode) is the best place to learn movement and the task minigames with no pressure.
- Among Us updates from time to time; most updates are fine, but a big one can occasionally break something until the mod is rebuilt.

---

## Support me

I will never lock a mod behind a paywall, but the tools I use to create them don't come cheap. Any support means the absolute world and is a massive help in the creation of new mods like this one.

- **Patreon** — https://www.patreon.com/Lily4080?utm_campaign=creatorshare_creator
- **Buy Me a Coffee** — https://buymeacoffee.com/liliancogha

---

## Thanks

Among Us Access began life from **demon-of-fire's** Among Us accessibility mod. It has since been rebuilt so extensively — all the by-ear task minigames, the roles, the radar, the meeting and sabotage work — that, with his blessing, it is released here as its own thing. Thank you to demon-of-fire for the original spark, and to everyone who tested along the way.

Among Us is a trademark of Innersloth LLC. This is an unofficial, fan-made accessibility mod and is not affiliated with or endorsed by Innersloth.
