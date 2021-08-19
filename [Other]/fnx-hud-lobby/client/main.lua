

RegisterNetEvent('fnx-t-open')
AddEventHandler('fnx-t-open', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('fnx-t-close')
AddEventHandler('fnx-t-close', function(Action)
	SendNUIMessage({
		action = Action
	})
end)

