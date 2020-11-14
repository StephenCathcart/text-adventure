local t = require("lib.dev.luaunit")
local guard = require("src.core.guard")
local soul = require("src.engine.entity.item.soul")

TestGuard = {}

function TestGuard:setUp()
    self.soul = soul('name')
end

function TestGuard.test_number()
    t.assertEquals(guard.number(nil), false)
    t.assertEquals(guard.number('a'), false)
    t.assertEquals(guard.number(true), false)
    t.assertEquals(guard.number(false), false)
    t.assertEquals(guard.number({}), false)
    t.assertEquals(guard.number(1), true)
end

function TestGuard.test_string()
    t.assertEquals(guard.string(nil), false)
    t.assertEquals(guard.string(true), false)
    t.assertEquals(guard.string(false), false)
    t.assertEquals(guard.string(1), false)
    t.assertEquals(guard.string({}), false)
    t.assertEquals(guard.string('a'), true)
end

function TestGuard.test_boolean()
    t.assertEquals(guard.boolean(nil), false)
    t.assertEquals(guard.boolean('a'), false)
    t.assertEquals(guard.boolean(1), false)
    t.assertEquals(guard.boolean({}), false)
    t.assertEquals(guard.boolean(true), true)
    t.assertEquals(guard.boolean(false), true)
end

function TestGuard.test_array()
    t.assertEquals(guard.array(nil), false)
    t.assertEquals(guard.array(true), false)
    t.assertEquals(guard.array(false), false)
    t.assertEquals(guard.array('a'), false)
    t.assertEquals(guard.array(1), false)
    t.assertEquals(guard.array({}), true)
    t.assertEquals(guard.array({'b'}), true)
    t.assertEquals(guard.array({'b', 'c'}), true)
end

function TestGuard.test_class()
    t.assertEquals(guard.class(soul, nil), false)
    t.assertEquals(guard.class(soul, 'Demon'), false)
    t.assertEquals(guard.class(soul, 'Soul'), true)
end

os.exit(t.LuaUnit.run())
