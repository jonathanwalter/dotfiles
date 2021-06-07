border = nil

function drawBorder()
    if border then
        border:delete()
    end

    local win = hs.window.focusedWindow()
    if win == nil then return end

    local screen = win:screen()
    local max = screen:fullFrame()
    local f = win:frame()

    border = hs.canvas.new{x=max.x, y=max.y, h=max.h, w=max.w}
    border:appendElements({
        type = "rectangle",
        action="stroke",
        strokeWidth=3.0,
        strokeColor= {green=1.0},
        roundedRectRadii = { xRadius = 6, yRadius = 6 },
        frame = {x=f.x, y=f.y, h=f.h, w=f.w}
        })

    border:show()
end

drawBorder()

windows = hs.window.filter.new(nil)
windows:keepActive()
windows:subscribe(hs.window.filter.windowFocused, function () drawBorder() end)
windows:subscribe(hs.window.filter.windowUnfocused, function () drawBorder() end)
-- windows:subscribe(hs.window.filter.windowMoved, function () drawBorder() end)
-- windows:subscribe(hs.window.filter.windowInCurrentSpace, function () drawBorder() end)