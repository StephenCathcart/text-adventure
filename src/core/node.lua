local guard = require("src.core.guard")
local array_util = require("src.core.array_util")
local class = require("src.core.class")
local Node = class:derive("Node")

-- A node may be connected to a neighbour in the following directions.
Node.directions = {north = 1, east = 2, south = 3, west = 4}

-- Creates a new Node object.
function Node:new(value)
    self.value = value or nil
    self.neighbours = {}
end

-- Adds multiple existing nodes as directed neighbours of this node.
-- @param ... A list of node, direction data structures each to be added as neighbours.
function Node:add_neighbours(...)
    for _, neighbour in ipairs({...}) do
        self:add_neighbour(neighbour.node, neighbour.direction)
    end
end

-- Adds an existing node as a directed neighbour of this node.
-- @param node The node to add as a neighbour.
-- @param direction The direction of the connected neighbour.
function Node:add_neighbour(node, direction)
    assert(guard.class(node, "Node"), "invalid node")
    assert(array_util.contains(self.directions, direction), "invalid direction")
    table.insert(self.neighbours, {node = node, direction = direction})
end

-- Returns the gained xp per party member for defeating demon.
-- @param value The value this node should hold.
function Node:set_value(value)
    assert(value, "invalid value")
    self.value = value
end

-- Returns true if the node has no value.
function Node:is_empty()
    return self.value == nil
end

return Node
