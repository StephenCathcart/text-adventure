local t = require("lib.dev.luaunit")
local clone = require("src.core.clone")

TestClone = {}

function TestClone.test_clone_deep()
    local demon = {name = "bune", bio = {age = 666}}
    local cloned = clone.deep(demon)
    demon.name = "ammut"
    demon.bio.age = 888

    t.assertEquals(demon.name, "ammut")
    t.assertEquals(demon.bio.age, 888)
    t.assertEquals(cloned.name, "bune")
    t.assertEquals(cloned.bio.age, 666)
end

function TestClone.test_clone_shallow()
    local demon = {name = "bune", bio = {age = 666}}
    local cloned = clone.shallow(demon)
    demon.name = "ammut"
    demon.bio.age = 888

    t.assertEquals(demon.name, "ammut")
    t.assertEquals(demon.bio.age, 888)
    t.assertEquals(cloned.name, "bune")
    t.assertEquals(cloned.bio.age, 888)
end

os.exit(t.LuaUnit.run())
