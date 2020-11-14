local t = require("lib.dev.luaunit")
local array_util = require("src.core.array_util")

TestMain = {}

-- Test to ensure application isn't polluting the global scope anymore than needed.
function TestMain.test_pollution_of_global_environment()
  t.assertEquals(array_util.count(_G), 37)
end

os.exit(t.LuaUnit.run())