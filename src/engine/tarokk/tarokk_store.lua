local loader = require("src.data.loader")
local tarokk_card_state = require("src.engine.tarokk.tarokk_card_state")
local tarokk_card = require("src.engine.tarokk.tarokk_card")

local TarokkStore = {
    cards = {}
}

-- Loads all tarokk cards from data files into memory.
function TarokkStore:load()
    local cards = loader.load("tarokk")
    for key, value in pairs(cards) do
        local tarokk_card_state = nil
        if value.type == "Major" then
            tarokk_card_state =
                tarokk_card_state(value.suit, value.elemental, value.north, value.east, value.south, value.west)
        end
        local tarokk_card = tarokk_card(value.name, value.level, value.arcana, tarokk_card_state)
        self.cards[value.name] = card
    end
end

return TarokkStore
