function getRandomizedCoordinates(n, max_width, max_height, min_width, min_height)
    local randomized_coordinates = {}
    for i=1,n do
        randomized_coordinates[i] = {}
        randomized_coordinates[i].x = love.math.random(min_width, max_width)
        randomized_coordinates[i].y = love.math.random(min_height, max_height)
    end
    return randomized_coordinates
end


function setRandomizedGroup(n, m, o)
    local tiles_coordinates = {}
    local tiles_grp = {}
    local primaries = getRandomizedCoordinates(n, 3500, 2000, -1200, -1200)
    for i=1, n do
        tiles_grp[i] = {}
        tiles_grp[i] = getRandomizedCoordinates(m, primaries[i].x + o, primaries[i].y + o, primaries[i].x - o, primaries[i].y - o)
        for j=1, m do
            tiles_coordinates[(i-1) * m + j] = tiles_grp[i][j]
        end
    end
    return tiles_coordinates, m*n
end

function setDecorators()
    local decorators = {}
    decorators.pierres = {}
    local decorators_coordinates = {}
    decorators_coordinates.pierres, n = setRandomizedGroup(10, 20, 200)
    for i=1, n do
        decorators.pierres[i] = physical_decoration:new(decorators_coordinates.pierres[i].x, decorators_coordinates.pierres[i].y, sprites.pierre, 50, 50)
    end

    return decorators, decorators_coordinates
end
