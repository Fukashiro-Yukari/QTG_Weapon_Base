--[[-------------------------------------------------------------

This file will not be loaded, just show all custom Hooks
Will update more hooks later

wep = weapons
ent = player or npc (I think it is impossible for other entities)

----------------------------------------------------------------]]

-- state

QTG_OnSetState(wep,state) -- Called when the state is set, returns true to prevent, returns a string and number to override the state and state time

-- deploy+init

QTG_SetupDataTables(wep) -- Insert content in SetupDataTables
QTG_PreInitialize(wep) -- Add content before initialization
QTG_Initialize(wep) -- Add content after initialization
QTG_PreDeploy(wep,ent) -- Add content before Deploy
QTG_Deploy(wep,ent) -- Add content after Deploy,return to override what the thingy returns

-- attack

QTG_PrePrimaryAttack(wep) -- Called on weapon primary attack, return true to prevent
QTG_DelayPrimaryAttack(wep) -- Called on weapon primary delay attack, return true to prevent
QTG_PrimaryAttack(wep) -- Called on weapon primary attack
QTG_PreSecondaryAttack(wep) -- Called on weapon secondary attack, return true to prevent
QTG_DelaySecondaryAttack(wep) -- Called on weapon secondary delay attack, return true to prevent
QTG_SecondaryAttack(wep) -- Called on weapon secondary attack

-- Reload

QTG_Reload(wep) -- Called when the weapon is reloaded, returning true prevents

-- think

QTG_Think(wep,ent) -- Add content to Think

-- holster + remove

QTG_PreHolster(wep,ent) -- Called before we truly holster,return to override what the thingy returns
QTG_Holster(wep) -- Add content after the real holster
QTG_OnRemove(wep) -- return to override what the thingy returns
QTG_OnDrop(wep) -- return to override what the thingy returns

-- DrawHUD

QTG_DrawHUD(wep) -- Draw HUD when picking up the weapon
QTG_PreDrawScope(wep) -- Draw Scope HUD
QTG_DrawScope(wep) -- Draw Scope HUD, return true to override the default HUD (Only 'qtg_weapon_sniper_base' Base)
QTG_PreDrawCrosshair(wep,cone) -- Draw Crosshair
QTG_DrawCrosshair(wep,cone) -- Draw Crosshair
QTG_PreDrawWeaponSelection(wep,x,y,wide,tall,alpha) -- Draw Weapon Selection
QTG_DrawWeaponSelection(wep,x,y,wide,tall,alpha) -- Draw Weapon Selection
QTG_PrePaintContentIcon(weptbl,wide,tall) -- Paint Content Icon
QTG_PaintContentIcon(weptbl,wide,tall) -- Paint Content Icon

-- Throw

QTG_OnThrow(wep) -- Called when the grenade is thrown out (Only 'qtg_weapon_grenade_base' Base)

-- Sound

QTG_IronSightSounds(wep,bool) -- Called when IronSight plays a sound when switching, return true prevents, return string overlay sound

-- melee

QTG_MeleeHit(wep,bool) -- Melee hits an object or wall, true is Primary Attack, false is Secondary Attack (Only 'qtg_weapon_melee_base' Base)