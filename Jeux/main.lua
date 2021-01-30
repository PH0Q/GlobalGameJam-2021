function love.load()

    require("source/startup/gameStart")
    gameStart()
                                      --x, y
    pierre = physical_decoration:new(-35, 10, sprites.pierre, 50, 50)
    --pierre_1 = physical_decoration:new(100, 60, sprites.pierre, 50, 50





end

function love.update(dt)

    player:update(dt)
    world:update(dt)
    cam:update()

end

function love.draw()
    camera:attach()

        -- Draw the background image
        love.graphics.setColor(1, 1, 1, 1)
        -- set background and set the origine (here, width/2 and height/2)
        love.graphics.draw(sprites.background, -2500/2, -2500/2)

        pierre:draw()
        player:draw()


        love.graphics.setLineWidth(5)
        --world:draw()


    camera:detach()
    love.graphics.print(camera.scale, 0, 0)

end

function love.keypressed(key)

    -- Resets the player's position to (0, 0)
    if key == "r" then
        player.collider:setPosition(0, 0)
        player.collider:setLinearVelocity(0, 0)
    end

end
