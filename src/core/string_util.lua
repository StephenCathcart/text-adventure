local guard = require("src.core.guard")

local StringUtil = {}

-- Capitalise the first letter of given string.
-- @param str The string to capitalise.
function StringUtil.first_to_upper(str)
    assert(guard.string(str), "invalid string")
    return (str:gsub("^%l", string.upper))
end

return StringUtil
