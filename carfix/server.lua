local everyoneAllowed = true

local allowed = 
{
	"steam:11000010d576dee",
	"steam:1100001134a6025",
	"steam:110000107ee770c"
}

AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/carfix" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('mad_carfix:fix', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('mad_carfix:fix', source)
			else
				TriggerClientEvent('mad_carfix:noPerms', source)
			end
		end
	elseif msg == "/clean" then 
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('mad_carfix:clean', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('mad_carfix:clean', source)
			else
				TriggerClientEvent('mad_carfix:noPerms', source)
			end
		end
	end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
	end
	
	return false
end