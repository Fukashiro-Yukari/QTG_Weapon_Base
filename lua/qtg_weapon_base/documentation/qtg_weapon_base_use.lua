-- Use base

DEFINE_BASECLASS('qtg_weapon_base')                                 -- You need to fill in this code to use base
SWEP.Base                       = 'qtg_weapon_base'                 -- Just like the above function, you can only choose one (Recommend the first)

-- qtg_weapon_base Setting

SWEP.HoldType 					= 'pistol'                          -- Wep Hold Type
SWEP.WeaponType					= ''                                -- What type of wep is it?
SWEP.PrintName					= 'Scripted Weapon'                 -- Wep Name
SWEP.Author						= ''                                -- Wep Author, yes you name
SWEP.Contact					= ''                                -- Contact information
SWEP.Purpose					= ''                                -- Wep Purpose
SWEP.Instructions				= ''                                -- Wep Instructions

SWEP.ViewModelFOV				= 62                                -- Fov
SWEP.ViewModelFlip				= false                             -- Flip?
SWEP.ViewModel					= 'models/weapons/v_pistol.mdl'     -- You wep view model
SWEP.ViewModelTxd				= {}
SWEP.WorldModel					= 'models/weapons/w_357.mdl'        -- Wep world model
SWEP.WorldModelTxd				= {}
			
SWEP.Spawnable					= false
SWEP.AdminOnly					= false
SWEP.DrawCustomCrosshair		= true

SWEP.Weight						= 5
SWEP.AutoSwitchTo				= true
SWEP.AutoSwitchFrom				= true

SWEP.CanIdle					= true                              -- Is there an idle action?
SWEP.CanRun						= true                              -- Can run?

SWEP.WepSelectIcon				= surface.GetTextureID('weapons/swep')
SWEP.SpeechBubbleLid			= surface.GetTextureID('gui/speech_lid')

SWEP.DrawWeaponInfoBox			= true
SWEP.BounceWeaponIcon			= true
SWEP.OldBounceWeaponIcon		= false

SWEP.WeaponInfoDisplayAmmo		= true
SWEP.WeaponInfoType				= 0
SWEP.WeaponInfoModelCustom		= ''
SWEP.WeaponInfoModelSize		= 45
SWEP.WeaponInfoFontCustom		= 'QTG_HL2SelectIcons'
SWEP.WeaponInfoFontIcon			= 'd'
SWEP.WeaponInfoColor			= Color(100,100,100)
SWEP.WeaponInfoTitleColor		= Color(0,0,255)
SWEP.WeaponInfoTextColor		= Color(0,0,0)

SWEP.KillIconType				= 0
SWEP.KillIconFont				= 'HL2MPTypeDeath'
SWEP.KillIconAdd				= ''
SWEP.KillIconColor				= Color(255,80,0)
SWEP.KillIconExtraAdd			= {}
SWEP.KillIconExtraAddAlias		= {}
SWEP.KillIconExtraAddFont		= {}
	
SWEP.ReloadAnim					= ACT_VM_RELOAD
SWEP.ReloadAnimEmpty			= ACT_VM_RELOAD_EMPTY
SWEP.ReloadSilencerAnim			= ACT_VM_RELOAD_SILENCED
SWEP.ReloadSound				= 'Weapon_Pistol.Reload'
SWEP.ReloadCustomTime			= 2
SWEP.ReloadViewBob				= true
SWEP.ReloadViewBobAng			= Angle(0,0,-90)
SWEP.ReloadTime					= 2
SWEP.ReloadPos					= Vector(0,0,0)
SWEP.ReloadAng					= Vector(0,0,0)
	
SWEP.DeployAnim					= ACT_VM_DRAW
SWEP.DeploySilencerAnim			= ACT_VM_DRAW_SILENCED
SWEP.DeployEmptyAnim			= ACT_VM_DRAW_EMPTY
SWEP.DeploySound				= ''
SWEP.DeployCustom				= false
SWEP.DeployCustomTime			= 1
SWEP.DeployViewBob				= true
SWEP.DeployViewBobAng			= Angle(0,0,-90)

SWEP.CanHolster					= true
SWEP.HolsterAnim				= ACT_VM_HOLSTER
SWEP.HolsterSound				= ''
SWEP.HolsterCustom				= false

SWEP.CanPush					= false
SWEP.PushAnim					= 'melee'
SWEP.PushSwingSound				= ''
SWEP.PushHitWorldSound			= ''
SWEP.PushHitInfectedSound		= ''
SWEP.PushHitDistance			= 75

SWEP.EmptySound					= 'Weapon_Pistol.Empty'
SWEP.EmptyAnim					= ACT_VM_PRIMARYATTACK_EMPTY

SWEP.IdleAnim					= ACT_VM_IDLE
SWEP.IdleEmptyAnim				= ACT_VM_IDLE_EMPTY

SWEP.IsPump						= false
SWEP.PumpDelay					= 0.5
SWEP.PumpSound					= 'Weapon_Shotgun.Special1'
SWEP.PumpAnim					= ACT_SHOTGUN_PUMP

SWEP.Shotgun					= false
SWEP.ShotgunReload				= true
SWEP.ShotgunStartReloadTime		= 0.5
SWEP.ShotgunReloadTime			= 0.5
SWEP.ShotgunEndReloadSound		= ''

SWEP.Penetration				= true
SWEP.Ricochet					= true
SWEP.FireUnderWater				= false
	
