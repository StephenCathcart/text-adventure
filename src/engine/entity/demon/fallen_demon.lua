local class = require("src.core.class")
local guard = require("src.core.guard")
local FallenDemon = class:derive("FallenDemon")

function FallenDemon:new(id, xp, passive, moveset, cod)
    assert(guard.number(id), "invalid id")
    assert(guard.number(xp), "invalid xp")
    assert(guard.string(passive), "invalid passive")
    assert(guard.array(moveset), "invalid moveset")
    assert(guard.class(cod, "CauseOfDeath"), "invalid cod")
    self.id = id
    self.xp = xp
    self.passive = passive
    self.moveset = moveset
    self.cod = cod
end

return FallenDemon
