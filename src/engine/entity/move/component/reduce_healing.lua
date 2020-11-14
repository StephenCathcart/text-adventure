local log = require("lib.log")
local class = require("src.core.class")
local guard = require("src.core.guard")
local effect = require("src.engine.entity.move.component.effect")
local ReduceHealing = effect:derive("ReduceHealing")

function ReduceHealing:new(target, power, turns)
    assert(guard.string(target), "invalid target")
    assert(guard.number(power), "invalid power")
    assert(guard.number(turns), "invalid turns")
    self.name = "REDUCE_HEALING"
    self.target = target
    self.power = power
    self.turns = turns
end

-- Apply effect.
-- @param source The demon applying the efect.
-- @param target The demon being targeted by the effect.
function ReduceHealing:apply(source, target)
    log.trace("reduce_healing:apply")
    source.base.hp = source.base.hp - 1 -- TODO
    print(self.target)
    print(self.power)
    print(self.turns)
end

return ReduceHealing
