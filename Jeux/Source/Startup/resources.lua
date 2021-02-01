
-- All sprites (images)
sprites = {}

function sprites:new(imgfile, scale, width, height, hitboxwidth, hitboxheight )
  local elem = {}
  elem.img = love.graphics.newImage(imgfile)
  elem.scale = scale
  elem.width = width
  elem.height = height
  elem.hitbox = {}
  elem.hitbox.width = hitboxwidth
  elem.hitbox.height = hitboxheight
  return elem
end

sprites.blob = love.graphics.newImage("Source/Assets/blob_2.png")
sprites.player = love.graphics.newImage("Source/Assets/pilot.png")
sprites.player_back = love.graphics.newImage("Source/Assets/pilot_2.png")
sprites.background = love.graphics.newImage("Source/Assets/background.png")
sprites.death_modal_background = love.graphics.newImage("Source/Assets/death_modal_background.png")

sprites.herbe_a = sprites:new("Source/Assets/herbe-a.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.herbe_b = sprites:new("Source/Assets/herbe-b.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.herbe_c = sprites:new("Source/Assets/herbe-c.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.herbe_d = sprites:new("Source/Assets/herbe-d.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.herbe_e = sprites:new("Source/Assets/herbe-e.png", 0.1, 80/2, 50/2, 40, 25 )

sprites.trefle_a = sprites:new("Source/Assets/trefle-a.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.trefle_b = sprites:new("Source/Assets/trefle-b.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.trefle_c = sprites:new("Source/Assets/trefle-c.png", 0.1, 80/2, 50/2, 40, 25 )

sprites.fleur_a = sprites:new("Source/Assets/fleur-a.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.fleur_b = sprites:new("Source/Assets/fleur-b.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.fleur_c = sprites:new("Source/Assets/fleur-c.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.fleur_d = sprites:new("Source/Assets/fleur-d.png", 0.1, 80/2, 50/2, 40, 25 )
sprites.fleur_e = sprites:new("Source/Assets/fleur-e.png", 0.1, 80/2, 50/2, 40, 25 )

-- sprites.coquillage_a = love.graphics.newImage("Source/Assets/coquillage-a.png")
-- sprites.coquillage_b = love.graphics.newImage("Source/Assets/coquillage-b.png")
-- sprites.coquillage_c = love.graphics.newImage("Source/Assets/coquillage-c.png")
-- sprites.crabe = love.graphics.newImage("Source/Assets/crabe.png")

-- sprites.phoque = love.graphics.newImage("Source/Assets/phoque.png")
-- sprites.note = love.graphics.newImage("Source/Assets/note.png")
-- sprites.monolithe = love.graphics.newImage("Source/Assets/monolithe.png")

-- sprites.feu = love.graphics.newImage("Source/Assets/feu-on.png")

sprites.rocher_a = sprites:new("Source/Assets/rocher-a.png", 0.1, 550/2, 480/2, 50, 50 )
sprites.rocher_b = sprites:new("Source/Assets/rocher-b.png", 0.1, 420/2, 800/1.5, 50, 50 )
sprites.rocher_c = sprites:new("Source/Assets/rocher-c.png", 0.1, 420/2, 750/1.45, 50, 40 )

sprites.buisson_a = sprites:new("Source/Assets/buisson-a.png", 0.1, 750/2, 680/1.1, 50, 10 )
sprites.buisson_b = sprites:new("Source/Assets/buisson-b.png", 0.1, 750/2, 680/1.1, 50, 10 )
sprites.buisson_c = sprites:new("Source/Assets/buisson_1.png", 0.1, 750/2, 680/1.1, 50, 10 )
sprites.buisson_d = sprites:new("Source/Assets/buisson_2.png", 0.1, 750/2, 680/1.1, 50, 10 )

sprites.arbre_a = sprites:new("Source/Assets/arbre_1.png", 0.1, 3683/2, 3119/1.1, 100, 50)
sprites.arbre_b = sprites:new("Source/Assets/arbre_2.png", 0.1, 3683/2, 3119/1.1, 100, 50)
sprites.arbre_c = sprites:new("Source/Assets/arbre_3.png", 0.1, 3683/2.4, 3119/1.4, 90, 50)

-- un peu lourd, je les laisse de côté pour le moment...
--sprites.arbre_d = sprites:new("Source/Assets/BAOBAB_1.png", 0.1, 5500/2, 5000/1.09, 100, 70)
--sprites.arbre_e = sprites:new("Source/Assets/BAOBAB_2.png", 0.1, 7500/2.05, 5000/1.15, 200, 80)
--sprites.arbre_f = sprites:new("Source/Assets/BAOBAB_3.png", 0.1, 7600/1.92, 4800/1.095, 280, 90)
--sprites.arbre_g = sprites:new("Source/Assets/BAOBAB_4.png", 0.1, 4400/2.1, 3700/1.08, 180, 50)


-- sprites.avion = love.graphics.newImage("Source/Assets/avion.png")
-- sprites.buddy_a = love.graphics.newImage("Source/Assets/buddy_arbre_vivant.png")
-- sprites.buddy_b = love.graphics.newImage("Source/Assets/buddy_arbre_mort.png")
-- sprites.tete = love.graphics.newImage("Source/Assets/Head.png")
-- sprites.outils = love.graphics.newImage("Source/Assets/MECA.png")
-- sprites.soins = love.graphics.newImage("Source/Assets/SOIN.png")
-- sprites.cle = love.graphics.newImage("Source/Assets/clef.png")
-- sprites.arbre_crystal = love.graphics.newImage("Source/Assets/crystal_tree.png")
-- sprites.crystal = love.graphics.newImage("Source/Assets/Crystal.png")
-- sprites.cascade = love.graphics.newImage("Source/Assets/cascade.png")
-- sprites.texte = love.graphics.newImage("Source/Assets/texte.png")

sprites.decorators = {sprites.arbre_a, sprites.arbre_b, sprites.arbre_c, --sprites.arbre_d, sprites.arbre_e, sprites.arbre_f, sprites.arbre_g
                      sprites.buisson_a, sprites.buisson_b, sprites.buisson_c, sprites.buisson_d,
                      sprites.rocher_a, sprites.rocher_b, sprites.rocher_c}

sprites.groundDecorators = {sprites.herbe_a,sprites.herbe_b,sprites.herbe_c,sprites.herbe_d,sprites.herbe_e,
                            sprites.fleur_a,sprites.fleur_b,sprites.fleur_c,sprites.fleur_d,sprites.fleur_e,
                            sprites.trefle_a,sprites.trefle_b,sprites.trefle_c,}

music = {}
music.dawn = love.audio.newSource("Source/Music/Matin.mp3", "stream")
music.dawn:setVolume(0.8)
music.afternoon = love.audio.newSource("Source/Music/Midi.mp3", "stream")
music.afternoon:setVolume(0.8)
music.sunset = love.audio.newSource("Source/Music/Soir.mp3", "stream")
music.sunset:setVolume(0.8)
music.night = love.audio.newSource("Source/Music/Nuit.mp3", "stream")
music.night:setVolume(0.8)
