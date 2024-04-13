--Teleport player to target
RegisterCommand('goto', function(_, args)
    local targetId = args[1]

    if not targetID then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.' }
        })
        return
    end

    TriggerServerEvent('rc_teleporter:goto', targetID)
end)

--Teleport target to player
RegisterCommand('summon', function(_, args)
    local targetId = args[1]

    if not targetID then
        TriggerEvent('chat:addMessage', {
            args = { 'Please provide a target ID.' }
        })
        return
    end

    TriggerServerEvent('rc_teleporter:summon', targetId)
end)

RegisterCommand('waypoint', function()

    local waypoint = GetFirstBlipInfoId(8)
    
    if not DoesBlipExist(waypoint) then
        TriggerEvent('chat:addMessage', {
            args = { 'You need to have a waypoint.' }
        })
        return
    end

    local coords = GetBlipCoords(waypoint)
    
    --//TODO
    -- local _, newZ = GetGroundZFor3dCoord(coords.x, coords.y, 150.0, false)
    -- coords.z = newZ
    

    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
end)


--Teleport player to specific coords //TODO delete this
-- RegisterNetEvent('rc_teleporter:teleport', function(targetCoordinates)
--     SetEntityCoords(PlayerPedId(), targetCoordinates)
-- end)
