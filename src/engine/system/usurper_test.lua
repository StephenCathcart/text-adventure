local t = require("lib.dev.luaunit")
local log = require("lib.log")
local usurper = require("src.engine.system.usurper")

TestUsurper = {}

function TestUsurper:setUp()
    log.level = "fatal"
end

function TestUsurper:test_init()
    -- testing
    usurper:init()
end

os.exit(t.LuaUnit.run())
