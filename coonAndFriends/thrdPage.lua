local composer = require( "composer" )
local physics = require("physics")

local scene = composer.newScene()
physics.start()
local fondo
local grupoGrillas
local alto = ch/6
local ancho = cw/6 
 
function moverComic(e)
    if e.phase == "ended" then
        transition.to(fondo,{time=1000,xScale=2.5,yScale=2,x=cw/2 + ancho*3.5, y=ch/2 + alto*2, onComplete = mysterion})
    end
end
 
function reestablecerFondo(metodo)
    transition.to(fondo,{time=2000,x=cw/2, y=ch/2,delay=3000,xScale=1, yScale=1,onComplete=metodo})
end
function cambiarEscena()
    composer.gotoScene("frthPage",{effect="zoomOutInRotate",time=500})
end
function desvanecerMysterionCoon(img1,img2)
    transition.to(img1,{time=1000,alpha = 0,delay=2000})
    transition.to(img2,{time=1000,alpha = 0,delay=2000,onComplete=cambiarEscena})
end
function coon_mysterion()
    local Mysterion2 = display.newImage("../img/Mysterion2.png", cw/2 -ancho*2, ch/2)
    local theCoon = display.newImage("../img/theCoon.png", cw/2 +ancho*2, ch/2)

    transition.to(theCoon,{time=500,xScale=3,yScale=3})
    transition.to(Mysterion2,{time=500,xScale=3,yScale=3,onComplete=desvanecerMysterionCoon(Mysterion2,theCoon)})
end

function theCoon()
    transition.to(fondo,{time=1000,xScale=3,yScale=2,x=cw/2 -ancho*6, y = ch/2 - alto*1.6})
    local theCoon = display.newImage("../img/theCoon.png", cw/2, ch/2)
    local theCoon2 = display.newImage("../img/theCoon2.png", cw/2, ch/2)
    theCoon2.alpha = 0
    theCoon.alpha = 0
    theCoon2.xScale = 2
    theCoon2.yScale = 2
    local function desvanecertheCoon2()
        transition.to(theCoon2, { time = 500, alpha = 0, delay = 2000, onComplete = reestablecerFondo(coon_mysterion) })
    end

    local function mostrartheCoon2() 
        transition.to(theCoon2, { time = 10, alpha = 1, delay = 300, onComplete = desvanecertheCoon2 })
    end

    local function desvanecertheCoon()
        transition.to(theCoon, { time = 10, alpha = 0, delay = 300, onComplete = mostrartheCoon2 })
    end

    local function mostrartheCoon()
        transition.to(theCoon, { time = 500, alpha = 1, delay = 500,onComplete = desvanecertheCoon })
    end
    timer.performWithDelay(500, mostrartheCoon)
end

function mysterion()
    local Mysterion = display.newImage("../img/Mysterion.png", cw/2, 0)
    local Mysterion2 = display.newImage("../img/Mysterion2.png", cw/2, ch/2)
    local piso = display.newRect(cw,ch,cw*2,100)
    piso:setFillColor( 0,0,0,0)
    physics.addBody( piso,"static")
    physics.setGravity(0, 30)
    Mysterion2.alpha = 0
    Mysterion.alpha = 0
    Mysterion.xScale = 1
    Mysterion.yScale = 1
    Mysterion2.xScale = 1.5
    Mysterion2.yScale = 1.5

    local function desvanecerMysterion2()
        transition.to(Mysterion2, { time = 500, alpha = 0, delay = 2000, onComplete = reestablecerFondo(theCoon) })
    end

    local function mostrarMysterion2() 
        transition.to(Mysterion2, { time = 1000, alpha = 1, delay = 0, onComplete = desvanecerMysterion2 })
    end

    local function desvanecerMysterion()
        transition.to(Mysterion, { time = 500, alpha = 0, delay = 500, onComplete = mostrarMysterion2 })
    end

    local function mostrarMysterion()
        --transition.to(Mysterion, { time = 500, alpha = 1, delay = 500, y = ch/2, onComplete = desvanecerMysterion })
        Mysterion.alpha = 1
        local piso = display.newRect(cw,ch,cw*2,400)
        piso:setFillColor( 0,0,0,0)
        physics.addBody( piso,"static")
        physics.addBody(Mysterion, "dynamic", { radius = 110, bounce = 0.5 })
        transition.to(Mysterion,{time=200,delay=3500,y=ch/2,yScale=1.5,xScale=1.5,onComplete=desvanecerMysterion})
    end
    timer.performWithDelay(500, mostrarMysterion)
end



-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    grupoGrillas = display.newGroup()
    -- Code here runs when the scene is first created but has not yet appeared on screen
    fondo = display.newImageRect(sceneGroup,"../img/segundaPagina.jpg",cw,ch)
    fondo.x, fondo.y = cw/2,ch/2
    -- for i=1, 5 do 
    --    local line = display.newLine(grupoGrillas,0,alto*i,cw,alto*i)
    --    line.strokeWidth = 3
    --    line:setStrokeColor(0)
    -- end
    -- for i=1, 5 do
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