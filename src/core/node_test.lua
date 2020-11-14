local t = require("lib.dev.luaunit")
local node = require("src.core.node")

TestNode = {}

function TestNode.setUp()
end

function TestNode.test_new_default()
    local node = node()
    t.assertEquals(node.value, nil)
    t.assertEquals(node.neighbours, {})
end

function TestNode.test_new_value()
    local node = node(1)
    t.assertEquals(node.value, 1)
    t.assertEquals(node.neighbours, {})
end

function TestNode.test_add_neighbour()
    local node_1 = node(1)
    local node_2 = node(2)
    local node_3 = node(3)
    node_1:add_neighbour(node_2, node.directions.north)
    node_1:add_neighbour(node_3, node.directions.east)
    node_2:add_neighbour(node_3, node.directions.south)
    t.assertEquals(#node_1.neighbours, 2)
    t.assertEquals(node_1.neighbours[1].direction, 1)
    t.assertEquals(node_1.neighbours[2].direction, 2)
    t.assertEquals(#node_2.neighbours, 1)
    t.assertEquals(node_2.neighbours[1].direction, 3)
    t.assertEquals(#node_3.neighbours, 0)
end

function TestNode.test_add_neighbour_invalid_state()
    t.assertErrorMsgContains("invalid node", node.add_neighbour, node, 1, 2)
end

function TestNode.test_add_neighbours()
    local node_1 = node(1)
    local node_2 = node(2)
    local node_3 = node(3)
    node_1:add_neighbours(
        {node = node_2, direction = node.directions.north},
        {node = node_3, direction = node.directions.east}
    )
    t.assertEquals(#node_1.neighbours, 2)
    t.assertEquals(node_1.neighbours[1].direction, 1)
    t.assertEquals(node_1.neighbours[2].direction, 2)
end

function TestNode.test_set_value()
    local node = node()
    node:set_value(2)
    t.assertEquals(node.value, 2)
end

function TestNode.test_set_value_invalid_state()
    t.assertErrorMsgContains("invalid value", node.set_value, node, nil)
end

function TestNode.test_is_empty()
    local node = node()
    t.assertEquals(node:is_empty(), true)
    node.value = 1
    t.assertEquals(node:is_empty(), false)
end

os.exit(t.LuaUnit.run())
