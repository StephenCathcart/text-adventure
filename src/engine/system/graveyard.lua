local log = require("lib.log")
local guard = require("src.core.guard")
local array_util = require("src.core.array_util")
local game_state = require("src.storage.game_state")
local demon_store = require("src.engine.entity.demon.demon_store")
local fallen_demon = require("src.engine.entity.demon.fallen_demon")
-- may need to import demon_store to lookup demon by id for history and summoning

-- The graveyard holds a log of all fallen demons.
-- A soulstone can be used here to revive a single demon.
local Graveyard = {}

-- Returns dialogue from gravekeeper.
function Graveyard:talk()
    return "hello"
end

-- Return history of fallen demons, including their name, level and cause of death.
function Graveyard:view_history()
    local fallen_demons = {}
    for _, fallen_demon in pairs(game_state.data.graveyard) do
        assert(guard.class(fallen_demon, "FallenDemon"), "invalid fallen demon")
        table.insert(fallen_demons, fallen_demon)
    end
    return fallen_demons
end

-- THIS NEEDS REDONE TO FIT IN WITH NEW DEMON STORE
-- Revive a fallen demon if a soulstone is available.
function Graveyard:summon(fallen_demon)
    assert(guard.class(fallen_demon, "FallenDemon"), "invalid fallen demon")
    -- @todo create demon from fallen demon record and add to roster.
    -- local demon = demon_store
    -- consume a soulstone.
    game_state.data.soulstones = game_state.data.soulstones - 1
end

function Graveyard:is_summon_enabled()
    -- must have at least one soulstone
    if game_state.data.soulstones == 0 then
        return false
    end
    -- must have at least one demon in graveyard
    if array_util.count(game_state.data.graveyard) == 0 then
        return false
    end
    -- must have space in roster
    if array_util.count(game_state.data.roster) == 4 then -- @todo store 4 as roster max size
        return false
    end
    return true
end

return Graveyard