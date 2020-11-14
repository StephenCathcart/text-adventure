local loader = require("src.data.loader")
local provision = require("src.engine.entity.item.provision")

local ProvisionStore = {
    provisions = {}
}

-- Loads all provisions from data files into memory.
function ProvisionStore:load()
end

-- Return a random provision.
function ProvisionStore:random()
    -- return random from self.provisions
end

-- Adds a provision onto the State.
-- @param name The name of the provision.
function ProvisionStore:add(name)
    -- add name to self.state
end

-- Removes a provision from the State.
-- @param name The name of the provision.
function ProvisionStore:remove(name) 
    -- remove name from self.state
end

-- Returns a count of named provisions held in State.
-- @param name The name of the provision.
function ProvisionStore:count(name) 
    -- count name from self.state
end

return ProvisionStore