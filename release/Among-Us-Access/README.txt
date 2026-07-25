====================================================================
 AMONG US ACCESS
 Screen-reader accessibility for Among Us (PC / Steam)
 All-in-one: the mod AND its framework, one-click install.
====================================================================

This mod makes Among Us playable with a screen reader. Everything a
sighted player sees on screen - menus, your surroundings, tasks, roles,
sabotages, meetings, the end-of-game screen - is spoken aloud or turned
into a sound cue. The headline feature is that EVERY task minigame on
The Skeld is genuinely playable BY EAR: you do the task yourself with
sound, you are not just teleported through it.

It speaks through Tolk, so it uses NVDA if NVDA is running, otherwise
SAPI / the system voice.

This README walks you through installation and then EVERY feature and
key. It is long on purpose - feel free to jump around. There is a quick
key reference near the bottom, and you can press H in a round at any
time to hear your status.


====================================================================
 1. WHAT YOU NEED
====================================================================

  * Among Us on PC (the Steam version).
  * A screen reader. NVDA is recommended (it is free). Make sure it is
    running before you launch the game.

That is it. The modding framework (BepInEx) and the speech engine are
ALREADY INCLUDED - you do not download anything else.


====================================================================
 2. INSTALLING  (one click)
====================================================================

  1. Make sure Among Us is CLOSED.

  2. Run "Install" (Install.bat, in this folder). A black window opens
     and does everything for you: it finds your Among Us folder
     automatically and copies the mod in.
        - If it cannot find the game, it asks you to paste the folder
          path. In Steam: right click Among Us > Manage > Browse local
          files, and copy the path from the address bar.
        - When it says "DONE!", close the window.

  3. Start NVDA (or your screen reader).

  4. Launch Among Us from Steam. A few seconds after it opens you
     should hear:  "Among Us Accessibility Mod loaded"

If you hear that line, you are good to go. The very first launch may
take a few extra seconds while the framework warms up; later launches
are quick.

REMOVING IT LATER: run "Uninstall" (Uninstall.bat) in this folder. It
puts the game back exactly as it was - nothing about Among Us itself is
ever changed.


====================================================================
 3. WHAT IS INCLUDED
====================================================================

You do not need to install anything else. This package contains:

  * The mod itself (Among Us Access).
  * BepInEx 6 (IL2CPP) - the modding framework it runs on, plus the
    small .NET runtime it needs (the "dotnet" folder).
  * The speech engine DLLs (Tolk + NVDA/SAPI), in a "SpeechLibs" folder.
  * A ready-made config, so all the keys match this README out of the box.

After install these live inside ...\Among Us\BepInEx\ (the mod and the
SpeechLibs folder are under BepInEx\plugins\). The Uninstall script
removes exactly these and nothing else.


====================================================================
 4. FIRST THINGS TO KNOW
====================================================================

  * Movement is the normal Among Us movement (arrow keys / WASD). The
    mod layers extra keys and sound cues on top.

  * Almost everything has a sound: menus speak, your status speaks, tasks
    turn into tones, and important events (kills, bodies, sabotages) are
    announced.

  * Many keys can be changed. After the first launch a config file is at:
        ...\Among Us\BepInEx\config\greenbean.amongusaccessibilitymod.cfg
    Open it in a text editor to rebind any key listed in this README.

  * BEST WAY TO LEARN: open the game, choose "Freeplay" (practice mode)
    from the main menu. In Freeplay you can walk around The Skeld alone,
    walk into task consoles, and try every minigame with no pressure. A
    few things behave differently in Freeplay (noted below), but it is
    the ideal place to learn the controls.


====================================================================
 5. GETTING AROUND MENUS
====================================================================

All menus (main menu, lobby, the laptop, etc.) are navigable:

  * Up / Down arrow     - move between buttons / options. The mod reads
                          each one out. (Left and Right are left free for
                          actions inside a menu, like changing a volume or
                          accepting a friend request.)
  * Enter               - activate the focused button.
  * Escape              - back out / close.
  * Page Up / Page Down - jump ten items at a time in a long list.
  * Home / End          - jump to the first / last item.
  * C                   - jump straight to the chat input box (in a lobby
                          or game). Type your message, press Enter to send.
                          Game hotkeys are disabled while the chat box is
                          focused, so you can type freely.

