#!/usr/bin/osascript

tell application "System Events" to tell process "Firefox"
    click menu item "New Window" of menu "File" of menu bar 1
    set frontmost to true
end tell