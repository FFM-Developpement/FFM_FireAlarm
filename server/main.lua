ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("fireAlarm", function(source, args, rawCommand)
    if (source > 0) then
        local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == 'fire' then
            TriggerClientEvent("Fire:TriggerSound", -1)
            print("Vous avez mis en marche l'alarme.")
        else 
            print("Vous devez être pompier pour cela.")
        end
    end
end, false)
