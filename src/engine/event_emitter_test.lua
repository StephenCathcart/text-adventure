local t = require("lib.dev.luaunit")
local event_emitter = require("src.engine.event_emitter")

TestEventListener = {}

function TestEventListener:setup()
    event_emitter:unregister_all()
end

function TestEventListener:test_initial_state()
    t.assertEquals(#event_emitter.listeners.keypressed, 0)
    t.assertEquals(#event_emitter.listeners.keyreleased, 0)
end

function TestEventListener:test_register()
    event_emitter:register('keypressed', 1)
    event_emitter:register('keypressed', 1)
    event_emitter:register('keyreleased', 1)
    t.assertEquals(#event_emitter.listeners.keypressed, 2)
    t.assertEquals(#event_emitter.listeners.keyreleased, 1)
end

function TestEventListener:test_unregister()
    table.insert(event_emitter.listeners['keypressed'] , 1)
    t.assertEquals(#event_emitter.listeners.keypressed, 1)
    event_emitter:unregister('keypressed', 1)
    t.assertEquals(#event_emitter.listeners.keypressed, 0)
end

function TestEventListener:test_unregister_all()
    table.insert(event_emitter.listeners['keypressed'] , 1)
    table.insert(event_emitter.listeners['keypressed'] , 1)
    table.insert(event_emitter.listeners['keyreleased'] , 1)
    t.assertEquals(#event_emitter.listeners.keypressed, 2)
    t.assertEquals(#event_emitter.listeners.keyreleased, 1)
    event_emitter:unregister_all()
    t.assertEquals(#event_emitter.listeners.keypressed, 0)
    t.assertEquals(#event_emitter.listeners.keyreleased, 0)
end

-- local function myfunc(event)
--     print('wtf this works')
-- end

-- function TestEventListener:test_derive()
-- local event_emitter = require("src.engine.event_emitter")
-- -- the numbers here will be functions
-- -- table.insert(event_emitter.listeners['keyreleased'] , myfunc)
-- table.insert(event_emitter.listeners['keyreleased'] , 33)
-- table.insert(event_emitter.listeners['keyreleased'] , 44)
-- table.insert(event_emitter.listeners['keypressed'] , 55)

-- -- this guards against adding an unsupported event
-- if event_emitter.listeners['keypressed'] then
--     -- print(true)
-- else
--     -- print(false)
-- end
--     -- body

-- -- emit for event type
-- for k1, v1 in pairs(event_emitter.listeners['keyreleased']) do
--     print('event: '..v1)
-- end

-- for k1, v1 in pairs(event_emitter.listeners) do
--     print('event: '..k1)
--     for k2, v2 in pairs(v1) do
--         -- v2()
--         print('listener: '..k2..' '..v2)
--     end
-- end

-- print('removing...........')
-- table.remove(event_emitter.listeners['keyreleased'])
-- table.remove(event_emitter.listeners['keyreleased'])
-- for k1, v1 in pairs(event_emitter.listeners['keyreleased']) do
--     -- print('event: '..k1..'  '..v1)
--     if v1 == 33 then
--         table.remove(event_emitter.listeners['keyreleased'], k1)
--         break
--     end
-- end
-- print('removed............')

-- for k1, v1 in pairs(event_emitter.listeners) do
--     print('event: '..k1)
--     for k2, v2 in pairs(v1) do
--         -- v2()
--         print('listener: '..k2..' '..v2)
--     end
-- end

os.exit(t.LuaUnit.run())
