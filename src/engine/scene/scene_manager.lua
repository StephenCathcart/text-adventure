local class = require("src.core.class")
local guard = require("src.core.guard")
local array_util = require("src.core.array_util")
local SceneManager = class:derive("SceneManager")

-- Constructor.
function SceneManager:new()
    self.scenes = {}
    self.current = nil
end

-- Adds a new scene to list of scenes.
-- @param scene The scene to add.
function SceneManager:add(scene)
    assert(guard.super(scene, "Scene"), "invalid scene")
    self.scenes[scene:get_type()] = scene
end

-- Removes an existing scene from list of scenes.
-- @param scene The scene to remove.
function SceneManager:remove(scene)
    assert(guard.super(scene, "Scene"), "invalid scene")
    self.scenes[scene:get_type()] = nil
end

-- Removes all scenes from list of scenes.
function SceneManager:clear()
    for k in pairs(self.scenes) do
        self.scenes[k] = nil
    end
end

-- Draws the currently active scene.
function SceneManager:draw()
    if self.current then self.current:draw() end
end

-- Updates the currently active scene.
-- @param dt The time (seconds) since last frame.
function SceneManager:update(dt)
    assert(guard.number(dt), "invalid dt")
    if self.current then self.current:update(dt) end
end

-- Changes the currently active scene to another scene.
-- Calls exit on previous scene and enter on new scene.
-- @param scene The scene to change to.
-- @param args The arguments to pass to new scene.
function SceneManager:change(scene, args)
    -- TODO guard parameter for args
    assert(self.scenes[scene], "invalid scene")
    if self.current then self.current:exit() end
    self.current = self.scenes[scene]
    self.current:enter(args)
end

-- Called when the application is shutting down.
function SceneManager:shutdown()
    if self.current then self.current:exit() end
end

-- Returns a count of the number of scenes within manager.
function SceneManager:count()
    return array_util.count(self.scenes)
end

return SceneManager