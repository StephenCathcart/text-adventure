local class = require("src.core.class")
local guard = require("src.core.guard")
local DemonBase = class:derive("DemonBase")

function DemonBase:new(hp, attack, defence, spell_attack, spell_defence, speed)
    assert(guard.number(hp), "invalid hp")
    assert(guard.number(attack), "invalid attack")
    assert(guard.number(defence), "invalid defence")
    assert(guard.number(spell_attack), "invalid spell_attack")
    assert(guard.number(spell_defence), "invalid spell_defence")
    assert(guard.number(speed), "invalid speed")
    self.hp = hp
    self.attack = attack
    self.defence = defence
    self.spell_attack = spell_attack
    self.spell_defence = spell_defence
    self.speed = speed
end

return DemonBase
