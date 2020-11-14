local flot = require("lib.dev.flot")
local formula = require("src.engine.math.formula")

local required_xp = {}
for i = 1, 10 do
    required_xp[i] = {i, formula.required_xp(i)}
end

local p =
    flot.Plot {
    -- legend at 'south east' corner
    legend = {position = "se"}
}
p:add_series("required_xp", required_xp)

flot.render(p)
