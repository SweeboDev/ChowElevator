-- elevator.lua

local QBCore = exports['qb-core']:GetCoreObject()

-- Load the configuration file
Config = Config or {}
Config.Locations = Config.Locations or {}

-- Register the target for each location
for location, data in pairs(Config.Locations) do
    for _, floorData in ipairs(data.coords) do
        local pos = floorData.position
        exports['qb-target']:AddBoxZone(location .. "_" .. floorData.floor, pos, 1.0, 1.0, {
            name = location .. "_" .. floorData.floor,
            heading = 0,
            debugPoly = false,
            minZ = pos.z - 1.0,
            maxZ = pos.z + 1.0,
        }, {
            options = {
                {
                    event = "elevator:openMenu",
                    icon = "fas fa-elevator",
                    label = "Use Elevator",
                    location = location
                }
            },
            distance = 1.5
        })
    end
end

RegisterNetEvent('elevator:openMenu')
AddEventHandler('elevator:openMenu', function(data)
    local location = data.location
    local elements = {}

    for _, floorData in ipairs(Config.Locations[location].coords) do
        table.insert(elements, {
            title = floorData.floor,
            description = "Go to " .. floorData.floor,
            event = "elevator:goToFloor",
            args = {
                x = floorData.position.x,
                y = floorData.position.y,
                z = floorData.position.z
            }
        })
    end

    lib.registerContext({
        id = 'elevator_menu',
        title = 'Elevator Menu',
        options = elements
    })

    lib.showContext('elevator_menu')
end)

RegisterNetEvent('elevator:goToFloor')
AddEventHandler('elevator:goToFloor', function(data)
    local playerPed = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)

    SetEntityCoords(playerPed, data.x, data.y, data.z)

    DoScreenFadeIn(1000)
    
end)
