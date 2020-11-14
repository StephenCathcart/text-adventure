local t = require("lib.dev.luaunit")
local formula = require("src.engine.math.formula")

TestLevelFormula = {}

function TestLevelFormula.test_current_level()
    -- Level 1
    t.assertEquals(formula.current_level(0), 1)
    t.assertEquals(formula.current_level(5), 1)
    -- Level 2
    t.assertEquals(formula.current_level(6), 2)
    t.assertEquals(formula.current_level(20), 2)
    -- Level 3
    t.assertEquals(formula.current_level(21), 3)
    t.assertEquals(formula.current_level(50), 3)
    -- Level 4
    t.assertEquals(formula.current_level(51), 4)
    t.assertEquals(formula.current_level(99), 4)
    -- Level 5
    t.assertEquals(formula.current_level(100), 5)
    t.assertEquals(formula.current_level(171), 5)
    -- Level 6
    t.assertEquals(formula.current_level(172), 6)
    t.assertEquals(formula.current_level(273), 6)
    -- Level 7
    t.assertEquals(formula.current_level(274), 7)
    t.assertEquals(formula.current_level(408), 7)
    -- Level 8
    t.assertEquals(formula.current_level(409), 8)
    t.assertEquals(formula.current_level(582), 8)
    -- Level 9
    t.assertEquals(formula.current_level(583), 9)
    t.assertEquals(formula.current_level(799), 9)
    -- Level 10
    t.assertEquals(formula.current_level(800), 10)
end

function TestLevelFormula.test_current_level_invalid_xp()
    t.assertErrorMsgContains("negative xp", formula.current_level, -1)
end

function TestLevelFormula.test_gained_xp_base_20()
    -- Party 4
    t.assertEquals(formula.gained_xp(20, 1, 4), 1)
    t.assertEquals(formula.gained_xp(20, 10, 4), 10)
    -- Party 4 -- Mod 1.5
    t.assertEquals(formula.gained_xp(20, 1, 4, 1.5), 1)
    t.assertEquals(formula.gained_xp(20, 10, 4, 1.5), 15)
    -- Party 1
    t.assertEquals(formula.gained_xp(20, 1, 1), 4)
    t.assertEquals(formula.gained_xp(20, 10, 1), 40)
    -- Party 1 -- Mod 1.5
    t.assertEquals(formula.gained_xp(20, 1, 1, 1.5), 6)
    t.assertEquals(formula.gained_xp(20, 10, 1, 1.5), 60)
end

function TestLevelFormula.test_gained_xp_base_50()
    -- Party 4
    t.assertEquals(formula.gained_xp(50, 1, 4), 2)
    t.assertEquals(formula.gained_xp(50, 10, 4), 25)
    -- Party 4 -- Mod 1.5
    t.assertEquals(formula.gained_xp(50, 1, 4, 1.5), 3)
    t.assertEquals(formula.gained_xp(50, 10, 4, 1.5), 37)
    -- Party 1
    t.assertEquals(formula.gained_xp(50, 1, 1), 10)
    t.assertEquals(formula.gained_xp(50, 10, 1), 100)
    -- Party 1 -- Mod 1.5
    t.assertEquals(formula.gained_xp(50, 1, 1, 1.5), 15)
    t.assertEquals(formula.gained_xp(50, 10, 1, 1.5), 150)
end

function TestLevelFormula.test_gained_xp_invalid_base()
    t.assertErrorMsgContains("invalid base", formula.gained_xp, 19, 1, 4)
end

function TestLevelFormula.test_gained_xp_invalid_level()
    t.assertErrorMsgContains("invalid level", formula.gained_xp, 20, 0, 4)
end

function TestLevelFormula.test_gained_xp_invalid_party()
    t.assertErrorMsgContains("party too small", formula.gained_xp, 20, 1, 0)
    t.assertErrorMsgContains("party too large", formula.gained_xp, 20, 1, 5)
end

function TestLevelFormula.test_required_xp()
    t.assertEquals(formula.required_xp(1), 0)
    t.assertEquals(formula.required_xp(2), 6)
    t.assertEquals(formula.required_xp(3), 21)
    t.assertEquals(formula.required_xp(4), 51)
    t.assertEquals(formula.required_xp(5), 100)
    t.assertEquals(formula.required_xp(6), 172)
    t.assertEquals(formula.required_xp(7), 274)
    t.assertEquals(formula.required_xp(8), 409)
    t.assertEquals(formula.required_xp(9), 583)
    t.assertEquals(formula.required_xp(10), 800)
end

function TestLevelFormula.test_required_xp_invalid_level()
    t.assertErrorMsgContains("invalid level", formula.required_xp, 0)
end

TestCombatFormula = {}

-- TODO
function TestCombatFormula.test_()
    t.assertEquals(formula.max_hp(10, 1, 1), 13)
    t.assertEquals(formula.max_hp(10, 10, 1), 40)

    t.assertEquals(formula.max_hp(10, 1, 1.5), 19)
    t.assertEquals(formula.max_hp(10, 10, 1.5), 60)

    t.assertEquals(formula.max_hp(125, 1, 1), 36)
    t.assertEquals(formula.max_hp(125, 10, 1), 270)

    t.assertEquals(formula.max_hp(125, 1, 1.5), 54)
    t.assertEquals(formula.max_hp(125, 10, 1.5), 405)

    t.assertEquals(formula.max_hp(255, 1, 1), 62)
    t.assertEquals(formula.max_hp(255, 10, 1), 530)

    t.assertEquals(formula.max_hp(255, 1, 1.5), 93)
    t.assertEquals(formula.max_hp(255, 10, 1.5), 795)
end

-- TODO
function TestCombatFormula.test_2()
    t.assertEquals(formula.max_stat(255, 1, 1), 52)
    t.assertEquals(formula.max_stat(255, 10, 1), 520)

    t.assertEquals(formula.max_stat(100, 1, 1), 21)
    t.assertEquals(formula.max_stat(100, 10, 1), 210)
end

-- TODO
function TestCombatFormula.test_3()
    -- level, power, attack, defence, mod
    t.assertEquals(formula.damage(1, 100, 52, 21, 1), 21)

    t.assertEquals(formula.damage(10, 100, 520, 210, 1), 110)

    t.assertEquals(formula.damage(10, 100, 1, 520, 1), 2)
end

os.exit(t.LuaUnit.run())
