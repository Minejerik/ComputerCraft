print("refueling")

for i = 1, 16 do -- loop through the slots
  turtle.select(i) -- change to the slot
  if turtle.refuel(0) then -- if it's valid fuel
    local halfStack = math.ceil(turtle.getItemCount(i) / 2) -- work out half of the amount of fuel in the slot
    turtle.refuel(halfStack) -- consume half the stack as fuel
  end
end
local fuel = turtle.getFuelLevel() -- get the fuel level
if fuel < 100 then -- if the fuel level is less than 100
  print("Not enough fuel") -- print out that there is not enough fuel
  os.exit() -- exit the program
end
os.setComputerLabel("Minejerik miner - Miner")
local modemside = nil
print("What side is the modem?")
modemside = io.read()
local modem = peripheral.wrap(modemside)
rednet.open(modemside)


print(os.getComputerID())
print("Please input above id into server!")
local serverid = rednet.receive()
print("Server id: " .. serverid)

local function mainloop()
  while true do
    if input == "stop" then
      print("Stopping")
      rednet.close(modemside)
      os.exit()
    end
    if input == "beans" then
      print("Beans")
    end
  end
end

local input = rednet.receive()
mainloop()
