-- blob's properties
player = {}
player.width = 50 -- width of the animation
player.height = 47 -- height of the animation
player.isMoving = false
player.isAlive = true

-- Physics properties
player.collider = world:newCircleCollider(0, 0, 40)
player.collider:setCollisionClass("Player")

player.grids = {}
-- offset
local left = 0
local top = 0
local border = 0
player.grids.walk = anim8.newGrid(player.width, player.height, sprites.player:getWidth(), sprites.player:getHeight(), left, top, border)

player.animations = {}
player.animations.move = anim8.newAnimation(player.grids.walk('1-2', 1), 0.300)
player.animations.left = anim8.newAnimation(player.grids.walk('4-4', 1), 0.300)
player.animations.right = anim8.newAnimation(player.grids.walk('2-2', 1), 0.300)
player.animations.top = anim8.newAnimation(player.grids.walk('1-1', 1), 0.300)
player.animations.bottom = anim8.newAnimation(player.grids.walk('3-3', 1), 0.300)

-- This value stores the player's current animation
--player.anim = player.animations.top

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
        player.anim = player.animations.left
        player.dir = "left"
    end
    if love.keyboard.isDown("right") then
        vectorX = 1
        player.anim = player.animations.right
        player.dir = "right"
    end
    if love.keyboard.isDown("up") then
        vectorY = -1
        player.anim = player.animations.top
        player.dir = "up"
    end
    if love.keyboard.isDown("down") then
        vectorY = 1
        player.anim = player.animations.bottom
        player.dir = "down"
    end

    player.collider:setLinearVelocity(vectorX * 300, vectorY * 300)

    -- Check if player is moving
    if vectorX == 0 and vectorY == 0 then
        player.isMoving = false
        player.anim = player.animations.bottom
        player.anim:gotoFrame(1) -- go to standing frame
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
    player.anim:draw(sprites.player, px, py, nil, sx, 1, player.width/2, player.height/1.3)

end

function player:die()
    player.collider:setPosition(0, 0)
    player.collider:setLinearVelocity(0, 0)
    player.isAlive = false
end
