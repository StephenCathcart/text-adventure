local class = require("src.core.class")
local guard = require("src.core.guard")
local Demon = class:derive("Demon")

function Demon:new(id, bio, base, types, passives, ultimate)
    assert(guard.number(id), "invalid id")
    assert(guard.class(bio, "DemonBio"), "invalid bio")
    assert(guard.class(base, "DemonBase"), "invalid base")
    assert(guard.array(types), "invalid types")
    assert(guard.array(passives), "invalid passives")
    assert(guard.string(ultimate), "invalid ultimate")
    self.id = id
    self.bio = bio
    self.base = base
    self.types = types
    self.passives = passives
    self.ultimate = ultimate
    -- persistent data below from game state data
    self.hp = 0
    self.xp = 0
    self.moveset = {}
    self.passive = ""
    self.afflictions = {}
end

function Demon:set_unique_data(hp, xp, moveset, passive, afflictions)
    assert(guard.number(hp), "invalid hp")
    assert(guard.number(xp), "invalid xp")
    assert(guard.array(moveset), "invalid moveset")
    assert(guard.string(passive), "invalid passive")
    assert(guard.class(afflictions, "DemonAfflictions"), "invalid afflictions")
    self.hp = hp
    self.xp = xp
    self.moveset = moveset
    self.passive = passive
    self.afflictions = afflictions
end

return Demon
