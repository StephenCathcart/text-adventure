local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local EventBanner = {
    location = nil,
    title = nil,
    description = nil
}

function EventBanner:load(location, event)
    EventBanner.location = location
    EventBanner.title = event.title
    EventBanner.description = event.description
end

local function draw_event()
    local event_text = {
        color.common, "\t[",
        color.legendary, EventBanner.title,
        color.common, "] "..EventBanner.description,
    }
    love.graphics.print(event_text, 0, util.y_offset(EventBanner.location + 1))
end

local function draw_help()
    local help_text = {
        color.common, "[",
        color.exotic, "E",
        color.common, "]Event\t",
    }
    love.graphics.printf(help_text, 0, util.y_offset(EventBanner.location + 1), love.graphics.getWidth(), "right")
end

function EventBanner:draw()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(EventBanner.location))
    -- Draw event
    draw_event()
    -- Draw help
    draw_help()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(EventBanner.location + 2))
end

return EventBanner
