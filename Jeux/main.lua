function love.load()

    require("source/startup/gameStart")
    gameStart()

end

function love.update(dt)

    player:update(dt)
    world:update(dt)

    local dx,dy = player.collider:getX() - cam.x, player.collider:getY() - cam.y
    cam:move(dx/2, dy/2)


end

function love.draw()
    cam:attach()

        -- Draw the background image
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(sprites.background, -2169, -1800)

        player:draw()

        love.graphics.setLineWidth(5)
        --world:draw()

    cam:detach()


end

function love.keypressed(key)

    -- Resets the player's position to (0, 0)
    if key == "r" then
        player.collider:setPosition(0, 0)
        player.collider:setLinearVelocity(0, 0)
    end

end
