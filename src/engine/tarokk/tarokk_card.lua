local class = require("src.core.class")
local guard = require("src.core.guard")
local TarokkCard = class:derive("TarokkCard")

-- Constructor.
-- @param state The serialised tarokk card state.
function TarokkCard:new(name, level, arcana, state)
    assert(guard.string(name), "invalid name")
    assert(guard.number(level), "invalid level")
    assert(guard.string(arcana), "invalid arcana")
    self.name = name
    self.level = level
    self.arcana = arcana

    if state then
        assert(guard.class(state, "TarokkCardState"), "invalid state")
        self.state = state
    end
end

return TarokkCard
