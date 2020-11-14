local class = require("src.core.class")
local guard = require("src.core.guard")
local CauseOfDeath = class:derive("CauseOfDeath")

function CauseOfDeath:new(enemy_name, enemy_level, enemy_move, date)
    assert(guard.string(enemy_name), "invalid enemy name")
    assert(guard.number(enemy_level), "invalid enemy level")
    assert(guard.string(enemy_move), "invalid enemy move")
    assert(guard.string(date), "invalid date")
    self.enemy_name = enemy_name
    self.enemy_level = enemy_level
    self.enemy_move = enemy_move
    self.date = date
end

return CauseOfDeath
