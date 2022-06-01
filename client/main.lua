ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("Fire:TriggerSound")
AddEventHandler("Fire:TriggerSound", function()
    local PlayerX, PlayerY, PlayerZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local nearestStation

    for i = 1, #Config.FireStations, 1 do
        local distDiff = Vdist(PlayerX, PlayerY, PlayerZ, Config.FireStations[i].x, Config.FireStations[i].y, Config.FireStations[i].z)
        local nearestStationDiff

        if nearestStation == nil then
            nearestStation = i
            nearestStationDiff = Vdist(PlayerX, PlayerY, PlayerZ, Config.FireStations[i].x, Config.FireStations[i].y, Config.FireStations[i].z)
        else
            nearestStationDiff = Vdist(PlayerX, PlayerY, PlayerZ, Config.FireStations[nearestStation].x, Config.FireStations[nearestStation].y, Config.FireStations[nearestStation].z)
        end

        if distDiff <= nearestStationDiff then
            nearestStation = i
        end
    end

    for i = 1, 10, 1 do
        for i = 1, 10, 1 do
            PlaySoundFromCoord(i, "scanner_alarm_os", Config.FireStations[nearestStation].x, Config.FireStations[nearestStation].y, Config.FireStations[nearestStation].z, "dlc_xm_iaa_player_facility_sounds", 1, 500, 0)
        end
        Wait(1000)
    end
end)
