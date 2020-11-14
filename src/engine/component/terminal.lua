local event_emitter = require("src.engine.event_emitter")
local util = require("src.engine.component.util")

local Terminal = {
    location = nil,
    cursor = "|",
    command = "",
    cursor_timer = 0.530
}

local function input(key)
    Terminal.command = Terminal.command .. key:upper()
end

local function backspace()
    if Terminal.command ~= nil or Terminal.command ~= "" then
        Terminal.command = Terminal.command:sub(1, -2)
    end
end

local function submit()
    event_emitter:emit("terminal", Terminal.command)
    Terminal.command = ""
end

function Terminal.load(location)
    Terminal.location = location
    event_emitter:register("keypressed", Terminal.on_keypressed)
end

function Terminal.unload()
    event_emitter:unregister("keypressed", Terminal.on_keypressed)
end

function Terminal:draw()
    love.graphics.print(">" .. self.command .. self.cursor, 0, util.y_offset(Terminal.location))
end

function Terminal:update(dt)
    if self.cursor_timer <= 0 then
        self:update_cursor()
        self.cursor_timer = 0.530
    end
    self.cursor_timer = self.cursor_timer - dt
end

function Terminal.reset_cursor_time()
    Terminal.cursor = "|"
    Terminal.cursor_timer = 0.530
end

function Terminal:update_cursor()
    if self.cursor == "|" then
        self.cursor = " "
    else
        self.cursor = "|"
    end
end

function Terminal.on_keypressed(key)
    Terminal.reset_cursor_time()
    if key == "backspace" then
        backspace()
    elseif key:match("^[a-z0-9]$") then
        input(key)
    elseif key == "return" then
        submit()
    end
end

return Terminal
