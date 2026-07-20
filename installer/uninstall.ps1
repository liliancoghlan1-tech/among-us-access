$ErrorActionPreference = "Stop"

function Say($m) { Write-Host $m }

Say ""
Say "=================================================="
Say " AMONG US ACCESS  -  NVDA Accessibility Mod  -  REMOVE"
Say "=================================================="
Say ""

if (Get-Process -Name "Among Us" -ErrorAction SilentlyContinue) {
    Say "Among Us is currently running."
    Say "Please close the game completely, then run this again."
    Say ""
    Say "Nothing was changed."
    return
}

# Locate the game (same logic as the installer).
$candidates = New-Object System.Collections.Generic.List[string]
$candidates.Add("C:\Program Files (x86)\Steam\steamapps\common\Among Us")
$candidates.Add("C:\Program Files\Steam\steamapps\common\Among Us")
try {
    foreach ($vdf in @("C:\Program Files (x86)\Steam\steamapps\libraryfolders.vdf",
                       "C:\Program Files\Steam\steamapps\libraryfolders.vdf")) {
        if (Test-Path $vdf) {
            foreach ($line in Get-Content $vdf) {
                if ($line -match '"path"\s+"(.+?)"') {
                    $candidates.Add((Join-Path $matches[1].Replace("\\","\") "steamapps\common\Among Us"))
                }
            }
        }
    }
} catch {}

$game = $null
foreach ($c in $candidates) { if (Test-Path (Join-Path $c "Among Us.exe")) { $game = $c; break } }
if (-not $game) {
    Say "Type or paste the full path to your Among Us folder, then press Enter:"
    $game = (Read-Host "Folder").Trim('"').Trim()
}
if (-not $game -or -not (Test-Path (Join-Path $game "Among Us.exe"))) {
    Say "Folder not found. Nothing changed."
    return
}
Say "Found Among Us at: $game"

# Our own files first: the mod, its speech libraries, and its config.
$ourPlugin = Join-Path $game "BepInEx\plugins\Among Us Accessibility Mod.dll"
if (Test-Path $ourPlugin) { Remove-Item -LiteralPath $ourPlugin -Force; Say "Removed the mod" }
$speech = Join-Path $game "BepInEx\plugins\SpeechLibs"
if (Test-Path $speech) { Remove-Item -LiteralPath $speech -Recurse -Force; Say "Removed the speech libraries" }
$cfg = Join-Path $game "BepInEx\config\greenbean.amongusaccessibilitymod.cfg"
if (Test-Path $cfg) { Remove-Item -LiteralPath $cfg -Force; Say "Removed the mod's settings" }

# BepInEx itself is shared. If any OTHER mod is using it, leave the framework
# alone - pulling it out would silently break someone else's mods.
$plugins = Join-Path $game "BepInEx\plugins"
$othersRemain = $false
if (Test-Path $plugins) {
    $left = Get-ChildItem $plugins -Recurse -File -ErrorAction SilentlyContinue
    if ($left -and $left.Count -gt 0) { $othersRemain = $true }
}

if ($othersRemain) {
    Say ""
    Say "Other BepInEx mods are still installed, so the framework has been left in place."
    Say "Among Us Access itself is removed."
} else {
    # Only the things this installer actually puts there. Nothing else.
    foreach ($f in @("BepInEx", "winhttp.dll", "doorstop_config.ini", ".doorstop_version", "dotnet")) {
        $p = Join-Path $game $f
        if (Test-Path $p) {
            Remove-Item -LiteralPath $p -Recurse -Force -ErrorAction SilentlyContinue
            Say "Removed $f"
        }
    }
    Say ""
    Say "The accessibility mod and its framework have been removed."
}

Say ""
Say "Among Us is back to normal. Nothing about the game itself was ever changed,"
Say "so it will run exactly as it did before."
Say ""
Say "If anything seems wrong, in Steam: right click Among Us, Properties,"
Say "Installed Files, Verify integrity of game files."
Say ""
