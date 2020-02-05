DEFINE_BASECLASS('qtg_weapon_melee_base')

SWEP.HoldType 				= 'melee'

SWEP.PrintName			    = 'Water pipe'
SWEP.Author 				= 'Neptune QTG'

SWEP.Slot 					= 0
SWEP.SlotPos 				= 5

SWEP.Spawnable 				= true
SWEP.Category 				= 'Neptune QTG SWEPs'

SWEP.ViewModel 				= 'models/weapons/c_crowbar.mdl'
SWEP.WorldModel 			= 'models/weapons/w_crowbar.mdl'
SWEP.ViewModelFOV 			= 54
SWEP.UseHands 				= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_SelectIcons'
SWEP.WeaponInfoFontIcon		= 'a'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_KillIcons'
SWEP.KillIconAdd			= 'a'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.MaxDistance	= 64
SWEP.Primary.AminMiss		= ACT_VM_MISSCENTER
SWEP.Primary.AminHit		= ACT_VM_HITCENTER
SWEP.Primary.SlashSound		= 'Weapon_Crowbar.Melee_Hit'
SWEP.Primary.MissSound		= 'Weapon_Crowbar.Single'
SWEP.Primary.HitWallSound	= 'Canister.ImpactHard'
SWEP.Primary.HitWallType	= QSWEP.ENUM.MELEEHIT.BULLET
SWEP.Primary.Delay			= 0.3
SWEP.Primary.Damage			= 20
SWEP.Primary.DamageType		= DMG_CLUB

SWEP.Secondary.CanUse 		= false

SWEP.ShowViewModel          = false
SWEP.ShowWorldModel         = false

SWEP.VElements = {
	["pipe"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.255, 1.534, -7.661), angle = Angle(5.355, 5.453, -1.543), size = Vector(0.702, 0.702, 0.702), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["pipe"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.786, 1.565, -8.573), angle = Angle(3.125, -82.561, -5.349), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.RunningPos = Vector(-4.737, 0.469, 0.995)
SWEP.RunningAng = Vector(-33.348, 0, -62.18)