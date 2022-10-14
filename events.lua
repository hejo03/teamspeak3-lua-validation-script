local MenuIDs = {
    MENU_ID_CHANNEL_1 = 1,
    MENU_ID_CHANNEL_2 = 2


}

local moduleMenuItemID = 0


--
-- Called when a plugin menu item (see ts3plugin_initMenus) is triggered. Optional function, when not using plugin menus, do not implement this.
--
-- Parameters:
--  serverConnectionHandlerID: ID of the current server tab
--  type: Type of the menu (ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CLIENT or ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_GLOBAL)
--  menuItemID: Id used when creating the menu item
--  selectedItemID: Channel or Client ID in the case of PLUGIN_MENU_TYPE_CHANNEL and PLUGIN_MENU_TYPE_CLIENT. 0 for PLUGIN_MENU_TYPE_GLOBAL.
--
local function onMenuItemEvent(serverConnectionHandlerID, menuType, menuItemID, selectedItemID)
    if menuItemID == 1 then
        local clients, error = ts3.getChannelClientList(serverConnectionHandlerID, selectedItemID)


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
        ts3.requestSendChannelTextMsg(serverConnectionHandlerID, msg, selectedItemID)
    elseif menuItemID == 2 then
        local clients, error = ts3.getChannelClientList(serverConnectionHandlerID, selectedItemID)


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

        ts3.printMessageToCurrentTab(msg)

    end
end

testmodule_events = {
    MenuIDs = MenuIDs,
    moduleMenuItemID = moduleMenuItemID,
    onMenuItemEvent = onMenuItemEvent
}
