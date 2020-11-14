local class = require("src.core.class")
local scene = require("src.engine.scene.scene")
local MainMenu = scene:derive("MainMenu")

function MainMenu:draw()
    -- TODO
    love.graphics.print('MainMenu', 0, 0)
end

function MainMenu:update(dt)
    -- TODO
end

function MainMenu:enter(args)
    -- TODO
end

function MainMenu:exit()
    -- TODO
end

return MainMenu