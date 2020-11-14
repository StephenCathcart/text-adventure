local log = require("lib.log")
local class = require("src.core.class")
local guard = require("src.core.guard")
local effect = require("src.engine.entity.move.component.effect")
local Damage = effect:derive("Damage")

function Damage:new(target, power, conditions)
    assert(guard.string(target), "invalid target")
    assert(guard.number(power), "invalid power")
    self.name = "DAMAGE"
    self.target = target
    self.power = power
    self.conditions = conditions
end

-- Apply effect.
-- @param source The demon applying the efect.
-- @param target The demon being targeted by the effect.
function Damage:apply(source, target)
    log.trace("damage:apply")
    -- TODO handle conditions
    local conditions = self.conditions or {}
    for _, condition in pairs(conditions) do
        local subject = target.base[condition.subject]
        if condition.operator == "<" and subject < condition.value then
            -- TODO return here as move has failed.
        end
    end

    source.base.hp = 999 -- TODO
end

return Damage
