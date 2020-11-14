local t = require("lib.dev.luaunit")
local demon_afflictions = require("src.engine.entity.demon.demon_afflictions")

TestDemonAfflictions = {}

function TestDemonAfflictions:test_new()
    local demon_afflictions = demon_afflictions(1, 2, 3, 4, 5)
    t.assertEquals(demon_afflictions:get_type(), "DemonAfflictions")
    t.assertEquals(demon_afflictions.bleeds, 1)
    t.assertEquals(demon_afflictions.burns, 2)
    t.assertEquals(demon_afflictions.chills, 3)
    t.assertEquals(demon_afflictions.cripples, 4)
    t.assertEquals(demon_afflictions.plagues, 5)
end

function TestDemonAfflictions:test_new_invalid_state()
    t.assertErrorMsgContains("invalid bleeds", demon_afflictions)
    t.assertErrorMsgContains("invalid burns", demon_afflictions, 1)
    t.assertErrorMsgContains("invalid chills", demon_afflictions, 1, 2)
    t.assertErrorMsgContains("invalid cripples", demon_afflictions, 1, 2, 3)
    t.assertErrorMsgContains("invalid plagues", demon_afflictions, 1, 2, 3, 4)
end

os.exit(t.LuaUnit.run())
