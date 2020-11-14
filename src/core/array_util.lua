local guard = require("src.core.guard")

local ArrayUtil = {}

-- Returns the number of items held by array as # doesn't always work when
-- index does not begin with 1.
-- @param array The array in which to count items.
function ArrayUtil.count(array)
    assert(guard.array(array), "invalid array")
    local count = 0
    for _ in pairs(array) do
        count = count + 1
    end
    return count
end

-- Returns true if the array contains value.
-- @param array The array to check.
-- @param value The value to check exists in array.
function ArrayUtil.contains(array, value)
    assert(guard.array(array), "invalid array")
    assert(value, "invalid value")
    for _, v in pairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

return ArrayUtil
