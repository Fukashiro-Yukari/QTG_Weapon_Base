DEFINE_BASECLASS('qtg_weapon_sniper_base')

SWEP.PrintName			= 'AWP'
SWEP.Slot		        = 3
SWEP.SlotPos			= 4
SWEP.DrawAmmo			= true
SWEP.BounceWeaponIcon	= true
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_snip_awp.mdl'
SWEP.WorldModel			= 'models/weapons/w_snip_awp.mdl'
SWEP.ReloadSound		= ''
SWEP.HoldType			= 'ar2'
SWEP.UseHands           = true
SWEP.ViewModelFOV 		= 54

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true			
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_CSSelectIcons'
SWEP.WeaponInfoFontIcon		= 'r'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_CSKillIcons'
SWEP.KillIconAdd			= 'r'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Primary.Sound			= 'Weapon_AWP.Single'
SWEP.Primary.Damage			= 150
SWEP.Primary.DamageType		= bit.bor(DMG_AIRBOAT,DMG_BLAST)
SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.NumShots		= 1
SWEP.Primary.Recoil			= 2.7
SWEP.Primary.CrosshairRecoil= 2
SWEP.Primary.Cone			= 0.06
SWEP.Primary.CrosshairCone	= 0.001
SWEP.Primary.Delay			= 1.5
SWEP.Primary.Ammo			= '357'
SWEP.Primary.MouseSensitivity		= {
	0.3,
	0.2
}

SWEP.ZoomLevels						= {
    40,
    60
}

SWEP.IronSightsPos          = Vector(-7.454, -1.747, 2.227)
SWEP.IronSightsAng          = Vector(0, 0, 0)

SWEP.RunningPos             = Vector(3.49, -2.579, -2.6)
SWEP.RunningAng             = Vector(-14.351, 34.903, -28.945)

SWEP.NPCRestTimesMax		= 1.5
SWEP.NPCRestTimesMin		= 1.2

SWEP.NPCBulletSpreadPoor		= 0
SWEP.NPCBulletSpreadAverage		= 0
SWEP.NPCBulletSpreadGood		= 0
SWEP.NPCBulletSpreadVeryGood	= 0
SWEP.NPCBulletSpreadPerect		= 0

SWEP.IsPump					= true
SWEP.PumpDelay				= 0.1
SWEP.PumpSound				= ''
SWEP.PumpAnim				= nil

SWEP.VFireEffects           = 'CS_MuzzleFlash_X'