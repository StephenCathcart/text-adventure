local t = require("lib.dev.luaunit")
local log = require("lib.log")
local game_state = require("src.storage.game_state")
local crypt = require("src.engine.system.crypt")

TestCrypt = {}

function TestCrypt:setUp()
    log.level = "fatal"
    crypt.reputation = 0
    game_state.data.roster = {}
end

function TestCrypt:test_reputation_stats_zero()
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 125)
    t.assertEquals(percent, 0)
end

function TestCrypt:test_reputation_stats_124()
    crypt.reputation = 125
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 250)
    t.assertEquals(percent, 0.0)
end

function TestCrypt:test_reputation_stats_125()
    crypt.reputation = 125
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 250)
    t.assertEquals(percent, 0)
end

function TestCrypt:test_reputation_stats_187_5()
    crypt.reputation = 187.5
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 250)
    t.assertEquals(percent, 0.5)
end

function TestCrypt:test_reputation_stats_249()
    crypt.reputation = 249
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 250)
    t.assertEquals(percent, 0.992)
end

function TestCrypt:test_reputation_stats_499()
    crypt.reputation = 499
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 500)
    t.assertEquals(percent, 0.996)
end

function TestCrypt:test_reputation_stats_500()
    crypt.reputation = 500
    local next_reputation, percent = crypt:reputation_stats()
    t.assertEquals(next_reputation, 500)
    t.assertEquals(percent, 1)
end

function TestCrypt:test_awakening_eligibility_zero()
    game_state.data.roster = {{xp=0},{xp=0}}
    local awakening_eligibility = crypt.awakening_eligibility()
    t.assertEquals(awakening_eligibility, 0)
end

function TestCrypt:test_awakening_eligibility_level_one_and_level_six()
    game_state.data.roster = {{xp=0},{xp=173}}
    local awakening_eligibility = crypt.awakening_eligibility()
    t.assertEquals(awakening_eligibility, 1)
end

function TestCrypt:test_awakening_eligibility_level_one_and_level_six_awakened()
    game_state.data.roster = {{xp=0},{xp=173, awakened=true}}
    local awakening_eligibility = crypt.awakening_eligibility()
    t.assertEquals(awakening_eligibility, 0)
end

function TestCrypt:test_awakening_eligibility_level_six_and_level_six_awakened()
    game_state.data.roster = {{xp=173},{xp=173, awakened=true}}
    local awakening_eligibility = crypt.awakening_eligibility()
    t.assertEquals(awakening_eligibility, 1)
end

function TestCrypt:test_awakening_eligibility_level_six_and_level_six_awakened()
    game_state.data.roster = {{xp=173, awakened=true},{xp=173, awakened=true}}
    local awakening_eligibility = crypt.awakening_eligibility()
    t.assertEquals(awakening_eligibility, 0)
end

function TestCrypt:test_awakening_eligibility_level_six_and_level_six()
    game_state.data.roster = {{xp=173},{xp=173}}
    local awakening_eligibility = crypt.awakening_eligibility()
    t.assertEquals(awakening_eligibility, 2)
end

os.exit(t.LuaUnit.run())
