local densityMultiplier = Config.densityMultiplier

RegisterNetEvent('popdensity:setMultiplier')

AddEventHandler('popdensity:setMultiplier', function(multiplier)
	densityMultiplier = multiplier
end)

function SetAmbientAnimalDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xC0258742B034DFAF, multiplier)
end

function SetAmbientHumanDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xBA0980B5C0A11924, multiplier)
end

function SetAmbientPedDensityMultiplierThisFrame(multiplier)
	Citizen.InvokeNative(0xAB0D553FE20A6E25, multiplier)
end

function SetScenarioAnimalDensityThisFrame(multiplier)
	Citizen.InvokeNative(0xDB48E99F8E064E56, multiplier)
end

function SetScenarioHumanDensityThisFrame(multiplier)
	Citizen.InvokeNative(0x28CB6391ACEDD9DB, multiplier)
end

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/popdensity', 'Set the population density multiplier', {
		{name = 'multiplier', help = 'A number between 0.0 (no population) and 1.0 (max population). Omit to print current multiplier.'}
	})

	TriggerServerEvent('popdensity:sync')

	while true do
		if SetPedDensityMultiplierThisFrame then
			-- FiveM
			SetPedDensityMultiplierThisFrame(densityMultiplier)
			SetScenarioPedDensityMultiplierThisFrame(densityMultiplier, densityMultiplier)
		else
			-- RedM
			SetAmbientAnimalDensityMultiplierThisFrame(densityMultiplier)
			SetAmbientHumanDensityMultiplierThisFrame(densityMultiplier)
			SetAmbientPedDensityMultiplierThisFrame(densityMultiplier)
			SetScenarioAnimalDensityThisFrame(densityMultiplier)
			SetScenarioHumanDensityThisFrame(densityMultiplier)
			SetScenarioPedDensityMultiplierThisFrame(densityMultiplier)
		end

		SetParkedVehicleDensityMultiplierThisFrame(densityMultiplier)
		SetRandomVehicleDensityMultiplierThisFrame(densityMultiplier)
		SetVehicleDensityMultiplierThisFrame(densityMultiplier)

		Citizen.Wait(0)
	end
end)
