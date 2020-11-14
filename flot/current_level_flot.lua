local flot = require("lib.dev.flot")
local formula = require("src.engine.math.formula")

local current_level = {}
for i = 1, 800 do
    current_level[i] = {i, formula.current_level(i)}
end

local p =
    flot.Plot {
    -- legend at 'south east' corner
    legend = {position = "se"}
}
p:add_series("current_level", current_level)

flot.render(p)
