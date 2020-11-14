local guard = require("src.core.guard")

local Formula = {}

local level_max = 10
local min_xp_yield = 20
local party_size = 4
local base_stat_min = 1
local base_stat_max = 255

-- Returns the minimum number of experience points required for a demon to be at given level.
-- @param level Required demon level.
function Formula.required_xp(level)
    assert(level > 0, "invalid level")
    return math.floor(4 * (level ^ 3) / 5)
end

-- Returns the level of the demon given their accrued experience.
-- @param xp Demons accrued experience.
function Formula.current_level(xp)
    assert(xp >= 0, "negative xp")
    for level = 1, level_max do
        local required_xp = Formula.required_xp(level)
        if xp < required_xp then
            return level - 1
        end
    end
    return level_max
end

-- Returns the gained xp per party member for defeating demon.
-- @param base The base experience yield of the defeated demon species.
-- @param level The level of the defeated demon.
-- @param party The number of alive demons remaining in party.
-- @param mod Any modifications, defaults to 1.
function Formula.gained_xp(base, level, party, mod)
    assert(base >= min_xp_yield, "invalid base")
    assert(level > 0, "invalid level")
    assert(party > 0, "party too small")
    assert(party <= party_size, "party too large")
    mod = mod or 1
    return math.floor((base * level * mod) / (5 * party))
end

-- Return max hit points of demon given it's base hp stat and level.
-- @param base The base hit points of demon species.
-- @param level The level of the demon.
-- @param mod Any modification of HP such as ±0.5 passives or enchantments.
function Formula.max_hp(base, level, mod)
    assert(base >= base_stat_min and base <= base_stat_max, "invalid base")
    assert(level > 0, "invalid level")
    mod = mod or 1
    return math.floor((((base * 2 * level) / level_max) + level + 10) * mod)
end

-- Return max stat points (except hp) of demon given it's base stat and level.
-- @param base The base stat of demon species, (not for hp).
-- @param level The level of the demon.
-- @param mod Any modification of stat such as ±0.5 of 1 passives or enchantments.
function Formula.max_stat(base, level, mod)
    assert(base >= base_stat_min and base <= base_stat_max, "invalid base")
    assert(level > 0, "invalid level")
    mod = mod or 1
    return math.floor((((base * 2 * level) / level_max) + level) * mod)
end

-- Return damage against foe for the attacking demon.
-- @param level The level of the attacking demon.
-- @param power The effective power of used move.
-- @param attack The effective attack or spell attack stat of the attacking demon.
-- @param defence The effective defence or spell defence stat of the attacking demon.
-- @param mod Modification calculated as weather * type * burn where each is ±0.5 of 1.
function Formula.damage(level, power, attack, defence, mod)
    assert(level > 0, "invalid level")
    assert(guard.number(power), "invalid power")
    assert(guard.number(attack), "invalid attack")
    assert(guard.number(defence), "invalid defence")
    mod = mod or 1
    return math.floor(((((((10 * level) / 5) + 2) * power * (attack / defence) + 2) / 50) + 2) * mod)
end

return Formula
