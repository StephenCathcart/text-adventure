local event_emitter = require("src.engine.event_emitter")
local game = require("src.engine.game")

function love.load(args)
  game.load(args)
end

function love.update(dt)
  game.update(dt)
end

function love.draw()
  game.draw()
end

function love.keypressed(key)
  event_emitter:emit("keypressed", key)
end

function love.keyreleased(key)
  event_emitter:emit("keyreleased", key)
end

function love.resize(w, h)
  game.resize()
end

function love.focus(focused)
end

function love.visible(visible)
end

function love.quit()
  game.shutdown()
end
