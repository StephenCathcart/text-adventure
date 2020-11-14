local log = require("lib.log")
local event_emitter = require("src.engine.event_emitter")
local key_binding = require("src.engine.accessibility.key_binding")
local terminal = require("src.engine.component.terminal")
local scene = require("src.engine.scene.scene")
local Archives = scene:derive("Archives")

local function on_terminal(command)
end

function Archives:draw()
    love.graphics.print("Archives", 0, 0)
    terminal:draw()
end

function Archives:update(dt)
end

function Archives:enter(args)
    log.trace('Archives:enter')
    event_emitter:register("terminal", on_terminal)
    terminal.load()
end

function Archives:exit()
    log.trace('Archives:exit')
    event_emitter:unregister("terminal", on_terminal)
    terminal.unload()
end

return Archives
