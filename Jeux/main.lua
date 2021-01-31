function love.load()
    require("source/startup/gameStart")
    gameStart()
    decorators, decorators_coordinates = setDecorators()

    score = 0 --debug

    dayNight:start()

end

function love.update(dt)
    player:update(dt)
    world:update(dt)
    cam:update(dt)

    dayNight.timer:update(dt)

    if player.isAlive == false then
        death_modal = Modal:new("centered", 200, 150, {top=10, bottom=10, left=10, right=10})
        death_modal:setImageBackground(love.graphics.newImage("Source/Assets/death_modal_background.png"))
        death_modal:displayText("You are dead")
    end
end

function love.draw()
    camera:attach()

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(sprites.background, -2500/2, -2500/2)
        for i, v in ipairs(decorators.pierres) do
          decorators.pierres[i]:draw()
        end
        --pierre:draw()
        player:draw()
        love.graphics.setLineWidth(5)

        --debug
        world:draw()
        --end debug
    camera:detach()

    --draw front filter
    dayNight:draw()

    --draw UI




    -- debug
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", 0, 0, 150, 40)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print(camera.scale, 0, 0)
    love.graphics.print(player.collider:getX(), 0, 10)
    love.graphics.print(player.collider:getY(), 0, 20)

    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print(score, 0, 40)
    --love.graphics.print(pierre.collider:getY(), 0, 50)

    --love.graphics.print(pierre.x, 50, 40)
    --love.graphics.print(pierre.y, 50, 50)
    -- end debug

    if player.isAlive == false then
        death_modal:drawModal()
    end
end

function love.keypressed(key)
    if key == "k" then
        player:die()
    end
    if key == "space" then
        local px, py = frontInteraction(60)
        local colliders = world:queryCircleArea(px, py, 20, {"physical_decoration"})
        if #colliders > 0 then
          score = score + #colliders
        end
    end

end

function love.keyreleased(key)
end
