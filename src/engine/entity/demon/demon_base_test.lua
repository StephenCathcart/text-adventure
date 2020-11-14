local t = require("lib.dev.luaunit")
local DemonBase = require("src.engine.entity.demon.demon_base")

TestDemonBase = {}

function TestDemonBase:test_new()
    local demon_base = DemonBase(1, 2, 3, 4, 5, 6)
    t.assertEquals(demon_base:get_type(), "DemonBase")
    t.assertEquals(demon_base.hp, 1)
    t.assertEquals(demon_base.attack, 2)
    t.assertEquals(demon_base.defence, 3)
    t.assertEquals(demon_base.spell_attack, 4)
    t.assertEquals(demon_base.spell_defence, 5)
    t.assertEquals(demon_base.speed, 6)
end

function TestDemonBase:test_new_invalid_state()
    t.assertErrorMsgContains("invalid hp", DemonBase)
    t.assertErrorMsgContains("invalid attack", DemonBase, 1)
    t.assertErrorMsgContains("invalid defence", DemonBase, 1, 2)
    t.assertErrorMsgContains("invalid spell_attack", DemonBase, 1, 2, 3)
    t.assertErrorMsgContains("invalid spell_defence", DemonBase, 1, 2, 3, 4)
    t.assertErrorMsgContains("invalid speed", DemonBase, 1, 2, 3, 4, 5)
end

os.exit(t.LuaUnit.run())