SWEP.Primary.Sound				= 'Weapon_AR2.Single'
SWEP.Primary.SilencerSound		= 'Weapon_USP.SilencedShot'
SWEP.Primary.Anim				= ACT_VM_PRIMARYATTACK
SWEP.Primary.AnimSilenced		= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Primary.Damage				= 150
SWEP.Primary.DamageType			= DMG_BULLET
SWEP.Primary.NumShots			= 1
SWEP.Primary.Recoil				= 1
SWEP.Primary.Cone				= 0.01
SWEP.Primary.Spread				= 0.3
SWEP.Primary.SpreadMax			= 0.5
SWEP.Primary.Delay				= 1
SWEP.Primary.DelayFireTime		= 0
SWEP.Primary.DelayFireAnim		= ''
SWEP.Primary.DelayFireSound		= ''
SWEP.Primary.DelayFireView		= Angle()
SWEP.Primary.DelayFireHold		= false
SWEP.Primary.NoAmmo				= false
SWEP.Primary.ClipSize			= 8
SWEP.Primary.DefaultClip		= 0
SWEP.Primary.Tracer				= 1
SWEP.Primary.TracerName			= ''
SWEP.Primary.Force				= 1
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo				= 'Pistol'
SWEP.Primary.EntAmmo			= ''
SWEP.Primary.EntAmmoCanUndo		= false
SWEP.Primary.EntAmmoSetting		= function(self,e) end
SWEP.Primary.TakeAmmo			= 1
SWEP.Primary.CanUse				= true
SWEP.Primary.UseEntBullet		= false
SWEP.Primary.EntBulletSpeed		= 1e9
SWEP.Primary.NotDoing			= false
SWEP.Primary.AttackCallback		= function(self,a,t,d) end
SWEP.Primary.NoCone				= false
	
SWEP.Secondary.Sound			= 'Weapon_Shotgun.Single'
SWEP.Secondary.SilencerSound	= 'Weapon_USP.SilencedShot'
SWEP.Secondary.Anim				= ACT_VM_SECONDARYATTACK
SWEP.Secondary.AnimSilenced		= ACT_VM_SECONDARYATTACK_SILENCED
SWEP.Secondary.Damage			= 150
SWEP.Secondary.DamageType		= DMG_BULLET
SWEP.Secondary.NumShots			= 1
SWEP.Secondary.Recoil			= 10
SWEP.Secondary.Cone				= 0.2
SWEP.Secondary.Spread			= 0.5
SWEP.Secondary.SpreadMax		= 1
SWEP.Secondary.Delay			= 1
SWEP.Secondary.DelayFireTime	= 0
SWEP.Secondary.DelayFireAnim	= ''
SWEP.Secondary.DelayFireSound	= ''
SWEP.Secondary.DelayFireView	= Angle()
SWEP.Secondary.DelayFireHold	= false
SWEP.Secondary.NoAmmo			= false
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= 0
SWEP.Secondary.Tracer			= 1
SWEP.Secondary.TracerName		= ''
SWEP.Secondary.Force			= 1
SWEP.Secondary.Automatic		= true
SWEP.Secondary.Ammo				= 'Pistol'
SWEP.Secondary.EntAmmo			= ''
SWEP.Secondary.EntAmmoCanUndo 	= false
SWEP.Secondary.EntAmmoSetting	= function(self,e) end
SWEP.Secondary.TakeAmmo			= 1
SWEP.Secondary.CanUse			= false
SWEP.Secondary.UseEntBullet		= false
SWEP.Secondary.EntBulletSpeed	= 1e9
SWEP.Secondary.NotDoing			= false
SWEP.Secondary.AttackCallback	= function(self,a,t,d) end
SWEP.Secondary.UsePrimary		= false
SWEP.Secondary.NoCone			= false

SWEP.SpreadRecovery				= 0.002
SWEP.SpreadRecoveryTime			= 0.01
SWEP.SpreadinAir				= true

SWEP.SprintAnimation			= {
	['Start'] = {
		ACT_VM_IDLE,
		ACT_VM_IDLE_TO_LOWERED
	},
	['End'] = {
		ACT_VM_IDLE_LOWERED,
		ACT_VM_LOWERED_TO_IDLE
	}
}
SWEP.IronAnimation 				= {}
SWEP.ZoomFov					= 15
SWEP.Chambering					= true
SWEP.NPCWeaponsOnly				= false
SWEP.PLYWeaponsOnly				= false

SWEP.CSMuzzleFlashes			= false
SWEP.CSMuzzleX					= false

SWEP.ViewModelBoneMods 			= {}
SWEP.VElements 					= {}
SWEP.WElements 					= {}

SWEP.ShowViewModel 				= true
SWEP.ShowWorldModel 			= true

SWEP.IronSightsPos				= Vector(0,0,0)
SWEP.IronSightsAng				= Vector(0,0,0)
SWEP.IronSightsCrosshair		= false

SWEP.RunningPos					= Vector(0,0,0)
SWEP.RunningAng					= Vector(0,0,0)

SWEP.InspectionPos 				= Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 				= Vector(35.715,43.609,35.206)

SWEP.ReloadingPos				= Vector(0,0,0)
SWEP.ReloadingAng				= Vector(0,0,0)
SWEP.ReloadingTime				= 2

SWEP.NPCCanPicked				= true

SWEP.NPCRestTimesMax			= 0.6
SWEP.NPCRestTimesMin			= 0.3

SWEP.NPCBurstMax				= 6
SWEP.NPCBurstMin				= 1
SWEP.NPCBurstDelay				= 0.1

SWEP.NPCBulletSpreadPoor		= 1
SWEP.NPCBulletSpreadAverage		= 1
SWEP.NPCBulletSpreadGood		= 1
SWEP.NPCBulletSpreadVeryGood	= 1
SWEP.NPCBulletSpreadPerect		= 1

SWEP.FireMode					= {}
SWEP.FireModeShow				= true
SWEP.FireModeSemiAuto			= true
SWEP.FireModeFullAuto			= true
SWEP.FireModeRoundBurst			= false
SWEP.FireModeRoundBurstNum		= 3
SWEP.FireModeToggleSound		= 'Weapon_Alyx_Gun.Special2'

