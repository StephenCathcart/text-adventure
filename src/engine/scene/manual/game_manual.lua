local log = require("lib.log")
local event_emitter = require("src.engine.event_emitter")
local key_binding = require("src.engine.accessibility.key_binding")
local banner = require("src.engine.component.banner")
local terminal = require("src.engine.component.terminal")
local scene = require("src.engine.scene.scene")
local GameManual = scene:derive("GameManual")

local function on_terminal(command)
    if command == key_binding.manual.combat then
        -- event_emitter:emit("transition", "CombatManual")
    elseif command == key_binding.manual.demons then
        -- event_emitter:emit("transition", "DemonManual")
    elseif command == key_binding.manual.inventory then
        -- event_emitter:emit("transition", "InventoryManual")
    elseif command == key_binding.manual.world then
        -- event_emitter:emit("transition", "WorldManual")
    elseif command == key_binding.manual.back then
        event_emitter:emit("transition", "Town")
    end
end

function GameManual:draw()
    banner:draw()
    terminal:draw()
end

function GameManual:update(dt)
end

function GameManual:enter(args)
    log.trace("GameManual:enter")
    event_emitter:register("terminal", on_terminal)
    banner:load(0, {title="Game Manual"})
    terminal.load(20)
end

function GameManual:exit()
    log.trace("GameManual:exit")
    event_emitter:unregister("terminal", on_terminal)
    terminal.unload()
end

return GameManual
