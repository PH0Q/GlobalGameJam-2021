-- blob's properties
player = {}
player.timer = Timer.new()
player.width = 245 -- width of the animation
player.height = 447 -- height of the animation
player.isMoving = false
player.isAlive = true

-- Physics properties
player.collider = world:newCircleCollider(0,0,player.width*0.08)
player.collider:setCollisionClass("Player")
player.collider:setType("dynamic")
player.collider:setFixedRotation( true )

player.grids = {}

player.sx = 1

-- offset
local left = 0
local top = 0
local border = 0
player.grids.walk = anim8.newGrid(player.width, player.height, sprites.player:getWidth(), sprites.player:getHeight(), left, top, border)

player.sprite = sprites.player --sprites.player_back

-- This value stores the player's current animation
--player.anim = player.animations.top

function player:update(dt)

    -- Freeze the animation if the player isn't moving
    --if player.isMoving then
        --player.anim:update(dt)
    --end

    local vectorX = 0
    local vectorY = 0

    -- Keyboard direction checks for movement
    if love.keyboard.isDown("left") then
        vectorX = -1
        --player.anim = player.animations.left
        player.dir = "left"
    end
    if love.keyboard.isDown("right") then
        vectorX = 1
        --player.anim = player.animations.right
        player.dir = "right"
    end
    if love.keyboard.isDown("up") then
        vectorY = -1
        --player.anim = player.animations.top
        player.dir = "up"
    end
    if love.keyboard.isDown("down") then
        vectorY = 1
        --player.anim = player.animations.bottom
        player.dir = "down"
    end

    player.collider:setLinearVelocity(vectorX * 300, vectorY * 300)

    -- Check if player is moving
    if vectorX == 0 and vectorY == 0 then
        player.isMoving = false
    else
        player.isMoving =  true
    end

end

function player:draw()

    local px = player.collider:getX()
    local py = player.collider:getY()


    if player.dir == "right" then
      player.sx = 1
    elseif player.dir == "left" then
      player.sx = -1
    elseif player.dir == "up" then
      player.sprite = sprites.player_back
    elseif player.dir == "down" then
      player.sprite = sprites.player
    end

    -- Draw the player's walk animation
    love.graphics.draw(player.sprite, px, py, nil, player.sx*0.2, 0.2, player.width/2, player.height/1.24)

end

function player:die()
    player.collider:setPosition(0, 0)
    player.collider:setLinearVelocity(0, 0)
    player.isAlive = false
    player.timer:after(5, function() player.isAlive = true end)
end
