-- blob's properties
player = {}
player.width = 50 -- width of the animation
player.height = 47 -- height of the animation
player.isMoving = false

-- Physics properties
player.collider = world:newCircleCollider(0, 0, 40)
player.collider:setCollisionClass("Player")

player.grids = {}
-- offset
local left = 1
local top = 0
local border = 1
player.grids.walk = anim8.newGrid(player.width, player.height, sprites.blob:getWidth(), sprites.blob:getHeight(), left, top, border)

player.animations = {}
player.animations.move = anim8.newAnimation(player.grids.walk('1-2', 1), 0.300)

-- This value stores the player's current animation
player.anim = player.animations.move



function player:update(dt)

    -- Freeze the animation if the player isn't moving
    if player.isMoving then
        player.anim:update(dt)
    end

    local vectorX = 0
    local vectorY = 0

    -- Keyboard direction checks for movement
    if love.keyboard.isDown("left") then
        vectorX = -1
        player.anim = player.animations.move
        player.dir = "left"
    end
    if love.keyboard.isDown("right") then
        vectorX = 1
        player.anim = player.animations.move
        player.dir = "right"
    end
    if love.keyboard.isDown("up") then
        vectorY = -1
        player.anim = player.animations.move
        player.dir = "up"
    end
    if love.keyboard.isDown("down") then
        vectorY = 1
        player.anim = player.animations.move
        player.dir = "down"
    end

    player.collider:setLinearVelocity(vectorX * 300, vectorY * 300)

    -- Check if player is moving
    if vectorX == 0 and vectorY == 0 then
        player.isMoving = false
        player.anim:gotoFrame(2) -- go to standing frame
    else
        player.isMoving =  true
    end

end

function player:draw()

    local px = player.collider:getX()
    local py = player.collider:getY()

    -- sx represents the scale on the x axis for the player animation
    local sx = 1

    -- Draw the player's walk animation
    love.graphics.setColor(1, 1, 1, 1)
    player.anim:draw(sprites.blob, px, py, nil, sx, 1, player.width/2, player.height/1.3)

end
