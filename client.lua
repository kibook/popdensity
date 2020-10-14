local DensityMultiplier = Config.DensityMultiplier

RegisterNetEvent('popdensity:setMultiplier')

AddEventHandler('popdensity:setMultiplier', function(multiplier)
	DensityMultiplier = multiplier
end)

CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/popdensity', 'Set the population density multiplier', {
		{name = 'multiplier', help = 'A number between 0.0 (no population) and 1.0 (max population). Omit to print current multiplier.'}
	})

	TriggerServerEvent('popdensity:sync')

	while true do
		Wait(0)
		if SetPedDensityMultiplierThisFrame then
			-- FiveM
			SetPedDensityMultiplierThisFrame(DensityMultiplier)
			SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier, DensityMultiplier)
		else
			-- RedM
			SetScenarioPedDensityMultiplierThisFrame(DensityMultiplier)
		end
		SetParkedVehicleDensityMultiplierThisFrame(DensityMultiplier)
		SetRandomVehicleDensityMultiplierThisFrame(DensityMultiplier)
		SetVehicleDensityMultiplierThisFrame(DensityMultiplier)
	end
end)
