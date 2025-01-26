local etoiles = {}
local img = love.graphics.newImage("/star.png")

-- Function qui creer et renvoi une etoile avec une position x et y random
function CreateEtoile()
    local etoile = {
        y = love.math.random(1, love.graphics.getHeight() - img:getHeight()),
        x = love.math.random(1, love.graphics.getWidth() - img:getWidth()),
        r = 0,
        scaleX = 0.1,
        scaleY = 0.1,
        largeur = img:getWidth(),
        hauteur = img:getHeight(),
        vitesse_x = love.math.random(1, 500),
        vitesse_y = love.math.random(1, 500),
        image = img
    }
    return etoile
end

-- On creer une fonction avec laquelle on pourra ajouter un nb d'etoiles defini dans notre tableau et le renvoyer
function ajouteNbEtoile(nbEtoile)
    for index = 1, nbEtoile do 
        table.insert(etoiles, CreateEtoile())
    end
    return etoiles
end