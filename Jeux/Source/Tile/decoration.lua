decoration = {}
decoration.__index = decoration

function decoration:new(p_x, p_y, p_sprite, p_width, p_height)
  local this = {
    x = p_x,
    y = p_y,
    width = p_width,
    height = p_height,
    sprite = p_sprite,
    collider = world:newRectangleCollider(p_x, p_y, p_width, p_height)
  }

  this.collider:setType('static')
  this.collider:setCollisionClass("decoration")


  setmetatable(this, self)
  return this
end

function decoration:draw()
  love.graphics.draw(self.sprite.img, self.collider:getX(), self.collider:getY(), nil, self.sprite.scale, self.sprite.scale, self.sprite.width, self.sprite.height)
end
