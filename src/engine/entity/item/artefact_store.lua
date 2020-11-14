local loader = require("src.data.loader")
local artefact = require("src.engine.entity.item.artefact")

local ArtefactStore = {
    artefacts = {}
}

-- Loads all artefacts from data files into memory.
function ArtefactStore:load()
    local artefacts = loader.load("artefacts")
    for key, value in pairs(artefacts) do
        local artefact = artefact(value.name, value.description, value.upgrades, value.location, value.reputation)
        self.artefacts[key] = artefact
    end
end

-- Return a random artefact belonging to a location.
-- @param location The dungeon location.
function ArtefactStore:random(location)
    local matches = {}
    for _, artefact in pairs(self.artefacts) do
        if artefact.location == location then
            table.insert(matches, artefact)
        end
    end
    return matches[math.random(#matches)]
end

-- Adds an artefact onto the State.
-- @param name The name of the artefact.
function ArtefactStore:add(name)
    -- add name to self.state
end

-- Removes an artefact from the State.
-- @param name The name of the artefact.
function ArtefactStore:remove(name)
    -- remove name from self.state
end

-- Returns a count of named artefacts held in State.
-- @param name The name of the artefact.
function ArtefactStore:count(name)
    -- count name from self.state
end

return ArtefactStore
