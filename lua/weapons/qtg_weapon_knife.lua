DEFINE_BASECLASS('qtg_weapon_melee_base')

SWEP.PrintName			= 'Knife'
SWEP.Slot		        = 0
SWEP.SlotPos			= 0
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_knife_t.mdl'
SWEP.WorldModel 		= 'models/weapons/w_knife_t.mdl'
SWEP.HoldType			= 'knife'
SWEP.UseHands           = true

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true			
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'j'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'j'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Damage			= 35
SWEP.Primary.Automatic		= true
SWEP.Primary.Delay			= 0.5
SWEP.Primary.AminMiss		= ACT_VM_MISSCENTER
SWEP.Primary.AminHit		= ACT_VM_PRIMARYATTACK

SWEP.Secondary.CanUse		= true
SWEP.Secondary.Damage		= 65
SWEP.Secondary.BackDamage	= 150
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Delay		= 0.8
SWEP.Secondary.AminMiss		= ACT_VM_MISSCENTER
SWEP.Secondary.AminHit		= ACT_VM_SECONDARYATTACK