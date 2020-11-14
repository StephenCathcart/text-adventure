local class = require("src.core.class")
local guard = require("src.core.guard")
local Artefact = class:derive("Artefact")

-- Artefact module.
-- @param name The name of the artefact.
-- @param description A description of the artefact.
-- @param upgrades What building the artefact upgrades.
-- @param location Where the artefact is found.
-- @param reputation The reputation gain.
function Artefact:new(name, description, upgrades, location, reputation)
    assert(guard.string(name), "invalid name")
    assert(guard.string(description), "invalid description")
    assert(guard.string(upgrades), "invalid upgrades")
    assert(guard.string(location), "invalid location")
    assert(guard.number(reputation), "invalid reputation")
    self.name = name
    self.description = description
    self.upgrades = upgrades
    self.location = location
    self.reputation = reputation
end

function Artefact:__tostring(e)
    return self:get_type() ..
        "{name=" ..
            self.name ..
                ",description=" ..
                    self.description ..
                        ",upgrades=" ..
                            self.upgrades .. ",location=" .. self.location .. ",reputation=" .. self.reputation .. "}"
end

return Artefact
