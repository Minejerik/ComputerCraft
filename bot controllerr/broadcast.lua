local broadcast = {}
local t2s = require('t2s')

broadcast.init = function()
    rednet.open("right")
end

broadcast.send = function(receiver, message)
    receiver = tonumber(receiver)
    rednet.send(receiver, message)

    repeat
        Event, Id, Messa = os.pullEvent()
    until Event == "rednet_message" and Id == receiver
    Data  = t2s.st2(Messa)

end

return broadcast
