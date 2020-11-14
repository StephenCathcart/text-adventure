local flot = require("lib.dev.flot")
local formula = require("src.engine.math.formula")

-- kills per level - slowest and fastest for base 20s and 50s
local kpl_b20_s, kpl_b50_s, kpl_b20_f, kpl_b50_f = {}, {}, {}, {}
for lvl = 1, 10 do
    local required_xp = formula.required_xp(lvl)
    -- slowest
    kpl_b20_s[lvl] = {lvl, required_xp / formula.gained_xp(20, lvl, 4, 1)}
    kpl_b50_s[lvl] = {lvl, required_xp / formula.gained_xp(50, lvl, 4, 1)}
    -- fastest
    kpl_b20_f[lvl] = {lvl, required_xp / formula.gained_xp(20, lvl, 1, 1.5)}
    kpl_b50_f[lvl] = {lvl, required_xp / formula.gained_xp(50, lvl, 1, 1.5)}
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
        content = "%s | Level: %x | Avg.Enemies: %y"
    }
}

p:add_series("kpl_b20_s", kpl_b20_s, {shadowSize = 0, color = "#000000", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("kpl_b50_s", kpl_b50_s, {shadowSize = 0, color = "#36f7f5", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("kpl_b20_f", kpl_b20_f, {shadowSize = 0, color = "#f320bc", lines = {lineWidth = 1, show = true}, points = {show = true}})
p:add_series("kpl_b50_f", kpl_b50_f, {shadowSize = 0, color = "#f58429", lines = {lineWidth = 1, show = true}, points = {show = true}})

flot.render(p)
