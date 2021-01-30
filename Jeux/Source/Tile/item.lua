item = {}
item.__index = item

function item:new(p_x, p_y, p_sprite, p_width, p_height)
    local this = {
      x = p_x,
      y = p_y,
      width = p_width,
      height = p_height
    }


    self.collider = world:newRectangleCollider(this.x, this.y, this.width, this.height)
    self.collider:setType('static')
    self.collider:setCollisionClass("item")

    self.sprite = p_sprite

    setmetatable(this, self)
    return this
end

function item:draw()
    love.graphics.draw( self.sprite, self.x, self.y)
end
