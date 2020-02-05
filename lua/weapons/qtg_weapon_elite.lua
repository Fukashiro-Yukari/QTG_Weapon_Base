DEFINE_BASECLASS('qtg_weapon_akimbo_base')

SWEP.PrintName			= 'Dual Elites'
SWEP.Slot		        = 1
SWEP.SlotPos			= 4
SWEP.DrawAmmo			= true
SWEP.BounceWeaponIcon	= true
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_pist_elite.mdl'
SWEP.WorldModel			= 'models/weapons/w_pist_elite.mdl'
SWEP.ReloadSound		= ''
SWEP.HoldType			= 'duel'
SWEP.UseHands           = true
SWEP.ViewModelFOV 		= 54

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true			
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 's'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 's'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Anim2          = ACT_VM_SECONDARYATTACK
SWEP.Primary.Sound			= 'Weapon_Elite.Single'
SWEP.Primary.Damage			= {10,20}
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= false
SWEP.Primary.NumShots		= 1
SWEP.Primary.Recoil			= 0.8
SWEP.Primary.Cone			= 0.02
SWEP.Primary.Spread         = 0.4
SWEP.Primary.SpreadMax      = 0.6
SWEP.Primary.Delay			= 0.12
SWEP.Primary.Ammo			= 'pistol'

SWEP.InspectionPos = Vector(0, 0, -5.935)
SWEP.InspectionAng = Vector(25.539, 0, 0)

SWEP.RunningPos = Vector(0, -4.114, -12.775)
SWEP.RunningAng = Vector(44.896, 0, 0)

SWEP.VFireEffects           = 'CS_MuzzleFlash_X'