local t = require("lib.dev.luaunit")
local log = require("lib.log")
local demon_bio = require("src.engine.entity.demon.demon_bio")
local demon_base = require("src.engine.entity.demon.demon_base")
local demon = require("src.engine.entity.demon.demon")
local damage = require("src.engine.entity.move.component.damage")

TestDamage = {}

function TestDamage:setUp()
    log.level = "fatal"
    local bio = demon_bio("a", "b", 5, "c", 1.1, 2.2)
    local base = demon_base(1, 2, 3, 4, 5, 6)
    self.demon = demon(1, bio, base, {"a"}, {"b"}, "c")
end

function TestDamage:test_apply()
    local damage = damage("SELF", 20)
    damage:apply(self.demon, self.demon)
    t.assertEquals(self.demon.base.hp, 999)
end

os.exit(t.LuaUnit.run())
