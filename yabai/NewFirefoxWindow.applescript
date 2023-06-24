#!/usr/bin/osascript

if application "Firefox" is running then
    tell application "System Events" to tell process "Firefox"
        click menu item "New Window" of menu "File" of menu bar 1
        #set frontmost to true
    end tell
    tell application "Firefox" to activate
else
    #tell application "Firefox" to activate
    do shell script "MOZ_DISABLE_SAFE_MODE_KEY=1 /Applications/Firefox.app/Contents/MacOS/Firefox"
end if