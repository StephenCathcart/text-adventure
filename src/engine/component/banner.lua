local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local Banner = {
    location = nil,
    title = nil,
    subtitle = nil,
    week = nil
}

function Banner:load(location, data)
    Banner.location = location
    Banner.title = data.title
    Banner.subtitle = data.subtitle
    Banner.week = data.week
end

local function draw_week()
    if Banner.week then
        love.graphics.printf("\tWeek: " .. Banner.week, 0, util.y_offset(Banner.location + 1), love.graphics.getWidth(), "left")
    end
end

local function draw_subtitle(center_text)
    if Banner.subtitle then
        table.insert(center_text, color.trash)
        table.insert(center_text, " <" .. Banner.subtitle .. ">")
    end
end

local function draw_center_text()
    local center_text = {color.common, Banner.title}
    draw_subtitle(center_text)
    draw_week()
    love.graphics.printf(center_text, 0, util.y_offset(Banner.location + 1), love.graphics.getWidth(), "center")
end

function Banner:draw()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(Banner.location))
    -- Draw center text
    draw_center_text()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(Banner.location + 2))
end

return Banner
