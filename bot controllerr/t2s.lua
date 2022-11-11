T2s = {}

function mysplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end

T2s.t2s = function(table)
	local temp = ''
	for key, value in pairs(table) do
		temp = temp .. '|' .. key .. '~' .. tostring(value)
	end
	return temp
end

T2s.st2 = function(string)
	temp = mysplit(string, '|')
	for i = 1, #temp, 1 do
		h = string.find(temp[i], '~')
		key = string.sub(temp[i], 0, h - 1)
		value = string.sub(temp[i], h + 1)
		temp[i] = nil
		temp[key] = value
	end
	return temp
end

return T2s
