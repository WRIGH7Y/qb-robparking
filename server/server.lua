local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent(Config.CoreName..':GetObject', function(obj) QBCore = obj end)



RegisterServerEvent('qb-robparking:server:sp1d3r1987')
AddEventHandler('qb-robparking:server:sp1d3r1987', function(count)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local data = {
        worth = math.random(Config.MoneyMin,Config.MoneyMax)
    }
    local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then 
        streetLabel = streetLabel .. " " .. street2
    end
local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Parking Meter Robbery'}
local dispatchData = {dispatchData = data, caller = 'Alarm', streetLabel}
TriggerEvent('wf-alerts:svNotify', dispatchData)
    Player.Functions.AddMoney("cash", data.worth)
    TriggerClientEvent('QBCore:Notify', src, "You got $"..data.worth.." from the parking meter", "success", 5000)
    TriggerClientEvent('QBCore:Notify', src, "Was it really worth it?", "success", 5000)
end)

