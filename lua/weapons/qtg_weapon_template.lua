DEFINE_BASECLASS('qtg_weapon_base')

SWEP.HoldType 						= 'pistol' -- Weapon holdtype
SWEP.WeaponType						= '' -- Weapon type (show in c menu, if not filled, it is the default type)
SWEP.PrintName						= 'Scripted Weapon' -- Weapon name
SWEP.Author							= '' -- You name (or my name)
SWEP.Contact						= '' -- Contact
SWEP.Purpose						= '' -- Purpose
SWEP.Instructions					= '' -- Fill in your personality introduction

SWEP.ViewModelFOV					= 54
SWEP.ViewModelFlip					= false
SWEP.ViewModel						= 'models/weapons/v_pistol.mdl' -- Weapon view model
SWEP.ViewModelTxd					= {} -- Custom weapon view sub material
SWEP.WorldModel						= 'models/weapons/w_357.mdl' -- Weapon world model
SWEP.WorldModelTxd					= {} -- Custom weapon world sub material

SWEP.Slot					        = 0 -- slot
SWEP.SlotPos				        = 10 -- slot pos
SWEP.DrawCrosshair			        = true -- 

SWEP.Spawnable						= false
SWEP.AdminOnly						= false

SWEP.CanIdle						= true -- Allow weapons to idle
SWEP.CanRun							= true -- Allow weapons running

SWEP.ReloadAnim						= ACT_VM_RELOAD -- Weapon reload anim
SWEP.ReloadAnimEmpty				= ACT_VM_RELOAD_EMPTY -- Weapon reload anim too, but weapon is empty
SWEP.ReloadSilencerAnim				= ACT_VM_RELOAD_SILENCED -- Weapon reload anim too, but weapon has a silencer
SWEP.ReloadSound					= 'Weapon_Pistol.Reload' -- Weapon reload sound
SWEP.ReloadCustomTime				= 2 -- Weapon custom reload time, if weapon allows custom reloading anim
SWEP.ReloadViewBob					= true -- Allow weapon reload angle swing
SWEP.ReloadViewBobAng				= -90 -- Weapon reload angle
-- SWEP.ReloadPos                      = Vector(0,0,0) -- Weapon custom reload vector, if input representative allows custom reloading
-- SWEP.ReloadAng                      = Vector(0,0,0) -- Weapon custom reload angle, if input representative allows custom reloading

SWEP.DeployAnim						= ACT_VM_DRAW -- Weapon deploy anim
SWEP.DeploySilencerAnim				= ACT_VM_DRAW_SILENCED -- Weapon deploy anim too, but weapon has a silencer
SWEP.DeployEmptyAnim				= ACT_VM_DRAW_EMPTY -- Weapon deploy anim too, but weapon is empty
SWEP.DeploySound					= '' -- Weapon deploy sound
SWEP.DeployCustom					= false -- Allow custom weapon deploy anim
SWEP.DeployCustomTime				= 1 -- Custom weapon deploy anim time
SWEP.DeployViewBob					= true -- Allow weapon deploy angle swing
SWEP.DeployViewBobAng				= -90 -- Weapon deploy angle

SWEP.CanHolster						= true -- Allow weapon holster anim
SWEP.HolsterAnim					= ACT_VM_HOLSTER -- weapon holster anim
SWEP.HolsterSound					= '' -- weapon holster sound
SWEP.HolsterCustom					= false -- Allow weapon custom holster anim

SWEP.CanPush					    = false -- Allow the use of weapons to propel the entity
SWEP.PushAnim					    = 'melee' -- 
SWEP.PushSwingSound				    = ''
SWEP.PushHitWorldSound			    = ''
SWEP.PushHitInfectedSound		    = ''
SWEP.PushHitDistance			    = 75
SWEP.PushHitDamageType			    = bit.bor(DMG_CLUB,DMG_SLASH)

SWEP.EmptySound						= 'Weapon_Pistol.Empty'
SWEP.EmptyAnim						= ACT_VM_PRIMARYATTACK_EMPTY

SWEP.IdleAnim						= ACT_VM_IDLE
SWEP.IdleSilencerAnim				= ACT_VM_IDLE_SILENCED
SWEP.IdleEmptyAnim					= ACT_VM_IDLE_EMPTY

SWEP.IsPump							= false
SWEP.PumpDelay						= 0.5
SWEP.PumpSound						= 'Weapon_Shotgun.Special1'
SWEP.PumpAnim						= ACT_SHOTGUN_PUMP

SWEP.Shotgun						= false
SWEP.ShotgunReload					= true
SWEP.ShotgunStartReloadTime			= 0.5
SWEP.ShotgunReloadTime				= 0.5
SWEP.ShotgunEndReloadSound			= ''

