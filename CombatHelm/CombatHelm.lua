AUTHOR = "https://github.com/madlinga | Mïtch (Firemaw Alliance)"
VERSION = 1.0

-- Version and author message in console.
print("CombatHelm: v" .. VERSION .. " | " .. "Author: " .. AUTHOR)

-- Creates a CLI /ch interface allowing users to configure if the addon is enabled dynamically.
local function cliHandler(arg, editbox)
    if arg == 'enable' then
        enabled = true
        print("CombatHelm enabled")
    elseif arg == 'disable' then
        enabled = false
        print("CombatHelm disabled")
    else
        print("Invalid /ch command.\nOptions:\n    /ch enabled\n    /ch disabled")
    end
end

SLASH_CH1 = '/ch'
SlashCmdList["CH"] = cliHandler 

-- Event Listener setup along with core logic.
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_DEAD") -- Edge case for removing on death
frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Edge case for removing helm after event such as BG, arena, dungeon etc.
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == "CombatHelm" then
        if enabled == nil then 
            enabled = true
        end
        print("CombatHelm loaded, enabled: ", enabled)
    end

    -- Shows helm when the player is in combat (if enabled)
    if enabled and UnitAffectingCombat("player") then
        ShowHelm(true)
    else
        ShowHelm(false)
    end
end
)