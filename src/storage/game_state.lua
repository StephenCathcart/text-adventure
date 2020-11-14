local log = require("lib.log")
local json = require("lib.json")

local GameState = {
    data = {
        week = 1,
        gold = 0,
        artefacts = {},
        reputation = {},
        provisions = {},
        souls = {},
        soulstones = 0,
        fetishes = {},
        graveyard = {},
        roster = {}
    }
}

function GameState.save()
    log.trace("game_state:save")
    -- TODO do something with success and message
    success, message = love.filesystem.write("save.json", json.encode(GameState.data))
end

function GameState.load()
    log.trace("game_state:load")
    -- TODO do something with error msg
    chunk, error_msg = love.filesystem.read("save.json")
    if chunk then
        GameState.data = json.decode(chunk)
    end
end

return GameState
