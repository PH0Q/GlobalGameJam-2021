function createCollisionClasses()

    world:addCollisionClass('Ignore', {ignores = {'Ignore'}})
    world:addCollisionClass('Player', {ignores = {'Ignore'}})

    world:addCollisionClass('decoration', {ignores = {'Ignore', 'Player'}})
    world:addCollisionClass('physical_decoration', {ignores = {'Ignore'}})
    world:addCollisionClass('item', {ignores = {'Ignore', 'Player'}})
    world:addCollisionClass('readable', {ignores = {'Ignore'}})
    world:addCollisionClass('button', {ingores = {'Ignore'}})

end
