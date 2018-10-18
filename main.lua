-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

heros = {}

--Permet d'empêcher la fonction m(ath.random de ne pas avoir le même résultat trop de fois
math.randomseed(love.timer.getTime())

--Liste d'éléments
liste_sprites = {}
liste_tirs = {}
liste_aliens = {}

-- Niveau 16x12
niveau = {}
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,2,2,2,2,2,2,2,2,0,0 })
table.insert(niveau, { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })
table.insert(niveau, { 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3 })

-- Caméra
camera = {}
camera.y = 0
camera.vitesse = 1

-- Écran courant
ecran_courant = "menu"

victoire = false
timerVictoire = 0 

-- Images des tuiles
imgTuiles = {}
local n
for n=1, 3 do 
  imgTuiles[n] = love.graphics.newImage("images/tuile_"..n..".png")
end

-- Images des explosions
imgExplosion = {}
for n=1, 5 do
  imgExplosion[n] = love.graphics.newImage("images/explode_"..n..".png")
end

imgMenu = love.graphics.newImage("images/menu.jpg")
imgGameOver = love.graphics.newImage("images/gameover.jpg")
imgVictoire = love.graphics.newImage("images/victory.jpg")

sonShoot = love.audio.newSource("sons/shoot.wav","static")
sonExplode = love.audio.newSource("sons/explode_touch.wav", "static")

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

function collide(a1, a2)
 if (a1==a2) then return false end
 local dx = a1.x - a2.x
 local dy = a1.y - a2.y
 if (math.abs(dx) < a1.image:getWidth()+a2.image:getWidth()) then
  if (math.abs(dy) < a1.image:getHeight()+a2.image:getHeight()) then
   return true
  end
 end
 return false
end

function CreerTir(pType, pNomImage, pX, pY, pVitesseX, pVitesseY)
  local tir = CreerSprite(pNomImage, pX, pY)
  tir.type = pType
  tir.vitesseX = pVitesseX
  tir.vitesseY = pVitesseY
  table.insert(liste_tirs, tir)
  
  sonShoot:play()
end

function CreerAlien(pType, pX, pY)
  
  local nomImage = ""
  if pType == 1 then 
    nomImage = "enemy1"
  elseif pType == 2 then
    nomImage = "enemy2"
  elseif pType == 3 then
    nomImage = "tourelle"
  elseif pType == 10 then
    nomImage = "enemy3"
  end
  
  local alien = CreerSprite(nomImage, pX, pY)
  
  alien.type = pType
  
  alien.endormi = true
  alien.chronotir = 0
  
  --Gestion type aliens
  if pType == 1 then 
    alien.vitesseY = 2
    alien.vitesseX = 0
    alien.energie = 1
  elseif pType == 2 then
    local direction = math.random(1,2)
    if direction == 1 then
      alien.vitesseX = 1
    else
      alien.vitesseX = -1
    end
    alien.vitesseY = 2
    alien.energie = 3
    --Déplacement aléatoire de l'alien
    local direction = math.random(1,2)
    if direction == 1 then 
      alien.vitesseX = 1
    else 
      alien.vitesseX = -1
    end
    alien.energie = 3
  elseif pType == 3 then
    alien.vitesseX = 0
    alien.vitesseY = camera.vitesse
    alien.energie = 5
  elseif pType == 10 then
    alien.vitesseX = 0
    alien.vitesseY = camera.vitesse * 2
    alien.energie = 20
    alien.angle = 0
  end
  
  table.insert(liste_aliens, alien)
end

function CreerSprite(pNomImage, pX, pY)
  
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.suppression = false
  sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
  sprite.largeur = sprite.image:getWidth()
  sprite.hauteur = sprite.image:getHeight()
  
  sprite.frame = 1
  sprite.listeFrames = {}
  sprite.maxFrame = 1
  
  table.insert(liste_sprites, sprite)
  
  return sprite
  
end

function CreerExplosion(pX,pY)
  local newExplosion = CreerSprite("explode_1",pX,pY)
  newExplosion.listeFrames = imgExplosion
  newExplosion.maxFrame = 5
