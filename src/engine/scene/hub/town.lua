local log = require("lib.log")
local event_emitter = require("src.engine.event_emitter")
local key_binding = require("src.engine.accessibility.key_binding")
local banner = require("src.engine.component.banner")
local resources = require("src.engine.component.resources")
local event_banner = require("src.engine.component.event_banner")
local actions = require("src.engine.component.actions")
local terminal = require("src.engine.component.terminal")
local scene = require("src.engine.scene.scene")
local town_system = require("src.engine.system.town")
local Town = scene:derive("Town")

local function on_terminal(command)
    if command == key_binding.hub.archives then
        event_emitter:emit("transition", "Archives")
    elseif command == key_binding.hub.crypt then
        event_emitter:emit("transition", "Crypt")
    elseif command == key_binding.hub.manual then
        event_emitter:emit("transition", "GameManual")
    elseif command == key_binding.hub.necronomicon then
        event_emitter:emit("transition", "Bestiary")
    elseif command == key_binding.hub.quit then
        love.event.quit()
    end
end

function Town:draw()
    banner:draw()
    resources:draw()
    event_banner:draw()
    actions:draw()
    terminal:draw()
end

function Town:update(dt)
    terminal:update(dt)
end

function Town:enter(args)
    log.trace("Town:enter")
    event_emitter:register("terminal", on_terminal)
    town_system:enter()
    banner:load(0, {title="Lynchwood", subtitle="Hub", week=town_system.data.week})
    resources:load(10, {
        gold = town_system.data.gold, 
        roster = {current = town_system.data.roster_current, max = town_system.data.roster_max}, 
        souls = town_system.data.souls, 
        soulstones = town_system.data.soulstones}
    )
    event_banner:load(11, {title = "Blood Moon", description = "Blood demons rise under the hour of the blood moon."})
    actions:load(14)
    terminal.load(20)
end

function Town:exit()
    log.trace("Town:exit")
    event_emitter:unregister("terminal", on_terminal)
    terminal.unload()
end

return Town
