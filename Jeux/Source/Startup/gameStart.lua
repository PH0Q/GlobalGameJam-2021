function gameStart()

    -- Currently assumes 1080p resolution
    love.window.setFullscreen(false)

    -- import camera lib
    Camera = require("Source/packages/camera")

    -- import animation lib
    anim8 = require("Source/packages/anim8")

    -- import environement lib
    local windfield = require("Source/packages/windfield")
    world = windfield.newWorld()
    world:setQueryDebugDrawing(true)

    -- import 2D collision lib
    require("Source/Startup/collisionClasses")
    createCollisionClasses()

    -- import timer lib
    Timer = require("Source/packages/timer")

    -- Load assets and resources
    require("Source/Startup/resources")
    require("Source/player")
    require("Source/cam")

    -- all element
    require("Source/Tile/physical_decoration")
    require("Source/Tile/decoration")
    require("Source/Tile/item")
    require("Source/Tile/readable")

    require("Source/global")

    -- Load modal boxes
    require("Source/modal")

    require("Source/randomize_terrain")

    -- daynight cycle
    require("Source/dayNight")

    -- music system
    --srequire("Source/musicSystem")


end
