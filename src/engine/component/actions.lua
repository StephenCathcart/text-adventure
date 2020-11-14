local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local Actions = {
    location = nil
}

function Actions:load(location, data)
    Actions.location = location
end

local function text_length(colored_text)
    local text = colored_text[2]..colored_text[4]..colored_text[6]
    return font.default:getWidth(text)
end

local function left_action(key, name)
    return {
        color.common, "¦",
        color.common, "\t[",
        color.exotic, key,
        color.common, "]"..name,
    }
end

local function center_action(key, name)
    return {
        color.common, "[",
        color.exotic, key,
        color.common, "]"..name,
    }
end

local function right_action(key, name)
    return {
        color.common, "¦\t[",
        color.exotic, key,
        color.common, "]"..name.."\t¦",
    }
end

local function print_left(text, offset)
    love.graphics.print(text, 0, util.y_offset(Actions.location + offset))
end

local function print_center(text, offset)
    local center = love.graphics.getWidth() / 2
    local half_longest_text = font.default:getWidth("[P]Pack Rat's Wagon") / 2
    love.graphics.print(text, center - half_longest_text, util.y_offset(Actions.location + offset))
end

local function print_right(text, offset)
    love.graphics.printf(text, 0, util.y_offset(Actions.location + offset), love.graphics.getWidth(), "right")
end

local function draw_left_actions()
    print_left(left_action("A", "Archives"), 0)
    print_left(left_action("C", "Crypt"), 1)
    print_left(left_action("F", "Ferryman"), 2)
    print_left(left_action("G", "Graveyard"), 3)
    print_left(left_action("H", "Hermit's Hovel"), 4)
end

local function draw_center_actions()
    print_center(center_action("J", "Jujibo's Shack"), 0)
    print_center(center_action("P", "Pack Rat's Wagon"), 1)
    print_center(center_action("S", "Secluded Cove"), 2)
    print_center(center_action("T", "Tavern"), 3)
    print_center(center_action("Z", "Zed's Clinic"), 4)
end

local function draw_right_actions()
    print_right(right_action("I", "Inventory   "), 0)
    print_right(right_action("N", "Necronomicon"), 1)
    love.graphics.printf("¦-----------------------¦", 0, util.y_offset(Actions.location + 2), love.graphics.getWidth(), "right")
    print_right(right_action("M", "Manual      "), 3)
    print_right(right_action("Q", "Quit        "), 4)
end

function Actions:draw()
    -- Draw left actions
    draw_left_actions()
    -- Draw center actions
    draw_center_actions()
    -- Draw right actions
    draw_right_actions()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(Actions.location + 5))
end

return Actions
