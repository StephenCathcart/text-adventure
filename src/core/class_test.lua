local t = require("lib.dev.luaunit")
local class = require("src.core.class")

TestClass = {}

function TestClass:setUp()
    local animal = class:derive("Animal")
    function animal.sound()
        return "uh?"
    end
    self.animal = animal
end

function TestClass:test_derive()
    t.assertEquals(self.animal:get_type(), "Animal")
    t.assertEquals(self.animal:sound(), "uh?")
end

function TestClass:test_subclass()
    local cat = self.animal:derive("Cat")
    t.assertEquals(cat:sound(), "uh?")
    function cat.sound()
        return "meow"
    end
    t.assertEquals(cat:get_type(), "Cat")
    t.assertEquals(cat:sound(), "meow")
    t.assertEquals(cat.super:sound(), "uh?")
end

function TestClass:test_subsubclass()
    local cat = self.animal:derive("Cat")
    local minx = cat:derive("Minx")

    t.assertEquals(minx:get_type(), "Minx")
    t.assertEquals(minx.super:get_type(), "Cat")
    t.assertEquals(minx.super.super:get_type(), "Animal")
end

os.exit(t.LuaUnit.run())
