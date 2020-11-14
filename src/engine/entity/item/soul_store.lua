local loader = require("src.data.loader")
local soul = require("src.engine.entity.item.soul")

local SoulStore = {
    souls = {}
}

-- Loads all soul from data files into memory.
function SoulStore:load()
    -- TODO - might just need to loop through demon names
end

-- Return a random soul.
function SoulStore:random()
    -- return random from self.souls
end

-- Adds a soul onto the State.
-- @param name The name of the soul.
function SoulStore:add(name)
    -- add name to self.state
end

-- Removes a soul from the State.
-- @param name The name of the soul.
function SoulStore:remove(name) 
    -- remove name from self.state
end

-- Returns a count of named souls held in State.
-- @param name The name of the soul.
function SoulStore:count(name) 
    -- count name from self.state
end

return SoulStore