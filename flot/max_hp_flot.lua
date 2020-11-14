-- basic-flot.lua
local flot = require("lib.dev.flot")
local formula = require("src.engine.math.formula")

-- max hp per level - slowest and fastest for base 1s and 1.5s
local mhp_b10_m05, mhp_b255_m05, mhp_b10_m1, mhp_b255_m1, mhp_b10_m15, mhp_b255_m15 = {}, {}, {}, {}, {}, {}
for lvl = 1, 10 do
    -- lowest
    mhp_b10_m05[lvl]  = {lvl, formula.max_hp(10, lvl, 0.5)}
    mhp_b255_m05[lvl] = {lvl, formula.max_hp(255, lvl, 0.5)}
    -- average
    mhp_b10_m1[lvl]  = {lvl, formula.max_hp(10, lvl, 1)}
    mhp_b255_m1[lvl] = {lvl, formula.max_hp(255, lvl, 1)}
    -- highest
    mhp_b10_m15[lvl]  = {lvl, formula.max_hp(10, lvl, 1.5)}
    mhp_b255_m15[lvl] = {lvl, formula.max_hp(255, lvl, 1.5)}
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
        content = "%s | Level: %x | Max.HP: %y"
    }
}

p:add_series("mhp_b10_m05", mhp_b10_m05, {shadowSize = 0, color = "#000000", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("mhp_b255_m05", mhp_b255_m05, {shadowSize = 0, color = "#36f7f5", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("mhp_b10_m1", mhp_b10_m1, {shadowSize = 0, color = "#f320bc", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("mhp_b255_m1", mhp_b255_m1, {shadowSize = 0, color = "#f58429", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("mhp_b10_m15", mhp_b10_m15, {shadowSize = 0, color = "#f320bc", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("mhp_b255_m15", mhp_b255_m15, {shadowSize = 0, color = "#f58429", lines = {lineWidth = 1, show = true}, points = {show = true}})
flot.render(p)
