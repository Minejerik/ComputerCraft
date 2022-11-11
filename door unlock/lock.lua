local side = nil
local redstoneside = nil
print("what side of the computer is the modem on?")
side = read()
rednet.open(side)
print("what side of the computer is the redstone on?")
redstoneside = read()
print("what is the ID of the pda?")
local pdaid = tonumber(read())
rednet.send(pdaid, tostring(os.getComputerID()))

local function mainloop()
    local Input = rednet.receive()
    if Input == "unlock" then
        rs.setOutput(redstoneside, true)
        print("unlocked")
    elseif Input == "lock" then
        rs.setOutput(redstoneside, true)
        print("locked")
    elseif Input == "exit" then
        print("exiting")
        os.exit()
        return
    end
    mainloop()
end
