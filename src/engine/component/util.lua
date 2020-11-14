local font = require("src.engine.font")

local Util = {}

function Util.margin()
    local width = love.graphics.getWidth()
    local hyphens = width / font.default:getWidth("—") - 2
    local string = "+"
    for i = 1, hyphens do
        string = string .. "—"
    end
    string = string .. "+"
    return string
end

function Util.y_offset(location)
    return font.default:getHeight() * location
end

return Util
