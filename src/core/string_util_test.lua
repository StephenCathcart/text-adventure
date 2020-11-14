local t = require("lib.dev.luaunit")
local string_util = require("src.core.string_util")

TestStringUtil = {}

function TestStringUtil.test_first_to_upper()
    t.assertEquals(string_util.first_to_upper("cat"), "Cat")
    t.assertEquals(string_util.first_to_upper("Dog"), "Dog")
end

function TestStringUtil.test_first_to_upper_invalid_str()
    t.assertErrorMsgContains("invalid string", string_util.first_to_upper, 1)
    t.assertErrorMsgContains("invalid string", string_util.first_to_upper, {})
    t.assertErrorMsgContains("invalid string", string_util.first_to_upper, nil)
end

os.exit(t.LuaUnit.run())
