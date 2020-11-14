local t = require("lib.dev.luaunit")
local effect = require("src.engine.entity.move.component.effect")

TestEffect = {}

function TestEffect:test_apply()
    t.assertErrorMsgContains("effect:apply: abstract function", effect.apply)
end

os.exit(t.LuaUnit.run())
