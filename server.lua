
webhookmsg = '' -- Webhook for vMenu message logger.
webhookvmenu = '' -- Webhook for ClearArea, KillPlayer, & SummonPlayer.
webcolor = '44270' -- Webhook Color

--- DO NOT TOUCH BELOW UNLESS YOU KNOW WHAT YOUR DOING! - SOUTH ---

RegisterNetEvent('vMenu:SendMessageToPlayer', function(target, message)AddEventHandler("playerConnecting", function(name, setReason, deferrals)
	local src = source
	ServerFunc.CreateLog({ EmbedMessage = lang.join.msg:gsub("{name}", GetPlayerName(src)), player_id = src, channel = 'join'})
	deferrals.defer()
	Wait(50)
	deferrals.update(lang.join.update)
	if Config.CheckTimeout then
		ServerFunc.CheckTimeout({userId = ServerFunc.ExtractIdentifiers(src).discord:gsub("discord:", "")}, function(data)
			Wait(500)
			if not data.state then
				deferrals.done()
			else
				ServerFunc.CreateLog({ EmbedMessage = lang.join.deny:gsub("{name}", GetPlayerName(src)):gsub("{expire}", data.expire), channel = 'leave', color = '#F23A3A'})
				msg = lang.join.timeout:gsub("{expire}", data.expire)
				deferrals.done(msg)
			end
		end)
	else
		deferrals.done()
	end
end)
        
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookmsg, webcolor, "vMenu Event: Private Message", "**From:**\n**ID: "..sourceID.."** | "..sourceName.."\n\n**To:**\n**ID: "..target.."** | "..targetName.."\n\n**Message:** `"..message.."`")  
end)

RegisterNetEvent('vMenu:LogPlayerEvent', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Log Player Event:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:GetPlayerIdentifiers', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Player Identifiers:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:SaveTeleportLocation', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Save Teleport Location:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:PmsDisabled', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu PmsToggled:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:RequestBanList', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Requested Ban List:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:RequestPlayerUnban', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Requested Player Unban:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('cuff:ServerCuffSubject', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "Cuff Subject:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:Logging', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event:", "**ID: "..sourceID.."** | "..sourceName.. " ".."**"..target.."**")
end)

RegisterNetEvent('vMenu:TempBanPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Tempban Event", "**ID: "..sourceID.."** | "..sourceName.. " has tempbanned ".."**ID: "..target.."** | ".. targetName)
end)

RegisterNetEvent('vMenu:PermBanPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Ban Event", "**ID: "..sourceID.."** | "..sourceName.. " has banned ".."**ID: "..target.."** | ".. targetName)
end)

RegisterNetEvent('vMenu:KickPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Kick Event", "**ID: "..sourceID.."** | "..sourceName.. " has kick ".."**ID: "..target.."** | ".. targetName)
end)

RegisterNetEvent('vMenu:ClearArea', function()
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Clear Area", "**ID: "..sourceID.."** | "..sourceName.." has cleared the area")
end)

RegisterNetEvent('vMenu:KillPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Kill Player", "**ID: "..sourceID.."** | "..sourceName.. " has killed ".."**ID: "..target.."** | ".. targetName)
end)

RegisterNetEvent('vMenu:DeathNotification', function()
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Dead Player", "**ID: "..sourceID.."** | "..sourceName.." has died.")
end)

RegisterNetEvent('vMenu:SummonPlayer', function(target)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    local targetName = GetPlayerName(target)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Summon Player", "**ID: "..sourceID.."** | "..sourceName.. " has summoned ".."**ID: "..target.."** | ".. targetName)
end)

RegisterNetEvent('vMenu:UpdateServerWeather', function(result)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Server Weather", "**ID: "..sourceID.."** | "..sourceName.." has updated the weather to: **"..result.."**")
end)

RegisterNetEvent('vMenu:UpdateServerTime', function(result)
    local sourceID = source
    local sourceName = GetPlayerName(sourceID)
    sendToDiscord(webhookvmenu, webcolor, "vMenu Event: Server Time", "**ID: "..sourceID.."** | "..sourceName.." has updated the time to: **"..result..":00**")
end)


function sendToDiscord(webhook, color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
    

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- 
expectedName = "SouthLogs"
resource = GetCurrentResourceName()

if resource ~= expectedName then
    print("^1[^4" .. expectedName .. "^1] WARNING^0")
    print("Change the resource name to ^4" .. expectedName .. " ^0or else the functionality will not work correctly.")
end

print ("Your Script is up to date!")
print ("Connection Established to Discord!")
