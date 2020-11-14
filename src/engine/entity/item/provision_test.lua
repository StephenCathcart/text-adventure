local t = require("lib.dev.luaunit")
local Provision = require("src.engine.entity.item.provision")

TestProvision = {}

function TestProvision:test_new()
    local provision = Provision("a", "b", 1, 1.1)
    t.assertEquals(provision:get_type(), "Provision")
    t.assertEquals(provision.name, "a")
    t.assertEquals(provision.description, "b")
    t.assertEquals(provision.cost, 1)
    t.assertEquals(provision.weight, 1.1)
end

function TestProvision:test_new_invalid_state()
    t.assertErrorMsgContains("invalid name", Provision)
    t.assertErrorMsgContains("invalid description", Provision, "a")
    t.assertErrorMsgContains("invalid cost", Provision, "a", "b")
    t.assertErrorMsgContains("invalid weight", Provision, "a", "b", 1)
end

os.exit(t.LuaUnit.run())