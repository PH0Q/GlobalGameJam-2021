function love.load()
    require("source/startup/gameStart")
    gameStart()
end

function love.update(dt)
    player:update(dt)
    world:update(dt)
    if player.isAlive == false then
        death_modal = Modal:new("centered", 200, 150, {top=10, bottom=10, left=10, right=10})
        death_modal:setSolidBackground(0, 1, 0, 1)
        death_modal:displayText("You died")
    end
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
    if player.isAlive == false then
        death_modal:drawModal()
    end
end

function love.keypressed(key)
    if key == "k" then
        player:die()
    end

end

function love.keyreleased(key)
end
