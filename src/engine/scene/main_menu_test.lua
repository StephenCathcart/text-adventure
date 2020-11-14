local t = require("lib.dev.luaunit")
local main_menu = require("src.engine.scene.main_menu")

TestMainMenuScene = {}

function TestMainMenuScene:test_main_menu_class()
    t.assertEquals(main_menu:get_type(), 'MainMenu')
    t.assertEquals(main_menu.super:get_type(), 'Scene')
end

os.exit(t.LuaUnit.run())
