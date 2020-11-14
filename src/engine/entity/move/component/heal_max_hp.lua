local log = require("lib.log")
local class = require("src.core.class")
local guard = require("src.core.guard")
local effect = require("src.engine.entity.move.component.effect")
local HealMaxHP = effect:derive("HealMaxHP")

function HealMaxHP:new(target, power)
    assert(guard.string(target), "invalid target")
    assert(guard.number(power), "invalid power")
    self.name = "HEAL_MAX_HP"
    self.target = target
    self.power = power
end

-- Apply effect.
-- @param source The demon applying the efect.
-- @param target The demon being targeted by the effect.
function HealMaxHP:apply(source, target)
    log.trace('heal_max_hp:apply')
    source.base.hp = source.base.hp - 100 -- TODO

end

return HealMaxHP