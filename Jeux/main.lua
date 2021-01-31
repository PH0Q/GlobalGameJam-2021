function love.load()
    require("source/startup/gameStart")
    gameStart()

    dayNight:start()

    death_modal = Modal:new("centered", 200, 150, {top=10, bottom=10, left=10, right=10})
    death_modal:setImageBackground(love.graphics.newImage("Source/Assets/death_modal_background.png"))
    death_modal:displayText("You are dead")



end

function love.update(dt)
    player:update(dt)
    world:update(dt)
    cam:update(dt)

    dayNight.timer:update(dt)
    player.timer:update(dt)
end

function love.draw()
    camera:attach()

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setBackgroundColor(0.19, 0.35, 0.88, 1)
        love.graphics.draw(sprites.background, -2500/2, -2500/2)

        for i, v in ipairs(terrain.groundDecorators) do
            terrain.groundDecorators[i]:draw()
        end

        player:draw()
        for i, v in ipairs(terrain.decorators) do
            terrain.decorators[i]:draw()
        end
        love.graphics.setLineWidth(5)

        --debug
        --world:draw()
        --end debug
    camera:detach()

    --draw front filter
    dayNight:draw()

    --draw UI

    if player.isAlive == false then
        death_modal:draw()
    end
end

function love.keypressed(key)
    if key == "k" then
        player:die()
    end
    if key == "space" then
        local px, py = frontInteraction(60)
        local colliders = world:queryCircleArea(px, py, 40, {"button"})
        if #colliders > 0 then
          score = score + #colliders
        end
    end

end

function love.keyreleased(key)
end
