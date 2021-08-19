
exports('AddButton', function(title , description , trigger , par,server)
    SetNuiFocus(true , true)
    SendNUIMessage({addbutton = true , title = title , description = description , trigger = trigger , par = par ,server = server })
end)


exports('SetTitle', function(title)
    SendNUIMessage({SetTitle = true , title = title})
end)

RegisterNUICallback("clicked" , function(data, cb)
    local trigger   =  (data.trigger or false)
    local param     =  (data.param or false)
    local server    =  (data.server or false)
    if server then
        if trigger then
            TriggerServerEvent(trigger,param)
        end
    else
        if trigger then
            TriggerEvent(trigger,param)
        end
    end

    
end)
RegisterNUICallback("close" , function(data , cb)
    print("Debug")
    SetNuiFocus(false , false)
end)






