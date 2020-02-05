DEFINE_BASECLASS('qtg_weapon_grenade_base')

SWEP.PrintName 				= 'FlashBang'

SWEP.Slot 					= 4
SWEP.SlotPos 				= 0

SWEP.Spawnable 				= true
SWEP.Category 				= 'Neptune QTG SWEPs'

SWEP.ViewModel 				= 'models/weapons/cstrike/c_eq_flashbang.mdl'
SWEP.WorldModel 			= 'models/weapons/w_eq_flashbang.mdl'
SWEP.ViewModelFOV 			= 54
SWEP.UseHands 				= true

SWEP.WeaponInfoType			= 2
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'P'

SWEP.KillIconType			= 2
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'P'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Anim           = ACT_VM_PULLPIN
SWEP.Primary.EntAmmo		= 'qtg_ent_flashbang'

SWEP.Secondary.Anim         = ACT_VM_PULLPIN
SWEP.Secondary.ThrowAnim    = ACT_VM_THROW
SWEP.Secondary.EntAmmo		= SWEP.Primary.EntAmmo

SWEP.ThrowDelay             = 0.2

SWEP.PLYWeaponsOnly			= true