local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local BestiaryInfo = {
    location = nil
}

function BestiaryInfo:load(location, data)
    BestiaryInfo.location = location
end

local function left_action()
    return {
        color.common, "¦",
        color.common, "\t[",
        color.exotic, "P",
        color.common, "]Previous",
        color.common, "\t[",
        color.exotic, "N",
        color.common, "]Next",
    }
end

function BestiaryInfo:draw()
    -- love.graphics.print("¦\t[A]Action", 0, util.y_offset(BestiaryInfo.location))
    love.graphics.printf("<<Seen: 132\tSouls: 32>>", 0, util.y_offset(BestiaryInfo.location), love.graphics.getWidth(), "center")

    -- Draw margin
    -- love.graphics.print(util.margin(), 0, util.y_offset(BestiaryInfo.location))
    -- -- Draw left actions
    -- love.graphics.print(left_action(), 0, util.y_offset(BestiaryInfo.location + 1))
    -- -- Draw right actions
    -- love.graphics.printf(right_action(), 0, util.y_offset(BestiaryInfo.location + 1), love.graphics.getWidth(), "right")
    -- -- Draw margin
    -- love.graphics.print(util.margin(), 0, util.y_offset(BestiaryInfo.location + 2))
end

return BestiaryInfo
