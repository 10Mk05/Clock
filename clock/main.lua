function love.load()
    data = os.date(os.date ("%c"))
    font = love.graphics.newFont("Bungee-Regular.ttf", 40)
    larghezza = love.graphics.getWidth()/2 - 200
    nowTable = os.date(os.date ("%c"))
    nowYear = nowTable.year
    nowHour = nowTable.hour
    nowHour = nowTable.hour
    nowSeconds = nowTable.sec
    nowMinutes = nowTable.min

    sprites = {}
    sprites.clock = love.graphics.newImage('sprites/oroloio.png')
    sprites.mattina = love.graphics.newImage('sprites/mattina.jpeg')
    sprites.notte = love.graphics.newImage('sprites/notte.jpg')
    sprites.pomeriggio = love.graphics.newImage('sprites/pomeriggio.jpg')
    sprites.sera = love.graphics.newImage('sprites/sera.jpg')

    sounds = {}
    sounds.TicToc = love.audio.newSource('sounds/TicTac.mp3', "stream")
    sounds.mare = love.audio.newSource('sounds/Sea.mp3', "stream")
    sounds.Dong = love.audio.newSource('sounds/Chiming-clock.mp3', "stream")
    sounds.notte = love.audio.newSource('sounds/Notte.mp3', "stream")
    sounds.TicToc:setLooping(true)
    sounds.mare:setLooping(true)
    sounds.mare:setVolume(0.1)
    sounds.Dong:setLooping(false)
    sounds.Dong:setVolume(0.2)
    sounds.notte:setLooping(true)
    sounds.notte:setVolume(0) --0.2
    sounds.TicToc:play()
    sounds.TicToc:setVolume(0.5)

    love.window.setTitle("Clock")

end

function love.update(dt)
    nowTable = os.date('*t')
    nowYear = nowTable.year
    nowHour = nowTable.hour
    nowHour = nowTable.hour
    nowSeconds = nowTable.sec
    nowMinutes = nowTable.min
    data = os.date()
    
    if nowHour >= 18 or nowHour <= 7 then
        if sounds.mare:isPlaying() == true then
            sounds.mare:stop()
        end
        sounds.notte:setLooping(true)
        sounds.notte:play()

    end
    if nowHour >= 7 and nowHour <= 18 then
        if sounds.notte:isPlaying() == true then
            sounds.notte:stop()
        end
        sounds.mare:setLooping(true)
        sounds.mare:play()
    end
    if nowMinutes == 0 then
        sounds.Dong:play()
    end
end

function love.draw()
    if nowHour >=6 and nowHour <12 then
        love.graphics.draw(sprites.mattina,0,0)
    end
    if nowHour >=12 and nowHour <18 then
        love.graphics.draw(sprites.pomeriggio,0,0)
    end
    if nowHour >=18 and nowHour <21 then
        love.graphics.draw(sprites.sera,0,0)
    end
    if nowHour >=21 and nowHour <=24 or nowHour >= 0 and nowHour <6 then
        love.graphics.draw(sprites.notte,0,0)
    end
    love.graphics.draw(sprites.clock, larghezza-115 ,love.graphics:getHeight()-600 )

    love.graphics.setFont(font)
    love.graphics.print(data,larghezza,love.graphics:getHeight()-515)
end