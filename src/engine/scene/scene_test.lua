local t = require("lib.dev.luaunit")
local scene = require("src.engine.scene.scene")

TestScene = {}

function TestScene:test_draw()
    t.assertErrorMsgContains("scene:draw: abstract function", scene.draw, scene, nil)
end

function TestScene:test_update()
    t.assertErrorMsgContains("scene:update: abstract function", scene.update, scene, nil)
end

function TestScene:test_enter()
    t.assertErrorMsgContains("scene:enter: abstract function", scene.enter, scene, nil)
end

function TestScene:test_exit()
    t.assertErrorMsgContains("scene:exit: abstract function", scene.exit, scene, nil)
end

os.exit(t.LuaUnit.run())
