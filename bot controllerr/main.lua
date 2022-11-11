local broad = require('broadcast')
local option = 1
Data = {}
Blockabove = " "
local curcolor = ""
local curser = "<--- "
local messages = {}
messages[1] = 'up'
messages[2] = 'down'
messages[3] = 'forward'
messages[4] = 'backword'
messages[5] = 'place'
messages[6] = 'left'
messages[7] = 'right'
messages[8] = 'mine_for'
messages[9] = 'mine_dow'
messages[10] = 'mine_up'
messages[11] = 'cycle'
messages[12] = 'refuel'
term.clear()
print('what is the id of the turtle?')
local turtid = read()
broad.init()

function main()

    io.write("Up ")
    if option == 1 then io.write(curser) else end
    if option == 1 then io.write("   Currently Selected Item: " .. Data['Curritem'] .. "\n") else io.write("	Currently Selected Item: "
        .. Data['Curritem'] .. "\n") end

    io.write("Down ")
    if option == 2 then io.write(curser) else end
    if option == 2 then io.write("		Item Amount: " .. data['Itemnum'] .. "\n") else io.write("			Item Amount: " .. data['Itemnum'] ..
        "\n") end

    io.write("Forward ")
    if option == 3 then io.write(curser) else end
    if option == 3 then io.write('	Fuel Amount: ' .. data['Fuelnum'] .. "\n") else io.write('		Fuel Amount: ' .. data['Fuelnum'] .. "\n") end

    io.write("Backword ")
    if option == 4 then io.write(curser) else end
    if option == 4 then io.write('	Block Above: ' .. data['Blockabove'] .. "\n") else io.write('		Block Above: ' ..
        data['Blockabove'] .. "\n") end

    io.write("Place ")
    if option == 5 then io.write(curser) else end
    if option == 5 then io.write('		Block Below: ' .. data['Blockbelow'] .. "\n") else io.write('			Block Below: ' ..
        data['Blockbelow'] .. "\n") end

    io.write("Left Turn ")
    if option == 6 then io.write(curser) else end
    if option == 6 then io.write('	Block Ahead: ' .. data['Blockahead'] .. "\n") else io.write('		Block Ahead: ' ..
        data['Blockahead'] .. "\n") end

    io.write("Right Turn ")
    if option == 7 then io.write(curser) else end
    if option == 7 then io.write('Coords(x,y,z): ' .. data['Coords'] .. '\n') else io.write('		Coords(x,y,z): ' .. data['Coords'] .. '\n') end
    io.write("Mine ")
    if option == 8 then io.write(curser .. '\n') else io.write('\n') end
    io.write("Mine Down ")
    if option == 9 then io.write(curser .. '\n') else io.write('\n') end
    io.write("Mine Up ")
    if option == 10 then io.write(curser .. '\n') else io.write('\n') end
    io.write("Cycle Items ")
    if option == 11 then io.write(curser .. '\n') else io.write('\n') end
    io.write("Refuel ")
    if option == 12 then io.write(curser .. '\n') else io.write('\n') end
    local input = io.read()
    if input == "w" then
        if option ~= 1 then
            option = option - 1
        end
    elseif input == "s" then
        if option ~= 12 then
            option = option + 1
        end
    elseif input == "q" then
        broad.send(turtid, messages[option])
    end

    term.clear()
    main()
end

main()
