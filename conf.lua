function love.conf( t )
    t.identity      = "GtGLG"

    t.window.title  = "Text Adventure"
    t.window.width  = 800
    t.window.height = 450
    t.window.fullscreen = false
    t.window.resizable = true

    t.accelerometerjoystick = false

    t.modules.mouse = false
    t.modules.physics = false
    t.modules.touch = false
    t.modules.video = false
    t.modules.thread = false
end