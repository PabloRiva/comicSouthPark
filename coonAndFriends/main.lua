local composer = require("composer")
cw = display.contentWidth
ch = display.contentHeight
composer.gotoScene("frstPage",{time=1000,effect="fade"})

local backgroundMusic

-- Cargar la música
local function cargarMusica()
    backgroundMusic = audio.loadStream("../img/intro.mp3")
end

-- Reproducir la música
local function reproducirMusica()
    audio.play(backgroundMusic, { loops = -1 })
end

-- Detener la música
local function detenerMusica()
    audio.stop()
end

-- Llamar a las funciones en el momento adecuado, por ejemplo, en el evento "system" de Solar2D
local function onSystemEvent(event)
    if event.type == "applicationStart" then
        cargarMusica()
        reproducirMusica()
    elseif event.type == "applicationExit" then
        detenerMusica()
    end
end

-- Registrar el evento "system"
Runtime:addEventListener("system", onSystemEvent)

