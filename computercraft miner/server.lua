os.setComputerLabel("Minejerik miner - Server")
local modemside = nil
print("What side is the modem?")
modemside = io.read()
local modem = peripheral.wrap(modemside)
rednet.open(modemside)
print("Please input turtle id!")
local turtid = io.read()
print("Turtle id: " .. turtid)
local selfid = tostring(os.getComputerID())
rednet.broadcast(turtid, selfid)
local function mainloop()
    Input = io.read()
    if Input == "stop" then
        rednet.broadcast(turtid, "stop")
        rednet.close(modemside)
        print("Stopping")
        os.exit()
    end
    mainloop()
end

mainloop()
