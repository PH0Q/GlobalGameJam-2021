function love.load()
    require("source/startup/gameStart")
    gameStart()
    mapCreation()
end

function love.update(dt)
    player:update(dt)
    world:update(dt)
    cam:update(dt)
    if player.isAlive == false then
        death_modal = Modal:new("centered", 200, 150, {top=10, bottom=10, left=10, right=10})
        death_modal:setImageBackground(love.graphics.newImage("Source/Assets/death_modal_background.png"))
        death_modal:displayText("You are dead")
    end
end

function love.draw()
    camera:attach()
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(sprites.background, -2169, -1800)
        player:draw()
        love.graphics.setLineWidth(5)
    camera:detach()

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
