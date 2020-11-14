local class = require("src.core.class")
local Vector2 = class:derive("Vector2")

-- Creates a new Vector2 object.
-- @param x The x coordinate.
-- @param y The y coordinate.
function Vector2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

return Vector2