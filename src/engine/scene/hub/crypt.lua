local log = require("lib.log")
local event_emitter = require("src.engine.event_emitter")
local key_binding = require("src.engine.accessibility.key_binding")
local banner = require("src.engine.component.banner")
local shop_exp = require("src.engine.component.shop_exp")
local shop_banner = require("src.engine.component.shop_banner")
local shop_actions = require("src.engine.component.shop_actions")
local terminal = require("src.engine.component.terminal")
local scene = require("src.engine.scene.scene")
local crypt_system = require("src.engine.system.crypt")
local Crypt = scene:derive("Crypt")

local function on_terminal(command)
    if command == key_binding.crypt.back then
        event_emitter:emit("transition", "Town")
    end
end

function Crypt:draw()
    banner:draw()
    shop_exp:draw()
    shop_banner:draw()
    shop_actions:draw()
    terminal:draw()
end

function Crypt:update(dt)
    terminal:update(dt)
end

-- TODO supply proper values to components
function Crypt:enter(args)
    log.trace("Crypt:enter")
    event_emitter:register("terminal", on_terminal)
    crypt_system:enter()

    -- TODO shop actions needs major update
    print("awakening_eligibility", crypt_system.awakening_eligibility())

    banner:load(0, {title = "Crypt", subtitle = crypt_system:reputation_name()})
    shop_exp:load(11, "Skulls", crypt_system.reputation, crypt_system:reputation_stats())
    shop_banner:load(12, {owner = "Crypt Keeper", intro = "Your souls are nothing but fuel for a greater power."})
    shop_actions:load(15)
    terminal.load(20)
end

function Crypt:exit()
    log.trace("Crypt:exit")
    event_emitter:unregister("terminal", on_terminal)
    terminal.unload()
end

return Crypt
