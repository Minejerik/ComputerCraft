local broad = require('broadcast')
option = 1
coords = "9,15,20"
Curritem = "minecraft:stone"
Itemnum = 64
Fuelnum = 10000
Blockahead = "minecraft:diamond_ore"
Blockbelow = "minecraft:iron_ore"
Blockabove = "minecraft:cock"
local curcolor = ""
local curser = "<--- "
turtid = 15
messages = {}
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
function main()

if Fuelnum > 2500 then
curcolor = '\27[0;32m'
elseif Fuelnum <= 2500 and Fuelnum > 1000 then
curcolor = '\27[0;33m'
elseif Fuelnum <= 1000 then
curcolor = '\27[1;31m'
end

io.write("Up ") if option == 1 then io.write(curser) else end; if option == 1 then io.write("		Currently Selected Item: "..Curritem.."\n")else io.write("				Currently Selected Item: "..Curritem.."\n") end

io.write("Down ") if option == 2 then io.write(curser) else end;if option == 2 then io.write("		Item Amount: "..Itemnum.."\n") else io.write("			Item Amount: "..Itemnum.."\n") end

io.write("Forward ") if option == 3 then io.write(curser) else end;if option == 3 then io.write('	Fuel Amount: '..curcolor..Fuelnum..'\27[0m'.."\n") else io.write('		Fuel Amount: '..curcolor..Fuelnum..'\27[0m'.."\n") end

io.write("Backword ") if option == 4 then io.write(curser) else end;if option == 4 then io.write('	Block Above: '..Blockabove.."\n") else io.write('		Block Above: '..Blockabove.."\n") end

io.write("Place ") if option == 5 then io.write(curser) else end;if option == 5 then io.write('		Block Below: '..Blockbelow.."\n") else io.write('			Block Below: '..Blockbelow.."\n") end

io.write("Left Turn ") if option == 6 then io.write(curser) else end;if option == 6 then io.write('	Block Ahead: '..Blockahead.."\n") else io.write('		Block Ahead: '..Blockahead.."\n") end

io.write("Right Turn ") if option == 7 then io.write(curser) else end;if option == 7 then io.write('Coords(x,y,z): '..coords..'\n') else io.write('		Coords(x,y,z): '..coords..'\n') end
io.write("Mine ") if option == 8 then io.write(curser..'\n') else io.write('\n') end;
io.write("Mine Down ") if option == 9 then io.write(curser..'\n') else io.write('\n') end;
io.write("Mine Up ") if option == 10 then io.write(curser..'\n') else io.write('\n') end;
io.write("Cycle Items ") if option == 11 then io.write(curser..'\n') else io.write('\n') end;
io.write("Refuel ") if option == 12 then io.write(curser..'\n') else io.write('\n') end;
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
broad.send(turtid,messages[option])
end

os.execute('clear')
main()
end
main()