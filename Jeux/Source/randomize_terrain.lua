function randomizeSprites(n, map, sprite, world)
    local decorations = {}
    local i = 1
    while(i <= n) do
        local new_x = love.math.random(map.left, map.right)
        local new_y = love.math.random(map.top, map.bottom)

        local local_collider = world:queryRectangleArea(new_x, new_y, sprite.width, sprite.height)
        if #local_collider == 0 then
            if isValid(new_x, new_y, "earth") then
                decorations[i] = physical_decoration:new(new_x, new_y, sprite.img, sprite.width, sprite.height)
                i = i + 1
            end
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
    decorators = {}
    decorators.herbe_a = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.herbe_a, width = 50, height = 50}, world)
    decorators.herbe_b = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.herbe_a, width = 50, height = 50}, world)
    decorators.herbe_c = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.herbe_a, width = 50, height = 50}, world)
    decorators.herbe_d = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.herbe_a, width = 50, height = 50}, world)
    decorators.herbe_e = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.herbe_a, width = 50, height = 50}, world)
    decorators.trefle_a = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.trefle_a, width = 50, height = 50}, world)
    decorators.trefle_b = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.trefle_a, width = 50, height = 50}, world)
    decorators.trefle_c = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.trefle_a, width = 50, height = 50}, world)
    decorators.crabe = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.crabe, width = 50, height = 50}, world)
    decorators.phoque = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.phoque, width = 50, height = 50}, world)
    decorators.feu = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.feu, width = 50, height = 50}, world)
    decorators.fleur_a = randomizedGroupedSprites(3, 3, 200, map, {img = sprites.fleur_a, width = 50, height = 50}, world)
    decorators.fleur_b = randomizedGroupedSprites(3, 3, 200, map, {img = sprites.fleur_b, width = 50, height = 50}, world)
    decorators.fleur_c = randomizedGroupedSprites(3, 3, 200, map, {img = sprites.fleur_c, width = 50, height = 50}, world)
    decorators.fleur_d = randomizedGroupedSprites(3, 3, 200, map, {img = sprites.fleur_d, width = 50, height = 50}, world)
    decorators.fleur_e = randomizedGroupedSprites(3, 3, 200, map, {img = sprites.fleur_e, width = 50, height = 50}, world)
    decorators.tete = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.tete, width = 50, height = 50}, world)
    decorators.arbre_crystal = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.arbre_crystal, width = 50, height = 50}, world)
    decorators.arbre_a = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_a, width = 50, height = 50}, world)
    decorators.arbre_b = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_b, width = 50, height = 50}, world)
    decorators.arbre_c = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_c, width = 50, height = 50}, world)
    decorators.arbre_d = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_d, width = 50, height = 50}, world)
    decorators.arbre_e = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_e, width = 50, height = 50}, world)
    decorators.arbre_f = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_f, width = 50, height = 50}, world)
    decorators.arbre_g = randomizedGroupedSprites(3, 4, 200, map, {img = sprites.arbre_g, width = 50, height = 50}, world)
    decorators.outils = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.outils, width = 50, height = 50}, world)
    decorators.soins = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.soins, width = 50, height = 50}, world)
    decorators.cle = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.cle, width = 50, height = 50}, world)
    decorators.cascade = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.cascade, width = 50, height = 50}, world)
    decorators.monolithe = randomizedGroupedSprites(1, 1, 200, map, {img = sprites.monolithe, width = 50, height = 50}, world)
    decorators.rocher_a = randomizedGroupedSprites(4, 1, 200, map, {img = sprites.rocher_a, width = 50, height = 50}, world)
    decorators.rocher_b = randomizedGroupedSprites(4, 1, 200, map, {img = sprites.rocher_b, width = 50, height = 50}, world)
    decorators.rocher_c = randomizedGroupedSprites(4, 1, 200, map, {img = sprites.rocher_c, width = 50, height = 50}, world)
    decorators.buisson_a = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.buisson_a, width = 50, height = 50}, world)
    decorators.buisson_b = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.buisson_b, width = 50, height = 50}, world)
    decorators.buisson_c = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.buisson_c, width = 50, height = 50}, world)
    decorators.buisson_d = randomizedGroupedSprites(5, 1, 200, map, {img = sprites.buisson_d, width = 50, height = 50}, world)
    

    
    return decorators
end

function isValid(x, y, map)
    if map == "earth" then
        local offsetX = 1250
        local offsetY = 1250
        if(x < 560 - offsetX) then
            return false
        end
        if(x > 3420 - offsetX) then
            return false
        end
        if(y < 300 - offsetY) then
            return false
        end
        if(y > 2450 - offsetY) then
            return false
        end
        return true
    end
end
