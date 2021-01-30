physical_decoration = {}
physical_decoration.__index = physical_decoration

function physical_decoration:new(p_x, p_y, p_sprite, p_width, p_height)
    local v_x = p_x
    local v_y = p_y
    local v_width = p_width or 50
    local v_height = p_height or 50
    local v_sprite = p_sprite

    local this = {
        height = v_height,
        width = v_width,
        y = v_y,
        x = v_x,
        sprite = p_sprite
    }

    self.collider = world:newRectangleCollider(v_x, v_y, v_width, v_height)
    self.collider:setType('static')
    self.collider:setCollisionClass("physical_decoration")


    setmetatable(this, self)
    return this
end

function physical_decoration:draw()
    love.graphics.draw( self.sprite, self.x, self.y)
end