end

function love.load()
  
  --Permet de changer taille de la fenêtre
  love.window.setMode(1024,768)
  --Permet de renommer la fenêtre
  love.window.setTitle("Atelier Shooter")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  heros = CreerSprite("heros", largeur/2, hauteur)
  
  DemarreJeu()
  
end

function DemarreJeu()
  heros.x = largeur/2
  heros.y = hauteur - heros.hauteur*2
  
  --Création des aliens
  local ligne = 4
  CreerAlien(1, largeur/2, -(64/2)-(64*(ligne-1)))
  ligne = 10 
  CreerAlien(2, largeur/2, -(64/2)-(64*(ligne-1)))
  ligne = 11
  CreerAlien(3, 3*64, -(64/2)-(64*(ligne-1)))
  ligne = #niveau
  CreerAlien(10, largeur/2, -(64/2)-(64*(ligne-1)))
 
  -- Remise à zéro de la caméra
  camera.y = 0
end

function updateJeu()
  
  -- Avance la camera
  camera.y = camera.y + camera.vitesse

  local cpt
    
  for cpt=#liste_tirs,1,-1 do
    local tir = liste_tirs[cpt]
    tir.y = tir.y + tir.vitesseY
    tir.x = tir.x + tir.vitesseX
    
    -- Vérifie si on touche le heros
    if tir.type == "alien" then
      if collide(heros, tir) then
        print("Boom je suis touché")
        tir.suppression = true
        table.remove(liste_tirs, cpt)
        ecran_courant = "gameover"
      end
    end
    
    if tir.type == "heros" then 
      local nAlien
      for nAlien=#liste_aliens,1,-1 do 
        local alien = liste_aliens[nAlien]
        if alien.endormi == false then
          if collide(tir, alien) then
            CreerExplosion(tir.x, tir.y)
            tir.suppression = true
            table.remove(liste_tirs, cpt)
            alien.energie = alien.energie - 1
            sonExplode:play()
            if alien.energie <= 0 then
              local nExplosion
              for nExplosion=1, 5 do
                CreerExplosion(alien.x + math.random(-10,10), alien.y + math.random(-10,10))
              end
              if alien.type == 10 then 
                victoire = true
                timerVictoire = 200
                for nExplosion=1, 20 do
                  CreerExplosion(alien.x + math.random(-100,100), alien.y + math.random(-100,100))
                end
              end
              alien.suppression = true
              table.remove(liste_aliens, nAlien)
            end
          end
        end
      end
    end
      
    --Vérifie si le tir est sorti de l'écran 
    if (tir.y < 0 or tir.y > hauteur) and tir.suppression == false then 
      
      --Booléen qui supprime le sprite du tir
      tir.suppression = true
      --Retire le tir du tableau tirs
      table.remove(liste_tirs, cpt)
    end
    
      
  end
    
  --Traitement et suppression du sprite de la liste des sprites
  for cpt=#liste_sprites ,1,-1 do 
    local sprite = liste_sprites[cpt]
    -- Le sprite est-il animé ?
    if sprite.maxFrame > 1 then 
      sprite.frame = sprite.frame + 0.2
      if math.floor(sprite.frame) > sprite.maxFrame then 
        sprite.suppression = true
      else
        sprite.image = sprite.listeFrames[math.floor(sprite.frame)]
      end
    end
    if sprite.suppression == true then 
      table.remove(liste_sprites, cpt)
    end
  end
    
  -- Traitement des aliens
  for cpt=#liste_aliens,1,-1 do 
    local alien = liste_aliens[cpt]
    if alien.y > 0 then 
      alien.endormi = false
    end
    if alien.endormi == false then
      alien.x = alien.x + alien.vitesseX
      alien.y = alien.y + alien.vitesseY
      if alien.type == 1 or alien.type == 2 then
        alien.chronotir = alien.chronotir - 1
        if alien.chronotir <= 0 then
          alien.chronotir = math.random(60,100)
          CreerTir("alien","laser2", alien.x, alien.y, 0, 10)
        end
      elseif alien.type == 3 then 
        alien.chronotir = alien.chronotir - 1
        if alien.chronotir <= 0 then
          alien.chronotir = math.random(20, 30)
          local vitesseX, vitesseY
          local angle
          angle = math.angle(alien.x, alien.y, heros.x, heros.y)
          vitesseX = 10 * math.cos(angle)
          vitesseY = 10 * math.sin(angle)
          CreerTir("alien","laser2", alien.x, alien.y, vitesseX, vitesseY)
        end
      elseif alien.type == 10 then
        if alien.y > hauteur/3 then
          alien.y = hauteur/3
        end
        alien.chronotir = alien.chronotir - 1
        if alien.chronotir <= 0 then
          alien.chronotir = 15
          local vitesseX, vitesseY
          alien.angle = alien.angle + 0.5
          vitesseX = 10 * math.cos(alien.angle)
          vitesseY = 10 * math.sin(alien.angle)
          CreerTir("alien","laser2", alien.x, alien.y, vitesseX, vitesseY)
        end
      end
    else
      alien.y = alien.y + camera.vitesse
    end
    if alien.y > hauteur then 
      alien.suppression = true
      table.remove(liste_aliens, cpt)
    end
  end

  --Déplacement du vaisseau et blocage sortie d'écran
  if love.keyboard.isDown("right") and heros.x < largeur then 
    heros.x = heros.x + 4
  end
  if love.keyboard.isDown("down") and heros.y < hauteur then 
    heros.y = heros.y + 4
  end
  if love.keyboard.isDown("left") and heros.x > 0 then 
    heros.x = heros.x - 4
  end
  if love.keyboard.isDown("up") and heros.y > 0 then 
    heros.y = heros.y - 4 
  end
  
  if victoire == true then 
    timerVictoire = timerVictoire - 1
    if timerVictoire == 0 then
      ecran_courant = "victoire"
    end
  end
    