SWEP.Akimbo							= false

SWEP.Penetration					= true
SWEP.Ricochet						= true
SWEP.FireUnderWater					= false

SWEP.Primary.Sound					= 'Weapon_AR2.Single'
SWEP.Primary.SilencerSound			= 'Weapon_USP.SilencedShot'
SWEP.Primary.Anim					= ACT_VM_PRIMARYATTACK
SWEP.Primary.AnimSilenced			= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Primary.Anim2					= ACT_VM_PRIMARYATTACK
SWEP.Primary.AnimSilenced2			= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Primary.Damage					= 150
SWEP.Primary.DamageType				= DMG_BULLET
SWEP.Primary.NumShots				= 1
SWEP.Primary.Recoil					= 1
SWEP.Primary.Cone					= 0.01
SWEP.Primary.Spread					= 0.3
SWEP.Primary.SpreadMax				= 0.5
SWEP.Primary.Delay					= 1
SWEP.Primary.DelayFireTime			= 0
SWEP.Primary.DelayFireAnim			= ''
SWEP.Primary.DelayFireCancelAnim	= ''
SWEP.Primary.DelayFireSound			= ''
SWEP.Primary.DelayFireView			= Angle()
SWEP.Primary.DelayFireHold			= false
SWEP.Primary.NoAmmo					= false
SWEP.Primary.ClipSize				= 8
SWEP.Primary.DefaultClip			= 0
SWEP.Primary.Tracer					= 1
SWEP.Primary.TracerName				= ''
SWEP.Primary.Force					= 1
SWEP.Primary.Automatic				= true
SWEP.Primary.Ammo					= 'Pistol'
SWEP.Primary.EntAmmo				= ''
SWEP.Primary.EntAmmoCanUndo			= false
SWEP.Primary.EntAmmoSetting			= function(self,e) end
SWEP.Primary.TakeAmmo				= 1
SWEP.Primary.CanUse					= true
SWEP.Primary.UseEntBullet			= false
SWEP.Primary.EntBulletSpeed			= 1e4
SWEP.Primary.NotDoing				= false
SWEP.Primary.AttackCallback			= function(self,a,t,d) end
SWEP.Primary.NoCone					= false

SWEP.Secondary.Sound				= 'Weapon_Shotgun.Single'
SWEP.Secondary.SilencerSound		= 'Weapon_USP.SilencedShot'
SWEP.Secondary.Anim					= ACT_VM_SECONDARYATTACK
SWEP.Secondary.AnimSilenced			= ACT_VM_SECONDARYATTACK_SILENCED
SWEP.Secondary.Anim2				= ACT_VM_SECONDARYATTACK
SWEP.Secondary.AnimSilenced2		= ACT_VM_SECONDARYATTACK_SILENCED
SWEP.Secondary.Damage				= 150
SWEP.Secondary.DamageType			= DMG_BULLET
SWEP.Secondary.NumShots				= 1
SWEP.Secondary.Recoil				= 10
SWEP.Secondary.Cone					= 0.2
SWEP.Secondary.Spread				= 0.5
SWEP.Secondary.SpreadMax			= 1
SWEP.Secondary.Delay				= 1
SWEP.Secondary.DelayFireTime		= 0
SWEP.Secondary.DelayFireAnim		= ''
SWEP.Secondary.DelayFireCancelAnim	= ''
SWEP.Secondary.DelayFireSound		= ''
SWEP.Secondary.DelayFireView		= Angle()
SWEP.Secondary.DelayFireHold		= false
SWEP.Secondary.NoAmmo				= false
SWEP.Secondary.ClipSize				= -1
SWEP.Secondary.DefaultClip			= 0
SWEP.Secondary.Tracer				= 1
SWEP.Secondary.TracerName			= ''
SWEP.Secondary.Force				= 1
SWEP.Secondary.Automatic			= true
SWEP.Secondary.Ammo					= 'Pistol'
SWEP.Secondary.EntAmmo				= ''
SWEP.Secondary.EntAmmoCanUndo 		= false
SWEP.Secondary.EntAmmoSetting		= function(self,e) end
SWEP.Secondary.TakeAmmo				= 1
SWEP.Secondary.CanUse				= false
SWEP.Secondary.UseEntBullet			= false
SWEP.Secondary.EntBulletSpeed		= 1e4
SWEP.Secondary.NotDoing				= false
SWEP.Secondary.AttackCallback		= function(self,a,t,d) end
SWEP.Secondary.UsePrimary			= false
SWEP.Secondary.NoCone				= false

SWEP.SpreadRecovery					= 0.002
SWEP.SpreadRecoveryTime				= 0.01
SWEP.SpreadinAir					= true

