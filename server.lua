function Error(source, message)
	TriggerClientEvent('chat:addMessage', source, {
		color = {255, 0, 0},
		args = {'Error', message}
	})
end

RegisterCommand('popdensity', function(source, args, raw)
	if not args[1] then
		Error(source, 'No multiplier specified')
		return
	end

	local multiplier = tonumber(args[1])

	if not multiplier or multiplier < 0.0 or multiplier > 1.0 then
		Error(source, 'Multiplier must be a number between 0.0 and 1.0')
		return
	end

	TriggerClientEvent('popdensity:setMultiplier', -1, multiplier * 1.0)
end, true)