SWEP.LuaAnimAtt					= false
SWEP.LuaAnimAttZooming			= true
SWEP.LuaAnimAttTime				= 0.05
SWEP.LuaAnimAttShells			= ''
SWEP.LuaAnimAttShellsAttachment	= 2
SWEP.LuaAnimAttPos				= Vector(0,-2,0)

SWEP.VFireEffects				= 'CS_MuzzleFlash'
SWEP.WFireEffects				= ''
SWEP.FireEffectsAtt				= 1

-- qtg_weapon_melee_base Setting

SWEP.HoldType 					= 'pistol'                          -- Wep Hold Type
SWEP.WeaponType					= ''                                -- What type of wep is it?
SWEP.PrintName					= 'Scripted Weapon'                 -- Wep Name
SWEP.Author						= ''                                -- Wep Author, yes you name
SWEP.Contact					= ''                                -- Contact information
SWEP.Purpose					= ''                                -- Wep Purpose
SWEP.Instructions				= ''                                -- Wep Instructions

SWEP.ViewModelFOV				= 62                                -- Fov
SWEP.ViewModelFlip				= false                             -- Flip?
SWEP.ViewModel					= 'models/weapons/v_pistol.mdl'     -- You wep view model
SWEP.ViewModelTxd				= {}
SWEP.WorldModel					= 'models/weapons/w_357.mdl'        -- Wep world model
SWEP.WorldModelTxd				= {}
			
SWEP.Spawnable					= false
SWEP.AdminOnly					= false
SWEP.DrawCustomCrosshair		= false

SWEP.Weight						= 5
SWEP.AutoSwitchTo				= true
SWEP.AutoSwitchFrom				= true

SWEP.CanIdle					= true                              -- Is there an idle action?
SWEP.CanRun						= true                              -- Can run?

SWEP.WepSelectIcon				= surface.GetTextureID('weapons/swep')
SWEP.SpeechBubbleLid			= surface.GetTextureID('gui/speech_lid')

SWEP.DrawWeaponInfoBox			= true
SWEP.BounceWeaponIcon			= true
SWEP.OldBounceWeaponIcon		= false

SWEP.WeaponInfoDisplayAmmo		= true
SWEP.WeaponInfoType				= 0
SWEP.WeaponInfoModelCustom		= ''
SWEP.WeaponInfoModelSize		= 45
SWEP.WeaponInfoFontCustom		= 'QTG_HL2SelectIcons'
SWEP.WeaponInfoFontIcon			= 'd'
SWEP.WeaponInfoColor			= Color(100,100,100)
SWEP.WeaponInfoTitleColor		= Color(0,0,255)
SWEP.WeaponInfoTextColor		= Color(0,0,0)

SWEP.KillIconType				= 0
SWEP.KillIconFont				= 'HL2MPTypeDeath'
SWEP.KillIconAdd				= ''
SWEP.KillIconColor				= Color(255,80,0)
SWEP.KillIconExtraAdd			= {}
SWEP.KillIconExtraAddAlias		= {}
SWEP.KillIconExtraAddFont		= {}
	
SWEP.DeployAnim					= ACT_VM_DRAW
SWEP.DeploySilencerAnim			= ACT_VM_DRAW_SILENCED
SWEP.DeploySound				= ''
SWEP.DeployCustom				= false
SWEP.DeployCustomTime			= 1

SWEP.CanHolster					= true
SWEP.HolsterAnim				= ACT_VM_HOLSTER
SWEP.HolsterSound				= ''
SWEP.HolsterCustom				= false

SWEP.CanPush					= false
SWEP.PushAnim					= 'melee'
SWEP.PushSwingSound				= ''
SWEP.PushHitWorldSound			= ''
SWEP.PushHitInfectedSound		= ''
SWEP.PushHitDistance			= 75
	
SWEP.Primary.Damage				= 150
SWEP.Primary.DamageType			= DMG_SLASH
SWEP.Primary.DamageView			= Angle(0,0,0)
SWEP.Primary.Delay				= 1
SWEP.Primary.NoAmmo				= true
SWEP.Primary.MaxDistance		= 100
SWEP.Primary.AminMiss			= ACT_VM_MISSCENTER
SWEP.Primary.AminHit			= ACT_VM_PRIMARYATTACK
SWEP.Primary.SlashSound			= 'Weapon_Knife.Hit'
SWEP.Primary.MissSound			= 'Weapon_Knife.Slash'
SWEP.Primary.HitWallSound		= 'Weapon_Knife.HitWall'
SWEP.Primary.HitWallType		= 0
SWEP.Primary.Force				= 10000
SWEP.Primary.Automatic			= true
SWEP.Primary.CanUse				= true
SWEP.Primary.NotDoing			= false
	
SWEP.Secondary.Damage			= 150
SWEP.Secondary.DamageType		= DMG_SLASH
SWEP.Secondary.DamageView		= Angle(0,0,0)
SWEP.Secondary.Delay			= 1
SWEP.Secondary.NoAmmo			= true
SWEP.Secondary.MaxDistance		= 80
SWEP.Secondary.AminMiss			= ACT_VM_MISSCENTER
SWEP.Secondary.AminHit			= ACT_VM_SECONDARYATTACK
SWEP.Secondary.CanBack			= true
SWEP.Secondary.BackDamage		= 150
SWEP.Secondary.BackSound		= 'Weapon_Knife.Stab'
SWEP.Secondary.SlashSound		= 'Weapon_Knife.Hit'
SWEP.Secondary.MissSound		= 'Weapon_Knife.Slash'
SWEP.Secondary.HitWallSound		= 'Weapon_Knife.HitWall'
SWEP.Secondary.HitWallType		= 0
SWEP.Secondary.Force			= 10000
SWEP.Secondary.Automatic		= true
SWEP.Secondary.CanUse			= false
SWEP.Secondary.NotDoing			= false

