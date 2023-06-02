require("ts3init")
require("validation/events")

local MODULE_NAME = "validation"

local function createMenus(moduleMenuItemID)
    validation_events.moduleMenuItemID = moduleMenuItemID

    return {
        { ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, validation_events.MenuIDs.MENU_ID_CHANNEL_1,
            "Validation: Send Validation in Chat", "" },
        { ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, validation_events.MenuIDs.MENU_ID_CHANNEL_2,
            "Validation: Print Validation in Chat", "" }
    }
end

local registeredEvents = {
    createMenus = createMenus,
    onTextMessageEvent = validation_events.onTextMessageEvent,
    onMenuItemEvent = validation_events.onMenuItemEvent
}

ts3RegisterModule(MODULE_NAME, registeredEvents)
