local composer = require( "composer" )
local scene = composer.newScene()
local physics = require("physics")
physics.start()
local fondo
local grupoGrillas
local alto = ch/3
local ancho = cw/8 

local personajes 
personajes = display.newGroup()

local transformasiones
transformasiones = display.newGroup()

function moverComic(e)
    if e.phase == "ended" then
        mostrarPersonajes()
    end
end

function mostrarTransformaciones()
    local Mysterion = display.newImage(transformasiones,"../img/Mysterion.png", cw/2 - ancho*3, ch-100)
    local toolshed = display.newImage(transformasiones,"../img/toolshed.png", cw/2-ancho*1.5, ch-100)
    local humanKyte = display.newImage(transformasiones,"../img/humanKite.png", cw/2, ch-100)
    local theCoon = display.newImage(transformasiones,"../img/theCoon.png", cw/2+ancho*1.7, ch-100)
    local profesorCaos = display.newImage(transformasiones,"../img/profesorCaos.png", cw/2 + ancho*3, ch-100)
    Mysterion.xScale = 0.5
    Mysterion.yScale = 0.5

    toolshed.xScale = 0.3
    toolshed.yScale = 0.3

    profesorCaos.xScale = 0.4
    profesorCaos.yScale = 0.4

    humanKyte.xScale = 0.4
    humanKyte.yScale = 0.4

    theCoon.xScale = 0.4
    theCoon.yScale = 0.4

end

function mostrarPersonajes()    
    local kenny = display.newImage(personajes,"../img/kenny1.png", cw/2 - ancho*3, ch/2)
    local stan = display.newImage(personajes,"../img/stan.png", cw/2-ancho*1.5, ch/2)
    local kyle = display.newImage(personajes,"../img/kyle.png", cw/2, ch/2)
    local cartman2 = display.newImage(personajes,"../img/cartman2.png", cw/2+ancho*1.7, ch/2)
    local butters = display.newImage(personajes,"../img/butters.png", cw/2 + ancho*3, ch/2)
    
    kenny.xScale = 0.08
    kenny.yScale = 0.08

    stan.xScale = 0.3
    stan.yScale = 0.3

    butters.xScale = 0.3
    butters.yScale = 0.3

    kyle.xScale = 0.09
    kyle.yScale = 0.09

    cartman2.xScale = 0.5
    cartman2.yScale = 0.5

    local piso = display.newRect(cw, ch, cw*2, 100)
    piso:setFillColor(0,0, 0, 0)
    physics.addBody(piso, "static")
    
    physics.addBody(kenny, "dynamic", { radius = 50, bounce = 0.5 })
    physics.addBody(stan, "dynamic", { radius = 50, bounce = 0.5 })
    physics.addBody(kyle, "dynamic", { radius = 50, bounce = 0.5 })
    physics.addBody(cartman2, "dynamic", { radius = 50, bounce = 0.5 })
    physics.addBody(butters, "dynamic", { radius = 50, bounce = 0.5 })

    transition.to(personajes,{time=500,alpha=0,delay=4000,onComplete=mostrarTransformaciones})
end

function scene:create( event )
 
    local sceneGroup = self.view
    grupoGrillas = display.newGroup()
    fondo = display.newImageRect(sceneGroup,"../img/cuartaPagina.jpg",cw,ch)
    fondo.x, fondo.y = cw/2,ch/2
    -- for i=1, 3 do 
    --    local line = display.newLine(grupoGrillas,0,alto*i,cw,alto*i)
    --    line.strokeWidth = 3
    --    line:setStrokeColor(0)
    -- end
    -- for i=1, 8 do 
    --    local line = display.newLine(grupoGrillas,ancho*i,0,ancho*i,ch)
    --    line.strokeWidth = 3
    --    line:setStrokeColor(0)
    -- end
    

    fondo:addEventListener( "touch",moverComic)


end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene