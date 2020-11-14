local t = require("lib.dev.luaunit")
local vector2 = require("src.engine.math.vector2")

TestVector2 = {}

function TestVector2:test_new()
    local vector2 = vector2(1, 2)
    t.assertEquals(vector2.x, 1)
    t.assertEquals(vector2.y, 2)
end

function TestVector2:test_new_empty()
    local vector2 = vector2()
    t.assertEquals(vector2.x, 0)
    t.assertEquals(vector2.y, 0)
end

os.exit(t.LuaUnit.run())
