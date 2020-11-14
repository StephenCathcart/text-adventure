local log = require("lib.log")
local node = require("src.core.node")
local guard = require("src.core.guard")
local tarokk_card = require("src.engine.tarokk.tarokk_card")

local TarokkBoard = {
    elements = {},
    players = {
        human = 1,
        ai = 2
    },
    grid = {}
}

-- Sets up a fresh board ready for playing.
function TarokkBoard:setup()
    local node_1 = node()
    local node_2 = node()
    local node_3 = node()
    local node_4 = node()
    local node_5 = node()
    local node_6 = node()
    local node_7 = node()
    local node_8 = node()
    local node_9 = node()

    node_1:add_neighbours(
        {node = node_2, direction = node.directions.east},
        {node = node_4, direction = node.directions.south}
    )
    node_2:add_neighbours(
        {node = node_1, direction = node.directions.west},
        {node = node_3, direction = node.directions.east},
        {node = node_5, direction = node.directions.south}    
    )
    node_3:add_neighbours(
        {node = node_2, direction = node.directions.west},
        {node = node_6, direction = node.directions.south}    
    )
    node_4:add_neighbours(
        {node = node_1, direction = node.directions.north},
        {node = node_5, direction = node.directions.east},
        {node = node_7, direction = node.directions.south}    
    )
    node_5:add_neighbours(
        {node = node_2, direction = node.directions.north},
        {node = node_4, direction = node.directions.west},
        {node = node_6, direction = node.directions.east},
        {node = node_8, direction = node.directions.south}   
    )
    node_6:add_neighbours(
        {node = node_3, direction = node.directions.north},
        {node = node_5, direction = node.directions.west},
        {node = node_9, direction = node.directions.south}    
    )
    node_7:add_neighbours(
        {node = node_4, direction = node.directions.north},
        {node = node_8, direction = node.directions.east}    
    )
    node_8:add_neighbours(
        {node = node_5, direction = node.directions.north},
        {node = node_7, direction = node.directions.west},
        {node = node_9, direction = node.directions.east}    
    )
    node_9:add_neighbours(
        {node = node_6, direction = node.directions.north},
        {node = node_8, direction = node.directions.west}    
    )

    self.grid = {
        [1] = {node = node_1, owner = nil, element = self:create_element()},
        [2] = {node = node_2, owner = nil, element = self:create_element()},
        [3] = {node = node_3, owner = nil, element = self:create_element()},
        [4] = {node = node_4, owner = nil, element = self:create_element()},
        [5] = {node = node_5, owner = nil, element = self:create_element()},
        [6] = {node = node_6, owner = nil, element = self:create_element()},
        [7] = {node = node_7, owner = nil, element = self:create_element()},
        [8] = {node = node_8, owner = nil, element = self:create_element()},
        [9] = {node = node_9, owner = nil, element = self:create_element()}
    }
end

-- Has a low chance to return an element. Otherwise returns nil for no element.
function TarokkBoard:create_element()
    if math.random() > 0.8 then
        return self.elements[math.random(#self.elements)]
    end
end

-- Flips a coin. Returns true if player won the coin flip, otherwise false.
function TarokkBoard:coin_flip()
    return math.random(1, 2) == 1
end

-- Adds a card to a specific position on the board.
-- @param position The position to place the card.
-- @param card The card to place in specified position.
function TarokkBoard:place(position, card, owner)
    assert(position >= 1 and position <= 9, "invalid position")
    assert(guard.class(card, "TarokkCard"), "invalid card")
    assert(self.grid[position].node.value == nil, "position already populated")
    assert(owner == self.players.human or owner == self.players.ai, "invalid owner")
    self.grid[position].node.value = card
    self.grid[position].owner = owner
    -- resolve any battles
    -- check if game over
    --    if so calculate winner and emit
end

--
function TarokkBoard:battle(location_attacking, location_defending)
    -- if location_attacking.element && location_attacking.element
    -- local attacking_stat = node_attacking.value.state.north
    -- if node_attacking.value.state.north > node_defending.value.state.south then
    -- end
end

function TarokkBoard:calculate_stat(location, direction)
    assert(location.node.value, "location has no card")
    local stat = location.node.value.state[direction]
    -- if the card is not elemental then return base stat
    if not location.node.value.state.elemental then
        return stat
    end
    -- if the location does not have an element then return base stat
    if not location.element then
        return stat
    end
    -- if location element and card element matches, increase power, else decrease.
    if location.element == location.node.value.state.suit then
        return stat + 1
    else
        return stat - 1
    end
end

-- Returns current score for owner.
-- @param owner The owner to find score for.
function TarokkBoard:score(owner)
    assert(owner == self.players.human or owner == self.players.ai, "invalid owner")
    local score = 0
    for _, v in ipairs(self.grid) do
        if v.owner == owner then
            score = score + 1
        end
    end
    return score
end

-- Returns true if all locations have an owner, otherwise false.
function TarokkBoard:is_complete()
    local is_complete = true
    for _, v in ipairs(self.grid) do
        if v.owner == nil then
            is_complete = false
            break
        end
    end
    return is_complete
end

-- Returns true if all locations have an owner, otherwise false.
function TarokkBoard:set_elements(elements)
    assert(guard.array(elements), "invalid elements")
    self.elements = {}
    for _, element in pairs(elements) do
        assert(guard.string(element), "invalid element")
        table.insert(self.elements, element)
    end
end

return TarokkBoard
