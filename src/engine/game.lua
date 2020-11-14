local fps = require("src.engine.fps")
local font = require("src.engine.font")
local game_state = require("src.storage.game_state")
local event_emitter = require("src.engine.event_emitter")
local demon_store = require("src.engine.entity.demon.demon_store")
local scene_manager = require("src.engine.scene.scene_manager")
local town = require("src.engine.scene.hub.town")
local archives = require("src.engine.scene.hub.archives")
local crypt = require("src.engine.scene.hub.crypt")
local bestiary = require("src.engine.scene.necronomicon.bestiary")
local battle = require("src.engine.scene.battle")
local manual = require("src.engine.scene.manual.game_manual")

-- testing ***************
-- local demon_bio = require("src.engine.entity.demon.demon_bio")
-- local demon_base = require("src.engine.entity.demon.demon_base")
-- local demon_afflictions = require("src.engine.entity.demon.demon_afflictions")
-- local demon = require("src.engine.entity.demon.demon")
-- local move_store = require("src.engine.entity.move.move_store"
-- local archives_system = require("src.engine.system.archives")
local pprint = require("lib.dev.pprint")
-- testing ***************

local Game = {}

local function on_transition(scene)
    scene_manager:change(scene)
end

function Game.load(args)
    game_state:load()
    font.load()
    demon_store:load()
    event_emitter:register("transition", on_transition)
    scene_manager = scene_manager()
    scene_manager:add(town)
    scene_manager:add(archives)
    scene_manager:add(crypt)
    scene_manager:add(manual)
    scene_manager:add(bestiary)
    scene_manager:add(battle)
    -- scene_manager:change("Crypt")
    scene_manager:change("Town")
    -- scene_manager:change("Bestiary")
    -- scene_manager:change("Battle")

    -- testing ***************
    -- move_store:load()
    -- print(move_store.moves["FRENZY"]:activate(demon_store.demons[6], demon_store.demons[6]))

    -- How to create, save and load demons:
    -- game_state:load()
    -- pprint(demon_store:get_roster())
    for _, v in pairs(demon_store:get_roster()) do
        print("*******")
        if v.hp == 69 then
            v.base.attack = 999
            v.afflictions.bleeds = 777
            v.bio.name = "WTF"
            print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        end
        pprint(v)
        print("*******")
    end
    -- local afflictions = demon_afflictions(1, 2, 3, 4, 5)
    -- local bio = demon_bio("a", "b", 5, "c", 1.1, 2.2)
    -- local base = demon_base(1, 2, 3, 4, 5, 6)
    -- local demon = demon(6, bio, base, {"a"}, {"b"}, "c") -- 6 is important
    -- demon:set_unique_data(69, 7, {"move1", "move2"}, "passive", afflictions)
    -- demon_store:add_to_roster(demon)

    -- archives_system.init()
    -- testing ***************
end

function Game.update(dt)
    scene_manager:update(dt)
end

function Game.draw()
    scene_manager:draw()
    fps.draw()
end

function Game.resize()
    font.load()
end

function Game.shutdown()
    scene_manager:shutdown()
end

return Game
