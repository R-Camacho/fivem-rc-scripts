RegisterCommand('car', function(source, args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        TriggerEvent('chat:addMessage', {
            args = { vehicleName .. ' is not a valid vehicle name, try again!' },
        })
        return
    end

    TriggerEvent('chat:addMessage', {
        args = {vehicleName .. ' is being spawned by ' .. GetPlayerName(source)},
    })

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        Wait(1)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    
    local vehicle = CreateVehicle(
        vehicleName,
        pos,
        heading,
        true
    )
    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)
