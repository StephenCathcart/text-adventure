local Color = {
    danger = {0.988, 0.050, 0.105}, -- red
    trash = {0.749, 0.749, 0.749}, -- light grey
    common = {1, 1, 1}, -- white
    uncommon = {0.992, 0.988, 0.231}, -- yellow
    rare = {0.211, 0.968, 0.960}, -- light blue
    exotic = {0.168, 0.956, 0.188}, -- green
    mythic = {0.952, 0.125, 0.737}, -- pink
    legendary = {0.960, 0.517, 0.160} -- orange
}

-- Gets a palette of colors that should be distinguishable
-- for normal vision, deuteranopia, protanopia, and tritanopia.
function Color.color_blind_palette()
end

return Color
