local composer = require( "composer" )
 
local scene = composer.newScene()

local fondo
local grupoGrillas
local alto = ch/3
local ancho = cw/8 
 
function moverComic(e)
    if e.phase == "ended" then
        transition.to(fondo,{time=1000,xScale=3,yScale=2,x=cw/2, y = ch,onComplete=butters})
    end
end
function reestablecerFondo(metodo)
    transition.to(fondo,{time=2000,x=cw/2, y=ch/2,delay=3000,xScale=1, yScale=1,onComplete=metodo})
end

function siguientePagina()
    composer.gotoScene("thrdPage",{effect="zoomOutIn",time=500})
    fondo.isVisible = false
    grupoGrillas.isVisible = false
end

function cartman()
    transition.to(fondo,{time=1000,xScale=3,yScale=2,x=cw/2 -ancho*6, y = ch/2 - alto*1.6})
    local cartman = display.newImage("../img/cartman1.png",cw/2 - ancho,ch/2 + alto*0.3)
    local cartman2 = display.newImage("../img/cartman2.png",cw/2,ch/2)
    local theCoon = display.newImage("../img/theCoon2.png",cw/2,ch/2)

    cartman2.alpha = 0
    theCoon.alpha = 0
    cartman.alpha = 0
    cartman.rotation = -28
    theCoon.xScale = 2
    theCoon.yScale = 2

    local function desvanecertheCoon()
        transition.to(theCoon, { time = 500, alpha = 0, delay = 3000,onComplete=reestablecerFondo(siguientePagina)})
    end
    local function mostrartheCoon()
        theCoon.rotation = -360
        theCoon.alpha = 1
        transition.to(theCoon, { time = 500, rotation = 0,onComplete=desvanecertheCoon})
    end
    local function desvanecerCartman2()
        transition.to(cartman2, { time = 500, alpha = 0, delay = 500, onComplete = mostrartheCoon })
    end
    local function mostrarCartman2() 
        transition.to(cartman2, { time = 200, alpha = 1, delay = 200, onComplete = desvanecerCartman2 })
    end
    local function desvanecerCartman()
        transition.to(cartman,{ time = 500, alpha = 0, delay = 500, onComplete = mostrarCartman2 })
    end
    local function mostrarCartman()
        transition.to(cartman, { time = 500, alpha = 1, delay = 500,onComplete=desvanecerCartman})
    end

    timer.performWithDelay(1500, mostrarCartman)
end

function kyle()
    transition.to(fondo,{time=1000,xScale=8,delay=1500,yScale=8,x=cw/2+ancho*19, y = ch+ alto*3})
    local kyle = display.newImage("../img/kyle.png",cw/2,ch/2)
    local humanKyte = display.newImage("../img/humanKite.png",cw/2,ch/2)
    local kyle2 = display.newImage("../img/kyle2.png",cw/2,ch/2)

    humanKyte.alpha = 0
    kyle2.alpha = 0
    kyle.alpha = 0
    -- xScale, width , anchor 
    -- audio documentacion
    local function desvanecerHumanKyte()
        transition.to(humanKyte, { time = 500, alpha = 0, delay = 3000,onComplete= reestablecerFondo(cartman)})
    end
    local function mostrarHumanKyte()
        transition.to(humanKyte, { time = 500, alpha = 1,xScale=0.5,yScale=0.5,onComplete=desvanecerHumanKyte})
    end
    local function desvanecerKyle2()
        transition.to(kyle2, { time = 500, alpha = 0, delay = 500, onComplete = mostrarHumanKyte })
    end
    local function mostrarKyle2() 
        transition.to(kyle2, { time = 500, alpha = 1,xScale=0.2,yScale=0.2 ,delay = 500, onComplete = desvanecerKyle2 })
    end
    local function desvanecerKyle()
        transition.to(kyle,{ time = 500, alpha = 0, delay = 500, onComplete = mostrarKyle2 })
    end
    local function mostrarKyle()
        transition.to(kyle, { time = 500, alpha = 1,delay = 1000,xScale = 0.1,yScale=0.1,onComplete=desvanecerKyle})
    end

    timer.performWithDelay(1500, mostrarKyle)
end

