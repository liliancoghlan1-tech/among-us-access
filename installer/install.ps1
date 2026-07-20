$ErrorActionPreference = "Stop"
$ROOT = $PSScriptRoot
$FILES = Join-Path $ROOT "files"

function Say($m) { Write-Host $m }
function MD5($path) { (Get-FileHash -Algorithm MD5 -LiteralPath $path).Hash.ToUpper() }

Say ""
Say "===================================================="
Say " AMONG US ACCESS  -  NVDA Accessibility Mod  -  INSTALL"
Say "===================================================="
Say ""
Say "This makes Among Us playable with the NVDA screen reader."
Say "It only ADDS files next to the game. It does not change the"
Say "game itself, and Uninstall puts everything back the way it was."
Say ""

# --- 1. Is the game running? ---------------------------------------------------
# The mod files lock while the game is open, and the copy would fail halfway.
if (Get-Process -Name "Among Us" -ErrorAction SilentlyContinue) {
    Say "Among Us is currently running."
    Say "Please close the game completely, then run this installer again."
    Say ""
    Say "Nothing was changed."
    return
}

# --- 2. Locate the Among Us folder ---------------------------------------------
$candidates = New-Object System.Collections.Generic.List[string]
$candidates.Add("C:\Program Files (x86)\Steam\steamapps\common\Among Us")
$candidates.Add("C:\Program Files\Steam\steamapps\common\Among Us")
# Steam keeps a list of library folders, so this finds the game on other drives too.
try {
    foreach ($vdf in @("C:\Program Files (x86)\Steam\steamapps\libraryfolders.vdf",
                       "C:\Program Files\Steam\steamapps\libraryfolders.vdf")) {
        if (Test-Path $vdf) {
            foreach ($line in Get-Content $vdf) {
                if ($line -match '"path"\s+"(.+?)"') {
                    $p = $matches[1].Replace("\\","\")
                    $candidates.Add((Join-Path $p "steamapps\common\Among Us"))
                }
            }
        }
    }
} catch {}

$game = $null
foreach ($c in $candidates) {
    if (Test-Path (Join-Path $c "Among Us.exe")) { $game = $c; break }
}
if (-not $game) {
    Say "I could not find Among Us automatically."
    Say ""
    Say "In Steam: right click Among Us, then Manage, then Browse local files."
    Say "Copy the folder path from the address bar."
    Say ""
    Say "Type or paste the full path to your Among Us folder"
    Say "(the folder containing Among Us.exe), then press Enter:"
    $game = (Read-Host "Folder").Trim('"').Trim()
}
if (-not $game -or -not (Test-Path (Join-Path $game "Among Us.exe"))) {
    Say ""
    Say "ERROR: that folder does not contain Among Us.exe. Nothing was changed."
    return
}
Say "Found Among Us at: $game"

# --- 3. Already installed? -----------------------------------------------------
$pluginName = "Among Us Accessibility Mod.dll"
$installedPlugin = Join-Path $game (Join-Path "BepInEx\plugins" $pluginName)
$newPlugin = Join-Path $FILES (Join-Path "BepInEx\plugins" $pluginName)
if (Test-Path $installedPlugin) {
    if ((MD5 $installedPlugin) -eq (MD5 $newPlugin)) {
        Say ""
        Say "Good news: this version is already installed. Nothing to do."
        Say ""
        Say "Make sure NVDA is running, then launch Among Us from Steam."
        return
    }
    Say ""
    Say "A different version of the mod is already installed - updating it."
}

# --- 4. Copy everything in -----------------------------------------------------
Say ""
Say "Installing... (there is a large runtime folder, so give it a few seconds)"
Copy-Item -Path (Join-Path $FILES "*") -Destination $game -Recurse -Force
# The hidden .doorstop_version file is skipped by the wildcard above, copy it by name.
$doorstopVersion = Join-Path $FILES ".doorstop_version"
if (Test-Path $doorstopVersion) {
    Copy-Item -LiteralPath $doorstopVersion -Destination $game -Force
}

# --- 5. Check it landed --------------------------------------------------------
$ok = $true
foreach ($f in @("winhttp.dll", "doorstop_config.ini", "dotnet",
                 "BepInEx\core\BepInEx.Unity.IL2CPP.dll",
                 "BepInEx\plugins\Among Us Accessibility Mod.dll",
                 "BepInEx\plugins\SpeechLibs\Tolk.dll")) {
    if (-not (Test-Path (Join-Path $game $f))) { Say "  MISSING: $f"; $ok = $false }
}
if (-not $ok) {
    Say ""
    Say "ERROR: some files did not copy. If Among Us is in Program Files, try running"
    Say "this installer again by right clicking Install and choosing Run as administrator."
    return
}

Say ""
Say "===================================================="
Say " DONE!  Among Us Access is installed."
Say "===================================================="
Say ""
Say "Before you play: make sure NVDA is running."
Say "Then launch Among Us from Steam as normal."
Say ""
Say "A few seconds after it opens you should hear:"
Say "     Among Us Accessibility Mod loaded"
Say "If you hear that, it worked."
Say ""
Say "The FIRST launch can take an extra few seconds - that is normal,"
Say "the framework is warming up. Later launches are quick."
Say ""
Say "Press H in a round at any time to hear your status."
Say "The full key list and how to play every task by ear is in"
Say "README.txt, next to this installer."
Say ""
Say "To remove the mod later, run Uninstall."
Say ""

# --- 6. Is NVDA even running? --------------------------------------------------
if (-not (Get-Process -Name nvda -ErrorAction SilentlyContinue)) {
    Say "One thing: NVDA does not appear to be running right now."
    Say "Start NVDA before you launch the game, or you will not hear anything."
    Say ""
}
