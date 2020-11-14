local t = require("lib.dev.luaunit")
local log = require("lib.log")
local archives = require("src.engine.system.archives")

TestArchives = {}

function TestArchives:setUp()
    log.level = "fatal"
end

function TestArchives:test_talk()
    t.assertEquals(archives.talk(), "hello")
end

function TestArchives:test_init()
    -- testing
    archives.init()
end

os.exit(t.LuaUnit.run())