SWEP.SprintAnimation				= {
	['Start'] = {
		ACT_VM_IDLE,
		ACT_VM_IDLE_TO_LOWERED
	},
	['End'] = {
		ACT_VM_IDLE_LOWERED,
		ACT_VM_LOWERED_TO_IDLE
	}
}
SWEP.IronAnimation 					= {}
SWEP.ZoomFov						= 15
SWEP.Chambering						= true
SWEP.NPCWeaponsOnly					= false
SWEP.PLYWeaponsOnly					= false

SWEP.Silencer						= false -- allows toggle silencer
SWEP.SilencerDef					= false -- Silent mode by default
SWEP.SilencerDetachAnim				= ACT_VM_DETACH_SILENCER
SWEP.SilencerAttachAnim				= ACT_VM_ATTACH_SILENCER
SWEP.SilencerToggle					= true

SWEP.FireMode						= {}
SWEP.FireModeShow					= true
SWEP.FireModeStart					= 1
SWEP.FireModeSemiAuto				= true
SWEP.FireModeFullAuto				= true
SWEP.FireModeRoundBurst				= false
SWEP.FireModeRoundBurstNum			= 3
SWEP.FireModeSafety					= true
SWEP.FireModeToggleSound			= 'Weapon_Alyx_Gun.Special2'

SWEP.LuaAnimAtt						= false
SWEP.LuaAnimAttZooming				= true
SWEP.LuaAnimAttTime					= 0.05
SWEP.LuaAnimAttShells				= ''
SWEP.LuaAnimAttShellsAttachment		= 2

SWEP.VFireEffects					= 'CS_MuzzleFlash'
SWEP.VFireEffectsAtt				= 1
SWEP.VFireEffectsAtt2           	= 2
SWEP.WFireEffects					= ''
SWEP.WFireEffectsAtt				= 1

SWEP.NPCCanPicked				    = true

SWEP.NPCRestTimesMax			    = 0.6
SWEP.NPCRestTimesMin			    = 0.3

SWEP.NPCBulletSpreadPoor		    = 30
SWEP.NPCBulletSpreadAverage		    = 25
SWEP.NPCBulletSpreadGood		    = 20
SWEP.NPCBulletSpreadVeryGood	    = 15
SWEP.NPCBulletSpreadPerect		    = 10

if CLIENT then
	SWEP.WepSelectIcon			    = surface.GetTextureID('weapons/swep')
	SWEP.SpeechBubbleLid		    = surface.GetTextureID('gui/speech_lid')
end
        
SWEP.DrawWeaponInfoBox		        = false
SWEP.BounceWeaponIcon		        = true
SWEP.OldBounceWeaponIcon	        = false
        
SWEP.WeaponInfoDisplayAmmo	        = true
SWEP.WeaponInfoType			        = QSWEP.ENUM.WEPINFO.DEF
SWEP.WeaponInfoModelCustom	        = ''
SWEP.WeaponInfoModelSize	        = 45
SWEP.WeaponInfoFontCustom	        = 'QTG_HL2SelectIcons'
SWEP.WeaponInfoFontIcon		        = 'd'
SWEP.WeaponInfoFontColor	        = Color(255,210,0)
SWEP.WeaponInfoPNGCustom	        = ''
SWEP.WeaponInfoColor		        = Color(100,100,100)
SWEP.WeaponInfoTitleColor	        = Color(0,0,255)
SWEP.WeaponInfoTextColor	        = Color(0,0,0)

SWEP.ViewModelBoneMods 			    = {}
SWEP.VElements 					    = {}
SWEP.WElements 					    = {}

SWEP.ShowViewModel 				    = true
SWEP.ShowWorldModel 			    = true

SWEP.KillIconType			        = QSWEP.ENUM.KILLICON.DEF
SWEP.KillIconFont			        = 'HL2MPTypeDeath'
SWEP.KillIconAdd			        = ''
SWEP.KillIconColor			        = Color(255,80,0)
SWEP.KillIconExtraAdd		        = {}
SWEP.KillIconExtraAddAlias	        = {}
SWEP.KillIconExtraAddFont	        = {}
SWEP.KillIconEntShowWepIcon         = false

SWEP.InspectionPos 			        = Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 			        = Vector(35.715,43.609,35.206)

SWEP.LuaAnimAttPos			        = Vector(0,-2,0)
SWEP.LuaAnimAttAng                  = Vector(0,0,0)

SWEP.IronSightsPos 			        = Vector(13.748,-12.551,0.303)
SWEP.IronSightsAng 			        = Vector(35.715,43.609,35.206)
SWEP.IronSightsCrosshair	        = false

SWEP.RunningPos 			        = Vector(13.748,-12.551,0.303)
SWEP.RunningAng 			        = Vector(35.715,43.609,35.206)

SWEP.CrouchingChangeAng		        = true