SWEP.SprintAnimation			= {
	['Start'] = {
		ACT_VM_IDLE,
		ACT_VM_IDLE_TO_LOWERED
	},
	['End'] = {
		ACT_VM_IDLE_LOWERED,
		ACT_VM_LOWERED_TO_IDLE
	}
}
SWEP.NPCWeaponsOnly				= false
SWEP.PLYWeaponsOnly				= false

SWEP.ViewModelBoneMods 			= {}
SWEP.VElements 					= {}
SWEP.WElements 					= {}

SWEP.ShowViewModel 				= true
SWEP.ShowWorldModel 			= true

SWEP.RunningPos					= Vector(0,0,0)
SWEP.RunningAng					= Vector(0,0,0)

SWEP.InspectionPos 				= Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 				= Vector(35.715,43.609,35.206)

SWEP.NPCCanPicked				= true

SWEP.NPCRestTimesMax			= 0.6
SWEP.NPCRestTimesMin			= 0.3

SWEP.NPCBurstMax				= 6
SWEP.NPCBurstMin				= 1
SWEP.NPCBurstDelay				= 0.1

SWEP.NPCBulletSpreadPoor		= 1
SWEP.NPCBulletSpreadAverage		= 1
SWEP.NPCBulletSpreadGood		= 1
SWEP.NPCBulletSpreadVeryGood	= 1
SWEP.NPCBulletSpreadPerect		= 1

SWEP.FireMode					= {}
SWEP.FireModeShow				= false
SWEP.FireModeSemiAuto			= true
SWEP.FireModeFullAuto			= true
SWEP.FireModeRoundBurst			= false
SWEP.FireModeRoundBurstNum		= 3
SWEP.FireModeToggleSound		= 'Weapon_Alyx_Gun.Special2'

-- qtg_weapon_grenade_base Setting

SWEP.HoldReady		            = 'grenade'
SWEP.HoldType 					= 'pistol'                          -- Wep Hold Type
SWEP.WeaponType		            = 'Grenade'                         -- What type of wep is it?
SWEP.PrintName					= 'Scripted Weapon'                 -- Wep Name
SWEP.Author						= ''                                -- Wep Author, yes you name
SWEP.Contact					= ''                                -- Contact information
SWEP.Purpose					= ''                                -- Wep Purpose
SWEP.Instructions				= ''                                -- Wep Instructions

SWEP.ViewModelFOV				= 62                                -- Fov
SWEP.ViewModelFlip				= false                             -- Flip?
SWEP.ViewModel					= 'models/weapons/v_pistol.mdl'     -- You wep view model
SWEP.ViewModelTxd				= {}
SWEP.WorldModel					= 'models/weapons/w_357.mdl'        -- Wep world model
SWEP.WorldModelTxd				= {}
			
SWEP.Spawnable					= false
SWEP.AdminOnly					= false
SWEP.DrawCustomCrosshair		= false

SWEP.Weight						= 5
SWEP.AutoSwitchTo				= true
SWEP.AutoSwitchFrom				= true

SWEP.CanIdle					= true                              -- Is there an idle action?
SWEP.CanRun						= true                              -- Can run?

SWEP.WepSelectIcon				= surface.GetTextureID('weapons/swep')
SWEP.SpeechBubbleLid			= surface.GetTextureID('gui/speech_lid')

SWEP.DrawWeaponInfoBox			= true
SWEP.BounceWeaponIcon			= true
SWEP.OldBounceWeaponIcon		= false

SWEP.WeaponInfoDisplayAmmo		= true
SWEP.WeaponInfoType				= 0
SWEP.WeaponInfoModelCustom		= ''
SWEP.WeaponInfoModelSize		= 45
SWEP.WeaponInfoFontCustom		= 'QTG_HL2SelectIcons'
SWEP.WeaponInfoFontIcon			= 'd'
SWEP.WeaponInfoColor			= Color(100,100,100)
SWEP.WeaponInfoTitleColor		= Color(0,0,255)
SWEP.WeaponInfoTextColor		= Color(0,0,0)

SWEP.KillIconType				= 0
SWEP.KillIconFont				= 'HL2MPTypeDeath'
SWEP.KillIconAdd				= ''
SWEP.KillIconColor				= Color(255,80,0)
SWEP.KillIconExtraAdd			= {}
SWEP.KillIconExtraAddAlias		= {}
SWEP.KillIconExtraAddFont		= {}
	
SWEP.ReloadAnim					= ACT_VM_RELOAD                     -- Reload Anim
SWEP.ReloadAnimEmpty			= ACT_VM_RELOAD_EMPTY
SWEP.ReloadSilencerAnim			= ACT_VM_RELOAD_SILENCED
SWEP.ReloadSound				= 'Weapon_Pistol.Reload'
	
SWEP.DeployAnim					= ACT_VM_DRAW
SWEP.DeploySilencerAnim			= ACT_VM_DRAW_SILENCED
SWEP.DeploySound				= ''
SWEP.DeployCustom				= false
SWEP.DeployCustomTime			= 1

SWEP.CanHolster					= true
SWEP.HolsterAnim				= ACT_VM_HOLSTER
SWEP.HolsterSound				= ''
SWEP.HolsterCustom				= false

SWEP.CanPush					= false
SWEP.PushAnim					= 'melee'
SWEP.PushSwingSound				= ''
SWEP.PushHitWorldSound			= ''
SWEP.PushHitInfectedSound		= ''
SWEP.PushHitDistance			= 75

SWEP.EmptySound		            = ''

SWEP.FireUnderWater				= true

