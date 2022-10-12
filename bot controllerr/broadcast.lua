local broadcast = {}

broadcast.send = function (receiver,message)
print('sent '..message..' to '..receiver)
end




return broadcast