function randomizeSprites(n, map, sprite, world)
    local decorations = {}
    local i = 1
    while(i <= n) do
        local new_x = love.math.random(map.left, map.right)
        local new_y = love.math.random(map.top, map.bottom)

        local local_collider = world:queryRectangleArea(new_x, new_y, sprite.width, sprite.height)
        if #local_collider == 0 then
            decorations[i] = physical_decoration:new(new_x, new_y, sprite.img, sprite.width, sprite.height)
            i = i + 1
        else
            --n = n - 1
        end
    end
    return decorations, i-1
end

function randomizedGroupedSprites(n, m, offset, map, sprite, world)
    local decorators = {}
    local primals = nil
    local size = 0
    primals, size = randomizeSprites(n, map, sprite, world)
    local count = 1
    for i=1,size do
        local x = primals[i].x
        local y = primals[i].y
        temp = randomizeSprites(m, {left = x - offset, right = x + offset, top = y - offset, bottom = y + offset}, sprite, world)
        decorators[count] = primals[i]
        count = count + 1
        for j=1, size do
            decorators[count] = temp[j]
            count = count + 1
        end
    end
    return decorators
end

function setDecorators(map, world)
    return randomizedGroupedSprites(30, 10, 200, map, {img = sprites.pierre, width = 50, height = 50}, world)
end
