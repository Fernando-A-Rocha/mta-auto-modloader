--[[
	Author: https://github.com/Fernando-A-Rocha

	updater_server.lua

	/!\ UNLESS YOU KNOW WHAT YOU ARE DOING, NO NEED TO CHANGE THIS FILE /!\
--]]

local function outputUpdaterInfo(msg)
    outputServerLog("[AutoML Updater] "..msg)
end

local function fetchLatestCallback(data, info)
    if data and info and info.success == true then

        data = fromJSON(data)
        if not data then
            outputUpdaterInfo("Could not parse data from GitHub")
            return
        end
        
        -- fetch version from data
        local version = data.tag_name
        if not version then
            iprint(data)
            outputUpdaterInfo("Could not get version from GitHub data")
            return
        end

        -- compare versions
        local currentVersion = getResourceInfo(getThisResource(), "version")
        if not currentVersion then
            outputUpdaterInfo("Could not get resource version")
            return
        end

        local foundEqual = false
        local tryStrings = {currentVersion, "v"..currentVersion} -- check for v prefix
        for k, str in pairs(tryStrings) do
            if str == version then
                foundEqual = true
                break
            end
        end

        if not foundEqual then

            -- check if version is superior than currentVersion
            local currentVersionParts = split(currentVersion, ".")
            local currentVersionPartsCount = #currentVersionParts
            local versionParts = split(version, ".")
            local versionPartsCount = #versionParts

            versionParts[1] = versionParts[1]:gsub("v", "")

            if currentVersionPartsCount > versionPartsCount then
                versionPartsCount = currentVersionPartsCount
            end

            -- check if version is inferior than currentVersion
            local inferior = true

            for i = 1, versionPartsCount do
                if tonumber(currentVersionParts[i]) > tonumber(versionParts[i]) then
                    inferior = false
                    break
                end
            end

            if inferior then
                outputUpdaterInfo("You are running an inferior version of this resource")
                outputUpdaterInfo("Get the latest from: "..data.html_url)
                return
            end

            outputUpdaterInfo("You are running an unknown version of this resource")
        else
            outputUpdaterInfo("You are running the latest version: "..currentVersion)
        end
    else
        outputUpdaterInfo("Could not get data from GitHub")
    end
end

addEventHandler("onResourceStart", resourceRoot, function(startedResource)
    fetchRemote("https://api.github.com/repos/Fernando-A-Rocha/mta-auto-modloader/releases/latest", {
        queueName = "mod_downloader_updater",
        connectionAttempts = 3,
        connectTimeout = 5000,
    }, fetchLatestCallback)
end)
