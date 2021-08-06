local densityMultipliers = Config.densityMultipliers

RegisterNetEvent("popdensity:setMultipliers")

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

exports("getMultiplier", function(name)
	return densityMultipliers[name]
end)

exports("setMultiplier", function(name, value)
	densityMultipliers[name] = value
end)

exports("resetMultiplier", function(name)
	densityMultipliers[name] = Config.densityMultipliers[name]
end)

AddEventHandler("popdensity:setMultipliers", function(multipliers)
	densityMultipliers = multipliers
end)

Citizen.CreateThread(function()
	TriggerServerEvent("popdensity:sync")

	while true do
		if SetPedDensityMultiplierThisFrame then
			-- FiveM
			SetPedDensityMultiplierThisFrame(densityMultipliers.ambientPeds)
			SetScenarioPedDensityMultiplierThisFrame(densityMultipliers.scenarioPeds, densityMultipliers.scenarioPeds)
		else
			-- RedM
			SetAmbientAnimalDensityMultiplierThisFrame(densityMultipliers.ambientAnimals)
			SetAmbientHumanDensityMultiplierThisFrame(densityMultipliers.ambientHumans)
			SetAmbientPedDensityMultiplierThisFrame(densityMultipliers.ambientPeds)
			SetScenarioAnimalDensityThisFrame(densityMultipliers.scenarioAnimals)
			SetScenarioHumanDensityThisFrame(densityMultipliers.scenarioHumans)
			SetScenarioPedDensityMultiplierThisFrame(densityMultipliers.scenarioPeds)
		end

		SetParkedVehicleDensityMultiplierThisFrame(densityMultipliers.parkedVehicles)
		SetRandomVehicleDensityMultiplierThisFrame(densityMultipliers.randomVehicles)
		SetVehicleDensityMultiplierThisFrame(densityMultipliers.vehicles)

		Citizen.Wait(0)
	end
end)
