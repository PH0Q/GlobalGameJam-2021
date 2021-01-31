terrain = {}
terrain.nbDecorators = 50
terrain.nbGroundDecorators = 800
terrain.top = -1250
terrain.bottom =  1750
terrain.left = -1250
terrain.right = 2950

terrain.decorators = {}
terrain.groundDecorators = {}

-- generate some decorators, item and monuments on the empty map
function terrain:generate()
    terrain.decorators = setDecorators(terrain.nbDecorators)
    terrain.groundDecorators = setGroundDecorators(terrain.nbGroundDecorators)
end

-- generate some ground decorators
function setGroundDecorators(nbDecorators)
    local decorators = {}
    for i = 1, nbDecorators, 1 do
      local sprite = chooseRandGroundDecorator()
      local x, y = randCoord(terrain.top, terrain.bottom, terrain.left, terrain.right)
      decorators[i] = addGroundDecorator(x, y, sprite)
    end
    table.sort(decorators, function(a,b) return a.y<b.y end)
    return decorators
end

-- chosse the kind of ground ecorator
function chooseRandGroundDecorator()
  return sprites.groundDecorators[love.math.random(#sprites.groundDecorators)]
end

-- add a new decorator
function addGroundDecorator(x, y, sprite)
  local decorator = decoration:new(x, y,  sprite, sprite.hitbox.width, sprite.hitbox.height)
  return decorator
end

-- generate some decorators
function setDecorators(nbDecorators)
    local decorators = {}
    for i = 1, nbDecorators, 1 do
      local sprite = chooseRandDecorator()
      local x, y = randValideCoord(terrain.top, terrain.bottom, terrain.left, terrain.right, sprite.hitbox)
      decorators[i] = addDecorator(x, y, sprite)
    end
    table.sort(decorators, function(a,b) return a.y<b.y end)
    return decorators
end

-- chosse the kind of decorator
function chooseRandDecorator()
  return sprites.decorators[love.math.random(#sprites.decorators)]
end

-- add a new decorator
function addDecorator(x, y, sprite)
  local decorator = physical_decoration:new(x, y,  sprite, sprite.hitbox.width, sprite.hitbox.height)
  return decorator
end

-- give valide coordonate on a square
function randValideCoord(top, bottom, left, right, hitbox)
  local isValide = false
  local x = 0
  local y = 0
  while (not isValide) do
    x, y = randCoord(top, bottom, left, right)
    local colliders = world:queryRectangleArea(x, y,hitbox.width ,hitbox.height, {"physical_decoration"})
    isValide = (#colliders == 0)
  end
  return x, y
end

-- give random coordonate on a square
function randCoord(top, bottom, left, right)
    local y = love.math.random(top, bottom)
    local x = love.math.random(left, right)
    return x, y
end

terrain:generate()