SWEP.Primary.ThrowAnim          = ACT_VM_THROW
SWEP.Primary.Sound				= ''
SWEP.Primary.NumShots			= 1
SWEP.Primary.Delay				= 1
SWEP.Primary.NoAmmo				= false
SWEP.Primary.ClipSize			= -1
SWEP.Primary.DefaultClip		= 0
SWEP.Primary.Force				= 1500
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo				= 'grenade'
SWEP.Primary.EntAmmo			= ''
SWEP.Primary.EntAmmoCanUndo		= false
SWEP.Primary.EntAmmoSetting		= function(self,e) end
SWEP.Primary.TakeAmmo			= 1
SWEP.Primary.CanUse				= true
SWEP.Primary.NotDoing			= false
	
SWEP.Secondary.Sound			= 'Weapon_Shotgun.Single'
SWEP.Secondary.NumShots			= 9
SWEP.Secondary.Delay			= 1
SWEP.Secondary.NoAmmo			= false
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= 0
SWEP.Secondary.Force			= 1
SWEP.Secondary.Automatic		= true
SWEP.Secondary.EntAmmo			= ''
SWEP.Secondary.EntAmmoCanUndo 	= false
SWEP.Secondary.EntAmmoSetting	= function(self,e) end
SWEP.Secondary.TakeAmmo			= 1
SWEP.Secondary.CanUse			= false
SWEP.Secondary.NotDoing			= false
SWEP.Secondary.UsePrimary		= true

SWEP.ThrowDelay					= 0
SWEP.ThrowTime                  = 0.4

SWEP.SprintAnimation			= {
	['Start'] = {
		ACT_VM_IDLE,
		ACT_VM_IDLE_TO_LOWERED
	},
	['End'] = {
		ACT_VM_IDLE_LOWERED,
		ACT_VM_LOWERED_TO_IDLE
	}
}
SWEP.NPCWeaponsOnly				= false
SWEP.PLYWeaponsOnly				= false

SWEP.ViewModelBoneMods 			= {}
SWEP.VElements 					= {}
SWEP.WElements 					= {}

SWEP.ShowViewModel 				= true
SWEP.ShowWorldModel 			= true

SWEP.RunningPos					= Vector(0,0,0)
SWEP.RunningAng					= Vector(0,0,0)

SWEP.InspectionPos 				= Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 				= Vector(35.715,43.609,35.206)

SWEP.NPCCanPicked				= true

SWEP.NPCRestTimesMax			= 0.6
SWEP.NPCRestTimesMin			= 0.3

SWEP.NPCBurstMax				= 6
SWEP.NPCBurstMin				= 1
SWEP.NPCBurstDelay				= 0.1

SWEP.NPCBulletSpreadPoor		= 1
SWEP.NPCBulletSpreadAverage		= 1
SWEP.NPCBulletSpreadGood		= 1
SWEP.NPCBulletSpreadVeryGood	= 1
SWEP.NPCBulletSpreadPerect		= 1

SWEP.FireMode					= {}
SWEP.FireModeShow				= false
SWEP.FireModeSemiAuto			= true
SWEP.FireModeFullAuto			= true
SWEP.FireModeRoundBurst			= false
SWEP.FireModeRoundBurstNum		= 3
SWEP.FireModeToggleSound		= 'Weapon_Alyx_Gun.Special2'

-- qtg_weapon_sniper_base Setting

SWEP.HoldType 					= 'pistol'                          -- Wep Hold Type
SWEP.WeaponType					= ''                                -- What type of wep is it?
SWEP.PrintName					= 'Scripted Weapon'                 -- Wep Name
SWEP.Author						= ''                                -- Wep Author, yes you name
SWEP.Contact					= ''                                -- Contact information
SWEP.Purpose					= ''                                -- Wep Purpose
SWEP.Instructions				= ''                                -- Wep Instructions

SWEP.ViewModelFOV				= 62                                -- Fov
SWEP.ViewModelFlip				= false                             -- Flip?
SWEP.ViewModel					= 'models/weapons/v_pistol.mdl'     -- You wep view model
SWEP.ViewModelTxd				= {}
SWEP.WorldModel					= 'models/weapons/w_357.mdl'        -- Wep world model
SWEP.WorldModelTxd				= {}
			
SWEP.Spawnable					= false
SWEP.AdminOnly					= false
SWEP.DrawCustomCrosshair		= false

SWEP.Weight						= 5
SWEP.AutoSwitchTo				= true
SWEP.AutoSwitchFrom				= true

SWEP.CanIdle					= true                              -- Is there an idle action?
SWEP.CanRun						= true                              -- Can run?

SWEP.WepSelectIcon				= surface.GetTextureID('weapons/swep')
SWEP.SpeechBubbleLid			= surface.GetTextureID('gui/speech_lid')

SWEP.DrawWeaponInfoBox			= true
SWEP.BounceWeaponIcon			= true
SWEP.OldBounceWeaponIcon		= false

SWEP.WeaponInfoDisplayAmmo		= true
SWEP.WeaponInfoType				= 0
SWEP.WeaponInfoModelCustom		= ''
SWEP.WeaponInfoModelSize		= 45
SWEP.WeaponInfoFontCustom		= 'QTG_HL2SelectIcons'
SWEP.WeaponInfoFontIcon			= 'd'
SWEP.WeaponInfoColor			= Color(100,100,100)
SWEP.WeaponInfoTitleColor		= Color(0,0,255)
SWEP.WeaponInfoTextColor		= Color(0,0,0)

SWEP.KillIconType				= 0
SWEP.KillIconFont				= 'HL2MPTypeDeath'
SWEP.KillIconAdd				= ''
SWEP.KillIconColor				= Color(255,80,0)
SWEP.KillIconExtraAdd			= {}
SWEP.KillIconExtraAddAlias		= {}
SWEP.KillIconExtraAddFont		= {}
	
SWEP.ReloadAnim					= ACT_VM_RELOAD                     -- Reload Anim
SWEP.ReloadAnimEmpty			= ACT_VM_RELOAD_EMPTY
SWEP.ReloadSilencerAnim			= ACT_VM_RELOAD_SILENCED
SWEP.ReloadSound				= 'Weapon_Pistol.Reload'
	
