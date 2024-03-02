-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

local btn1 = display.newGroup()
local btn2 = display.newGroup()
local btn3 = display.newGroup()

local myText = display.newText( "Привет, мир!", display.contentCenterX, 100, native.systemFont, 24 )
myText:setFillColor( 1, 0, 0 )

local button1 = display.newRect( btn1, display.contentCenterX - 100, display.contentHeight - 50, 80, 30 )
button1:setFillColor( 0, 0, 1 )
local button1Text = display.newText( btn1, "Кнопка 1", button1.x, button1.y, native.systemFont, 12 )

local button2 = display.newRect( btn2, display.contentCenterX, display.contentHeight - 50, 80, 30 )
button2:setFillColor( 0, 1, 0 )
local button2Text = display.newText( btn2, "Кнопка 2", button2.x, button2.y, native.systemFont, 12 )

local button3 = display.newRect( btn3, display.contentCenterX + 100, display.contentHeight - 50, 80, 30 )
button3:setFillColor( 1, 1, 0 )
local button3Text = display.newText( btn3, "Кнопка 3", button3.x, button3.y, native.systemFont, 12 )

local function button1Clicked(event)
    transition.to(myText, {time = 500, xScale = 1.5, yScale = 1.5, transition = easing.outElastic, onComplete = function()
        myText.text = "Вы \nнажали \nна кнопку 1"
    end})
end

local function button2Clicked(event)
    transition.to(myText, {time = 500, rotation = 360, transition = easing.outQuad, onComplete = function()
        myText.text = "Привет, мир!"
    end})
end

local function button3Clicked(event)
    transition.to(myText, {time = 500, alpha = 0, transition = easing.outQuad, onComplete = function()
        myText.alpha = 1
        myText.text = "Пока что так"
    end})
end


button1:addEventListener("tap", button1Clicked)
button2:addEventListener("tap", button2Clicked)
button3:addEventListener("tap", button3Clicked)

local function onTouch(event)
    local target = event.target
    local phase = event.phase

    if phase == "began" then
        target.markX = target.x
        target.markY = target.y
    elseif phase == "moved" then
        local x = (event.x - event.xStart) + target.markX
        local y = (event.y - event.yStart) + target.markY

        target.x, target.y = x, y
    end

    return true
end

myText:addEventListener("touch", onTouch)
btn1:addEventListener("touch", onTouch)
btn2:addEventListener("touch", onTouch)
btn3:addEventListener("touch", onTouch)