local t = require("lib.dev.luaunit")
local demon_bio = require("src.engine.entity.demon.demon_bio")
local demon_base = require("src.engine.entity.demon.demon_base")
local demon_afflictions = require("src.engine.entity.demon.demon_afflictions")
local demon = require("src.engine.entity.demon.demon")

TestDemon = {}

function TestDemon:setUp()
    self.bio = demon_bio("a", "b", 5, "c", 1.1, 2.2)
    self.base = demon_base(1, 2, 3, 4, 5, 6)
end

function TestDemon:test_new()
    local demon = demon(1, self.bio, self.base, {"a"}, {"b"}, "c")
    t.assertEquals(demon:get_type(), "Demon")
    t.assertEquals(demon.id, 1)
    t.assertEquals(demon.bio, self.bio)
    t.assertEquals(demon.base, self.base)
    t.assertEquals(demon.types[1], "a")
    t.assertEquals(demon.passives[1], "b")
    t.assertEquals(demon.ultimate, "c")
end

function TestDemon:test_new_invalid_state()
    t.assertErrorMsgContains("invalid id", demon)
    t.assertErrorMsgContains("invalid bio", demon, 1)
    t.assertErrorMsgContains("invalid base", demon, 1, self.bio)
    t.assertErrorMsgContains("invalid types", demon, 1, self.bio, self.base)
    t.assertErrorMsgContains("invalid passives", demon, 1, self.bio, self.base, {"a"})
    t.assertErrorMsgContains("invalid ultimate", demon, 1, self.bio, self.base, {"a"}, {"b"})
end

function TestDemon:test_unique_data_is_empty()
    local demon = demon(1, self.bio, self.base, {"a"}, {"b"}, "c")
    t.assertEquals(demon.hp, 0)
    t.assertEquals(demon.xp, 0)
    t.assertEquals(demon.moveset, {})
    t.assertEquals(demon.passive, "")
    t.assertEquals(demon.afflictions, {})
end

function TestDemon:test_set_unique_data()
    local demon = demon(1, self.bio, self.base, {"a"}, {"b"}, "c")
    local afflictions = demon_afflictions(1, 2, 3, 4, 5)
    demon:set_unique_data(10, 12, {"e", "f"}, "g", afflictions)
    t.assertEquals(demon.hp, 10)
    t.assertEquals(demon.xp, 12)
    t.assertEquals(demon.moveset, {"e", "f"})
    t.assertEquals(demon.passive, "g")
    t.assertEquals(demon.afflictions.bleeds, 1)
    t.assertEquals(demon.afflictions.burns, 2)
    t.assertEquals(demon.afflictions.chills, 3)
    t.assertEquals(demon.afflictions.cripples, 4)
    t.assertEquals(demon.afflictions.plagues, 5)
end

os.exit(t.LuaUnit.run())
