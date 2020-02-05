DEFINE_BASECLASS('qtg_weapon_base')

SWEP.PrintName			= 'M249'
SWEP.Slot		        = 2
SWEP.SlotPos			= 4
SWEP.DrawAmmo			= true
SWEP.BounceWeaponIcon	= true
SWEP.DrawCrosshair		= true
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_mach_m249para.mdl'
SWEP.WorldModel			= 'models/weapons/w_mach_m249para.mdl'
SWEP.ReloadSound		= ''
SWEP.HoldType			= 'ar2'
SWEP.UseHands           = true
SWEP.ViewModelFOV 		= 54

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true			
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'z'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'z'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Sound			= 'Weapon_M249.Single'
SWEP.Primary.Damage			= 35
SWEP.Primary.DamageType		= bit.bor(DMG_AIRBOAT,DMG_BLAST)
SWEP.Primary.ClipSize		= 100
SWEP.Primary.DefaultClip	= 100
SWEP.Primary.Automatic		= true
SWEP.Primary.NumShots		= 1
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Cone			= 0.02
SWEP.Primary.Spread         = 0.5
SWEP.Primary.SpreadMax      = 1
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= 'smg1'

SWEP.Secondary.CanUse		= false

SWEP.IronSightsPos 			= Vector(-5.943,-5.623,2.417)
SWEP.IronSightsAng 			= Vector(0,0,0)

SWEP.RunningPos 			= Vector(5.353, -5.499, -9.24)
SWEP.RunningAng 			= Vector(-3.576, 45.151, -29.507)

SWEP.NPCRestTimesMax		= 0.01
SWEP.NPCRestTimesMin		= 0.01

SWEP.VFireEffects           = 'CS_MuzzleFlash_X'

SWEP.LuaAnimAtt             = true