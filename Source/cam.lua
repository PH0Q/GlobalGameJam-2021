-- Camera(x, y, zoom multiplier, rotation)
-- zoom default = 1
cam = {}

camera = Camera(0, 0, 0.5)

function cam:update()
    --cam:zoom()

    --set the postion of the camera du to player position
    local dx,dy = player.collider:getX() - camera.x, player.collider:getY() - camera.y
    camera:move(dx/2, dy/2)
end

-- reduces zoom if moving else expands
function cam:zoom()
    if player.isMoving == true  then
      if camera.scale > 0.8 then
        camera:zoom(0.99)
      end
    else
      if camera.scale < 1 then
        camera:zoom(1.01)
      end
    end
end
