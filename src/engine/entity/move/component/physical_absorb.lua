local log = require("lib.log")
local class = require("src.core.class")
local guard = require("src.core.guard")
local effect = require("src.engine.entity.move.component.effect")
local PhysicalAbsorb = effect:derive("PhysicalAbsorb")

function PhysicalAbsorb:new(target, power)
    assert(guard.string(target), "invalid target")
    assert(guard.number(power), "invalid power")
    self.name = "PHYSICAL_ABSORB"
    self.target = target
    self.power = power
end

-- Apply effect.
-- @param source The demon applying the efect.
-- @param target The demon being targeted by the effect.
function PhysicalAbsorb:apply(source, target)
    log.trace('physical_absorb:apply')
    source.base.hp = source.base.hp - 90 -- TODO

end

return PhysicalAbsorb