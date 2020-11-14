local t = require("lib.dev.luaunit")
local Artefact = require("src.engine.entity.item.artefact")

TestArtefact = {}

function TestArtefact:test_new()
    local artefact = Artefact("a", "b", "c", "d", 1)
    t.assertEquals(artefact:get_type(), "Artefact")
    t.assertEquals(artefact.name, "a")
    t.assertEquals(artefact.description, "b")
    t.assertEquals(artefact.upgrades, "c")
    t.assertEquals(artefact.location, "d")
    t.assertEquals(artefact.reputation, 1)
end

function TestArtefact:test_new_invalid_state()
    t.assertErrorMsgContains("invalid name", Artefact)
    t.assertErrorMsgContains("invalid description", Artefact, "a")
    t.assertErrorMsgContains("invalid upgrades", Artefact, "a", "b")
    t.assertErrorMsgContains("invalid location", Artefact, "a", "b", "c")
    t.assertErrorMsgContains("invalid reputation", Artefact, "a", "b", "c", "d")
end

function TestArtefact:test_tostring()
    local artefact = Artefact("a", "b", "c", "d", 1)
    t.assertEquals(tostring(artefact), "Artefact{name=a,description=b,upgrades=c,location=d,reputation=1}")
end

os.exit(t.LuaUnit.run())