Text input fields (name, lobby code, chat) can be focused and typed into.

SETTINGS (the gear icon on the main menu)
  The settings panel is mouse-driven in the base game, so the mod reads it
  as its own menu. Open it from the main menu and you get:

  * Up / Down     - move between the settings.
  * Left / Right  - change the highlighted one: music volume, sound effects
                    volume, censor chat, colour blind text, streamer mode,
                    friend list invites, disable mouse movement.
  * Enter         - flip a setting on or off.
  * Escape        - close the panel.

  Volumes are read as a percentage, switches as "on" or "off".

FRIENDS AND YOUR FRIEND CODE  -  press F1
  The game's friends panel cannot be reached without a mouse, so the mod
  gives you its own. Press F1 anywhere:

  * Your friend code is read out first. Press Enter to copy it to the
    clipboard so you can paste it to someone. (If the game is hiding your
    code behind the privacy toggle, the mod reveals it just long enough to
    read it, then puts your setting back.)
  * Friend requests   - Right arrow accepts, Left arrow denies. A request
                        you have answered will not be offered again.
  * Game invites      - Enter joins that friend's game.
  * Your friends      - Enter invites the highlighted friend to your lobby.
                        (Only works while you are actually in a lobby; the
                        mod says so if you are not.)
  * Up / Down move, Escape closes.

CONFIRMATION POP-UPS
  Some actions raise a small "are you sure?" box that has no keyboard route
  in the base game. The mod reads the question and gives you Enter to
  confirm, Escape to cancel - so you can never get stuck behind one.

THE DATE OF BIRTH SCREEN (first launch / new account)
  Among Us asks for your date of birth once, on a screen built from three
  mouse-driven drop-down lists. The mod makes it work by ear:

  * Up / Down move between Month, Day, Year and Submit, reading the current
    value of each ("Month, not set" / "Month, March").
  * Enter on Month, Day or Year opens its list; Up / Down move through it
    and Enter chooses. The year list is long, so Page Up / Page Down jump
    ten years at a time.
  * Submit reads the date back to you in words ("12 March 2006") and offers
    "Yes, that date is correct" or "No, go back and change it".


====================================================================
 6. WALKING AROUND THE SHIP (when a round starts)
====================================================================

  * Tab  - SCAN SURROUNDINGS. Reads your current room and what is near
           you (doors, vents, nearby players, etc.). Your most-used
           orientation key.

  * T    - NEAREST TASK. Points you to the nearest task you still need to
           do: announces the task name, the direction, and the distance,
           with a panned beep toward it. Press repeatedly as you walk to
           home in on it.

  * P    - PLAYERS IN ROOM. Announces the living players in the room you
           are currently in. (Mostly useful as an impostor, or for general
           awareness.)

  * U    - NEAREST DEAD BODY. Manually scans for the closest dead body and
           points you to it (direction + distance). See also the automatic
           body announcements below.

  * H    - YOUR STATUS. Speaks a full readout: your colour, your role,
           whether you are alive, the room you are in, your task progress
           ("3 of 5 tasks done"), how many players are alive, your kill
           cooldown (impostor), and your role's ability state (for example
           Scientist battery percent, Tracker state). Your go-to "where am
           I and what's going on" key.

  * Y    - LOCATE. As a crewmate, pings toward your nearest unfinished
           task. As an impostor, locates the nearest sabotage point. This
           is a LOCATOR only - it does not auto-complete anything.

TURN-BY-TURN DIRECTIONS  (X, Z and I)

The keys above all point in a STRAIGHT LINE at what you want. That is fine
once you know the map - but a straight line goes through walls, so if you
do not already have the ship memorised you end up walking into one, which
is both frustrating and a great way to look suspicious.

