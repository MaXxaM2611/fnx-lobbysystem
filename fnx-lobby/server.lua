local Lobby = {}



RegisterServerEvent("fnx-lobby:playerSpawned",function ()
    local src = source 
    if Lobby[src] == nil then
        SetPlayerRoutingBucket(src,0)
        Lobby[src] = GetPlayerRoutingBucket(src)
        TriggerClientEvent("fnx-lobby:getMyLobby",src,GetPlayerRoutingBucket(src))
    end
end)



RegisterCommand("lobby",function (src,args)
    if src ~= 0 then   
        if #args > 0 and tonumber(args[1]) ~= nil then     
            if Lobby[src] ~= nil and Lobby[src] ~= args[1] then
                exports["fnx-lobby"]:setLobby(src,args[1])
                TriggerClientEvent("fnx-lobby:notify",src,"Sei entrato nella lobby ~r~["..args[1].."]~w~")      
            else
                TriggerClientEvent("fnx-lobby:notify",src,"Sei gia in questa lobby")
            end
        end
    end
end)



RegisterCommand("set_lobby", function (src,args) 
    if src ~= 0 then
        if #args > 0 and tonumber(args[1]) and tonumber(args[2]) then
            if GetPerms(src,"set_lobby") then
                exports["fnx-lobby"]:setLobby(args[1],args[2])
                TriggerClientEvent("fnx-lobby:notify",args[1],"Sei stato settato nella lobby ~r~["..args[1].."]~w~".." da: "..GetPlayerName(src))     
                TriggerClientEvent("fnx-lobby:notify",src,"Hai settato nella lobby ~r~["..args[1].."]~w~".." Player: "..GetPlayerName(src))     
            else
                TriggerClientEvent("fnx-lobby:notify",src,"Non hai il permesso di eseguire questo comando!")
            end
        end
    end
end)


RegisterCommand("set_all_lobby", function (src,args)
    if src ~= 0 then
        if #args > 0 and tonumber(args[1]) then
            if GetPerms(src,"set_all_lobby") then
                for a, b in pairs(GetPlayers()) do
                   exports["fnx-lobby"]:setLobby(b,args[1])
                   TriggerClientEvent("fnx-lobby:notify",b,"Sei stato settato nella lobby ~r~["..args[1].."]~w~".." da: "..GetPlayerName(src))     
                    Citizen.Wait(20)
                end
            else
                TriggerClientEvent("fnx-lobby:notify",src,"Non hai il permesso di eseguire questo comando!")

            end
        end
    end
end)

GetPerms = function (src,type)
    if Config.Permessi[type] then
        for a, b in pairs(Config.Permessi[type]) do
            for c, d in pairs(GetPlayerIdentifiers(src)) do
                if b == d then
                    return true
                end
            end
        end
    end
end



RegisterServerEvent("fnx-lobby:setLobby")
AddEventHandler("fnx-lobby:setLobby", function (lobby)

    local src = source
    if Lobby[src] ~= nil then
    --[[if Config.Redzone[lobby] then
            TriggerClientEvent("fnx-lobby:setData",src,Config.Redzone[lobby])
        end]]
        exports["fnx-lobby"]:setLobby(src,lobby)
    end
end)



exports("setLobby",function (src, lobby)
    if Lobby[src] ~= nil then
        SetPlayerRoutingBucket(src,lobby)
        TriggerClientEvent("fnx-lobby:getMyLobby",src,lobby)
    end
end)

exports("getLobby",function (src)
    if Lobby[src] ~= nil then
        return Lobby[src]
    end
end)


AddEventHandler("playerDropped",function ()
    local src = source
    if Lobby[src] ~= nil then
        Lobby[src] = nil
    end
end)




