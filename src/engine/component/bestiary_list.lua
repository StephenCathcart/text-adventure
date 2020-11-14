local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local BestiaryList = {
    location = nil
}

local function dashes(id)
    local dashes = ""
    if id < 10 then dashes = "---"
    elseif id < 100 then dashes = "--"
    elseif id < 1000 then dashes = "-"
    end
    return dashes
end

local function left_demon(id, name)
    return {
        color.common, "¦",
        color.common, "\t[",
        color.exotic, id,
        color.common, "]",
        color.trash, dashes(id)..">["..name.."]",
    }
end

local function center_demon(id, name)
    return {
        color.common, "[",
        color.exotic, id,
        color.common, "]",
        color.trash, dashes(id)..">["..name.."]",
    }
end

local function right_demon(id, name)
    -- TODO need to find longest text on right hand side
    local longest_text = 18
    local right_text = "["..id.."]"..dashes(id)..">["..name.."]"
    local spaces = ""
    for i = #right_text, longest_text do 
        spaces = spaces.." "
    end

    return {
        color.common, "[",
        color.exotic, id,
        color.common, "]",
        color.trash, dashes(id)..">["..name.."]"..spaces.."\t¦",
    }
end

local function draw_left_demon(text, offset)
    love.graphics.print(text, 0, util.y_offset(BestiaryList.location + offset))
end

local function draw_center_demon(text, offset)
    local center = love.graphics.getWidth() / 2
    -- TODO need to find longest string in center
    local half_longest_text = font.default:getWidth("[10]-->SQURTILE") / 2
    love.graphics.print(text, center - half_longest_text, util.y_offset(BestiaryList.location + offset))
end

local function draw_right_demon(text, offset)
    love.graphics.printf(text, 0, util.y_offset(BestiaryList.location + offset), love.graphics.getWidth(), "right")
end

function BestiaryList:load(location)
    BestiaryList.location = location
end

function BestiaryList:draw()
    -- LEFT
    draw_left_demon(left_demon(1, "BULBASAUR"), 0)
    draw_left_demon(left_demon(2, "CHARMANDER"), 1)
    draw_left_demon(left_demon(3, "ODDISH"), 2)
    draw_left_demon(left_demon(4, "FARFETCH'D"), 3)
    draw_left_demon(left_demon(5, "GENGAR"), 4)
    draw_left_demon(left_demon(6, "DRAGONITE"), 5)
    draw_left_demon(left_demon(7, "MEW"), 6)
    draw_left_demon(left_demon(8, "BEEDRILL"), 7)
    draw_left_demon(left_demon(9, "VENONAT"), 8)
    draw_left_demon(left_demon(10, "..."), 9)
    draw_left_demon(left_demon(11, "STARMIE"), 10)
    draw_left_demon(left_demon(12, "SANDSLASH"), 11)
    draw_left_demon(left_demon(13, "BUTTERFREE"), 12)
    -- CENTER
    draw_center_demon(center_demon(14, "ZAPDOS"), 0)
    draw_center_demon(center_demon(15, "TAUROS"), 1)
    draw_center_demon(center_demon(16, "DOORIO"), 2)
    draw_center_demon(center_demon(17, "SQURTILE"), 3)
    draw_center_demon(center_demon(18, "VENUSAUR"), 4)
    draw_center_demon(center_demon(19, "CATERPIE"), 5)
    draw_center_demon(center_demon(20, "KAKUNA"), 6)
    draw_center_demon(center_demon(21, "PIDGEY"), 7)
    draw_center_demon(center_demon(22, "RATTATA"), 8)
    draw_center_demon(center_demon(23, "EKANS"), 9)
    draw_center_demon(center_demon(24, "ARBOK"), 10)
    draw_center_demon(center_demon(25, "PICKACHU"), 11)
    draw_center_demon(center_demon(26, "RAICHU"), 12)
    -- RIGHT
    draw_right_demon(right_demon(27, "MOLTRES"), 0)
    draw_right_demon(right_demon(28, "SANDSHREW"), 1)
    draw_right_demon(right_demon(29, "NIDORAN"), 2)
    draw_right_demon(right_demon(30, "CLEFAIRY"), 3)
    draw_right_demon(right_demon(31, "VULPIX"), 4)
    draw_right_demon(right_demon(32, "NINETAILS"), 5)
    draw_right_demon(right_demon(33, "ZUBAT"), 6)
    draw_right_demon(right_demon(34, "GOLBAT"), 7)
    draw_right_demon(right_demon(35, "GLOOM"), 8)
    draw_right_demon(right_demon(36, "DIGLETT"), 9)
    draw_right_demon(right_demon(37, "PERSIAN"), 10)
    draw_right_demon(right_demon(38, "MANKEY"), 11)
    draw_right_demon(right_demon(39, "POLIWAG"), 12)
end

return BestiaryList
