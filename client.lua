local DensityMultiplier = Config.DensityMultiplier

RegisterNetEvent('popdensity:setMultiplier')

AddEventHandler('popdensity:setMultiplier', function(multiplier)
	DensityMultiplier = multiplier
end)

CreateThread(function()
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
