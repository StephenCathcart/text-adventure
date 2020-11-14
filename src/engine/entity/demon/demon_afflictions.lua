local class = require("src.core.class")
local guard = require("src.core.guard")
local DemonAfflictions = class:derive("DemonAfflictions")

function DemonAfflictions:new(bleeds, burns, chills, cripples, plagues)
    assert(guard.number(bleeds), "invalid bleeds")
    assert(guard.number(burns), "invalid burns")
    assert(guard.number(chills), "invalid chills")
    assert(guard.number(cripples), "invalid cripples")
    assert(guard.number(plagues), "invalid plagues")
    self.bleeds = bleeds
    self.burns = burns
    self.chills = chills
    self.cripples = cripples
    self.plagues = plagues
end

return DemonAfflictions
