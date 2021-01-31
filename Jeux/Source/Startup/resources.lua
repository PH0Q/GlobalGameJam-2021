-- All sprites (images)
sprites = {}
sprites.blob = love.graphics.newImage("Source/Assets/blob_2.png")
sprites.player = love.graphics.newImage("Source/Assets/sprite_bitmap_place_holder.png")
sprites.background = love.graphics.newImage("Source/Assets/worldmap.png")
sprites.death_modal_background = love.graphics.newImage("Source/Assets/death_modal_background.png")
sprites.pierre = love.graphics.newImage("Source/Assets/pierre_1.png")
sprites.pierreP = love.graphics.newImage("Source/Assets/pierre_2.png")


music = {}
music.dawn = love.audio.newSource("Source/Music/Matin.mp3", "stream")
music.dawn:setVolume(0.8)
music.afternoon = love.audio.newSource("Source/Music/Midi.mp3", "stream")
music.afternoon:setVolume(0.8)
music.sunset = love.audio.newSource("Source/Music/Soir.mp3", "stream")
music.sunset:setVolume(0.8)
music.night = love.audio.newSource("Source/Music/Nuit.mp3", "stream")
music.night:setVolume(0.8)
