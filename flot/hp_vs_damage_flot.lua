-- basic-flot.lua
local flot = require("lib.dev.flot")
local formula = require("src.engine.math.formula")

-- max hp per level - slowest and fastest for base 1s and 1.5s
local hp_127_m1, dmg_p80_a400_d200_m1 = {}, {}
for lvl = 1, 10 do
    -- lowest

    -- average
    hp_127_m1[lvl]  = {lvl, formula.max_hp(127, lvl, 1)}
    dmg_p80_a400_d200_m1[lvl] = {lvl, formula.damage(lvl, 80, 400, 200, 1)}
    -- highest
end

local p =
    flot.Plot {
    yaxis = {ticks = 25},
    width = 1200,
    height = 620,
    legend = {
        position = "nw"
    },
    grid = {
        borderWidth = 1,
        hoverable = true
    },
    tooltip = {
        show = true,
        content = "%s | Level: %x | Value: %y"
    }
}

p:add_series("hp_127_m1", hp_127_m1, {shadowSize = 0, color = "#f320bc", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("dmg_p80_a400_d200_m1", dmg_p80_a400_d200_m1, {shadowSize = 0, color = "#f58429", lines = {lineWidth = 1, show = true}, points = {show = true}})
flot.render(p)
