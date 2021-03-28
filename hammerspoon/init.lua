-- Reload config on write
function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config reloaded")

-- Custom stuff
-- require "windowborder"
-- require('position')

stackline = require "stackline.stackline.stackline"

local stacklineConfig = {
    appearance = {
        showIcons = true,
        radius = 6,
        dimmer = 4,
        iconDimmer = 1,
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