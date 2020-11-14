local class = require("src.core.class")
local Scene = class:derive("Scene")

-- Callback function used to draw on the screen every frame.
-- @param dt The time (seconds) since last frame.
function Scene:draw(dt)
    error("scene:draw: abstract function")
end

-- Callback function used to update the state of the game every frame.
-- @param dt The time (seconds) since last frame.
function Scene:update(dt)
    error("scene:update: abstract function")
end

-- Called when this scene becomes the current scene.
-- @param args The arguments received from previous scene.
function Scene:enter(args)
    error("scene:enter: abstract function")
end

-- Called when this scene is no longer the current scene.
function Scene:exit()
    error("scene:exit: abstract function")
end

return Scene
