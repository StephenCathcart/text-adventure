local t = require("lib.dev.luaunit")
local battle = require("src.engine.scene.battle")

TestBattleScene = {}

function TestBattleScene:test_battle_class()
    t.assertEquals(battle:get_type(), 'Battle')
    t.assertEquals(battle.super:get_type(), 'Scene')
end

os.exit(t.LuaUnit.run())