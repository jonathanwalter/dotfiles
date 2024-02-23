set appName to "WezTerm"

if application appName is running then
  do shell script "/Applications/WezTerm.app/Contents/MacOS/wezterm-gui"
  tell application "System Events" to tell application process "wezterm-gui"
    set frontmost to true
  end tell
else
  tell application appName to activate
  tell application "System Events" to tell application process "wezterm-gui"
    set frontmost to true
  end tell
end if
