require("ts3defs")
require("ts3errors")


local function valid(serverConnectionHandlerID)
    local myClientID, error = ts3.getClientID(serverConnectionHandlerID)
    if error ~= ts3errors.ERROR_ok then
        print("Error getting own client ID: " .. error)
        return
    end
    if myClientID == 0 then
        ts3.printMessageToCurrentTab("Not connected")
        return
    end

    -- Get which channel we are in
    local myChannelID, error = ts3.getChannelOfClient(serverConnectionHandlerID, myClientID)
    if error ~= ts3errors.ERROR_ok then
        print("Error getting own channel: " .. error)
        return
    end

    -- Get the name of my channel
    local valid, error2 = ts3.getChannelClientList(serverConnectionHandlerID, myChannelID,
        ts3defs.ChannelProperties.CHANNEL_NAME)
    if error2 ~= ts3errors.ERROR_ok then
        print("Error getting channel members" .. error2)
    end
    ts3.printMessageToCurrentTab(table.tostring(valid))
end

local function validation(serverConnectionHandlerID)

    local myClientID, error = ts3.getClientID(serverConnectionHandlerID)
    if error ~= ts3errors.ERROR_ok then
        print("Error getting own client ID: " .. error)
        return
    end
    if myClientID == 0 then
        ts3.printMessageToCurrentTab("Not connected")
        return
    end



    local myChannelID, error = ts3.getChannelOfClient(serverConnectionHandlerID, myClientID)
    if error ~= ts3errors.ERROR_ok then
        print("Error getting own channel: " .. error)
        return
    end


    local clients, error = ts3.getChannelClientList(serverConnectionHandlerID, myChannelID)

    if error == ts3errors.ERROR_not_connected then
        ts3.printMessageToCurrentTab("Not connected")
        return
    elseif error ~= ts3errors.ERROR_ok then
        print("Error getting client list: " .. error)
        return
    end

    local msg = ("")
    for i = 1, #clients do
        local clientName, error = ts3.getClientVariableAsString(serverConnectionHandlerID, clients[i],
            ts3defs.ClientProperties.CLIENT_NICKNAME)
        if error == ts3errors.ERROR_ok then
            msg = msg .. " " .. clientName
        else
            clientName = "Error getting client name"
        end
    end
    ts3.requestSendChannelTextMsg(serverConnectionHandlerID, msg, myChannelID)
    ts3.printMessageToCurrentTab(msg)
end

testmodule = {
    valid = valid,
    validation = validation

}
