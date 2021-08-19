
local Lobby = 0
Citizen.CreateThread(function()
    while true do
        if NetworkIsPlayerActive(PlayerId()) then
            TriggerEvent('fnx-t-open', 'hud_active', "<b>Lobby</b></p>Lobby Attuale: "..Lobby)
            TriggerServerEvent("fnx-lobby:playerSpawned")
            break
        end
    end
end)


RegisterNetEvent("fnx-lobby:getMyLobby")
AddEventHandler("fnx-lobby:getMyLobby",function (lobby)
    Lobby = lobby
    TriggerEvent('fnx-t-open', 'hud_active', "<b>Lobby</b></p>Lobby Attuale: "..Lobby)
end)




RegisterNetEvent("fnx-lobby:notify",function (msg)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(msg)
    DrawNotification(0,1)
end)




OpenMenu = function ()
    exports['fnx-menu']:SetTitle("Seleziona Lobby")		
    exports['fnx-menu']:AddButton("Lobby [10] Pistol Mk2" , "Redzone Mk2", "fnx-lobby:setLobby","10",true)	
end

RegisterCommand("opnemenulobby", function ()
    OpenMenu()
end)
RegisterKeyMapping('opnemenulobby', 'Menu Lobby', 'keyboard', 'L')




exports("setLobby",function (lobby)
  TriggerServerEvent("fnx-lobby:setLobby",lobby)
end)



exports("getLobby",function ()
    return Lobby
end)





--[[
RegisterNetEvent("fnx-lobby:setData")
AddEventHandler("fnx-lobby:setData",function (table)
    SetEntityCoords(PlayerPedId(), table.coords.x,  table.coords.y,  table.coords.z)
    GiveWeaponToPed(PlayerPedId(), table.weapon, 1000, true, true)
        for a, b in pairs(table.component) do
            GiveWeaponComponentToPed(PlayerPedId(),table.weapon, b)
        end
end)
]]
