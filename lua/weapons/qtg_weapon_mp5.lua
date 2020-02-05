DEFINE_BASECLASS('qtg_weapon_base')

SWEP.PrintName			= 'MP5'
SWEP.Slot		        = 2
SWEP.SlotPos			= 4
SWEP.DrawAmmo			= true
SWEP.BounceWeaponIcon	= true
SWEP.DrawCrosshair		= true
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_smg_mp5.mdl'
SWEP.WorldModel			= 'models/weapons/w_smg_mp5.mdl'
SWEP.ReloadSound		= ''
SWEP.HoldType			= 'smg'
SWEP.UseHands           = true
SWEP.ViewModelFOV 		= 54

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'x'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'x'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Sound			= 'Weapon_MP5Navy.Single'
SWEP.Primary.Damage			= {25,30}
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.NumShots		= 1
SWEP.Primary.Recoil			= 0.5
SWEP.Primary.Cone			= 0.025
SWEP.Primary.Spread         = 0.6
SWEP.Primary.SpreadMax      = 0.9
SWEP.Primary.Delay			= 0.08
SWEP.Primary.Ammo			= 'smg1'

SWEP.Secondary.CanUse		= false

SWEP.IronSightsPos          = Vector(-5.341, 0, 1.917)
SWEP.IronSightsAng          = Vector(1.144, 0, 0)

SWEP.RunningPos             = Vector(9.668, 0, 0)
SWEP.RunningAng             = Vector(-27.625, 37.542, -30.233)

SWEP.NPCRestTimesMax		= 0.01
SWEP.NPCRestTimesMin		= 0.01

SWEP.FireModeRoundBurst		= true
SWEP.FireModeRoundBurstNum	= 3

SWEP.VFireEffects           = 'CS_MuzzleFlash_X'

SWEP.LuaAnimAtt             = true