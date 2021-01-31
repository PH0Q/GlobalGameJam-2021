physical_decoration = {}
physical_decoration.__index = physical_decoration

function physical_decoration:new(p_x, p_y, p_sprite, p_width, p_height)
    local this = {
      x = p_x,
      y = p_y,
      width = p_width,
      height = p_height,
      sprite = p_sprite,
      collider = world:newRectangleCollider(p_x, p_y, p_width, p_height)
    }

    this.collider:setType('static')
    this.collider:setCollisionClass("physical_decoration")


    setmetatable(this, self)
    return this
end

function physical_decoration:draw()
    love.graphics.draw(self.sprite, self.collider:getX(), self.collider:getY(), nil, 1, 1, self.width/2, self.height/2)
end
