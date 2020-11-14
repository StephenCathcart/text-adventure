local t = require("lib.dev.luaunit")
local log = require("lib.log")
local guard = require("src.core.guard")
local tarokk_card_state = require("src.engine.tarokk.tarokk_card_state")
local tarokk_card = require("src.engine.tarokk.tarokk_card")
local tarokk_board = require("src.engine.tarokk.tarokk_board")

TestTarokkBoard = {}

function TestTarokkBoard:setUp()
    log.level = "fatal"
    tarokk_board.elements = {"Wands", "Cups", "Swords", "Pentacles"}
    tarokk_board:setup()
    self.card = tarokk_card("a", 1, "b", tarokk_card_state("c", false, 1, 2, 3, 4))
    self.elemental_card = tarokk_card("Knight", 9, "Minor", tarokk_card_state("Wands", true, 5, 6, 7, 8))
end

function TestTarokkBoard:test_new_default()
    tarokk_board:setup()
    t.assertEquals(#tarokk_board.grid, 9)
    for _, location in ipairs(tarokk_board.grid) do
        t.assertEquals(location.node.value, nil)
        t.assertEquals(location.owner, nil)
        t.assertNotEquals(location.node.neighbours, {})
    end
end

function TestTarokkBoard:test_create_element()
    for i = 1, 100 do
        tarokk_board:create_element()
    end
end

function TestTarokkBoard:test_coin_flip()
    for i = 1, 100 do
        t.assertTrue(guard.boolean(tarokk_board.coin_flip()))
    end
end

function TestTarokkBoard:test_place()
    tarokk_board:place(3, self.card, tarokk_board.players.ai)
    t.assertEquals(tarokk_board.grid[3].node.value, self.card)
end

function TestTarokkBoard:test_place_invalid_position()
    t.assertErrorMsgContains("invalid position", tarokk_board.place, tarokk_board, 0, self.card, tarokk_board.players.ai)
    t.assertErrorMsgContains("invalid position", tarokk_board.place, tarokk_board, 10, self.card, tarokk_board.players.ai)
end

function TestTarokkBoard:test_place_invalid_card()
    t.assertErrorMsgContains("invalid card", tarokk_board.place, tarokk_board, 1, nil, tarokk_board.players.ai)
end

function TestTarokkBoard:test_place_position_already_populated()
    tarokk_board:place(3, self.card, tarokk_board.players.ai)
    t.assertErrorMsgContains("position already populated", tarokk_board.place, tarokk_board, 3, self.card, tarokk_board.players.ai)
end

function TestTarokkBoard:test_place_invalid_owner()
    t.assertErrorMsgContains("invalid owner", tarokk_board.place, tarokk_board, 3, self.card, "a")
end

function TestTarokkBoard:test_score()
    t.assertEquals(tarokk_board:score(tarokk_board.players.human), 0)
    t.assertEquals(tarokk_board:score(tarokk_board.players.ai), 0)

    tarokk_board.grid[1].owner = tarokk_board.players.ai
    tarokk_board.grid[4].owner = tarokk_board.players.ai
    tarokk_board.grid[7].owner = tarokk_board.players.human

    t.assertEquals(tarokk_board:score(tarokk_board.players.ai), 2)
    t.assertEquals(tarokk_board:score(tarokk_board.players.human), 1)
end

function TestTarokkBoard:test_score_invalid_owner()
    t.assertErrorMsgContains("invalid owner", tarokk_board.score, tarokk_board, nil)
end

function TestTarokkBoard:test_is_complete_fresh_state()
    t.assertEquals(tarokk_board:is_complete(), false)
end

function TestTarokkBoard:test_is_complete_in_progress_state()
    tarokk_board.grid[1].owner = tarokk_board.players.ai
    tarokk_board.grid[2].owner = tarokk_board.players.human

    t.assertEquals(tarokk_board:is_complete(), false)
end

function TestTarokkBoard:test_is_complete_full_state()
    for _, location in ipairs(tarokk_board.grid) do
        location.owner = tarokk_board.players.ai
    end
    t.assertEquals(tarokk_board:is_complete(), true)
end

function TestTarokkBoard:test_set_elements()
    local elements = {"Wands", "Cups", "Swords", "Pentacles"}
    tarokk_board:set_elements(elements)
    t.assertEquals(#tarokk_board.elements, 4)
end

-- function TestTarokkBoard:test_calculate_stat_no_card_element()
--     local card = self.elemental_card
--     card.state.elemental = false
--     tarokk_board.grid[1].node.value = card
--     t.assertEquals(tarokk_board:calculate_stat(tarokk_board.grid[1], "north"), 5)
-- end

-- function TestTarokkBoard:test_calculate_stat_no_location_element()
--     tarokk_board.grid[1].node.value = self.elemental_card
--     tarokk_board.grid[1].element = nil
--     t.assertEquals(tarokk_board:calculate_stat(tarokk_board.grid[1], "north"), 5)
-- end

-- function TestTarokkBoard:test_calculate_stat_matching_element()
--     tarokk_board.grid[1].node.value = self.elemental_card
--     tarokk_board.grid[1].element = "Wands"
--     t.assertEquals(tarokk_board:calculate_stat(tarokk_board.grid[1], "north"), 6)
-- end

-- function TestTarokkBoard:test_calculate_stat_not_matching_element()
--     tarokk_board.grid[1].node.value = self.elemental_card
--     tarokk_board.grid[1].element = "Cups"
--     t.assertEquals(tarokk_board:calculate_stat(tarokk_board.grid[1], "north"), 4)
-- end

-- function TestTarokkBoard:test_calculate_stat_location_has_no_card()
--     t.assertErrorMsgContains("location has no card", tarokk_board.calculate_stat, tarokk_board, tarokk_board.grid[1], "north")
-- end

os.exit(t.LuaUnit.run())