function stan()
    transition.to(fondo,{time = 1000,x= cw/2 - ancho*8,y=ch/2 +alto*1.7})
    local stan = display.newImage("../img/stan.png", cw/2, ch/2)
    local toolsheed = display.newImage("../img/toolshed.png", cw/2, ch/2)
    stan.alpha = 0
    toolsheed.alpha = 0

    stan.anchorX = 0.5
    stan.anchorY = 0.5

    local function desvanecerToolSheed()
        transition.to(toolsheed, { time = 500, alpha = 0, delay = 3000,onComplete=reestablecerFondo(kyle)})
    end
    local function mostrarToolSheed() 
        transition.to(toolsheed, { time = 500, alpha = 1,onComplete = desvanecerToolSheed })
    end
    local function desvanecerStan()
        transition.to(stan,{ time = 500, alpha = 0, delay = 500, onComplete = mostrarToolSheed })
    end
    local function mostrarStan()
        --transition.to(stan, { time = 500, alpha = 1, delay = 500,onComplete=desvanecerStan})
        transition.to(stan, { time = 2000, alpha = 1,xScale=0.7,yScale=0.7,rotation = 360, iterations = 2, transition = easing.linear,onComplete = desvanecerStan})

    end

    timer.performWithDelay(1500, mostrarStan)
end

function kenny()
    transition.to(fondo,{time=1000,x=cw/2 +ancho*5,y=ch/2 - alto*1.7})
    local kenny = display.newImage("../img/kenny1.png", cw/2, ch/2)
    local kenny2 = display.newImage("../img/kenny2.png", cw/2, ch/2)
    local Mysterion = display.newImage("../img/Mysterion.png", cw/2, ch/2)
    kenny2.alpha = 0
    Mysterion.alpha = 0
    kenny.alpha = 0

    local function desvanecerMysterion()
        transition.to(Mysterion, { time = 500, alpha = 0, delay = 3000, onComplete = stan })
    end
    local function mostrarMysterion()
        transition.to(Mysterion, { time = 500, alpha = 1, xScale = 1.5, yScale = 1.5,onComplete=desvanecerMysterion})
    end
    local function desvanecerkenny2()
        transition.to(kenny2, { time = 500, alpha = 0, delay = 500, onComplete = mostrarMysterion })
    end
    local function mostrarkenny2() 
        transition.to(kenny2, { time = 500, alpha = 1, delay = 500,xScale=0.16,yScale=0.16,onComplete = desvanecerkenny2 })
    end
    local function desvanecerkenny()
        transition.to(kenny,{ time = 500, alpha = 0, delay = 500, onComplete = mostrarkenny2 })
    end
    local function mostrarkenny()
        transition.to(kenny, { time = 500, alpha = 1, delay = 500,xScale=0.16,yScale=0.16,onComplete=desvanecerkenny})
    end

    timer.performWithDelay(1500, mostrarkenny)
end



function butters()
    local butters = display.newImage("../img/butters.png", cw/2, ch/2)
    local profesorCaos = display.newImage("../img/profesorCaos.png", cw/2, ch/2)
    local profesorCaos2 = display.newImage("../img/profesorCaos2.png", cw/2, ch/2)
    profesorCaos.alpha = 0
    profesorCaos2.alpha = 0
    butters.alpha = 0

    local function desvanecerProfesorCaos2()
        transition.to(profesorCaos2, { time = 500, alpha = 0, delay = 3000, onComplete = kenny })
    end
    local function mostrarProfesorCaos2()
        transition.to(profesorCaos2, { time = 500, alpha = 1, xScale = 1.5, yScale = 1.5,onComplete=desvanecerProfesorCaos2})
    end
    local function desvanecerProfesorCaos()
        transition.to(profesorCaos, { time = 500, alpha = 0, delay = 500, onComplete = mostrarProfesorCaos2 })
    end
    local function mostrarProfesorCaos() 
        transition.to(profesorCaos, { time = 500, alpha = 1, delay = 500, onComplete = desvanecerProfesorCaos })
    end
    local function desvanecerButters()
        transition.to(butters,{ time = 500, alpha = 0, delay = 500, onComplete = mostrarProfesorCaos })
    end
    local function mostrarButters()
        transition.to(butters, { time = 500, alpha = 1, delay = 500,onComplete=desvanecerButters})
    end

    timer.performWithDelay(1500, mostrarButters)
end


function scene:create( event )
 
    local sceneGroup = self.view
    grupoGrillas = display.newGroup()
    fondo = display.newImageRect(sceneGroup,"../img/primeraPagina.jpg",cw,ch)
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