local log = require("lib.log")
local loader = require("src.data.loader")
local damage = require("src.engine.entity.move.component.damage")
local heal_max_hp = require("src.engine.entity.move.component.heal_max_hp")
local reduce_healing = require("src.engine.entity.move.component.reduce_healing")
local physical_absorb = require("src.engine.entity.move.component.physical_absorb")
local move = require("src.engine.entity.move.move")

local MoveStore = {
    moves = {}
}

local function load_effect(effect)
    log.trace("movestore:load_effect:" .. (effect.name or ""))
    if effect.name == "DAMAGE" then
        return damage(effect.target, effect.power, effect.conditions)
    elseif effect.name == "HEAL_MAX_HP" then
        return heal_max_hp(effect.target, effect.power)
    elseif effect.name == "REDUCE_HEALING" then
        return reduce_healing(effect.target, effect.power, effect.turns)
    elseif effect.name == "PHYSICAL_ABSORB" then
        return physical_absorb(effect.target, effect.power)
    else
        error("invalid_effect: " .. (effect.name or ""))
    end
end

-- Loads all moves from data files into memory.
function MoveStore:load()
    local moves = loader.load("moves")
    for key, value in pairs(moves) do
        local effects = {}
        for _, effect in pairs(value.effects) do
            table.insert(effects, load_effect(effect))
        end

        local move = move(
            value.name, 
            value.description, 
            value.cost, 
            value.priority, 
            value.family, 
            value.category, 
            effects
        )
        log.trace("movestore:load:move:" .. move.name)
        self.moves[value.name] = move
    end
end

return MoveStore