end

function updateMenu()
  
end

function love.update(dt)
  if ecran_courant == "jeu" then
    updateJeu()
  elseif ecran_courant == "menu" then
    updateMenu()
  end
end

function drawJeu() 
  -- Dessin niveau
  local nbLignes = #niveau
  local ligne, colonne
  local x, y
  
  x = 0 
  y = (0 - 64) + camera.y
  for ligne=nbLignes, 1, -1 do
    for colonne=1, 16 do 
      -- Dessine tuile
      local tuile = niveau[ligne][colonne]
      if tuile > 0 then
        love.graphics.draw(imgTuiles[tuile], x, y, 0, 2, 2)
      end
      x = x+64
    end
    x = 0
    y = y - 64
  end
  
  local cpt
  for cpt=1,#liste_sprites do 
    local s = liste_sprites[cpt]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.largeur/2, s.hauteur/2)
  end
  
  --Compte nombre de tirs à dans le tableau tirs
  love.graphics.print("Nombre de tirs : "..#liste_tirs.." Nombre de sprites : "..#liste_sprites.." Nombre d'aliens : "..#liste_aliens,0,0)
end

function drawMenu()
  love.graphics.draw(imgMenu, 0, 0)
end

function drawGameOver()
  love.graphics.draw(imgGameOver, 0, 0)
end

function drawVictoire()
  love.graphics.draw(imgVictoire, 0, 0)
end

function love.draw()
  if ecran_courant == "jeu" then
    drawJeu()
  elseif ecran_courant == "menu" then
    drawMenu()
  elseif ecran_courant == "gameover" then
    drawGameOver()
  elseif ecran_courant == "victoire" then
    drawVictoire()
  end
end

function love.keypressed(key)
  if ecran_courant == "jeu" then
    if key == "space" then 
      CreerTir("heros","laser1", heros.x, heros.y - (heros.hauteur*2)/2, 0, -10)
    end
  elseif ecran_courant == "menu" then
    if key == "space" then
      ecran_courant = "jeu"
    end
  elseif ecran_courant == "gameover" or ecran_courant == "victoire" then
    if key == "space" then
      love.load()
      DemarreJeu()
      ecran_courant = "jeu"
    end
  end
end
  