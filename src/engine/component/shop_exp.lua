local font = require("src.engine.font")
local color = require("src.engine.accessibility.color")
local util = require("src.engine.component.util")

local ShopExp = {}

function ShopExp:load(location, artefact, reputation, next, percentage)
    self.location = location
    self.artefact = artefact
    self.reputation = reputation
    self.next = next
    self.percentage = percentage
end

local function draw_experience_bar(artefact, reputation, next, percentage)
    local screen_width = love.graphics.getWidth()
    local hard_text_width = font.default:getWidth("\t\t"..artefact..": []["..reputation.."/"..next.." XP]\t\t")
    local xp_max_length = (screen_width - hard_text_width) / font.default:getWidth(">")
    local xp_length = math.floor(xp_max_length * percentage)

    local xp_bar = ""
    for _ = 1, xp_length do xp_bar = xp_bar .. ">" end
    for _ = 1, (xp_max_length - xp_length) do xp_bar = xp_bar .. "-" end

    local exp_text = {
        color.common, "\t\t"..artefact..": ",
        color.common, "[",
        color.rare, xp_bar,
        color.common, "]",
        color.common, "[",
        color.uncommon, reputation.."/"..next,
        color.common, " XP]"
    }
    love.graphics.print(exp_text, 0, util.y_offset(ShopExp.location))
end


function ShopExp:draw()
    draw_experience_bar(self.artefact, self.reputation, self.next, self.percentage)
end

return ShopExp
