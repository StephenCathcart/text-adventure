local Guard = {}

function Guard.number(var)
    return type(var) == "number"
end

function Guard.string(var)
    return type(var) == "string"
end

function Guard.boolean(var)
    return type(var) == "boolean"
end

function Guard.array(var)
    return type(var) == "table"
end

function Guard.array_of(var, class)
    if type(var) ~= "table" then
        return false
    end
    for _, v in pairs(var) do
        if not Guard.class(v, class) then
            return false
        end
    end
    return true
end

function Guard.array_of_super(var, class)
    if type(var) ~= "table" then
        return false
    end
    for _, v in pairs(var) do
        if not Guard.super(v, class) then
            return false
        end
    end
    return true
end

function Guard.class(var, class)
    return var ~= nil and type(var) == "table" and var.get_type and var:get_type() == class
end

function Guard.super(var, super_class)
    return var ~= nil and type(var) == "table" and var.get_type and var.super:get_type() == super_class
end

return Guard
