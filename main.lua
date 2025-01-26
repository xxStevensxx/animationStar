-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

require("etoiles")
require("animation")
require("menu")

local etoiles = {}
local pause = Pause()
local inversion = false

function love.load()
    etoiles = ajouteNbEtoile(100)
end

function love.update(dt)
    if pause == false then
        Rotate(etoiles, dt, 5)
        Veloce(etoiles, dt, inversion)
        Pulse(etoiles, dt)
        Collider(etoiles)
    end
end

function love.draw()
    --On boucle pour afficher toutes nos etoiles
    for index = 1, #etoiles do
        love.graphics.draw(etoiles[index].image, etoiles[index].x, etoiles[index].y, etoiles[index].r ,etoiles[index].scaleX ,etoiles[index].scaleY, etoiles[index].largeur/2, etoiles[index].hauteur/2 )
    end
end

function love.keypressed(key) 
    if key == "escape" then
        love.event.quit()
    end

-- pause
    if key == "p" then
        pause = not pause
    end

--Inversion sens
    if key == "space" then
        inversion = not inversion
    end
end