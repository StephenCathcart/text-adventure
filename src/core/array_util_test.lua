local t = require("lib.dev.luaunit")
local array_util = require("src.core.array_util")

TestArrayUtil = {}

function TestArrayUtil:setUp()
    self.array = {}
end

function TestArrayUtil:test_count_zero()
    t.assertEquals(array_util.count(self.array), 0)
end

function TestArrayUtil:test_count_positive()
    self.array = {1, 2, 3}
    t.assertEquals(array_util.count(self.array), 3)
end

function TestArrayUtil.test_count_invalid_array()
    t.assertErrorMsgContains("invalid array", array_util.count, 1, nil)
end

function TestArrayUtil.test_contains()
    local array = {"a", "b", "c"}
    t.assertEquals(array_util.contains(array, "a"), true)
    t.assertEquals(array_util.contains(array, "b"), true)
    t.assertEquals(array_util.contains(array, "c"), true)
    t.assertEquals(array_util.contains(array, "d"), false)
end

os.exit(t.LuaUnit.run())
