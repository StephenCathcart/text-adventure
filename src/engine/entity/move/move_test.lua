local t = require("lib.dev.luaunit")
local log = require("lib.log")
local demon_bio = require("src.engine.entity.demon.demon_bio")
local demon_base = require("src.engine.entity.demon.demon_base")
local demon = require("src.engine.entity.demon.demon")
local damage = require("src.engine.entity.move.component.damage")
local heal_max_hp = require("src.engine.entity.move.component.heal_max_hp")
local move = require("src.engine.entity.move.move")

TestMove = {}

function TestMove:setUp()
    log.level = "fatal"
    local bio = demon_bio("a", "b", 5, "c", 1.1, 2.2)
    local base = demon_base(1, 2, 3, 4, 5, 6)
    self.demon = demon(1, bio, base, {"a"}, {"b"}, "c")
    self.effects = {
        damage("ENEMY", 20),
        heal_max_hp("SELF", 5)
    }
end

function TestMove:test_new()
    local move = move("a", "b", 1, 2, "c", "d", self.effects)
    t.assertEquals(move:get_type(), "Move")
    t.assertEquals(move.name, "a")
    t.assertEquals(move.description, "b")
    t.assertEquals(move.cost, 1)
    t.assertEquals(move.priority, 2)
    t.assertEquals(move.family, "c")
    t.assertEquals(move.category, "d")
    t.assertEquals(move.effects[1].name, "DAMAGE")
    t.assertEquals(move.effects[1].target, "ENEMY")
    t.assertEquals(move.effects[1].power, 20)
    t.assertEquals(move.effects[2].name, "HEAL_MAX_HP")
    t.assertEquals(move.effects[2].target, "SELF")
    t.assertEquals(move.effects[2].power, 5)
end

function TestMove:test_new_invalid_state()
    t.assertErrorMsgContains("invalid name", move)
    t.assertErrorMsgContains("invalid description", move, "a")
    t.assertErrorMsgContains("invalid cost", move, "a", "b")
    t.assertErrorMsgContains("invalid priority", move, "a", "b", 1)
    t.assertErrorMsgContains("invalid family", move, "a", "b", 1, 2)
    t.assertErrorMsgContains("invalid category", move, "a", "b", 1, 2, "c")
    t.assertErrorMsgContains("invalid effects", move, "a", "b", 1, 2, "c", "d")
end

function TestMove:test_activate()
    local move = move("a", "b", 1, 2, "c", "d", self.effects)
    move:activate(self.demon, self.demon)
    t.assertEquals(self.demon.base.hp, 899)
end

os.exit(t.LuaUnit.run())
