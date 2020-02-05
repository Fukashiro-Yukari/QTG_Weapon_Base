DEFINE_BASECLASS('qtg_weapon_melee_base')

SWEP.PrintName			= 'Shovel'
SWEP.Slot		        = 0
SWEP.SlotPos			= 0
SWEP.DrawAmmo			= true
SWEP.BounceWeaponIcon	= true
SWEP.Category 			= 'Neptune QTG SWEPs'
SWEP.ViewModel			= 'models/weapons/cstrike/c_knife_t.mdl'
SWEP.WorldModel 		= 'models/weapons/w_knife_t.mdl'
SWEP.ShowWorldModel 	= false
SWEP.ReloadSound		= ''
SWEP.HoldType			= 'melee2'
SWEP.UseHands           = true
SWEP.ViewModelFOV 		= 70

SWEP.Weight				= 2
SWEP.AutoSwitchTo		= true			
SWEP.Spawnable			= true

SWEP.WeaponInfoType			= QSWEP.ENUM.WEPINFO.FONT
SWEP.WeaponInfoFontCustom	= 'QTG_SelectIcons'
SWEP.WeaponInfoFontIcon		= 'b'

SWEP.KillIconType			= QSWEP.ENUM.KILLICON.FONT
SWEP.KillIconFont			= 'QTG_KillIcons'
SWEP.KillIconAdd			= 'b'
SWEP.KillIconColor			= Color(255,80,0)

SWEP.DeployCustom			= true
SWEP.DeployCustomTime		= 1

SWEP.Primary.SlashSound		= 'Weapon_Crowbar.Melee_Hit'
SWEP.Primary.MissSound		= 'Weapon_Knife.Slash'
SWEP.Primary.HitWallSound	= 'Canister.ImpactHard'
SWEP.Primary.HitWallType	= QSWEP.ENUM.MELEEHIT.BULLET
SWEP.Primary.Damage			= 50
SWEP.Primary.MaxDistance	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.NumShots		= 2
SWEP.Primary.Recoil			= 1
SWEP.Primary.Delay			= 1.5
SWEP.Primary.Ammo			= 'smg1'
SWEP.Primary.AminMiss		= ACT_VM_MISSCENTER
SWEP.Primary.AminHit		= ACT_VM_MISSCENTER
SWEP.Primary.DamageType		= bit.bor(DMG_CRUSH,DMG_CLUB)
SWEP.Primary.Force			= 10000

SWEP.Secondary.CanUse		= false

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -22.375, 0) },
	["ValveBiped.Bip01_L_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -37.44, 0) },
	["ValveBiped.Bip01_L_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0.616, 13.22, 0) },
	["ValveBiped.Bip01_L_Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 2.93, 0) },
	["ValveBiped.Bip01_L_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -10.945, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.3, 5.622, -28.289) },
	["ValveBiped.Bip01_L_Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -2.241, 0) },
	["ValveBiped.Bip01_L_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -37.348, 0) },
	["v_weapon.Knife_Handle"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(3.467, 5.083, -12.447), angle = Angle(-1.658, -76.821, -36.627) },
	["ValveBiped.Bip01_L_Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -36.077, 0) },
	["ValveBiped.Bip01_L_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.625, 0) },
	["ValveBiped.Bip01_L_Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -28.264, 0) },
	["ValveBiped.Bip01_L_Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -37.737, 0) },
	["ValveBiped.Bip01_L_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -5.94, 0) },
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(4.283, 11.034, -0.334), angle = Angle(20.083, -19.753, 34.792) },
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(14.953, 13.873, 12.368) }
}
SWEP.VElements = {
	["melee"] = { type = "Model", model = "models/props_junk/Shovel01a.mdl", bone = "v_weapon.Knife_Handle", rel = "", pos = Vector(0.317, 0.795, 9.204), angle = Angle(0, 92.692, 180), size = Vector(0.596, 0.596, 0.596), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["melee"] = { type = "Model", model = "models/props_junk/Shovel01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.744, 1.75, -14.169), angle = Angle(-6.653, -180, 4.344), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.RunningPos 			= Vector(-14.108, -0.213, 0.785)
SWEP.RunningAng 			= Vector(-15.985, -1.739, -90)