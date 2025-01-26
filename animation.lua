-- -- on boucle sur notre tableau d'etoiles puis on ajoute une une rotation et du mouvement a toutes les etoile
function Rotate(etoiles, r, dt)
    for index = 1, #etoiles do
        etoiles[index].r = etoiles[index].r + r * dt
    end
end

-- On ajoute de la velocité a notre etoile
function Veloce(etoiles, dt, inversion)
  
    for index = 1, #etoiles do
        if inversion == false then 
            etoiles[index].x = etoiles[index].x + etoiles[index].vitesse_x * dt
            etoiles[index].y = etoiles[index].y + etoiles[index].vitesse_y * dt
        else
            etoiles[index].x = etoiles[index].x - etoiles[index].vitesse_x * dt
            etoiles[index].y = etoiles[index].y - etoiles[index].vitesse_y * dt
        end
    end
end

-- Fonction qui inverse le sens des etoiles


function Collider(etoiles)
    --Rebond haut et bas
    for index = 1, #etoiles do
        if etoiles[index].y < 0  then
            etoiles[index].y = etoiles[index].y + love.graphics.getHeight() 
        elseif etoiles[index].y >= love.graphics.getHeight() then
            etoiles[index].y = 0
        end
    end

    --Rebond gauche et droite
    for index = 1, #etoiles do
        if etoiles[index].x < 0  then
            etoiles[index].x = etoiles[index].x + love.graphics.getWidth()
        elseif etoiles[index].x >= love.graphics.getWidth() then
            etoiles[index].x = 0
            end
        end
end

-- Animation de pulsation on augmente le scaling x et y si il est inferieur ou egale a 1 
function Pulse(etoiles, dt)
    pulse = true
    for index = 1, #etoiles do
        if etoiles[index].scaleX <= 0.5 and etoiles[index].scaleY <= 0.5 and pulse == true then
            etoiles[index].scaleX = etoiles[index].scaleX + 0.1 * dt
            etoiles[index].scaleY = etoiles[index].scaleY + 0.1 * dt
        else
            pulse = not pulse
            etoiles[index].scaleX = -etoiles[index].scaleX - 0.1 * dt
            etoiles[index].scaleY = -etoiles[index].scaleY - 0.1 * dt
        end
    end
end
