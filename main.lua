function love.load()

    require("source/startup/gameStart")
    gameStart()

end

function love.update(dt)

    player:update(dt)
    world:update(dt)

end

function love.draw()
    cam:attach()

        -- Draw the background image
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setBackgroundColor(0, 0, 0, 1)
        player:draw()

        love.graphics.setLineWidth(5)
        --world:draw()

    cam:detach()


end

function love.keypressed(key)

    if key == "m" then
        love.window.showMessageBox("coucouc", "test", "error", true)
    end

    if key == "k" then
        player:die()
    end

end
