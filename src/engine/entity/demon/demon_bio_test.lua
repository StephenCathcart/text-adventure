local t = require("lib.dev.luaunit")
local DemonBio = require("src.engine.entity.demon.demon_bio")

TestDemonBio = {}

function TestDemonBio:test_new()
    local demon_bio = DemonBio("a", "b", 5, "c", 1.1, 2.2)
    t.assertEquals(demon_bio:get_type(), "DemonBio")
    t.assertEquals(demon_bio.name, "a")
    t.assertEquals(demon_bio.rank, "b")
    t.assertEquals(demon_bio.legions, 5)
    t.assertEquals(demon_bio.description, "c")
    t.assertEquals(demon_bio.height, 1.1)
    t.assertEquals(demon_bio.weight, 2.2)
end

function TestDemonBio:test_new_invalid_state()
    t.assertErrorMsgContains("invalid name", DemonBio)
    t.assertErrorMsgContains("invalid rank", DemonBio, "a")
    t.assertErrorMsgContains("invalid legions", DemonBio, "a", "b")
    t.assertErrorMsgContains("invalid description", DemonBio, "a", "b", 5)
    t.assertErrorMsgContains("invalid height", DemonBio, "a", "b", 5, "")
    t.assertErrorMsgContains("invalid weight", DemonBio, "a", "b", 5, "c", 1.1)
end

os.exit(t.LuaUnit.run())
