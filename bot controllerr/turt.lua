rednet.open("left")
local coords
local function sendinfo()
local x,y,z = gps.locate()
if not x == nil then
coords = x..' | '..y..' | '..z
else
coords = ' '
end
local Fuelnum = turtle.getFuelLevel()
local Curritem = turtle.getItemDetail()
if Curritem == nil then Curritem = 'nothing' else Curritem = Curritem.name end
local Itemnum = turtle.getItemCount()

local df, Blockabove = turtle.inspectUp()
if df == false then Blockabove = 'air' else Blockabove = Blockabove.name end
local df, Blockbelow = turtle.inspectDown()
if df == false then Blockbelow = 'air' else Blockbelow = Blockbelow.name end
local df, Blockahead = turtle.inspect()
if df == false then Blockahead = 'air' else Blockahead = Blockahead.name end
local messa = coords..','..Fuelnum..','..Curritem..','..Itemnum..','..Blockabove..','..Blockbelow..','..Blockahead
rednet.send(0,messa)
end



while true do
    local event, id, text = os.pullEvent()
    if event == "rednet_message" then
        print(id..'> '..text)
        if text == "up" then
            turtle.up()
            sendinfo()
        elseif text == "down" then
            turtle.down()
            sendinfo()
        elseif text == 'forward' then
            turtle.forward()
            sendinfo()
        elseif text == 'backword' then
            turtle.back()
            sendinfo()
        elseif text == 'place'  then
            turtle.place()
            sendinfo()
        elseif text == 'left' then
            turtle.turnLeft()
            sendinfo()
        elseif text == 'right' then
            turtle.turnRight()
            sendinfo()
        elseif text == 'mine_for' then
            turtle.dig()
            sendinfo()
        elseif text == 'mine_dow' then
            turtle.digDown()
            sendinfo()
        elseif text == 'mine_up' then
            turtle.digUp()
            sendinfo()
        elseif text == 'cycle' then
            if turtle.getSelectedSlot == 16 then turtle.select(1) else turtle.select(turtle.getSelectedSlot() + 1) end
            sendinfo()
        elseif text == 'refuel' then
            turtle.refuel()
            sendinfo()
        end
    end
end


