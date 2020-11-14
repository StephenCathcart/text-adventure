local class = require("src.core.class")
local guard = require("src.core.guard")
local Move = class:derive("Move")

function Move:new(name, description, cost, priority, family, category, effects)
    assert(guard.string(name), "invalid name")
    assert(guard.string(description), "invalid description")
    assert(guard.number(cost), "invalid cost")
    assert(guard.number(priority), "invalid priority")
    assert(guard.string(family), "invalid family")
    assert(guard.string(category), "invalid category")
    assert(guard.array_of_super(effects, 'Effect'), "invalid effects")
    self.name = name
    self.description = description
    self.cost = cost
    self.priority = priority
    self.family = family
    self.category = category
    self.effects = effects
end

-- Iterate through all of the moves effects.
-- @param source The demon activating the move.
-- @param target The demon being targeted by the move.
function Move:activate(source, target)
    assert(guard.class(source, 'Demon'), 'invalid source')
    assert(guard.class(target, 'Demon'), 'invalid target')
    for _, effect in pairs(self.effects) do
        effect:apply(source, target)
    end
end

return Move
