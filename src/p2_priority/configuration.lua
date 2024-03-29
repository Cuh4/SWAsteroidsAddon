--------------------------------------------------------
-- [Priority] Configuration
--------------------------------------------------------

--[[
    ----------------------------

    CREDIT:
        Author: @cuh6_ (Discord)
        GitHub Repository: https://github.com/Cuh4/SWAsteroidsAddon
        File Created: 14/01/2024 (dd/mm/yy)

    ----------------------------
]]

-------------------------------
-- // Setup
-------------------------------
addonConfiguration = {
    credit = {
        discordUsername = "cuh6_",
        discordServerInvite = "https://dsc.gg/cuhhubsw"
    },

    information = {
        addonName = "Asteroids Addon",

        description = {
            short = "An addon that adds asteroids to space.",
            long = "A performant addon that periodically spawns asteroids around players if they are in space."
        },

        requiredDLCs = {
            {
                name = "Space",
                enabled = AuroraFramework.attributes.SpaceEnabled
            },

            -- {
            --     name = "Industrial Frontier",
            --     enabled = AuroraFramework.attributes.AridEnabled
            -- },

            -- {
            --     name = "Weapons",
            --     enabled = AuroraFramework.attributes.WeaponsEnabled
            -- }
        }
    },

    dev = {
        debugEnabled = false
    }
}