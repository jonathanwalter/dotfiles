-- Reload config on write
function reload_config(files)
    hs.reload()
    hs.alert.show("Config reloaded")
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-- Custom stuff
-- require "windowborder"
-- require('position')

stackline = require "stackline.stackline.stackline"

local stacklineConfig = {
    appearance = {
        color = { white = 0 },
        showIcons = true,
        radius = 6,
        dimmer = 5,
        iconDimmer = 1.5,
        iconPadding = 4,
        size = 30,
        pillThinness = 4,
    },
    features = {
        fzyFrameDetect = {
            fuzzFactor = 20
        },
    },
}

stackline:init(stacklineConfig)