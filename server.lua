local densityMultiplier = Config.densityMultiplier

RegisterNetEvent('popdensity:sync')

local function errorMessage(source, message)
	TriggerClientEvent('chat:addMessage', source, {
		color = {255, 0, 0},
		args = {'Error', message}
	})
end

RegisterCommand('popdensity', function(source, args, raw)
	if not args[1] then
		TriggerClientEvent('chat:addMessage', source, {
			color = {255, 255, 128},
			args = {'Density Multiplier', string.format('%.1f', densityMultiplier)}
		})
		return
	end

	local multiplier = tonumber(args[1])

	if not multiplier or multiplier < 0.0 or multiplier > 1.0 then
		errorMessage(source, 'Multiplier must be a number between 0.0 and 1.0')
		return
	end

	densityMultiplier = multiplier * 1.0

	TriggerClientEvent('popdensity:setMultiplier', -1, densityMultiplier)
end, true)

AddEventHandler('popdensity:sync', function()
	TriggerClientEvent('popdensity:setMultiplier', -1, densityMultiplier)
end)
