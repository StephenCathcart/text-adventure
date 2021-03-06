local Class = {}
Class.__index = Class

-- Default implementation
function Class.new() end

-- Create new Class type from super
function Class:derive(type)
    local cls = {}
    cls["__call"] = Class.__call
    cls.type = type
    cls.__index = cls
    cls.super = self
    setmetatable(cls, self)
    return cls
end

function Class:__call(...)
    local instance = setmetatable({}, self)
    instance:new(...)
    return instance
end

function Class:get_type()
    return self.type
end

return Class