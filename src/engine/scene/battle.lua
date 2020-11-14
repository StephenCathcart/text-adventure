local log = require("lib.log")
local event_emitter = require("src.engine.event_emitter")
local key_binding = require("src.engine.accessibility.key_binding")
local scene = require("src.engine.scene.scene")
local terminal = require("src.engine.component.terminal")
local BattleScene = scene:derive("Battle")

local function on_terminal(command)
    -- if command == key_binding.necronomicon.bestiary.back then
    --     event_emitter:emit("transition", "Town")
    -- end
end

function BattleScene:draw()
    love.graphics.print('BattleScene', 0, 0)
    terminal:draw()
end

function BattleScene:update(dt)
end

function BattleScene:enter(args)
    log.trace('Battle:enter')
    event_emitter:register("terminal", on_terminal)
    terminal.load(20)
end

function BattleScene:exit()
    log.trace('Battle:exit')
    event_emitter:unregister("terminal", on_terminal)
    terminal.unload()
end

return BattleScene