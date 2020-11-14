local pprint = require("lib.dev.pprint")

local Usurper = {
    well_of_souls = {
        {name= "Amon"},
        {name= "Bael"},
        {name= "Charun"},
        {name= "Daeva"}
    },
    reigning = {
    },
    team = {
    }
}

local personalities = {"Hardy", "Brave", "Docile", "Timid", "Rash", "Careful"}
local quirks = {
    positive = {"Fire-Proof", "Immune to Curse", "Enraged", "Agile", "Lifesteal", "Powerful", "Focused", "Stalwart"},
    negative = {"Deserter", "Intimidated", "Sickly", "Burning", "Vulnerable", "Clumsy", "Weak", "Soft-Headed", "Paranoid", "Selfish"}
}

-- Fisher-Yates shuffle
local function shuffle(list)
    for i = #list, 2, -1 do
        local j = math.random(i)
		list[i], list[j] = list[j], list[i]
	end
end

local function init_power_levels()
    for _, demon in ipairs(Usurper.well_of_souls) do
        demon.power_level = 1
    end
end

local function init_personality()
    for _, demon in ipairs(Usurper.well_of_souls) do
        demon.personality = personalities[math.random(#personalities)]
    end
end

local function init_quirks()
    for _, demon in ipairs(Usurper.well_of_souls) do
        shuffle(quirks.positive)
        shuffle(quirks.negative)
        demon.quirks = {
            positive = {quirks.positive[1]},
            negative = {table.unpack(quirks.negative, 1, 3)}
        }
    end
end

function Usurper:init()
    init_power_levels()
    init_personality()
    init_quirks()
    pprint(Usurper.well_of_souls)
end

return Usurper
