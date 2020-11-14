local class = require("src.core.class")
local guard = require("src.core.guard")
local TarokkCardState = class:derive("TarokkCardState")

-- Serialisable tarokk card state.
function TarokkCardState:new(suit, elemental, north, east, south, west)
    assert(guard.string(suit), "invalid suit")
    assert(guard.boolean(elemental), "invalid elemental")
    assert(guard.number(north), "invalid north")
    assert(guard.number(east), "invalid east")
    assert(guard.number(south), "invalid south")
    assert(guard.number(west), "invalid west")
    self.suit = suit
    self.elemental = elemental
    self.north = north
    self.east = east
    self.south = south
    self.west = west
end

return TarokkCardState
