local broadcast = {}

broadcast.init = function()
    rednet.open("right")
end

broadcast.send = function(receiver, message)
    receiver = tonumber(receiver)
    rednet.send(receiver, message)

    repeat
        Event, Id, Messa = os.pullEvent()
    until Event == "rednet_message" and Id == receiver

    local messa = Messa
    local temp = string.find(messa, ",")
    Coords = string.sub(messa, 0, temp - 1)
    messa = string.sub(messa, temp + 1)

    temp = string.find(messa, ",")
    Fuelnum = string.sub(messa, 0, temp - 1)
    messa = string.sub(messa, temp + 1)

    temp = string.find(messa, ",")
    Curritem = string.sub(messa, 0, temp - 1)
    messa = string.sub(messa, temp + 1)

    temp = string.find(messa, ",")
    Itemnum = string.sub(messa, 0, temp - 1)
    messa = string.sub(messa, temp + 1)

    temp = string.find(messa, ",")
    Blockabove = string.sub(messa, 0, temp - 1)
    messa = string.sub(messa, temp + 1)

    temp = string.find(messa, ",")
    Blockbelow = string.sub(messa, 0, temp - 1)
    messa = string.sub(messa, temp + 1)



    Blockahead = messa

end



return broadcast
