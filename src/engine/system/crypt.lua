local guard = require("src.core.guard")
local formula = require("src.engine.math.formula")
local string_util = require("src.core.string_util")
local game_state = require("src.storage.game_state")
local reputation = require("src.engine.math.reputation")

local Crypt = {
    reputation = nil,
    evocation_cost = {
        feared = 4,
        tolerated = 3,
        revered = 2,
        hallowed = 1
    },
    awakening_cost = {
        feared = 2,
        tolerated = 4,
        revered = 6,
        hallowed = 8
    },
    skill_cost = {
        feared = 1,
        tolerated = 2,
        revered = 4,
        hallowed = 8
    }
}

function Crypt:enter()
    self.reputation = game_state.data.reputation.crypt or 0

    print(self.evocation_cost[reputation:to_name(self.reputation)])
    print(self.awakening_cost[reputation:to_name(self.reputation)])
    print(self.skill_cost[reputation:to_name(self.reputation)])
end

-- talk to crypt keeper to learn about services
function Crypt.talk()
    return "hello"
end

function Crypt.awakening_eligibility()
    local awakening_count = 0
    for _, demon in pairs(game_state.data.roster) do
        if (formula.current_level(demon.xp) >= 6 and not demon.awakened) then
            awakening_count = awakening_count + 1
        end
    end
    return awakening_count
end

function Crypt:reputation_name()
    return string_util.first_to_upper(reputation:to_name(self.reputation))
end

function Crypt:reputation_stats()
    return reputation:stats(self.reputation)
end

return Crypt
