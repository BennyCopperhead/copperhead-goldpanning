local RSGCore = exports['rsg-core']:GetCoreObject()

-- use goldpan
RSGCore.Functions.CreateUseableItem("goldpan", function(source, item)
    local src = source
    TriggerClientEvent("rsg-goldpanning:client:StartGoldPan", src, item.name)
end)

-- give reward
RegisterServerEvent('rsg-goldpanning:server:reward')
AddEventHandler('rsg-goldpanning:server:reward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local foundgold = math.random(1,100)
	local tamount = math.random(1,5)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    if foundgold < Config.GoldChance then
        local chance = math.random(1,100)
        if chance <= 50 then
            local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            -- add items
            Player.Functions.AddItem("goldflake", tamount)
            --Player.Functions.AddXp('main', xp)
            TriggerClientEvent("rsg-inventory:client:ItemBox", src, "goldflake", "add")
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.not_much_this_pan'), 'primary')
            -- webhook
            TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', 'Gold Found 🌟', 'yellow', firstname..' '..lastname..' found a gold nugget!')
        end
        if chance >= 50 and chance <= 80 then -- medium reward
            local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            --local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            -- add items
            Player.Functions.AddItem("goldnugget", tamount)
            TriggerClientEvent("rsg-inventory:client:ItemBox", src, "goldnugget", "add")
           -- Player.Functions.AddItem(item2, Config.MediumRewardAmount)
           -- TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.looks_like_good_gold'), 'primary')
            -- webhook
            TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', 'Gold Fever 🌟', 'yellow', firstname..' '..lastname..' found two gold nuggets!')
        end
        if chance > 80 then -- large reward
            local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
           --local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
           -- local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            -- add items
            Player.Functions.AddItem("goldnuggetl", tamount)
            TriggerClientEvent("rsg-inventory:client:ItemBox", src, "goldnuggetl", "add")
            --Player.Functions.AddItem(item2, Config.LargeRewardAmount)
            --TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
           -- Player.Functions.AddItem(item3, Config.LargeRewardAmount)
           -- TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item3], "add")
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.gold_fever_jackpot'), 'primary')
            -- webhook
            TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', 'Jackpot Gold Find 🌟', 'yellow', firstname..' '..lastname..' found three gold nuggets!')
        end
    else
        TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.no_gold_this_time'), 'primary')
    end
end)

-- give hotspot reward
RegisterServerEvent('rsg-goldpanning:server:hotspotreward')
AddEventHandler('rsg-goldpanning:server:hotspotreward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local foundgold = math.random(1,100)
	local tamount = math.random(1,5)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local xp = Config.Xp
    local xp1 = Config.Xp1
    local xp2 = Config.Xp2
    if foundgold < Config.HSGoldChance then
        local chance = math.random(1,100)
        if chance <= 50 then
            local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            -- add items
            --Player.Functions.AddItem(item1, Config.HSSmallRewardAmount)
			Player.Functions.AddItem("goldnugget", tamount)
  
            --TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
			riggerClientEvent("rsg-inventory:client:ItemBox", src, "goldflake", "add")
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.not_much_this_pan'), 'primary')
            -- webhook
            TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', 'Mega Gold Found 🌟', 'yellow', firstname..' '..lastname..' found a gold nugget!')
        end
        if chance >= 50 and chance <= 80 then -- medium reward
            local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            -- add items
            --Player.Functions.AddItem(item1, Config.HSMediumRewardAmount)
           -- TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
           -- Player.Functions.AddItem(item2, Config.HSMediumRewardAmount)
            --TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
			Player.Functions.AddItem("goldnugget", tamount)
            TriggerClientEvent("rsg-inventory:client:ItemBox", src, "goldnugget", "add")
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.looks_like_good_gold'), 'primary')
            -- webhook
            TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', 'Mega Gold Fever 🌟', 'yellow', firstname..' '..lastname..' found two gold nuggets!')
        end
        if chance > 80 then -- large reward
            local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
            -- add items
           -- Player.Functions.AddItem(item1, Config.HSLargeRewardAmount)
            --TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
           -- Player.Functions.AddItem(item2, Config.HSLargeRewardAmount)
          --  TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
          --  Player.Functions.AddItem(item3, Config.HSLargeRewardAmount)
          --  TriggerClientEvent("rsg-inventory:client:ItemBox", src, RSGCore.Shared.Items[item3], "add")
			Player.Functions.AddItem("goldnuggetl", tamount)
            TriggerClientEvent("rsg-inventory:client:ItemBox", src, "goldnuggetl", "add")
            TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.gold_fever_jackpot'), 'primary')
            -- webhook
            TriggerEvent('rsg-log:server:CreateLog', 'goldpanning', 'Mega Jackpot Gold Find 🌟', 'yellow', firstname..' '..lastname..' found three gold nuggets!')
        end
    else
        TriggerClientEvent('RSGCore:Notify', src, Lang:t('primary.no_gold_this_time'), 'primary')
    end
end)
