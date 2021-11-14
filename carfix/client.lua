RegisterNetEvent('mad_carfix:fix')
AddEventHandler('mad_carfix:fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		notification("~g~Araç Tamir Edildi")
	else
		notification("~o~Araçta Olmalısın!")
	end
end)

RegisterNetEvent('mad_carfix:clean')
AddEventHandler('mad_carfix:clean', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		notification("~b~Araç Temizlendi!")
	else
		notification("~o~Araçta Olmalısın!")
	end
end)

RegisterNetEvent('mad_carfix:noPerms')
AddEventHandler('mad_carfix:noPerms', function()
	notification("~r~Yetkin yok.")
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end