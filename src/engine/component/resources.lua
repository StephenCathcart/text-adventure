local array_util = require("src.core.array_util")
local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local Resources = {
    location = nil,
    gold = nil,
    roster = {
        current = nil,
        max = nil
    },
    souls = nil,
    soulstones = nil
}

function Resources:load(location, resources)
    Resources.location = location
    Resources.gold = resources.gold
    Resources.roster = resources.roster
    Resources.souls = resources.souls
    Resources.soulstones = resources.soulstones
end

function Resources:draw()
    resources_text = {
        color.common, "\tGold: ",
        color.uncommon, self.gold,
        color.common, "\tRoster: ",
        color.uncommon, self.roster.current.."/"..self.roster.max,
        color.common, "\tSouls: ",
        color.uncommon, array_util.count(self.souls),
        color.common, "\tSoulstones: ",
        color.uncommon, self.soulstones,
    }
    love.graphics.print(resources_text, 0, util.y_offset(Resources.location))
end

return Resources
