local Font = {
    default = nil
}

local screen_rows = 21

-- Load and set application wide font with a default filter of nearest.
function Font.load()
    local font_size = math.floor(love.graphics.getHeight() / screen_rows)
    Font.default = love.graphics.newFont("assets/fonts/VT323-Regular.ttf", font_size)
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setFont(Font.default)
end

return Font
