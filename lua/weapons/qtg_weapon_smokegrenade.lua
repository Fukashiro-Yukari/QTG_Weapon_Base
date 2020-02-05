DEFINE_BASECLASS('qtg_weapon_grenade_base')

SWEP.PrintName 				= 'Smoke Grenade'

SWEP.Slot 					= 4
SWEP.SlotPos 				= 0

SWEP.Spawnable 				= true
SWEP.Category 				= 'Neptune QTG SWEPs'

SWEP.ViewModel 				= 'models/weapons/cstrike/c_eq_smokegrenade.mdl'
SWEP.WorldModel 			= 'models/weapons/w_eq_smokegrenade.mdl'
SWEP.ViewModelFOV 			= 54
SWEP.UseHands 				= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'Q'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'Q'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Anim           = ACT_VM_PULLPIN
SWEP.Primary.EntAmmo		= 'qtg_ent_smokegrenade'

SWEP.Secondary.Anim         = ACT_VM_PULLPIN
SWEP.Secondary.ThrowAnim    = ACT_VM_THROW
SWEP.Secondary.EntAmmo		= SWEP.Primary.EntAmmo

SWEP.ThrowDelay             = 0.2

SWEP.PLYWeaponsOnly			= true