local class = require("src.core.class")
local guard = require("src.core.guard")
local Provision = class:derive("Provision")

function Provision:new(name, description, cost, weight)
    assert(guard.string(name), "invalid name")
    assert(guard.string(description), "invalid description")
    assert(guard.number(cost), "invalid cost")
    assert(guard.number(weight), "invalid weight")
    self.name = name
    self.description = description
    self.cost = cost
    self.weight = weight
end

return Provision