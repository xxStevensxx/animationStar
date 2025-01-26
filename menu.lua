local pause = false
local startMenu = {
    continue = 0,
    option = 0,
    exit = 0
}

function Pause()
        pause = false
    return pause
end

function chaineCouleur(pChaine, pX, pY)
    love.graphics.print(pChaine, pX, pY)
    return pChaine
end
