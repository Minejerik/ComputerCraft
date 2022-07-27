local curry
local currx
local currz
local x
local y
local z
local bedrocklevel = 58
local rednettoggle = false
local id

print("Advanced Miner")
print("By: Minejerik")
print("Version: 1.0")
print("")
print("")
print("What is the current y of the computer?")
y = tonumber(io.read())
print("What diamater do you want to mine?")
z = tonumber(io.read())
x=y
print("Are you using rednet? (y/n)")
if io.read() == "y" then
rednettoggle = true
end
print("what is the id of the rednet channel?")
id = tonumber(io.read())
if rednet then
print("Connecting to rednet")
end

local function fueling()
    for i = 1, 16 do -- loop through the slots
        turtle.select(i) -- change to the slot
        if turtle.refuel(0) then -- if it's valid fuel
          turtle.refuel(all) -- consume half the stack as fuel
        end
      end
    local fuel = turtle.getFuelLevel() -- get the fuel level
    if fuel < 100 then -- if the fuel level is less than 100
      print("Not enough fuel") -- print out that there is not enough fuel
      os.exit() -- exit the program
    end
end

local function rednet(n)
if rednet then
rednet.open(side)
rednet.send(id, n)
end
end

local function error(n)
print("------FATAL ERROR------")
rednet("error: "..n)
print("error: "..n)
end

fueling()
local function miner()
turtle.digDown()
turtle.down()
turtle.digDown()
turtle.down()
turtle.digDown()
local function bems()


for i = 1, 4, 1 do
turtle.dig()
turtle.forward()
turtle.digUp()
turtle.digDown()
end
turtle.turnRight()
turtle.dig()
turtle.forward()
turtle.digUp()
turtle.digDown()
turtle.turnRight()
end
for i = 1, 5, 1 do
bems()
end
end