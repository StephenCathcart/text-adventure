local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local ShopActions = {
    location = nil
}

function ShopActions:load(location)
    ShopActions.location = location
end

local function left_action(key, name, help)
    left_text = {
        color.common, "¦",
        color.common, "\t[",
        color.exotic, key,
        color.common, "]"..name,
    }
    if help then
        table.insert(left_text, color.trash)
        table.insert(left_text, help)
    end
    return left_text
end

local function right_action(key, name)
    return {
        color.common, "\t[",
        color.exotic, key,
        color.common, "]"..name.."\t¦",
    }
end

local function print_left(text, offset)
    love.graphics.print(text, 0, util.y_offset(ShopActions.location + offset))
end

local function print_right(text, offset)
    love.graphics.printf(text, 0, util.y_offset(ShopActions.location + offset), love.graphics.getWidth(), "right")
end

local function draw_left_actions()
    print_left(left_action("1", "Talk"), 0)
    print_left(left_action("2", "Evocation", "------->[Roster   : 5/9]"), 1)
    print_left(left_action("3", "Awakening", "------->[Eligible :   0]"), 2)
    print_left(left_action("4", "Skills"), 3)
end

local function draw_right_actions()
    print_right("¦", 0)
    print_right("¦", 1)
    print_right("¦", 2)
    print_right(right_action("B", "Back"), 3)
end

function ShopActions:draw()
    -- Draw left actions
    draw_left_actions()
    -- Draw right actions
    draw_right_actions()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(ShopActions.location + 4))
end

return ShopActions
