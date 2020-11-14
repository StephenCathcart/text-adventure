local t = require("lib.dev.luaunit")
local Soul = require("src.engine.entity.item.soul")

TestSoul = {}

function TestSoul:test_new()
    local soul = Soul("name")
    -- t.assertEquals(soul:get_type(), "Soul")
    -- t.assertEquals(soul.name, "a")
end

-- function TestSoul:test_new_invalid_state()
--     t.assertErrorMsgContains("invalid name", Soul)
-- end

os.exit(t.LuaUnit.run())