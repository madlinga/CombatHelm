# CombatHelm v1.1

![CombatHelm Icon](/assets/CombatHelm.png)

> A lightweight WoW addon to display the players helm during combat.

## Future Improvements

- Add features to enable show helm permanently in certain scenarios such as dungeons, raids, battlegrounds, arenas, duels, etc.

## Change log

### v1.1

Added the ability to enable and disable the addon dynamically in-game by using the /ch command - defaults to enabled if the var isn't found in memory (first time load).
Added event listeners to detect when player dies or enters a loading screen to remove the helm, catering for bugs such as when a helm remained on after leaving a BG or releasing their spirit after death.

### v1.0

Basic addon functionality added, always enabled and toggles show helm whilst in combat.