SWEP.DeployAnim					= ACT_VM_DRAW
SWEP.DeploySilencerAnim			= ACT_VM_DRAW_SILENCED
SWEP.DeploySound				= ''
SWEP.DeployCustom				= false
SWEP.DeployCustomTime			= 1

SWEP.CanHolster					= true
SWEP.HolsterAnim				= ACT_VM_HOLSTER
SWEP.HolsterSound				= ''
SWEP.HolsterCustom				= false

SWEP.CanPush					= false
SWEP.PushAnim					= 'melee'
SWEP.PushSwingSound				= ''
SWEP.PushHitWorldSound			= ''
SWEP.PushHitInfectedSound		= ''
SWEP.PushHitDistance			= 75

SWEP.EmptySound					= 'Weapon_Pistol.Empty'

SWEP.IsPump						= false
SWEP.PumpDelay					= 0.5
SWEP.PumpSound					= 'Weapon_Shotgun.Special1'

SWEP.Shotgun					= false
SWEP.ShotgunReloadTime			= 0.5

SWEP.Penetration				= true
SWEP.Ricochet					= true
SWEP.FireUnderWater				= false
	
SWEP.Primary.Sound				= 'Weapon_AR2.Single'
SWEP.Primary.SilencerSound		= 'Weapon_USP.SilencedShot'
SWEP.Primary.Anim				= ACT_VM_PRIMARYATTACK
SWEP.Primary.AnimSilenced		= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Primary.Damage				= 150
SWEP.Primary.DamageType			= DMG_BULLET
SWEP.Primary.NumShots			= 1
SWEP.Primary.Recoil				= 1
SWEP.Primary.CrosshairRecoil	= 1
SWEP.Primary.Cone				= 0.01
SWEP.Primary.CrosshairCone		= 1
SWEP.Primary.Delay				= 1
SWEP.Primary.NoAmmo				= false
SWEP.Primary.ClipSize			= 8
SWEP.Primary.DefaultClip		= 0
SWEP.Primary.Tracer				= 1
SWEP.Primary.TracerName			= nil
SWEP.Primary.Force				= 1
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo				= 'Pistol'
SWEP.Primary.EntAmmo			= ''
SWEP.Primary.EntAmmoCanUndo		= false
SWEP.Primary.EntAmmoSetting		= function(self,e) end
SWEP.Primary.TakeAmmo			= 1
SWEP.Primary.CanUse				= true
SWEP.Primary.UseEntBullet		= false
SWEP.Primary.EntBulletSpeed		= 1e9
SWEP.Primary.NotDoing			= false
SWEP.Primary.AttackCallback		= function(self,a,t,d) end
SWEP.Primary.MouseSensitivity	= {}
	
SWEP.Secondary.Sound			= 'Weapon_Shotgun.Single'
SWEP.Secondary.SilencerSound	= 'Weapon_USP.SilencedShot'
SWEP.Secondary.ScopeSound		= 'Default.Zoom'
SWEP.Secondary.Anim				= ACT_VM_PRIMARYATTACK
SWEP.Secondary.AnimSilenced		= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Secondary.Damage			= 150
SWEP.Secondary.DamageType		= DMG_BULLET
SWEP.Secondary.NumShots			= 9
SWEP.Secondary.Recoil			= 10
SWEP.Secondary.Cone				= 0.2
SWEP.Secondary.Delay			= 1
SWEP.Secondary.NoAmmo			= false
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= 0
SWEP.Secondary.Tracer			= 1
SWEP.Secondary.TracerName		= nil
SWEP.Secondary.Force			= 1
SWEP.Secondary.Automatic		= true
SWEP.Secondary.Ammo				= 'Pistol'
SWEP.Secondary.EntAmmo			= ''
SWEP.Secondary.EntAmmoCanUndo 	= false
SWEP.Secondary.EntAmmoSetting	= function(self,e) end
SWEP.Secondary.TakeAmmo			= 1
SWEP.Secondary.CanUse			= false
SWEP.Secondary.UseEntBullet		= false
SWEP.Secondary.EntBulletSpeed	= 1e9
SWEP.Secondary.NotDoing			= false
SWEP.Secondary.AttackCallback	= function(self,a,t,d) end
SWEP.Secondary.UsePrimary		= false
SWEP.Secondary.Scope			= surface.GetTextureID('sprites/scope')
SWEP.Secondary.ScopeBorder  	= true
SWEP.Secondary.ScopeColor		= Color(255,255,255)
SWEP.Secondary.ScopeDelay		= 0

SWEP.ZoomLevels					= {}

SWEP.SprintAnimation			= {
	['Start'] = {
		ACT_VM_IDLE,
		ACT_VM_IDLE_TO_LOWERED
	},
	['End'] = {
		ACT_VM_IDLE_LOWERED,
		ACT_VM_LOWERED_TO_IDLE
	}
}
SWEP.IronAnimation 				= {}
SWEP.ZoomFov					= 15
SWEP.Chambering					= true
SWEP.NPCWeaponsOnly				= false
SWEP.PLYWeaponsOnly				= false

SWEP.ViewModelBoneMods 			= {}
SWEP.VElements 					= {}
SWEP.WElements 					= {}

SWEP.ShowViewModel 				= true
SWEP.ShowWorldModel 			= true

SWEP.IronSightsPos				= Vector(0,0,0)
SWEP.IronSightsAng				= Vector(0,0,0)
SWEP.IronSightsCrosshair		= false

SWEP.RunningPos					= Vector(0,0,0)
SWEP.RunningAng					= Vector(0,0,0)

SWEP.InspectionPos 				= Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 				= Vector(35.715,43.609,35.206)

