-- maybe not local, Singleton event emitter for...
local EventEmitter = {
    listeners = {
        keypressed = {},
        keyreleased = {},
        terminal = {},
        transition = {}
    }
}

local function event_guard(event)
    if not EventEmitter.listeners[event] then
        error("unsupported event type")
    end
end

-- emit event to all listeners
function EventEmitter:emit(event, args)
    event_guard(event)
    for _, func in pairs(self.listeners[event]) do
        func(args)
    end
end

function EventEmitter:register(event, func)
    event_guard(event)
    table.insert(self.listeners[event], func)
end

function EventEmitter:unregister(event, func)
    event_guard(event)
    for i, listener in pairs(self.listeners[event]) do
        if listener == func then
            table.remove(self.listeners[event], i)
            break
        end
    end
end

function EventEmitter:unregister_all()
    for listener, _ in pairs(self.listeners) do
        self.listeners[listener] = {}
    end
end

return EventEmitter
