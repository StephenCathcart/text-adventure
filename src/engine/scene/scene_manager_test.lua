local t = require("lib.dev.luaunit")
local scene_manager = require("src.engine.scene.scene_manager")
local main_menu = require("src.engine.scene.main_menu")

TestSceneManager = {}

function TestSceneManager:test_add()
    local scene_manager = scene_manager()
    t.assertEquals(scene_manager.scenes[main_menu:get_type()], nil)
    scene_manager:add(main_menu)
    t.assertEquals(scene_manager.scenes[main_menu:get_type()], main_menu)
end

function TestSceneManager:test_add_invalid_scene()
    t.assertErrorMsgContains("invalid scene", scene_manager.add, scene_manager, {})
end

function TestSceneManager:test_change()
    -- TODO figure out what were doing with args
    local scene_manager = scene_manager()
    scene_manager.scenes[main_menu:get_type()] = main_menu
    t.assertEquals(scene_manager.current, nil)
    scene_manager:change("MainMenu", nil)
    t.assertEquals(scene_manager.current, main_menu)
end

function TestSceneManager:test_change_invalid_scene()
    local scene_manager = scene_manager()
    t.assertErrorMsgContains("invalid scene", scene_manager.change, scene_manager, "Invalid")
end

function TestSceneManager:test_clear()
    local scene_manager = scene_manager()
    scene_manager.scenes = {1, 2, 3}
    scene_manager:clear()
    t.assertEquals(scene_manager.scenes, {})
end

function TestSceneManager:test_count()
    local scene_manager = scene_manager()
    t.assertEquals(scene_manager:count(), 0)
    scene_manager.scenes = {1, 2, 3}
    t.assertEquals(scene_manager:count(), 3)
end

function TestSceneManager:test_remove()
    local scene_manager = scene_manager()
    scene_manager.scenes[main_menu:get_type()] = main_menu
    t.assertEquals(scene_manager.scenes[main_menu:get_type()], main_menu)
    scene_manager:remove(main_menu)
    t.assertEquals(scene_manager.scenes[main_menu:get_type()], nil)
end

function TestSceneManager:test_remove_invalid_scene()
    t.assertErrorMsgContains("invalid scene", scene_manager.remove, scene_manager, {})
end

function TestSceneManager:test_update_invalid_delta()
    t.assertErrorMsgContains("invalid dt", scene_manager.update, scene_manager, nil)
end

os.exit(t.LuaUnit.run())
