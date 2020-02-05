DEFINE_BASECLASS('qtg_weapon_base')

SWEP.PrintName			= 'AK47'
SWEP.Slot		        = 2
SWEP.SlotPos			= 4
SWEP.DrawAmmo			= true
SWEP.BounceWeaponIcon	= true
SWEP.DrawCrosshair		= true
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_rif_ak47.mdl'
SWEP.WorldModel			= 'models/weapons/w_rif_ak47.mdl'
SWEP.ReloadSound		= ''
SWEP.HoldType			= 'ar2'
SWEP.UseHands           = true
SWEP.ViewModelFOV 		= 54

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'b'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'b'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Sound			= 'Weapon_AK47.Single'
SWEP.Primary.Damage			= 45
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.NumShots		= 1
SWEP.Primary.Recoil			= 1
SWEP.Primary.Cone			= 0.022
SWEP.Primary.Spread         = 0.5
SWEP.Primary.SpreadMax      = 2
SWEP.Primary.Delay			= 0.1
SWEP.Primary.Ammo			= 'AR2'

SWEP.Secondary.CanUse		= false

SWEP.IronSightsPos          = Vector(-6.575, 0, 2.017)
SWEP.IronSightsAng          = Vector(2.546, 0.041, 0.202)

SWEP.RunningPos             = Vector(9.654, 0, 0)
SWEP.RunningAng             = Vector(-25.355, 37.542, -30.233)

SWEP.NPCRestTimesMax		= 0.01
SWEP.NPCRestTimesMin		= 0.01

SWEP.VFireEffects           = 'CS_MuzzleFlash_X'

SWEP.LuaAnimAtt             = true
SWEP.LuaAnimAttShells       = 'RifleShellEject'