local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local ShopBanner = {
    location = nil,
    owner = nil,
    intro = nil
}

function ShopBanner:load(location, event)
    ShopBanner.location = location
    ShopBanner.owner = event.owner
    ShopBanner.intro = event.intro
end

local function draw_owner_intro()
    local owner_text = {
        color.common, "\t",
        color.rare, ShopBanner.owner,
        color.common, ": "..ShopBanner.intro,
    }
    love.graphics.print(owner_text, 0, util.y_offset(ShopBanner.location + 1))
end

local function draw_upgrade()
    local upgrade_text = {
        color.common, "[",
        color.exotic, "U",
        color.common, "]Upgrade\t",
    }
    love.graphics.printf(upgrade_text, 0, util.y_offset(ShopBanner.location + 1), love.graphics.getWidth(), "right")
end

function ShopBanner:draw()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(ShopBanner.location))
    -- Draw owner intro
    draw_owner_intro()
    -- Draw upgrade
    draw_upgrade()
    -- Draw margin
    love.graphics.print(util.margin(), 0, util.y_offset(ShopBanner.location + 2))
end

return ShopBanner
