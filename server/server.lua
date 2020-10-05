local ESX = nil

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)

RegisterNetEvent('FoRa:hellobro')
AddEventHandler('FoRa:hellobro', function()
	local _source = source	
    local xPlayer = ESX.GetPlayerFromId(_source)
    local result  = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{['@identifier'] = player})
	local noob = result[1].noob
    if noob == 'yes' then
    xPlayer.addInventoryItem('noob', 1)
    TriggerClientEvent('esx:showNotification', _source,'~o~ 歡迎加入客家村 這是您的新手禮包  ~w~')
	MySQL.Async.execute(
    'UPDATE users SET `noob` = @yes WHERE identifier = @identifier',{['@yes']= true,['@identifier'] = xPlayer.identifier}
	)	
    else
    TriggerClientEvent('esx:showNotification', _source,'~o~ 歡迎回來客家村  ~w~')
    end
    end
end)

ESX.RegisterUsableItem('noob', function(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('noob', 1)
    xPlayer.addMoney(1000000)
    xPlayer.addInventoryItem('water', 87)
end)