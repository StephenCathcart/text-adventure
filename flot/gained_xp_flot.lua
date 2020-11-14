local flot = require("lib.dev.flot")
local formula = require("src.engine.math.formula")

local b20_t4, b50_t4 = {}, {}
local b20_t1, b50_t1 = {}, {}
local b20_t4_m1_5, b50_t4_m1_5 = {}, {}
local b20_t1_m1_5, b50_t1_m1_5 = {}, {}
for lvl = 1, 10 do
    --
    b20_t4[lvl] = {lvl, formula.gained_xp(20, lvl, 4, 1)}
    b50_t4[lvl] = {lvl, formula.gained_xp(50, lvl, 4, 1)}
    --
    b20_t1[lvl] = {lvl, formula.gained_xp(20, lvl, 1, 1)}
    b50_t1[lvl] = {lvl, formula.gained_xp(50, lvl, 1, 1)}
    --
    b20_t4_m1_5[lvl] = {lvl, formula.gained_xp(20, lvl, 4, 1.5)}
    b50_t4_m1_5[lvl] = {lvl, formula.gained_xp(50, lvl, 4, 1.5)}
    --
    b20_t1_m1_5[lvl] = {lvl, formula.gained_xp(20, lvl, 1, 1.5)}
    b50_t1_m1_5[lvl] = {lvl, formula.gained_xp(50, lvl, 1, 1.5)}
    --
end

local p =
    flot.Plot {
    -- legend at 'south east' corner
    legend = {position = "nw"}
}

p:add_series("b20_t4", b20_t4, {shadowSize = 0})
p:add_series("b50_t4", b50_t4, {shadowSize = 0})
p:add_series("b20_t1", b20_t1, {shadowSize = 0})
p:add_series("b50_t1", b50_t1, {shadowSize = 0})
p:add_series("b20_t4_m1_5", b20_t4_m1_5, {shadowSize = 0})
p:add_series("b50_t4_m1_5", b50_t4_m1_5, {shadowSize = 0})
p:add_series("b20_t1_m1_5", b20_t1_m1_5, {shadowSize = 0})
p:add_series("b50_t1_m1_5", b50_t1_m1_5, {shadowSize = 0})

flot.render(p)
