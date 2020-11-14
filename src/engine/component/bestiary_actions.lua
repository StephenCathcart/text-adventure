local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local BestiaryActions = {
    location = nil
}

function BestiaryActions:load(location, data)
    BestiaryActions.location = location
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

local function right_action(key, name)
    return {
        color.common, "\t[",
        color.exotic, "B",
        color.common, "]Back\t¦",
    }
end

function BestiaryActions:draw()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(BestiaryActions.location))
    -- Draw left actions
    love.graphics.print(left_action(), 0, util.y_offset(BestiaryActions.location + 1))
    -- Draw right actions
    love.graphics.printf(right_action(), 0, util.y_offset(BestiaryActions.location + 1), love.graphics.getWidth(), "right")
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(BestiaryActions.location + 2))
end

return BestiaryActions
