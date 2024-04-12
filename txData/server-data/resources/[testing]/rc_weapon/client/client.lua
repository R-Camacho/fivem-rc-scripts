RegisterCommand('weapon', function(source, args)
    local weaponName = args[1] or 'weapon_pistol' -- Default is pistol

    
    if not IsWeaponValid(weaponName) then
        TriggerEvent('chat:addMessage', {
            args = { weaponName .. ' is not a valid weapon name, try again!' }
        })
        return
    end

    TriggerEvent('chat:addMessage', {
        args = { 'Giving ' .. GetPlayerName(source) ..' a new weapon ' .. weaponName}
    })

    local ammoCount = args[2] or GetWeaponClipSize(weaponName) * 4 --4 mags

    GiveWeaponToPed(
        PlayerPedId(), 
        weaponName,
        ammoCount,
        false,
        true
    )
    --//TODO remove this and test changes
    SetModelAsNoLongerNeeded(weaponName)
end)