These three keys walk you there instead, following the corridors:

  * X    - NEXT DESTINATION. Cycles through your unfinished tasks (nearest
           first), then every room on the map, then "guidance off". It only
           says the name and distance - it does not start walking yet.

  * Z    - PREVIOUS DESTINATION.

  * I    - GO. Starts guiding you to whatever is selected. Press it again
           while walking to hear the current direction again (it also
           replans from wherever you are, so it doubles as "I'm lost").

You then get one leg at a time, spoken as you reach each corner:

    "Guiding to Navigation. Down, 7 meters."
    "Now right, 4 meters."
    "Now down and right, 3 meters, to Navigation."
    "Arrived at Navigation."

A quiet tick points toward the next corner between instructions. If you
wander off the route, or a door is sabotaged shut across it, the mod
silently works out a new way and just tells you the next direction.

You are still walking yourself - the mod gives you the shape of the ship,
not the answer.

To actually DO a task, walk to its console and press the game's normal USE
key (E). The mod takes over once the minigame opens. See the next section.

AUTOMATIC ANNOUNCEMENTS (no key needed):
  * A dead body is announced the moment it comes into your line of sight,
    with colour, direction, and room. (Can be turned off in the config:
    [Gameplay] AnnounceVisibleBodies = false.)
  * Kills and vents are announced if a sighted player in your position
    would have seen them ("Red killed Blue", "Green vented in Electrical").
  * If another player completes a VISUAL task in your sight, you hear it
    ("Red cleared asteroids") - so you can vouch for them, like a sighted
    player could.
  * Sabotages are announced with where to fix them, and deadly ones
    (reactor, oxygen) get a live countdown.


====================================================================
 7. PLAYING THE TASKS BY EAR  (the heart of the mod)
====================================================================

