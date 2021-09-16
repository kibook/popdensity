local densityMultipliers = Config.densityMultipliers

RegisterNetEvent("popdensity:sync")

AddEventHandler("popdensity:sync", function()
	TriggerClientEvent("popdensity:setMultipliers", source, densityMultipliers)
end)
