local log = require("lib.log")
local event_emitter = require("src.engine.event_emitter")
local key_binding = require("src.engine.accessibility.key_binding")
local banner = require("src.engine.component.banner")
local bestiary_list = require("src.engine.component.bestiary_list")
local bestiary_info = require("src.engine.component.bestiary_info")
local bestiary_actions = require("src.engine.component.bestiary_actions")
local terminal = require("src.engine.component.terminal")
local scene = require("src.engine.scene.scene")
local Bestiary = scene:derive("Bestiary")

local function on_terminal(command)
    if command == key_binding.necronomicon.bestiary.back then
        event_emitter:emit("transition", "Town")
    end
end

function Bestiary:draw()
    banner:draw()
    bestiary_list:draw()
    bestiary_info:draw()
    bestiary_actions:draw()
    terminal:draw()
end

function Bestiary:update(dt)
end

-- TODO supply proper values to components
function Bestiary:enter(args)
    log.trace('Bestiary:enter')
    event_emitter:register("terminal", on_terminal)
    banner:load(0, {title="Necronomicon", subtitle="Bestiary"})
    bestiary_list:load(3)
    bestiary_info:load(16)
    bestiary_actions:load(17)
    terminal.load(20)
end

function Bestiary:exit()
    log.trace('Bestiary:exit')
    event_emitter:unregister("terminal", on_terminal)
    terminal.unload()
end

return Bestiary