Walk into a task console and press E (the game's use key) to open it. The
mod announces the task and how to play it. General rules:

  * Most minigames use the ARROW KEYS to move/navigate, SPACE or ENTER to
    act, and TAB to repeat the current state / progress.
  * ESCAPE bails out of a minigame.
  * Listen for sound: rising pitch usually means "getting closer / nearly
    there", a chime means success, a buzz means a miss.

Here is every task minigame and how to play it by ear:

  ELECTRICAL / WIRING
  * Fix Wiring - Up/Down move within a column; Left/Right switch between
    the left wires and the right nodes (each announces its colour). Enter
    picks up a wire then Enter on a node connects it (tells you if the
    colours matched). Space auto-connects the next wire to its colour
    match. Tab = progress. There are usually 3 panels in a row.

  * Calibrate Distributor - a TIMING task with 3 spinning dials, done in
    order. A tone rises as the spinner approaches the target, and a bright
    ping sounds while it is in the "press now" window. Press Space at the
    ping to lock that dial. Mistime it and the dial resets (just like for
    a sighted player) - this one is meant to be challenging.

  * Divert Power - two parts. At the first console, hold Up/Space to raise
    the slider (rising tone) - it announces which system you are diverting
    to. Then go to that system's console and press Space to accept.

  WEAPONS / SHIELDS / NAVIGATION
  * Clear Asteroids - press Space to fire at the nearest asteroid (it
    auto-aims, since aiming is meaningless by ear). Hold to keep firing.
    Tab = how many left.

  * Prime Shields - Left/Right move between shields; each announces on or
    off (a lit shield is "on"). Space toggles the current one. ENTER is a
    shortcut that turns on all the off ones at once. Tab = how many off.
    The task completes when all shields are on at the same time.

  * Stabilize Steering - steer the crosshair to the centre by ear. Arrow
    keys move it; a 2D homing tone rises as you near the centre and pans
    left/right with your position. Press Enter (or hold at centre) to
    commit when you are centred.

  * Chart Course - you actively STEER the ship along its path. The mod
    tells you which way the course is heading ("up and right"); press the
    matching arrow key(s) to advance along it. A wrong direction gives a
    low "wrong way" beep. Reach the destination to finish.

  * Align Engine Output - a single up/down homing task. Use Up/Down to move
    the handle; a tone peaks as the engine lines up. When you get it close
    by ear the mod locks in the final, sub-degree precision for you and
    completes it.

  STORAGE / ENGINES / O2
  * Empty Garbage - hold Down (or Space) to pull the lever and empty the
    chute. Keep holding until it is done.

  * Fuel Engines - multi-stop task. At Storage, hold Space/Up to fill the
    canister (rising tone, "fuel pumped" when full). Then carry it to the
    upper and lower engines and hold again at each to empty it in.

  * Clean O2 Filter - the leaves are spread across the stereo field by
    their real position. Move to a leaf and HOLD Space; a rising "tug"
    tone plays and the leaf pops out when you have held long enough.
    Release too early and it slips back - commit to the pull. Tab = leaves
    left.

  ADMIN / MEDBAY / REACTOR
  * Submit Scan (Medbay) - step on the scanner; the mod narrates the scan
    as a sweeping tone with 25/50/75% callouts and "Scan complete". This
    one runs itself (it is networked) - you just stand and listen. It is
    a great alibi task because everyone can see you doing it.

  * Inspect Sample - press Space to start the analysis, wait through the
    "analyzing" ticks, then the mod tells you which sample is the anomaly
    ("anomaly is sample 3"). Press that number (or navigate with arrows
    and Enter) to select it.

  * Start Reactor (Simon Says) - the reactor flashes a sequence; each
    button has its own tone and stereo position, so the sequence sounds
    like a little melody. Echo it back on the NUMBER keys. You can use
    Left/Right arrows to explore which number maps to which tone (it
    speaks the number and plays the tone), and Space to replay the
    sequence. Then enter the sequence on the number keys.

  * Unlock Manifolds - press the number keys 1-9 (and 0 for ten) in order.
    Space presses the next one automatically. Tab = progress.

  * Swipe Card (Admin) - HOLD Space and the card slides through the
    reader: a tone sweeps across the stereo field and rises in pitch,
    ending in a "click". Hold all the way until the click. Release too
    early = a failed swipe (try again). Tip: tapping ENTER does an instant
    auto-swipe if you just want it done.

  CLEAN VENTS (when you open a dirty vent)
  * Press Space to open the vent, then HOLD Space on each dirt patch to
    scrub it out (patches are panned by position). Like Clean O2.

If a task is not in the list above (for example timer tasks like
Download / Upload Data), it simply completes on its own when you use the
console - there is nothing to play by ear.


====================================================================
 8. SABOTAGES
====================================================================

When a sabotage happens it is announced, with where to go to fix it, and
deadly ones count down out loud. Fixing them is accessible too:

  * Fix Lights (Electrical) - Left/Right move between switches (each says
    correct or wrong). Space flips one; Enter flips all the wrong ones at
    once. Tab = how many wrong.

  * Fix Oxygen / O2 (two keypads) - the mod reads you the code, then you
    type it on the number keys. Backspace clears, Enter submits. Tab
    re-reads the code and what you have entered.

  * Reactor Meltdown - the handprint hold. Follow the prompt to hold and
    stabilise it.

  * Fix Communications - tune the frequency until it locks (audio-guided).


====================================================================
 9. THE IMPOSTOR
====================================================================

  * H - your status includes your kill cooldown. You also get a "kill
        ready" cue and a directional beep toward a killable target.

  * B - SABOTAGE MAP. Opens the sabotage overlay from anywhere. Arrow keys
        move between sabotage targets (lights, oxygen, reactor, comms,
        doors); Enter triggers the selected one. Press B again to close.
        (For a crewmate, B instead reads your remaining TASK LIST.)

  * P - players in your current room (handy before a kill).

  * G - PROXIMITY RADAR (toggle, on by default). While it is on, every
        player who can CURRENTLY SEE YOU has their colour spoken and panned
        toward them, repeating on a steady cycle while they stay in view.
        SILENCE means nobody can see you - safe to kill or vent. It says
        "clear" when the last person who could see you leaves. This is the
        "is the coast clear" tool.

  * "You're on camera" - if you walk into the view of a security camera
    that someone is watching, you are told, with a low tick while you stay
    in view, and "off camera" when you leave.

  VENTS:
  * When you are inside a vent, the arrow keys move between connected
    vents: Left = vent to the left, Right = vent to the right, Up =
    forward/centre. The mod names the room each connected vent leads to.
    Tab re-announces your options. Move out of the vent to exit.

  SHAPESHIFTER:
  * Open the shapeshift menu with the game's ability key (F). The mod lets
    you cycle targets with Left/Right (it names each one and their colour);
    Enter morphs into the selected player.

  PHANTOM:
  * Use the ability (F) to turn invisible. You hear "Invisible", then a
    rising beep for each of the last 5 seconds so you know when you are
    about to reappear, then "Visible".

  VIPER:
  * Your kills leave a body that dissolves. You hear "Body dissolving, N
    seconds" and a countdown of the final seconds, then "Body dissolved".


====================================================================
 10. ROLES (crewmate and special)
====================================================================

Your status key (H) reports your role and its ability state. Beyond that:

  * SCIENTIST - open vitals with the ability key (F). The mod reads the
    summary (how many alive/dead), and Left/Right read each player and
    their status. If someone dies while you are watching, you hear it
    live. H tells you your battery percent.

  * TRACKER - place a tracker on the nearest player with your ability (F).
    The mod announces who you tagged. While tracking, a beep pans toward
    your target and rises in pitch as they get closer. Press J at any time
    for a precise readout: their direction, distance, room, and time left.

  * DETECTIVE - examine a body with your ability (F) to open the notebook.
    Left/Right switch between examined victims; Up/Down read each suspect
    and the room they were in when that victim died; Tab re-reads the page.

  * GUARDIAN ANGEL - after you die you can protect a living player. The mod
    announces the target as it changes and when you protect someone; H
    reads your protect cooldown even while you are a ghost.

  * ENGINEER - uses vents (see the vent navigation above).

(Roles only appear if they are enabled for the lobby. In Freeplay you may
not be assigned a special role - host a private lobby with the role turned
on, see the settings menu below, to test these.)


====================================================================
 11. LOBBY, HOSTING, AND SETTINGS
====================================================================

  * L - COLOUR PICKER (in a lobby). Left/Right cycle the colour names
        (says "taken" if another player has it); Enter chooses it.

  * O - GAME SETTINGS / RULES. Opens an accessible settings reader. Up/Down
        move between settings (map, number of impostors, max players,
        meeting and voting times, vision, kill cooldown, task counts, and
        the role settings); Left/Right change a value; Tab re-reads.
        Settings are grouped into categories: Tab moves to the next
        category, Backspace to the previous. Anyone can READ the settings;
        only the host can change them. This also works on the "Create
        Game" screen, so you can read and set the map and rules before
        making a lobby.

  * K - HOST: MANAGE PLAYERS (kick / ban). Host only. Arrow keys cycle the
        other players; Enter opens an action menu (Kick / Ban / Cancel);
        choose and confirm. A two-step menu so an accidental Enter cannot
        kick anyone.

  * SPACE - HOST: START GAME. In the pregame lobby, Space starts the match
        (the same as the Start button). It warns you if there are too few
        players. (Only active in the lobby, so it never clashes with Space
        during tasks or meetings.)


====================================================================
 12. MEETINGS, VOTING, AND THE END SCREEN
====================================================================

  * MEETINGS - when a meeting starts you are told who reported a body (and
    whose body) or that an emergency meeting was called. During voting,
    the voting screen reads PLAYER NAMES (not numbers), and each vote is
    announced as it is cast ("green voted blue", "red skipped"). Chat
    works with the C key as usual.

  * CHAT - messages are spoken as "{name} said, {message}".

  * END OF GAME - the result screen is fully readable and navigable. It
    announces Victory or Defeat, why (for example "won by completing all
    tasks"), and your XP, level, and Beans earned. Left/Right move between
    the buttons (Continue / Play Again / Leave Game) and Enter activates.
    This carries through to the rewards / "game complete" screen too.


====================================================================
 13. PAUSE / LEAVING A MATCH
====================================================================

  * M - PAUSE MENU. Among Us has no real keyboard pause menu, so this mod
        adds one. Opens in the lobby, in a match, and in meetings. Options
        are Resume and Leave Game (Resume is first so an accidental Enter
        is safe). Arrow keys cycle, Enter selects, M or Escape closes.
        Use "Leave Game" to cleanly quit back to the menu.


====================================================================
 14. QUICK KEY REFERENCE
====================================================================

  GETTING AROUND
    Up / Down ....... move between menu buttons / options
    Enter ........... activate / select
    Escape .......... back out / close
    Page Up/Down .... jump ten items in a long list
    Home / End ...... jump to the first / last item
    Tab ............. scan surroundings (or repeat state inside a minigame)
    C ............... jump to chat input
    F1 .............. friends: your friend code, requests, invites

  IN A ROUND
    H ............... your full status (colour, role, room, tasks, etc.)
    T ............... point to nearest unfinished task
    U ............... point to nearest dead body
    P ............... players in your current room
    Y ............... locate nearest task (crew) / sabotage (impostor)
    N ............... toggle automatic room-entry announcements on/off

  WALK ME THERE (turn-by-turn directions - new)
    X ............... next destination (your tasks first, then every
                      room on the map, then "guidance off")
    Z ............... previous destination
    I ............... start walking there. Press again on the way to
                      repeat the current direction

  IMPOSTOR
    B ............... open/close sabotage map (crew: read task list)
    G ............... toggle proximity radar (who can see you)
    F ............... role ability (shapeshift / phantom / etc. - game key)
    arrows in vent .. move between connected vents

  ROLES
    F ............... use your role ability (game key) - opens vitals /
                      tracker / detective notebook / etc.
    J ............... Tracker: read your target's direction & distance

  MENUS
    F1 .............. friends menu (code / requests / invites)
    gear icon ....... settings panel (Left/Right change a value)

  LOBBY / HOST
    L ............... colour picker
    O ............... game settings & rules (host can edit)
    K ............... host: manage players (kick / ban)
    Space ........... host: start the game (lobby only)

  ANYTIME
    M ............... pause menu (Resume / Leave Game)
    Escape .......... close a minigame / back out

  (All keys can be rebound in the config file - see section 4.)


====================================================================
 15. NOTES / KNOWN LIMITATIONS
====================================================================

  * This mod is focused on THE SKELD. Every task and sabotage there is
    accessible. Other maps (Mira HQ, Polus, Airship, Fungle) are not fully
    covered yet - play on The Skeld for the complete experience.

  * Freeplay vs real games: Freeplay is great for learning movement, tasks,
    and most minigames, but it does NOT apply lobby role/rule settings and
    some role timers behave oddly there. Test role features (Tracker, Viper
    dissolve timing, etc.) in a real lobby.

  * Movement keys still register while some menus/minigames are open, so
    you may drift slightly - not harmful, just be aware.

  * If you hear NO speech at all: make sure NVDA (or your screen reader)
    was running BEFORE you launched the game, and that the SpeechLibs
    folder is in place (section 3).

  * If the mod does not load ("Among Us Accessibility Mod loaded" never
    plays): make sure "winhttp.dll" is sitting right next to "Among Us.exe"
    in your Among Us folder. Running Install again fixes this.

  * Among Us updates from time to time. Because the mod reads the game
    through the framework, most updates are fine, but a big one can
    occasionally break something until the mod is rebuilt.


====================================================================
 16. THANKS
====================================================================

Among Us Access began life from demon-of-fire's Among Us accessibility
mod. It has since been rebuilt so extensively - all the by-ear task
minigames, the roles, the radar, the meeting and sabotage work - that,
with his blessing, it is released here as its own thing. Thank you to
demon-of-fire for the original spark, and to everyone who tested along
the way.

Have fun, and good luck finding the impostor (or being one).
====================================================================
