function getRandomizedCoordinates(n, map_width, map_height)
    randomized_coordinates = {}
    for i=1,n do
        randomized_coordinates[i].x = love.math.random(map_width)
        randomized_coordinates[i].y = love.math.random(map_height)
    end
    return randomized_coordinates
end

function mapCreation()
    n_decorators = love.math.random(10, 20)

end
