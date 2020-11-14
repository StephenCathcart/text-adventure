local loader = require("src.data.loader")
local guard = require("src.core.guard")
local clone = require("src.core.clone")
local game_state = require("src.storage.game_state")
local demon_afflictions = require("src.engine.entity.demon.demon_afflictions")
local demon_base = require("src.engine.entity.demon.demon_base")
local demon_bio = require("src.engine.entity.demon.demon_bio")
local demon = require("src.engine.entity.demon.demon")

local DemonStore = {
    demons = {}
}

-- Loads all demons from data files into memory.
function DemonStore:load()
    local demons = loader.load("demons")
    for _, value in pairs(demons) do
        local demon_bio =
            demon_bio(
            value.bio.name,
            value.bio.rank,
            value.bio.legions,
            value.bio.description,
            value.bio.height,
            value.bio.weight
        )
        local demon_base =
            demon_base(
            value.base.hp,
            value.base.attack,
            value.base.defence,
            value.base.spell_attack,
            value.base.spell_defence,
            value.base.speed
        )
        local demon = demon(value.id, demon_bio, demon_base, value.types, value.passives, value.ultimate)
        self.demons[value.id] = demon
    end
end

function DemonStore:get_roster()
    local demons = {}
    for _, v in pairs(game_state.data.roster) do
        local demon = clone.deep(self.demons[v.id])
        local demon_afflictions =
            demon_afflictions(
            v.afflictions.bleeds,
            v.afflictions.burns,
            v.afflictions.chills,
            v.afflictions.cripples,
            v.afflictions.plagues
        )
        demon:set_unique_data(v.hp, v.xp, v.moveset, v.passive, demon_afflictions)
        table.insert(demons, demon)
    end
    return demons
end

function DemonStore.add_to_roster(demon)
    assert(guard.class(demon, "Demon"), "invalid demon")
    table.insert(
        game_state.data.roster,
        {
            id = demon.id,
            hp = demon.hp,
            xp = demon.xp,
            moveset = demon.moveset,
            passive = demon.passive,
            afflictions = demon.afflictions
        }
    )
    game_state.save()
end

return DemonStore
