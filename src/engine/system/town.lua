local array_util = require("src.core.array_util")
local game_state = require("src.storage.game_state")
local archives = require("src.engine.system.archives")

local Town = {
    data = {
        week = 0,
        gold = 0,
        souls = 0,
        soulstones = 0,
        roster_current = 0,
        roster_max = 0
    }
}

function Town:enter()
        self.data.week = game_state.data.week or 1 -- @todo need to implement week system
        self.data.gold = game_state.data.gold
        self.data.souls = game_state.data.souls
        self.data.soulstones = game_state.data.soulstones
        self.data.roster_current = array_util.count(game_state.data.roster)
        self.data.roster_max = archives:get_roster_size()
end

return Town
