DEFINE_BASECLASS('qtg_weapon_base')

SWEP.WeaponType				= 'Shotgun'
SWEP.PrintName				= 'Heavy Automatic Shotgun'
SWEP.Slot		        	= 3
SWEP.SlotPos				= 4
SWEP.DrawAmmo				= true
SWEP.BounceWeaponIcon		= true
SWEP.DrawCrosshair			= true
SWEP.Category 				= 'Neptune QTG SWEPs'
SWEP.ViewModel				= 'models/weapons/cstrike/c_mach_m249para.mdl'
SWEP.WorldModel				= 'models/weapons/w_mach_m249para.mdl'
SWEP.ReloadSound			= ''
SWEP.HoldType				= 'ar2'
SWEP.UseHands           	= true
SWEP.ViewModelFOV 			= 54

SWEP.Weight					= 2
SWEP.AutoSwitchTo			= true			
SWEP.Spawnable				= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_SelectIcons'
SWEP.WeaponInfoFontIcon		= 'c'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_KillIcons'
SWEP.KillIconAdd			= 'c'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.Shotgun				= true
SWEP.ShotgunReload			= false

SWEP.Primary.Sound			= 'Weapon_XM1014.Single'
SWEP.Primary.Damage			= 8
SWEP.Primary.ClipSize		= 30
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.NumShots		= 11
SWEP.Primary.Recoil			= 1.6
SWEP.Primary.Cone			= 0.04
SWEP.Primary.Spread         = 0.5
SWEP.Primary.SpreadMax      = 2.4
SWEP.Primary.Delay			= 0.16
SWEP.Primary.Ammo			= 'buckshot'

SWEP.IronSightsPos 			= Vector(-5.943,-5.623,2.417)
SWEP.IronSightsAng 			= Vector(0,0,0)

SWEP.RunningPos 			= Vector(5.353, -5.499, -9.24)
SWEP.RunningAng 			= Vector(-3.576, 45.151, -29.507)

SWEP.NPCRestTimesMax		= 0.01
SWEP.NPCRestTimesMin		= 0.01

SWEP.VFireEffects           = 'CS_MuzzleFlash_X'

SWEP.LuaAnimAtt             = true
SWEP.ShotgunChambering		= true

SWEP.FireModeRoundBurst		= true

SWEP.ViewModelBoneMods = {
	["v_weapon.bullet1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["4"] = { type = "Model", model = "models/weapons/Shotgun_shell.mdl", bone = "v_weapon.bullet8", rel = "", pos = Vector(-0.08, 0, -0.325), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["8"] = { type = "Model", model = "models/weapons/Shotgun_shell.mdl", bone = "v_weapon.bullet2", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["1"] = { type = "Model", model = "models/xqm/cylinderx1.mdl", bone = "v_weapon.m249", rel = "", pos = Vector(0.129, -1.517, 20.549), angle = Angle(90, 0, 0), size = Vector(1.6, 0.2, 0.2), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["5"] = { type = "Model", model = "models/weapons/Shotgun_shell.mdl", bone = "v_weapon.bullet7", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["2"] = { type = "Model", model = "models/weapons/Shotgun_shell.mdl", bone = "v_weapon.bullet10", rel = "", pos = Vector(0, 0, -0.412), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["6"] = { type = "Model", model = "models/weapons/Shotgun_shell.mdl", bone = "v_weapon.bullet6", rel = "", pos = Vector(0, 0, 0.239), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["7"] = { type = "Model", model = "models/weapons/Shotgun_shell.mdl", bone = "v_weapon.bullet4", rel = "", pos = Vector(0.319, 0, 0), angle = Angle(0, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["1"] = { type = "Model", model = "models/xqm/cylinderx1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(23.333, 1.001, -8.931), angle = Angle(-10.928, 0, 0), size = Vector(1.69, 0.25, 0.25), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} }
}