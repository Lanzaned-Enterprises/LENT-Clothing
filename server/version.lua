--[[ Version Checker ]] --
local version = "100"

-- [[ Discord ]] --
local DISCORD_WEBHOOK = ""
local DISCORD_NAME = "LENT - Clothing"
local DISCORD_IMAGE = "https://cdn.discordapp.com/attachments/1026175982509506650/1026176123928842270/Lanzaned.png"

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        checkResourceVersion()
    end
end)

function checkUpdateEmbed(color, name, message, footer)
    local content = {
        {
            ["color"] = color,
            ["title"] = " " .. name .. " ",
            ["description"] = message,
            ["footer"] = {
                ["text"] = " " .. footer .. " ",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 
    'POST', json.encode({
        username = DISCORD_NAME, 
        embeds = content, 
        avatar_url = DISCORD_IMAGE
    }), { ['Content-Type'] = 'application/json '})
end

function checkResourceVersion()
    PerformHttpRequest("https://raw.githubusercontent.com/Lanzaned-Enterprises/LENT-Clothing/main/version.txt", function(err, text, headers)
        if (version > text) then
            print(" ")
            print("---------- LANZANED CLOTHING ----------")
            print("Clothing is using a Development Build! Please download stable!")
            print("Curent Version: " .. version .. " Latest Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Clothing")
            print("----------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Clothing Update Checker", "Clothing is using a Development Build! Please download stable!\nCurent Version: " .. version .. " Latest Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Clothing", "Script created by: https://discord.lanzaned.com")
        elseif (version < text) then
            print(" ")
            print("---------- LANZANED CLOTHING ----------")
            print("Clothing is not up to date! Please update!")
            print("Curent Version: " .. version .. " Latest Version: " .. text)
            print("https://github.com/Lanzaned-Enterprises/LENT-Clothing")
            print("----------------------------------------")
            print(" ")
            checkUpdateEmbed(5242880, "Clothing Update Checker", "Clothing is not up to date! Please update!\nCurent Version: " .. version .. " Latest Version: " .. text .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Clothing", "Script created by: https://discord.lanzaned.com")
        else
            print(" ")
            print("---------- LANZANED CLOTHING ----------")
            print("Clothing is up to date and ready to go!")
            print("Running on Version: " .. version)
            print("https://github.com/Lanzaned-Enterprises/LENT-Clothing")
            print("----------------------------------------")
            print(" ")
            checkUpdateEmbed(20480, "Clothing Update Checker", "Clothing is up to date and ready to go!\nRunning on Version: " .. version .. "\nhttps://github.com/Lanzaned-Enterprises/LENT-Clothing", "Script created by: https://discord.lanzaned.com")
        end
    end, "GET", "", {})
end