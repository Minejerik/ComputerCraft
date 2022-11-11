rednet.open("left")
 local data = {}
 function sendinfo()
     x, y, z = gps.locate()
    if not x == nil then
        data['coords'] = x .. ' | ' .. y .. ' | ' .. z
    else
        data['coords'] = 'GPS not found'
    end
     Fuelnum = turtle.getFuelLevel()
     data['Curritem'] = turtle.getItemDetail()
    if data['Curritem'] == nil then data['Curritem'] = 'nothing' else data['Curritem'] = data['Curritem'].name end
     data['Itemnum'] = turtle.getItemCount()

     df, data['Blockabove'] = turtle.inspectUp()
    if df == false then data['Blockabove'] = 'air' else data['Blockabove'] = data['Blockabove'].name end
     df, data['Blockbelow'] = turtle.inspectDown()
    if df == false then data['Blockbelow'] = 'air' else data['Blockbelow'] = data['Blockbelow'].name end
     df, data['Blockahead'] = turtle.inspect()
    if df == false then data['Blockahead'] = 'air' else data['Blockahead'] = data['Blockahead'].name end

    rednet.send(0, data)
end

while true do
    local event, id, text = os.pullEvent()
    if event == "rednet_message" then
        print(id .. '> ' .. text)
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
        elseif text == 'place' then
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
