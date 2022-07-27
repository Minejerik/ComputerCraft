if fs.exists("offlineminer.lua") then
  fs.delete("offlineminer.lua")
end
print("refueling")
local blocksmined
local left
for i = 1, 16 do -- loop through the slots
    turtle.select(i) -- change to the slot
    if turtle.refuel(0) then -- if it's valid fuel
      local halfStack = math.ceil(turtle.getItemCount(i)/2) -- work out half of the amount of fuel in the slot
      turtle.refuel(halfStack) -- consume half the stack as fuel
    end
  end
local fuel = turtle.getFuelLevel() -- get the fuel level
if fuel < 100 then -- if the fuel level is less than 100
  print("Not enough fuel") -- print out that there is not enough fuel
  os.exit() -- exit the program
end
blocksmined = 0
print("how far down would you like to go")
local times = read()
left = times
turtle.digDown()
blocksmined=blocksmined+1
turtle.down()
for i = 1, times, 1 do
    local success, data = turtle.inspectDown()
    if success then
    if data.name == "bedrock" then
    for i = 1, times, 1 do
    turtle.up()
    end
    return
    end
    else
    turtle.down()
    end
turtle.digDown()
blocksmined = blocksmined + 1
turtle.turnLeft()
turtle.dig()
blocksmined = blocksmined + 1
turtle.turnLeft()
turtle.dig()
blocksmined = blocksmined + 1
turtle.turnLeft()
turtle.dig()
blocksmined = blocksmined + 1
turtle.turnLeft()
turtle.dig()
blocksmined = blocksmined + 1
turtle.down()
left = left - 1
os.setComputerLabel("Minejerik Miner|Blocks Left: "..left)
end
print("done mining going up")
os.setComputerLabel("Minejerik Miner|Going Up!")
for i = 1, times, 1 do
turtle.up()
end
os.setComputerLabel("Minejerik Miner|Done Mining!")
print("Number of blocks mined: "..blocksmined)