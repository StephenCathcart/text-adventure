local FPS = {}

-- Displays frames-per-second.
function FPS.draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.printf(
        "FPS: " .. tostring(love.timer.getFPS()).." [BUILD 0.0.1]",
        0,
        love.graphics.getFont():getHeight(),
        love.graphics.getWidth(),
        "right"
    )
    love.graphics.setColor(1, 1, 1)
end

return FPS
