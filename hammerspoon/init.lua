-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}

require("hs.application")
require("hs.window")

-- hs.window.animationDuration = 0

-- Custom stuff
require "windowborder"
require "windowfocus"

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-- DISPLAY FOCUS SWITCHING --

--One hotkey should just suffice for dual-display setups as it will naturally
--cycle through both.

--Bring focus to next display/screen
hs.hotkey.bind(hyper, "§", function ()
  focusScreen(hs.window.focusedWindow():screen():next())
end)

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

-- Brings focus to the scren by setting focus on the front-most application in it.
-- Also move the mouse cursor to the center of the screen. This is because
-- Mission Control gestures & keyboard shortcuts are anchored, oddly, on where the
-- mouse is focused.
function focusScreen(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()

  -- Move mouse to center of screen
  local pt = geometry.rectMidPoint(screen:fullFrame())
  mouse.setAbsolutePosition(pt)
end

-- END DISPLAY FOCUS SWITCHING --