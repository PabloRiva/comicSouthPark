local composer = require( "composer" )
 
local scene = composer.newScene()
local fondo

function inComic(event)
    if event.phase == "ended" then
        composer.gotoScene("scndPage", {time=1000, effect="slideLeft"})
        print("cambio de escena")
    end
    return true
end 

function scene:create( event )
 
    local portada = {
        type = "image",
        filename = "../img/portada.jpg"
    }
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    fondo = display.newRect(sceneGroup,0,0,cw,ch)
    fondo.x, fondo.y = cw/2, ch/2
    fondo.fill = portada
end
 
 
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        fondo:addEventListener( "touch", inComic)
 
    end
end
 
 
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