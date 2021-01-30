Modal = {}
Modal.__index = Modal

function Modal:new(p_location, p_width, p_height, p_padding)
    local v_x = 0
    local v_y = 0
    if p_location == "centered" then
        v_x = (love.graphics.getWidth() - p_width) / 2
        v_y = (love.graphics.getHeight() - p_height) / 2
    else
        v_x = 0
        v_y = 0
    end

    local this = {
        height = p_height,
        width = p_width,
        y = v_y,
        x = v_x,
        padding = {top=p_padding.top, left=p_padding.left, right=p_padding.right, bottom=p_padding.bottom},
        loadingAnim = nil,
        leavingAnim = nil,
        textFont = nil,
        background = nil,
        canvas = love.graphics.newCanvas(p_width, p_height, normal, 0)
    }
    setmetatable(this, self)
    return this
end

function Modal:setSolidBackground(p_red, p_green , p_blue, p_alpha)
    self.background = nil
    love.graphics.setCanvas(self.canvas)
        love.graphics.clear()
        love.graphics.setColor(0, 1, 0, 1)
        love.graphics.rectangle("fill", 0, 0, self.width, self.height)
        self.background = nil
    love.graphics.setCanvas()
end

function Modal:setImageBackground(p_background)
    self.background = p_background
end

function Modal:displayText(text)
    love.graphics.setCanvas(self.canvas)
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.printf(text, self.padding.left, self.padding.top, self.width - self.padding.left - self.padding.right, justify)
    love.graphics.setCanvas()
end

function Modal:drawModal()
    love.graphics.setColor(1, 1, 1, 1)
    if self.background ~= nil then
        love.graphics.draw(self.background, self.x, self.y, nil, 1, 1, 0)
    end
    love.graphics.draw(self.canvas, self.x, self.y, nil, 1, 1, 0)
end
