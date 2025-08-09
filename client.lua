local nametags = {}

exports('addNametag', function(ped, text)
    if type(ped) ~= 'number' or not DoesEntityExist(ped) then
        print("^1[esx_npcnames] HIBÁS ped entity!^0")
        return
    end

    if type(text) ~= 'string' then
        print("^1[esx_npcnames] HIBÁS szöveg!^0")
        return
    end

    nametags[#nametags + 1] = {
        ped = ped,
        text = text
    }
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local dist = #(vector3(x, y, z) - p)

    local maxDistance = 25.0 -- távolság ameddig még látszik a nametag
    if dist > maxDistance then
        return 
    end

    local scale = 0.7 / dist
    scale = math.max(0.5, math.min(scale, 1.2))

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4) 
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextCentre(true)

        SetTextDropshadow(2, 2, 2, 2, 255)
        SetTextEdge(2, 0, 0, 0, 150)

        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

CreateThread(function()
    while true do
        Wait(0)
        for _, tag in ipairs(nametags) do
            local ped = tag.ped
            if DoesEntityExist(ped) then
                local coords = GetEntityCoords(ped)
                DrawText3D(coords.x, coords.y, coords.z + 1.1, tag.text)
            end
        end
    end
end)