SWEP.ReloadingPos				= Vector(0,0,0)
SWEP.ReloadingAng				= Vector(0,0,0)
SWEP.ReloadingTime				= 2

SWEP.NPCCanPicked				= true

SWEP.NPCRestTimesMax			= 0.6
SWEP.NPCRestTimesMin			= 0.3

SWEP.NPCBurstMax				= 6
SWEP.NPCBurstMin				= 1
SWEP.NPCBurstDelay				= 0.1

SWEP.NPCBulletSpreadPoor		= 1
SWEP.NPCBulletSpreadAverage		= 1
SWEP.NPCBulletSpreadGood		= 1
SWEP.NPCBulletSpreadVeryGood	= 1
SWEP.NPCBulletSpreadPerect		= 1

SWEP.FireMode					= {}
SWEP.FireModeShow				= true
SWEP.FireModeSemiAuto			= true
SWEP.FireModeFullAuto			= true
SWEP.FireModeRoundBurst			= false
SWEP.FireModeRoundBurstNum		= 3
SWEP.FireModeToggleSound		= 'Weapon_Alyx_Gun.Special2'

-- qtg_weapon_akimbo_base Setting

SWEP.HoldType 					= 'pistol'                          -- Wep Hold Type
SWEP.WeaponType					= ''                                -- What type of wep is it?
SWEP.PrintName					= 'Scripted Weapon'                 -- Wep Name
SWEP.Author						= ''                                -- Wep Author, yes you name
SWEP.Contact					= ''                                -- Contact information
SWEP.Purpose					= ''                                -- Wep Purpose
SWEP.Instructions				= ''                                -- Wep Instructions

SWEP.ViewModelFOV				= 62                                -- Fov
SWEP.ViewModelFlip				= false                             -- Flip?
SWEP.ViewModel					= 'models/weapons/v_pistol.mdl'     -- You wep view model
SWEP.ViewModelTxd				= {}
SWEP.WorldModel					= 'models/weapons/w_357.mdl'        -- Wep world model
SWEP.WorldModelTxd				= {}
			
SWEP.Spawnable					= false
SWEP.AdminOnly					= false
SWEP.DrawCustomCrosshair		= true

SWEP.Weight						= 5
SWEP.AutoSwitchTo				= true
SWEP.AutoSwitchFrom				= true

SWEP.CanIdle					= true                              -- Is there an idle action?
SWEP.CanRun						= true                              -- Can run?

SWEP.WepSelectIcon				= surface.GetTextureID('weapons/swep')
SWEP.SpeechBubbleLid			= surface.GetTextureID('gui/speech_lid')

SWEP.DrawWeaponInfoBox			= true
SWEP.BounceWeaponIcon			= true
SWEP.OldBounceWeaponIcon		= false

SWEP.WeaponInfoDisplayAmmo		= true
SWEP.WeaponInfoType				= 0
SWEP.WeaponInfoModelCustom		= ''
SWEP.WeaponInfoModelSize		= 45
SWEP.WeaponInfoFontCustom		= 'QTG_HL2SelectIcons'
SWEP.WeaponInfoFontIcon			= 'd'
SWEP.WeaponInfoColor			= Color(100,100,100)
SWEP.WeaponInfoTitleColor		= Color(0,0,255)
SWEP.WeaponInfoTextColor		= Color(0,0,0)

SWEP.KillIconType				= 0
SWEP.KillIconFont				= 'HL2MPTypeDeath'
SWEP.KillIconAdd				= ''
SWEP.KillIconColor				= Color(255,80,0)
SWEP.KillIconExtraAdd			= {}
SWEP.KillIconExtraAddAlias		= {}
SWEP.KillIconExtraAddFont		= {}
	
SWEP.ReloadAnim					= ACT_VM_RELOAD                     -- Reload Anim
SWEP.ReloadAnimEmpty			= ACT_VM_RELOAD_EMPTY
SWEP.ReloadSilencerAnim			= ACT_VM_RELOAD_SILENCED
SWEP.ReloadSound				= 'Weapon_Pistol.Reload'
SWEP.ReloadPos					= Vector(0,0,0)
SWEP.ReloadAng					= Vector(0,0,0)
SWEP.ReloadTime					= 2
	
SWEP.DeployAnim					= ACT_VM_DRAW
SWEP.DeploySilencerAnim			= ACT_VM_DRAW_SILENCED
SWEP.DeployEmptyAnim			= ACT_VM_DRAW_EMPTY
SWEP.DeploySound				= ''
SWEP.DeployCustom				= false
SWEP.DeployCustomTime			= 1

SWEP.CanHolster					= true
SWEP.HolsterAnim				= ACT_VM_HOLSTER
SWEP.HolsterSound				= ''
SWEP.HolsterCustom				= false

SWEP.CanPush					= false
SWEP.PushAnim					= 'melee'
SWEP.PushSwingSound				= ''
SWEP.PushHitWorldSound			= ''
SWEP.PushHitInfectedSound		= ''
SWEP.PushHitDistance			= 75

SWEP.EmptySound					= 'Weapon_Pistol.Empty'
SWEP.EmptyAnim					= ACT_VM_PRIMARYATTACK_EMPTY

SWEP.IdleAnim					= ACT_VM_IDLE
SWEP.IdleEmptyAnim				= ACT_VM_IDLE_EMPTY

SWEP.IsPump						= false
SWEP.PumpDelay					= 0.5
SWEP.PumpSound					= 'Weapon_Shotgun.Special1'
SWEP.PumpAnim					= ACT_SHOTGUN_PUMP

SWEP.Shotgun					= false
SWEP.ShotgunReloadTime			= 0.5

SWEP.Penetration				= true
SWEP.Ricochet					= true
SWEP.FireUnderWater				= false
	
