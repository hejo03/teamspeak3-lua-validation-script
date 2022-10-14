require("ts3init")
require("validation/events")
require("validation/script")

local MODULE_NAME = "validation"

local function createMenus(moduleMenuItemID)

    testmodule_events.moduleMenuItemID = moduleMenuItemID


    return {
        { ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, testmodule_events.MenuIDs.MENU_ID_CHANNEL_1,
            "Validation: Send Validation in Chat", "../test_plugin/1.png" },
        { ts3defs.PluginMenuType.PLUGIN_MENU_TYPE_CHANNEL, testmodule_events.MenuIDs.MENU_ID_CHANNEL_2,
            "Validation: Print Validation in Chat", "../test_plugin/1.png" }



    }
end

local registeredEvents = {
    createMenus = createMenus,
    onTextMessageEvent = testmodule_events.onTextMessageEvent,
    onMenuItemEvent = testmodule_events.onMenuItemEvent
}


ts3RegisterModule(MODULE_NAME, registeredEvents)
