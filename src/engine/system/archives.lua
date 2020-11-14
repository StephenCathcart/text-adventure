local guard = require("src.core.guard")
local game_state = require("src.storage.game_state")
local reputation = require("src.engine.math.reputation")

local Archives = {
    reputation = nil,
    roster_size = {
        feared = 8,
        tolerated = 12,
        revered = 16,
        hallowed = 20
    },
    available_demons = {
        feared = 2,
        tolerated = 4,
        revered = 6,
        hallowed = 8
    },
    demon_level = {
        feared = 1,
        tolerated = 2,
        revered = 4,
        hallowed = 8
    }
}

function Archives:init()
    self.reputation = game_state.data.reputation.archives or 0 -- @todo load reputation from - game state data archive reputation
    local reputation_name = reputation:to_name(self.reputation)

    print(self.roster_size[reputation_name])
    print(self.available_demons[reputation_name])
    print(self.demon_level[reputation_name])
end

-- talk to librarian to learn about services
function Archives:talk()
    return "hello"
end

-- express interest in a type of demon increasing chances next week.
function Archives:express_interest()
end

-- learn demon scriptures for necronomicon. Restocked weekly. Burn on use.
function Archives:demon_scriptures()
end

function Archives:is_hall_of_fame_available()
end

-- contains information of the team used to defeat The Devil's Gate.
function Archives:hall_of_fame()
end

function Archives:is_upgrade_available()
end

-- upgrade the archives with parchments
function Archives:upgrade(artefacts)
    assert(artefacts > 0, "negative artefacts")
    assert(guard.number(artefacts), "invalid artefacts")
    -- set game state data archive reputation
    game_state.data.artefacts.parchment = game_state.data.artefacts.parchment - artefacts
end

function Archives:get_roster_size()
    self.reputation = game_state.data.reputation.archives or 0
    local reputation_name = reputation:to_name(self.reputation)
    return self.roster_size[reputation_name]
end

return Archives
