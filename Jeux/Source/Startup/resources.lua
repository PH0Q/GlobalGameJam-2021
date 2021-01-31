-- All sprites (images)
sprites = {}
sprites.blob = love.graphics.newImage("Source/Assets/blob_2.png")
sprites.player = love.graphics.newImage("Source/Assets/pilot.png")
sprites.player_back = love.graphics.newImage("Source/Assets/pilot_2.png")
sprites.background = love.graphics.newImage("Source/Assets/worldmap.png")
sprites.death_modal_background = love.graphics.newImage("Source/Assets/death_modal_background.png")
sprites.rocher_a = love.graphics.newImage("Source/Assets/rocher-a.png")
sprites.rocher_b = love.graphics.newImage("Source/Assets/rocher-b.png")
sprites.rocher_c = love.graphics.newImage("Source/Assets/rocher-c.png")
sprites.herbe_a = love.graphics.newImage("Source/Assets/herbe-a.png")
sprites.herbe_b = love.graphics.newImage("Source/Assets/herbe-b.png")
sprites.herbe_c = love.graphics.newImage("Source/Assets/herbe-c.png")
sprites.herbe_d = love.graphics.newImage("Source/Assets/herbe-d.png")
sprites.herbe_e = love.graphics.newImage("Source/Assets/herbe-e.png")
sprites.trefle_a = love.graphics.newImage("Source/Assets/trefle-a.png")
sprites.trefle_b = love.graphics.newImage("Source/Assets/trefle-b.png")
sprites.trefle_c = love.graphics.newImage("Source/Assets/trefle-c.png")
sprites.phoque = love.graphics.newImage("Source/Assets/phoque.png")
sprites.crabe = love.graphics.newImage("Source/Assets/crabe.png")
sprites.note = love.graphics.newImage("Source/Assets/note.png")
sprites.monolithe = love.graphics.newImage("Source/Assets/monolithe.png")
sprites.coquillage_a = love.graphics.newImage("Source/Assets/coquillage-a.png")
sprites.coquillage_b = love.graphics.newImage("Source/Assets/coquillage-b.png")
sprites.coquillage_c = love.graphics.newImage("Source/Assets/coquillage-c.png")
sprites.feu = love.graphics.newImage("Source/Assets/feu-on.png")
sprites.fleur_a = love.graphics.newImage("Source/Assets/fleur-a.png")
sprites.fleur_b = love.graphics.newImage("Source/Assets/fleur-b.png")
sprites.fleur_c = love.graphics.newImage("Source/Assets/fleur-c.png")
sprites.fleur_d = love.graphics.newImage("Source/Assets/fleur-d.png")
sprites.fleur_e = love.graphics.newImage("Source/Assets/fleur-e.png")
sprites.buisson_a = love.graphics.newImage("Source/Assets/buisson-a.png")
sprites.buisson_b = love.graphics.newImage("Source/Assets/buisson-b.png")
sprites.buisson_c = love.graphics.newImage("Source/Assets/buisson_1.png")
sprites.buisson_d = love.graphics.newImage("Source/Assets/buisson_2.png")
sprites.arbre_a = love.graphics.newImage("Source/Assets/arbre_1.png")
sprites.arbre_b = love.graphics.newImage("Source/Assets/arbre_2.png")
sprites.arbre_c = love.graphics.newImage("Source/Assets/arbre_3.png")
sprites.arbre_d = love.graphics.newImage("Source/Assets/BAOBAB_1.png")
sprites.arbre_e = love.graphics.newImage("Source/Assets/BAOBAB_2.png")
sprites.arbre_f = love.graphics.newImage("Source/Assets/BAOBAB_3.png")
sprites.arbre_g = love.graphics.newImage("Source/Assets/BAOBAB_4.png")
sprites.avion = love.graphics.newImage("Source/Assets/avion.png")
sprites.buddy_a = love.graphics.newImage("Source/Assets/buddy_arbre_vivant.png")
sprites.buddy_b = love.graphics.newImage("Source/Assets/buddy_arbre_mort.png")
sprites.tete = love.graphics.newImage("Source/Assets/Head.png")
sprites.outils = love.graphics.newImage("Source/Assets/MECA.png")
sprites.soins = love.graphics.newImage("Source/Assets/SOIN.png")
sprites.cle = love.graphics.newImage("Source/Assets/clef.png")
sprites.arbre_crystal = love.graphics.newImage("Source/Assets/crystal_tree.png")
sprites.crystal = love.graphics.newImage("Source/Assets/Crystal.png")
sprites.cascade = love.graphics.newImage("Source/Assets/cascade.png")


music = {}
music.dawn = love.audio.newSource("Source/Music/Matin.mp3", "stream")
music.dawn:setVolume(0.8)
music.afternoon = love.audio.newSource("Source/Music/Midi.mp3", "stream")
music.afternoon:setVolume(0.8)
music.sunset = love.audio.newSource("Source/Music/Soir.mp3", "stream")
music.sunset:setVolume(0.8)
music.night = love.audio.newSource("Source/Music/Nuit.mp3", "stream")
music.night:setVolume(0.8)
