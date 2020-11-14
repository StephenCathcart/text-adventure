local json = require("lib.json")

local Loader = {}

local function read_file(dir, item)
    local file = assert(io.open("./" .. dir .. "/" .. item, "r"))
    local content = file:read("*a")
    file:close()
    return content
end

-- Loader module.
-- @param directory The directory to load data from.
function Loader.load(directory)
    assert(directory, "invalid directory")
    local data = {}
    local dir = "src/data/" .. directory
    local items = love.filesystem.getDirectoryItems(dir)
    for i, item in ipairs(items) do
        local content = read_file(dir, item)
        local object = json.decode(content)
        data[i] = object
    end
    return data
end

return Loader