SWEP.Primary.Sound				= 'Weapon_AR2.Single'
SWEP.Primary.SilencerSound		= 'Weapon_USP.SilencedShot'
SWEP.Primary.Anim				= ACT_VM_PRIMARYATTACK
SWEP.Primary.Anim2				= ACT_VM_PRIMARYATTACK
SWEP.Primary.AnimSilenced		= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Primary.Damage				= 150
SWEP.Primary.DamageType			= DMG_BULLET
SWEP.Primary.NumShots			= 1
SWEP.Primary.Recoil				= 1
SWEP.Primary.Cone				= 0.01
SWEP.Primary.Spread				= 0.5
SWEP.Primary.SpreadMax			= 2
SWEP.Primary.Delay				= 1
SWEP.Primary.NoAmmo				= false
SWEP.Primary.ClipSize			= 8
SWEP.Primary.DefaultClip		= 0
SWEP.Primary.Tracer				= 1
SWEP.Primary.TracerName			= nil
SWEP.Primary.Force				= 1
SWEP.Primary.Automatic			= true
SWEP.Primary.Ammo				= 'Pistol'
SWEP.Primary.EntAmmo			= ''
SWEP.Primary.EntAmmoCanUndo		= false
SWEP.Primary.EntAmmoSetting		= function(self,e) end
SWEP.Primary.TakeAmmo			= 1
SWEP.Primary.CanUse				= true
SWEP.Primary.UseEntBullet		= false
SWEP.Primary.EntBulletSpeed		= 1e9
SWEP.Primary.NotDoing			= false
SWEP.Primary.AttackCallback		= function(self,a,t,d) end
	
SWEP.Secondary.Sound			= 'Weapon_Shotgun.Single'
SWEP.Secondary.SilencerSound	= 'Weapon_USP.SilencedShot'
SWEP.Secondary.Anim				= ACT_VM_PRIMARYATTACK
SWEP.Secondary.Anim2			= ACT_VM_PRIMARYATTACK
SWEP.Secondary.AnimSilenced		= ACT_VM_PRIMARYATTACK_SILENCED
SWEP.Secondary.Damage			= 150
SWEP.Secondary.DamageType		= DMG_BULLET
SWEP.Secondary.NumShots			= 9
SWEP.Secondary.Recoil			= 10
SWEP.Secondary.Cone				= 0.2
SWEP.Secondary.Delay			= 1
SWEP.Secondary.Spread			= 0.5
SWEP.Secondary.SpreadMax		= 1
SWEP.Secondary.NoAmmo			= false
SWEP.Secondary.ClipSize			= -1
SWEP.Secondary.DefaultClip		= 0
SWEP.Secondary.Tracer			= 1
SWEP.Secondary.TracerName		= nil
SWEP.Secondary.Force			= 1
SWEP.Secondary.Automatic		= true
SWEP.Secondary.Ammo				= 'Pistol'
SWEP.Secondary.EntAmmo			= ''
SWEP.Secondary.EntAmmoCanUndo 	= false
SWEP.Secondary.EntAmmoSetting	= function(self,e) end
SWEP.Secondary.TakeAmmo			= 1
SWEP.Secondary.CanUse			= false
SWEP.Secondary.UseEntBullet		= false
SWEP.Secondary.EntBulletSpeed	= 1e9
SWEP.Secondary.NotDoing			= false
SWEP.Secondary.AttackCallback	= function(self,a,t,d) end
SWEP.Secondary.UsePrimary		= false

SWEP.SprintAnimation			= {
	['Start'] = {
		ACT_VM_IDLE,
		ACT_VM_IDLE_TO_LOWERED
	},
	['End'] = {
		ACT_VM_IDLE_LOWERED,
		ACT_VM_LOWERED_TO_IDLE
	}
}
SWEP.IronAnimation 				= {}
SWEP.ZoomFov					= 15
SWEP.Chambering					= true
SWEP.NPCWeaponsOnly				= false
SWEP.PLYWeaponsOnly				= false

SWEP.CSMuzzleFlashes			= false
SWEP.CSMuzzleX					= false

SWEP.ViewModelBoneMods 			= {}
SWEP.VElements 					= {}
SWEP.WElements 					= {}

SWEP.ShowViewModel 				= true
SWEP.ShowWorldModel 			= true

SWEP.IronSightsPos				= Vector(0,0,0)
SWEP.IronSightsAng				= Vector(0,0,0)
SWEP.IronSightsCrosshair		= false
SWEP.IronSightsLuaAnim      	= false

SWEP.RunningPos					= Vector(0,0,0)
SWEP.RunningAng					= Vector(0,0,0)

SWEP.InspectionPos 				= Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 				= Vector(35.715,43.609,35.206)

SWEP.Silencer					= false
SWEP.SilencerDef				= false
SWEP.SilencerDetachAnim			= ACT_VM_DETACH_SILENCER
SWEP.SilencerAttachAnim			= ACT_VM_ATTACH_SILENCER
SWEP.SilencerToggle				= true

SWEP.NPCCanPicked				= true

SWEP.NPCRestTimesMax			= 0.6
SWEP.NPCRestTimesMin			= 0.3

SWEP.NPCBurstMax				= 6
SWEP.NPCBurstMin				= 1
SWEP.NPCBurstDelay				= 0.1

SWEP.NPCBulletSpreadPoor		= 1
SWEP.NPCBulletSpreadAverage		= 1
SWEP.NPCBulletSpreadGood		= 1
SWEP.NPCBulletSpreadVeryGood	= 1
SWEP.NPCBulletSpreadPerect		= 1

SWEP.FireMode					= {}
SWEP.FireModeShow				= true
SWEP.FireModeSemiAuto			= true
SWEP.FireModeFullAuto			= true
SWEP.FireModeRoundBurst			= false
SWEP.FireModeRoundBurstNum		= 3
SWEP.FireModeToggleSound		= 'Weapon_Alyx_Gun.Special2'