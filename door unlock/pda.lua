local lockid = nil
print(os.getComputerID())
rednet.open("back")
lockid = rednet.receive()
for i = 1,1 do
Input = read()
if Input == "unlock" then
    rednet.send(lockid, "unlock")
    print("unlocked")
elseif Input == "lock" then
    rednet.send(lockid, "lock")
    print("locked")
elseif Input == "exit" then
    os.exit()
    print("exiting")
    return
else
    print("invalid input")
end
end