local class = require("src.core.class")
local guard = require("src.core.guard")
local Soul = class:derive("Soul")

function Soul:new(name)
    assert(guard.string(name), "invalid name")
    self.name = name
end

return Soul