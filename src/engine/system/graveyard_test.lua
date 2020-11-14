local t = require("lib.dev.luaunit")
local log = require("lib.log")
local game_state = require("src.storage.game_state")
local graveyard = require("src.engine.system.graveyard")
local fallen_demon = require("src.engine.entity.demon.fallen_demon")
local cause_of_death = require("src.engine.entity.demon.cause_of_death")

TestGraveyard = {}

function TestGraveyard:setUp()
    log.level = "fatal"
    game_state.data.roster = {}
    game_state.data.graveyard = {}
    game_state.data.soulstones = 0

    local cause_of_death = cause_of_death("enemy_name", 10, "enemy_move", "date")
    self.fallen_demon_1 = fallen_demon(1, 777, "passive1", {"move1", "move2"}, cause_of_death)
    self.fallen_demon_2 = fallen_demon(2, 999, "passive2", {"move3", "move4"}, cause_of_death)
end

function TestGraveyard:test_talk()
    t.assertEquals(graveyard.talk(), "hello")
end

function TestGraveyard:test_view_history_empty_graveyard()
    t.assertEquals(graveyard.view_history(), {})
end

function TestGraveyard:test_view_history_one_demon_in_graveyard()
    game_state.data.graveyard = {self.fallen_demon_1, self.fallen_demon_2}
    t.assertEquals(graveyard.view_history(), {self.fallen_demon_1, self.fallen_demon_2})
end

function TestGraveyard:test_summon()
    -- @todo assert roster has new demon added
    game_state.data.soulstones = 1
    graveyard:summon(self.fallen_demon_1)
    t.assertEquals(game_state.data.soulstones, 0)
end

function TestGraveyard:test_is_summon_enabled_zero_soulstones()
    t.assertEquals(graveyard.is_summon_enabled(), false)
end

function TestGraveyard:test_is_summon_enabled_one_soulstone_no_demons_in_graveyard()
    game_state.data.soulstones = 1
    t.assertEquals(graveyard.is_summon_enabled(), false)
end

function TestGraveyard:test_is_summon_enabled_one_soulstone_one_demon_in_graveyard()
    game_state.data.soulstones = 1
    game_state.data.graveyard = {"a"}
    t.assertEquals(graveyard.is_summon_enabled(), true)
end

function TestGraveyard:test_is_summon_enabled_max_roster()
    game_state.data.soulstones = 1
    game_state.data.graveyard = {"a"}
    game_state.data.roster = {"a", "b", "c", "d"}
    t.assertEquals(graveyard.is_summon_enabled(), false)
end

os.exit(t.LuaUnit.run())
