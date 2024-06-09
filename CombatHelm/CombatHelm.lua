AUTHOR = "https://github.com/madlinga | Mïtch (Firemaw Alliance)"
VERSION = 1.0

-- Version and author message in console.
print("CombatHelm: v" .. VERSION .. " | " .. "Author: " .. AUTHOR)

-- Helm does not show as default (on-load).
ShowHelm(false)

local inCombat = UnitAffectingCombat("player")
local holder = CreateFrame("Frame")
holder:RegisterEvent("PLAYER_REGEN_ENABLED")
holder:RegisterEvent("PLAYER_REGEN_DISABLED")
holder:SetScript("OnEvent", function(self, event)

-- Shows helm when the player is in combat
if UnitAffectingCombat("player") then
        ShowHelm(true)
    else
        ShowHelm(false)
    end
	
end)