local class = require("src.core.class")
local guard = require("src.core.guard")
local DemonBio = class:derive("DemonBio")

function DemonBio:new(name, rank, legions, description, height, weight)
    assert(guard.string(name), "invalid name")
    assert(guard.string(rank), "invalid rank")
    assert(guard.number(legions), "invalid legions")
    assert(guard.string(description), "invalid description")
    assert(guard.number(height), "invalid height")
    assert(guard.number(weight), "invalid weight")
    self.name = name
    self.rank = rank
    self.legions = legions
    self.description = description
    self.height = height
    self.weight = weight
end

return DemonBio