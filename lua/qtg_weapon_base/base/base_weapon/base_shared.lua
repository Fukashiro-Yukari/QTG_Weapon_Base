local SWEP = QSWEP.Base or {}

SWEP.HoldType 						= 'pistol'
SWEP.WeaponType						= ''
SWEP.PrintName						= 'Scripted Weapon'
SWEP.Author							= ''
SWEP.Contact						= ''
SWEP.Purpose						= ''
SWEP.Instructions					= ''

SWEP.ViewModelFOV					= 54
SWEP.ViewModelFlip					= false
SWEP.ViewModel						= 'models/weapons/v_pistol.mdl'
SWEP.ViewModelTxd					= {}
SWEP.WorldModel						= 'models/weapons/w_357.mdl'
SWEP.WorldModelTxd					= {}

SWEP.Spawnable						= false
SWEP.AdminOnly						= false

SWEP.CanIdle						= true
SWEP.CanRun							= true

SWEP.ReloadAnim						= ACT_VM_RELOAD
SWEP.ReloadAnimEmpty				= ACT_VM_RELOAD_EMPTY
SWEP.ReloadSilencerAnim				= ACT_VM_RELOAD_SILENCED
SWEP.ReloadSound					= 'Weapon_Pistol.Reload'
SWEP.ReloadCustomTime				= 2
SWEP.ReloadViewBob					= true
SWEP.ReloadViewBobAng				= Angle(0,0,-90)

SWEP.DeployAnim						= ACT_VM_DRAW
SWEP.DeploySilencerAnim				= ACT_VM_DRAW_SILENCED
SWEP.DeployEmptyAnim				= ACT_VM_DRAW_EMPTY
SWEP.DeploySound					= ''
SWEP.DeployCustom					= false
SWEP.DeployCustomTime				= 1
SWEP.DeployViewBob					= true
SWEP.DeployViewBobAng				= Angle(0,0,-90)

SWEP.CanHolster						= true
SWEP.HolsterAnim					= ACT_VM_HOLSTER
SWEP.HolsterSound					= ''
SWEP.HolsterCustom					= false

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

SWEP.Silencer						= false
SWEP.SilencerDef					= false
SWEP.SilencerDetachAnim				= ACT_VM_DETACH_SILENCER
SWEP.SilencerAttachAnim				= ACT_VM_ATTACH_SILENCER
SWEP.SilencerToggle					= true

SWEP.FireMode						= {}
SWEP.FireModeShow					= true
SWEP.FireModeSemiAuto				= true
SWEP.FireModeFullAuto				= true
SWEP.FireModeRoundBurst				= false
SWEP.FireModeRoundBurstNum			= 3
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

local SprintHolsterAnim = {
	['pistol'] = 'normal',
	['smg'] = 'passive',
	['grenade'] = 'normal',
	['ar2'] = 'passive',
	['shotgun'] = 'passive',
	['rpg'] = 'passive',
	['physgun'] = 'passive',
	['crossbow'] = 'passive',
	['melee'] = 'normal',
	['slam'] = 'normal',
	['normal'] = 'normal',
	['fist'] = 'normal',
	['melee2'] = 'normal',
	['passive'] = 'passive',
	['knife'] = 'normal',
	['duel'] = 'normal',
	['camera'] = 'normal',
	['magic'] = 'normal',
	['revolver'] = 'normal'
}

local SightsAnim = {
	['pistol'] = 'revolver',
	['smg'] = 'rpg',
	['grenade'] = 'grenade',
	['ar2'] = 'rpg',
	['shotgun'] = 'ar2',
	['rpg'] = 'rpg',
	['physgun'] = 'physgun',
	['crossbow'] = 'ar2',
	['melee'] = 'melee',
	['slam'] = 'slam',
	['normal'] = 'normal',
	['fist'] = 'fist',
	['melee2'] = 'melee2',
	['passive'] = 'passive',
	['knife'] = 'knife',
	['duel'] = 'duel',
	['camera'] = 'camera',
	['magic'] = 'magic',
	['revolver'] = 'revolver'
}

local bulletmiss = {
	'weapons/fx/nearmiss/bulletLtoR03',
	'weapons/fx/nearmiss/bulletLtoR04',
	'weapons/fx/nearmiss/bulletLtoR06',
	'weapons/fx/nearmiss/bulletLtoR07',
	'weapons/fx/nearmiss/bulletLtoR09',
	'weapons/fx/nearmiss/bulletLtoR10',
	'weapons/fx/nearmiss/bulletLtoR13',
	'weapons/fx/nearmiss/bulletLtoR14',
}

local maxricochettbl = {
	['pistol'] = 2,
	['357'] = 5,
	['smg1'] = 5,
	['ar2'] = 8,
	['buckshot'] = 1,
	['slam'] = 1,
	['AirboatGun'] = 8
}

local maxpenetrationtbl = {
	['pistol'] = 9,
	['357'] = 12,
	['smg1'] = 14,
	['ar2'] = 16,
	['buckshot'] = 5,
	['slam'] = 5,
	['AirboatGun'] = 17
}

local function patt(self,b)
	if self:GetHolstering() then return end
	if self:GetSAttacking() or self:GetState('reload') or self:GetState('run') then return end
	if self:CanPrimaryAttack() then
		local alta = self:AltPrePrimaryAttack()
		if alta then
			return
		end

		local alta = hook.Run('QTG_PrePrimaryAttack',self)
		if alta then
			return
		end
	end

	if b then
		self:SetRoundBurst(true)
	else
		self:StartAttack(self.Primary)
	end

	if self:CanPrimaryAttack(true) then
		self:AltPrimaryAttack()
		hook.Run('QTG_PrimaryAttack',self)
	end

	self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
	
	if !b and self.Primary.DelayFireAnim == '' then
		self:TakePrimaryAmmo(self.Primary.TakeAmmo)
	end
end

local basefiremode = {
	{
		name = 'Full-Auto',
		show = function(self)
			if self.Primary.Automatic then
				return self.FireModeFullAuto
			end
		end,
		toggle = function(self) end,
		wepdata = {
			Primary = {
				Automatic = true
			}
		}
	},
	{
		name = 'Semi-Auto',
		show = function(self)
			return self.FireModeSemiAuto
		end,
		toggle = function(self) end,
		wepdata = {
			Primary = {
				Automatic = false
			}
		}
	},
	{
		name = 'Round Burst',
		show = function(self)
			return self.FireModeRoundBurst
		end,
		toggle = function(self) end,
		wepdata = {
			PrimaryAttack = function(self)
				patt(self,true)
			end
		}
	}
}

local ironsights = QSWEP.GetConvar('ironsights')
local holdironsights = QSWEP.GetConvar('holdironsights')
local ricochet = QSWEP.GetConvar('ricochet')
local penetration = QSWEP.GetConvar('penetration')
local running = QSWEP.GetConvar('running')
local reload = QSWEP.GetConvar('reload')

function SWEP:SetupDataTables()
	self:AddNWVar('Bool','Silencer')
	self:AddNWVar('Bool','IsZoom')
	self:AddNWVar('Bool','SAttacking')
	self:AddNWVar('Bool','PAttacking')
	self:AddNWVar('Bool','Pumping')
	self:AddNWVar('Bool','StartReloadB')
	self:AddNWVar('Bool','RoundBurst')
	self:AddNWVar('Bool','IsEmpty')
	self:AddNWVar('Bool','DelayFire')
	self:AddNWVar('Bool','VMRight')
	self:AddNWVar('Float','Stateid')
	self:AddNWVar('Float','StateTime')
	self:AddNWVar('Float','NextIdle')
	self:AddNWVar('Float','Conetime')
	self:AddNWVar('Float','Pumptime')
	self:AddNWVar('Float','ShowChud')
	self:AddNWVar('Float','ToggleInspectTime')
	self:AddNWVar('Float','ToggleFireModeTime')
	self:AddNWVar('Float','Conet')
	self:AddNWVar('Float','NextAltFire')
	self:AddNWVar('Float','StartReload')
	self:AddNWVar('Float','FireMode')
	self:AddNWVar('Float','RoundBurstn')
	self:AddNWVar('Float','LuaAnimAtt')
	self:AddNWVar('Float','NextSights')
	self:AddNWVar('Float','DelayFireTime')
	self:AddNWVar('Float','LClip')
    self:AddNWVar('Float','RClip')
	self:AddNWVar('Entity','SelectWeapon')

	self:AltSetupDataTables()
	hook.Run('QTG_SetupDataTables',self)
end

function SWEP:GetState(a)
	if !isstring(a) then
		QSWEP.Error('Variable is not a string',true)

		return
	end

	if QSWEP.IsValidEnum('state',a) then
		return QSWEP.GetEnumStr('state',self:GetStateid()) == a
	end

	return false
end

function SWEP:SetState(a)
	if !isstring(a) then
		QSWEP.Error('Variable is not a string',true)

		return
	end

	if !QSWEP.IsValidEnum('state',a) then
		QSWEP.Error(a..'State not find')

		return
	end

	local state = a
	local time

	local r,t = hook.Run('QTG_OnSetState',self,a)
	if r then
		if r == true then
			return
		else
			state = r

			if t then
				time = t
			end
		end
	end
	
	self:SetStateid(QSWEP.GetEnum('state',state))

	if isnumber(time) then
		self:SetStateTime(CurTime()+time)
	end
end

function SWEP:GetHolstering()
	return self:GetState('holster') or self:GetState('holstercustom') or self:GetState('holsterfinish')
end

function SWEP:AltSetupDataTables() end

function SWEP:InitFireMode()
	self.__oldwepdata = self.__oldwepdata or {}
	self.__firemode = {}

	if !self.FireModeShow then return end

	for k,v in pairs(basefiremode) do
		if v.show and v.show(self) then
			self.__firemode[#self.__firemode+1] = v
		end
	end

	for k,v in pairs(self.FireMode) do
		if v.show and v.show(self) then
			self.__firemode[#self.__firemode+1] = v
		end
	end

	self:SetFireMode(1)
end

function SWEP:GetFireModeTbl()
	return self.__firemode
end

function SWEP:Initialize()
	hook.Run('QTG_PreInitialize',self)
	
	self:InitFireMode()
	self:SetHoldType(SprintHolsterAnim[self.HoldType])
	self:SetNoAmmo()
	self:SetPush()
	self:SetWeaponint()
	self:GetViewModel()

	for k,v in pairs(QSWEP.GetWepInit()) do
		v(self)
	end
	
	if CLIENT then
		self.DrawCustomCrosshair = self.DrawCrosshair
	end

	if self.WorldModelTxd and istable(self.WorldModelTxd) and !table.IsEmpty(self.WorldModelTxd) then
		for k,v in pairs(self.WorldModelTxd) do
			k = tonumber(k)
			v = tostring(v)
			
			if isnumber(k) and isstring(v) and !Material(v):IsError() then
				self:SetSubMaterial(k-1,v)
			end
		end
	end
	
	if CLIENT then
		self:InitMods()
	end

	if self.Owner:IsNPC() then
		self:SetNpc()
	end
	
	self:AltInitialize()
	hook.Run('QTG_Initialize',self)
end

function SWEP:AltInitialize() end

function SWEP:SetWeaponint()
	self.IsQTGWeapon = true
	self.Inspecting = false
	
	if self.Shotgun then
		self.Chambering = false
	end

	if self.PLYWeaponsOnly then
		self.NPCCanPicked = false
	end

	if self.Primary.ClipSize < 0 then
		self.Chambering = true
	end

	if self.Primary.EntAmmo != '' then
		self.Primary.NoCone = true
	end

	if self.Secondary.EntAmmo != '' then
		self.Secondary.NoCone = true
	end

	if self.Primary.NoCone then
		self.Primary.Cone = 0
		self.Primary.CrosshairCone = 0
	end

	if self.Secondary.NoCone then
		self.Secondary.Cone = 0
		self.Secondary.CrosshairCone = 0
	end

	if self.IronSightsLuaAnim then
		self.LuaAnimAtt = true
	end

	if self.Akimbo then
		local clip = (self.Primary.CanUse and !self.Primary.NoAmmo) and math.Round(self.Primary.ClipSize/2) or -1
		
		self:SetLClip(clip)
		self:SetRClip(clip)
	end

	if self.SilencerDef then
		self:SetSilencer(true)
	end

	if self.ReloadingAng then
		self.ReloadAng = self.ReloadingAng
	end

	if self.ReloadingPos then
		self.ReloadPos = self.ReloadingPos
	end
end

function SWEP:SetNoAmmo()
	if !self.Primary.CanUse or self.Primary.NoAmmo then
		self:SetClip1(-1)
		self.Primary.DefaultClip	= -1	
		self.Primary.Ammo			= 'none'
	end
	
	if !self.Secondary.CanUse or self.Secondary.NoAmmo or self.CanPush or self.Secondary.UsePrimary then
		self:SetClip2(-1)
		self.Secondary.DefaultClip	= -1	
		self.Secondary.Ammo			= 'none'
	end
end

function SWEP:PrimaryAttack()
	if self.Owner:KeyDown(IN_USE) and self.Silencer and self.SilencerToggle then
		self:ToggleSilencer()

		return
	end

	patt(self)
end

function SWEP:AltPrePrimaryAttack() end
function SWEP:AltPrimaryAttack() end

function SWEP:SecondaryAttack(a)
	if self:GetHolstering() then return end

	if !ironsights:GetBool() and self:GetState('zoom') then
		self:SetState('idle')
	end
	
	if !a and ((self.IronSightsPos and self.IronSightsAng and ironsights:GetBool()) or self.SetZoom) then
		return
	end

	if self.CanPush and !self:GetState('reload') and !self:GetState('reloadcustom') then
		self:PushSway()

		return
	end
	
	if self:GetPAttacking() or self:GetState('reload') or self:GetState('reloadcustom') or self:GetState('run') then return end
	if self:CanSecondaryAttack() then
		local alta = self:AltPreSecondaryAttack()
		if alta then
			return
		end

		local alta = hook.Run('QTG_PreSecondaryAttack',self)
		if alta then
			return
		end
	end
	
	self:StartAttack(self.Secondary)

	if self:CanSecondaryAttack(true) then
		self:AltSecondaryAttack()
		hook.Run('QTG_SecondaryAttack',self)
	end

	self:SetNextSecondaryFire(CurTime()+self.Secondary.Delay)

	if self.Secondary.DelayFireAnim == '' then
		if self.Secondary.UsePrimary then
			self:TakePrimaryAmmo(self.Secondary.TakeAmmo > self:Clip1() and self.Primary.TakeAmmo or self.Secondary.TakeAmmo)
		else
			self:TakeSecondaryAmmo(self.Secondary.TakeAmmo)
		end
	end
end

function SWEP:AltPreSecondaryAttack() end
function SWEP:AltSecondaryAttack() end

function SWEP:GetRecoil(a)
	if self.GetZoomLvl and self:GetState('zoom') and a.CrosshairRecoil then
		if istable(a.CrosshairRecoil) then
			return a.CrosshairRecoil[self:GetZoomLvl()] or a.Recoil
		else
			return a.CrosshairRecoil
		end
	else
		return a.Recoil
	end
end

function SWEP:GetCone(a)
	if self.GetZoomLvl and self:GetState('zoom') and a.CrosshairCone then
		if istable(a.CrosshairCone) then
			return a.CrosshairCone[self:GetZoomLvl()] or a.Cone
		else
			return a.CrosshairCone
		end
	else
		return a.Cone
	end
end

local function satt(self,a,b)
	self:ViewPunch(a)
	self:EmitSound(self:GetSilencer() and a.SilencerSound or a.Sound)
	self:ConeTrajectory(a)
	
	if a.UseEntBullet then
		self:ShootEffects(a,b)
		self:EntBulletFire(a)

		return
	end
	
	if a.EntAmmo != '' then
		self:ShootEffects(a,b)
		self:EntAmmoFire(a)

		return
	end
	
	self:ShootBullet(a,b)
	self:PostShoot()
end

function SWEP:StartAttack(a)
	local b = a == self.Primary and true or false
	local CanAttack = b and self.CanPrimaryAttack or self.CanSecondaryAttack
	local _,doanim = CanAttack(self,true)
	
	if a.TakeAmmo > self:Clip1() and self.Secondary.UsePrimary then
		a = self.Primary
	end
	
	if a.NotDoing then
		self:DoNotDoing(a)
		
		return
	end

	if !a.CanUse then return end
	if !CanAttack(self) then
		if self.Owner:IsNPC() then
			self:AIReload()
		end

		return
	end

	if a.DelayFireAnim != '' and !self.Owner:IsNPC() then
		if a.DelayFireHold then
			if !self:GetDelayFire() and IsFirstTimePredicted() then
				QSWEP.SendAnim(self,a.DelayFireAnim)
				self:EmitSound(a.DelayFireSound)
				self:SetDelayFire(true)
				self:SetDelayFireTime(CurTime()+(a.DelayFireTime > 0 and a.DelayFireTime or self.__vm:SequenceDuration()))
			end
		else
			QSWEP.SendAnim(self,a.DelayFireAnim)
			self:EmitSound(a.DelayFireSound)

			QSWEP.SimpleTimer(a.DelayFireTime > 0 and a.DelayFireTime or self.__vm:SequenceDuration(),self,self.Owner,function()
				self.Owner:ViewPunch(a.DelayFireView)

				local r = b and hook.Run('QTG_DelayPrimaryAttack',self) or hook.Run('QTG_DelaySecondaryAttack',self)
				
				if !r then
					satt(self,a)

					if b then
						self:TakePrimaryAmmo(self.Primary.TakeAmmo)
					else
						if a.UsePrimary then
							self:TakePrimaryAmmo(self.Secondary.TakeAmmo > self:Clip1() and self.Primary.TakeAmmo or self.Secondary.TakeAmmo)
						else
							self:TakeSecondaryAmmo(self.Secondary.TakeAmmo)
						end
					end
				end
			end)
		end
	else
		satt(self,a)
	end
end

function SWEP:PostShoot()
	if !IsValid(self.Owner) or self.Owner:IsNPC() then return end

	if self.IsPump and self:Clip1() > 1 then
		QSWEP.SimpleTimer(self.PumpDelay or 0.5,self,self.Owner,function()
			if self.Owner:IsNPC() then
				self.Owner:EmitSound(self.PumpSound)

				return
			end
				
			if !IsValid(self.Owner:GetActiveWeapon()) or self.Owner:GetActiveWeapon() != self or self:GetState('reload') or self:GetState('reloadcustom') then return end

			self.Owner:EmitSound(self.PumpSound)

			if self.PumpAnim and self.PumpAnim != '' then
				QSWEP.SendAnim(self,self.PumpAnim)
			end

			self:SetPumping(true)
			self:SetPumptime(CurTime()+self.__vm:SequenceDuration())

			if self.SetSniperPumping then
				self:SetSniperPumping(CurTime()+(self.__vm:SequenceDuration()-0.1))
			end
		end)
	else
		-- self:SetPumping(true)
		-- self:SetPumptime(CurTime()+1)
	end
end

function SWEP:DoNotDoing(a)
	QSWEP.SendAnim(self,a.Anim)
	self:EmitSound(a.Sound)
end

function SWEP:ToggleSilencer()
	if (!self:GetState('idle') and !self:GetState('zoom') and !self:GetState('run')) or !IsFirstTimePredicted() then return end
	
	if self:GetSilencer() then
		QSWEP.SendAnim(self,self.SilencerDetachAnim)
	else
		QSWEP.SendAnim(self,self.SilencerAttachAnim)
	end
	
	local dur = self.__vm:SequenceDuration()
	self:SetNextFire(dur+0.2)
	self:SetState('togglesilencer')
	self:SetStateTime(CurTime()+math.max(0,dur-0.1))
end

function SWEP:FinishSilencer()
	self:SetState(self:GetIsZoom() and 'zoom' or 'idle')
	self:SetSilencer(!self:GetSilencer())
end

function SWEP:ToggleSights(b)
	local mode

	if b != nil then
		mode = b
	else
		mode = !(self:GetState('zoom'))
	end

	local cis
	local dsound = true
	local r = hook.Run('QTG_IronSightSounds',self,mode)

	if r then
		if r == true then
			dsound = false
		else
			cis = r
		end
	end

	if dsound and (self:GetState('idle') or self:GetState('zoom')) and self.Owner:KeyPressed(IN_ATTACK2) then
		self:EmitSound(cis or (mode and 'QSWEP.Ironsighton' or 'QSWEP.Ironsightoff'))
	end

	self:SetIsZoom(!self:GetIsZoom())

	if !self:GetState('run') and !self:GetState('reload') and !self:GetState('reloadcustom') and !self:GetState('togglesilencer') and !self:GetHolstering() then
		self:SetState(mode and 'zoom' or 'idle')
	end
end

function SWEP:ToggleFireMode()
	if CLIENT then return end
	if !self.FireModeShow then return end
	if self:GetToggleFireModeTime() > CurTime() then return end

	local t = self:GetFireModeTbl()[self:GetFireMode()]

	if t.holster then
		t.holster(self)
	end

	if self:GetFireMode() < #self:GetFireModeTbl() then
		self:SetFireMode(self:GetFireMode()+1)
	else
		self:SetFireMode(1)
	end

	local t = self:GetFireModeTbl()[self:GetFireMode()]

	if !t then return end

	if #self:GetFireModeTbl() > 1 then
		self.Owner:EmitSound(self.FireModeToggleSound)
	end

	if t.toggle then
		t.toggle(self)
	end

	for k,v in pairs(self.__oldwepdata) do
		self[k] = v
	end

	self.__oldwepdata = {}

	if t.wepdata then
		for k,v in pairs(t.wepdata) do
			self.__oldwepdata[k] = self[k]

			if istable(self[k]) then
				table.Merge(self[k],v)
			else
				self[k] = v
			end
		end
	end

	self:SetToggleFireModeTime(CurTime()+0.01)
end

local spreadinair = QSWEP.GetConvar('spreadinair')

function SWEP:ConeTrajectory(a)
	if !IsValid(self.Owner) then return end
	if self.Owner:IsNPC() then return end

	local move = self.Owner:GetVelocity():Length()/5000
	local spread = a.Spread*0.05
	local maxspread = a.SpreadMax*0.05

	if self.Owner:OnGround() or !spreadinair:GetBool() or !self.SpreadinAir then
		if self:GetState('zoom') and self.Owner:Crouching() then
			spread = spread/6
			maxspread = maxspread/3
		elseif self:GetState('zoom') then
			spread = spread/4
			maxspread = maxspread/2
		elseif self.Owner:Crouching() then
			spread = spread/2
			maxspread = maxspread/1.2
		end
	elseif !self.Shotgun then
		spread = spread+move
		maxspread = move
	end

	local add = math.min(self:GetConet()+spread,maxspread)
	self:SetConet(add)
end

function SWEP:Trajectory(a,b)
	if !IsValid(self.Owner) then return a end
	if self:GetOwner():IsNPC() then return a end
	if b then return a end
	if self.Shotgun then return a+self:GetConet() end
	
	local move = self.Owner:GetVelocity():Length()/5000

	if self.Owner:OnGround() or !spreadinair:GetBool() or !self.SpreadinAir then
		if self:GetState('zoom') and self.Owner:Crouching() then
			a = a*0.05
		elseif self:GetState('zoom') then
			a = a*0.30
		elseif self.Owner:Crouching() then
			a = a*0.50
		else
			a = a*0.75
		end
	else
		a = a*1.5
	end

	if !spreadinair:GetBool() or !self.SpreadinAir then
		a = a+self:GetConet()
	else
		a = a+move+self:GetConet()
	end
	
	return a
end

function SWEP:ViewPunch(a)
	if !IsValid(self.Owner) then return end
	if self.Owner:IsNPC() then return end

	local kp,ky,kr

	if istable(a) and isangle(self:GetRecoil(a)) then
		local ang = self:GetRecoil(a)
		kp = self:Trajectory(ang.p)
		ky = self:Trajectory(ang.y)
		kr = self:Trajectory(ang.r)
	else
		local recoil = istable(a) and self:Trajectory(self:GetRecoil(a)) or self:Trajectory(a)
		kp = -recoil
		ky = math.Rand(-recoil,recoil)
		kr = recoil*math.Rand(-1,1)
	end
	
	local a = Angle(kp,ky,kr)
	
	self.Owner:ViewPunch(a)
	
	if (SERVER and game.SinglePlayer()) or (CLIENT and !game.SinglePlayer()) then
		local os = self.Owner:EyeAngles()
		os.p = os.p+a.p
		os.y = os.y+a.y

		self.Owner:SetEyeAngles(os)
	end
end

function SWEP:Reload() end

function SWEP:Reload2()
	if !IsFirstTimePredicted() then return end

	local hr = hook.Run('QTG_Reload',self)
	if hr then
		return
	end
	
	if self:GetState('reload') or self:GetState('reloadcustom') then return end
	
	if !self:CanReload() or !reload:GetBool() then
		self:SetShowChud(CurTime()+0.1)

		return
	end

	self:SetIsEmpty(false)
	self:SetHoldType(self.HoldType)

	QSWEP.SimpleTimer(0,self,function()
		self.Owner:SetAnimation(PLAYER_RELOAD)
	end)
	
	if self.Shotgun and self.ShotgunReload then
		self:ReloadShotgunStart()
		
		return
	end
	
	self:SetState('reload')
			
	if self.ReloadPos and self.ReloadAng then
		self:SetState('reloadcustom')
		self:SetStateTime(CurTime()+(self.ReloadCustomTime/2))
	else
		if self:Clip1() > 0 or !QSWEP.IsValidAnim(self,self.ReloadAnimEmpty) then
			QSWEP.SendAnim(self,self:GetSilencer() and self.ReloadSilencerAnim or self.ReloadAnim)
		else
			QSWEP.SendAnim(self,self:GetSilencer() and self.ReloadSilencerAnim or self.ReloadAnimEmpty)
		end
	end

	local AnimTime = (self.ReloadPos and self.ReloadAng) and self.ReloadCustomTime or self.__vm:SequenceDuration()

	self.Owner:EmitSound(self.ReloadSound)
	self:SetShowChud(CurTime()+AnimTime+0.8)
	self:SetStateTime(CurTime()+AnimTime)
end

function SWEP:FinishReload()
	self:SetState(self:GetIsZoom() and 'zoom' or 'idle')

	if self.Akimbo then
		self:SetVMRight(false)
	end
	
	if SERVER then
		if self:Clip1() > 0 and self.Chambering then
			local clip = math.min(self:Ammo1()+self:Clip1(),self.Primary.ClipSize+(self.Akimbo and 2 or 1))
			self.Owner:RemoveAmmo(self.Primary.ClipSize+1-self:Clip1(),self.Primary.Ammo)
			self:SetClip1(clip)

			if self.Akimbo and self.Primary.CanUse and !self.Primary.NoAmmo then
				self:SetLClip(math.Round(clip/2))
				self:SetRClip(math.Round(clip/2))
			end
		else
			local clip = math.min(self:Ammo1()+self:Clip1(),self.Primary.ClipSize)
			self.Owner:RemoveAmmo(self.Primary.ClipSize-self:Clip1(),self.Primary.Ammo)
			self:SetClip1(clip)

			if self.Akimbo and self.Primary.CanUse and !self.Primary.NoAmmo then
				self:SetLClip(math.Round(clip/2))
				self:SetRClip(math.Round(clip/2))
			end
		end
		
		if self:Clip2() > 0 and self.Chambering then
			local clip = math.min(self:Ammo2()+self:Clip2(),self.Secondary.ClipSize+(self.Akimbo and 2 or 1))
			self.Owner:RemoveAmmo(self.Secondary.ClipSize+1-self:Clip2(),self.Secondary.Ammo)
			self:SetClip2(clip)
		else
			local clip = math.min(self:Ammo2()+self:Clip2(),self.Secondary.ClipSize)
			self.Owner:RemoveAmmo(self.Secondary.ClipSize-self:Clip2(),self.Secondary.Ammo)
			self:SetClip2(clip)
		end
	end

	self:RunningStart()
end

function SWEP:Reload3()
end

function SWEP:ReloadShotgunStart()
	local ct = CurTime()
	
	if self:Ammo1() != 0 and self:Clip1() < self.Primary.ClipSize then
		self.reloaddelay = ct+self.ShotgunStartReloadTime

		self:SetState('reload')
		self:SetStateTime(ct+self.ShotgunStartReloadTime+self.ShotgunReloadTime*(self.Primary.ClipSize-self:Clip1())+1.5)
		self:SetShowChud(ct+self.ShotgunStartReloadTime+0.8)
		QSWEP.SendAnim(self,ACT_SHOTGUN_RELOAD_START)
		self:SetNextFire(0.5)
	else
		self:SetShowChud(CurTime()+0.01)
	end
end

function SWEP:ReloadShotgun(ct)
	if !IsValid(self) or !IsValid(self.Owner:GetActiveWeapon()) then return end
	
	if self:GetState('reload') or self:GetState('reloadcustom') then
		if self:Ammo1() == 0 or self:Clip1() >= self.Primary.ClipSize or self.Owner:KeyPressed(IN_ATTACK) or self.Owner:KeyPressed(IN_ATTACK2) or self.Owner:QTG_ALTKeyDown() then
			self:SetNextFire(self.ShotgunReloadTime+0.2)

			QSWEP.SimpleTimer(self.__vm:SequenceDuration(),self,function()
				QSWEP.SendAnim(self,ACT_SHOTGUN_RELOAD_FINISH)
					
				if self:GetState('reload') or self:GetState('reloadcustom') then
					self:SetState(self:GetIsZoom() and 'zoom' or 'idle')
					self:EmitSound(self.ShotgunEndReloadSound)
				end

				self:RunningStart()
			end)
		elseif SERVER or !game.SinglePlayer() then
			self.reloaddelay = self.reloaddelay or ct+self.ShotgunReloadTime
			
			if self.reloaddelay < ct then
				self.reloaddelay = ct+self.ShotgunReloadTime
				self:SetNextFire(self.ShotgunReloadTime)
				self:SetShowChud(ct+self.ShotgunReloadTime+0.8)
				self.Owner:EmitSound(self.ReloadSound)
				QSWEP.SendAnim(self,ACT_SHOTGUN_RELOAD_FINISH)
				self.__vm:SetPlaybackRate(0.01)

				QSWEP.SimpleTimer(0.05,self,function()
					QSWEP.SendAnim(self,ACT_VM_RELOAD)
				end)
				
				self:SetClip1(self:Clip1()+1)
				self.Owner:RemoveAmmo(1,self.Primary.Ammo,false)
			end
		end
	end
end

function SWEP:AIReload()
	if !IsValid(self) or !IsValid(self.Owner) then return end
	if self:Clip1() < self.Primary.ClipSize then
		if self.Owner:IsNPC() and !self.Owner:IsCurrentSchedule(SCHED_HIDE_AND_RELOAD) and !self.Owner:IsCurrentSchedule(SCHED_RELOAD) and !self.Owner:GetActivity() == ACT_RELOAD then
			self.Owner:SetSchedule(SCHED_RELOAD)
			self.Owner:EmitSound(self.ReloadSound)
		end
	end
end

function SWEP:IsPAttacking()
	local piskey = self.Primary.Automatic and self.Owner.KeyDown or self.Owner.KeyPressed

	return piskey(self.Owner,IN_ATTACK) and !self:GetSAttacking() and !self:GetState('run') and !self:GetHolstering()
end

function SWEP:IsSAttacking()
	local siskey = self.Secondary.Automatic and self.Owner.KeyDown or self.Owner.KeyPressed

	return ((siskey(self.Owner,IN_ATTACK2) and !self:GetState('zoom')) or self.Owner:QTG_ALTKeyDown()) and !self:GetPAttacking() and !self:GetState('run') and !self:GetHolstering()
end

function SWEP:UpdateNextIdle()
	if self.Owner:IsNPC() then return end
	if !IsValid(self.__vm) then return end

	self:SetNextIdle(CurTime()+self.__vm:SequenceDuration())
end

function SWEP:GetViewModel()
	if !IsValid(self:GetOwner()) or self.Owner:IsNPC() then return end

	if !IsValid(self.__vm) then
		self.__vm = QSWEP.GetPlyVM(self:GetOwner())
	end

	return self.__vm
end

function SWEP:Think()
	if !IsValid(self.Owner) then return end
	if self.Owner:IsNPC() then return end
	
	local ct = CurTime()

	self:GetViewModel()
	
	if !IsValid(self.__vm) then return end

	if self:GetPumping() and self:GetPumptime() < ct then
		self:RunningStart()
	end
	
	if self.CanRun and running:GetBool() and !self:GetHolstering() and self:GetPumptime() < ct and !self:GetState('reload') and !self:GetState('reloadcustom') then
		self:ThinkRunning(ct)
	end
	
	if self:IsPAttacking() then
		self:SetPAttacking(true)
	else
		self:SetPAttacking(false)
	end
	
	if self:IsSAttacking() then
		self:SetSAttacking(true)
	else
		self:SetSAttacking(false)
	end
	
	if game.SinglePlayer() and SERVER and IsValid(self:GetOwner()) and !self:GetOwner():IsNPC() then
		QSWEP.StartNet('isdrawply','Send',self:GetOwner())
	end
	
	-- if self.CanRun and running:GetBool() and self:GetStateTime() < ct and (self:GetState('deploy') or self:GetState('deploycustom') and self:GetState('deploy') then
	-- 	self:RunningStart()
	-- end

	if !running:GetBool() and self:GetState('run') then
		self:SetState('idle')
	end
	
	if self.Shotgun and self.ShotgunReload then
		self:ReloadShotgun(ct)
	end
	
	if self:GetState('run') then
		if !self.Owner:OnGround() then
			self:SetState('idle')
		end
	end

	if (!self.Owner:QTG_ALTKeyDown() and self:GetNextSights() < ct and self.IronSightsPos and self.IronSightsAng and ironsights:GetBool()) and !self.SetZoom then
		if holdironsights:GetBool() and !self.SetZoom then
			if self.Owner:KeyDown(IN_ATTACK2) then
				self:ToggleSights(true)
			else
				self:ToggleSights(false)
			end
		elseif self.Owner:KeyPressed(IN_ATTACK2) then
			self:ToggleSights()
			self:SetNextSights(ct+0.1)
		end
	end
	
	if IsValid(self.__vm) and SERVER then
		if self:GetNextIdle() < ct and self.CanIdle and (self:GetState('idle') or self:GetState('zoom')) and self.__vm:SequenceDuration() < ct then
			if self:CanPrimaryAttack(true) or !QSWEP.IsValidAnim(self,self.IdleEmptyAnim) then
				QSWEP.SendAnim(self,self:GetSilencer() and self.IdleSilencerAnim or self.IdleAnim)
			else
				QSWEP.SendAnim(self,self.IdleEmptyAnim)
			end
			
			self:SetNextIdle(ct+self.__vm:SequenceDuration())
		end
	end
	
	if !self.Owner:Alive() then
		self:Holster()
	end

	if self:GetState('holster') or self:GetState('holstercustom') then
		if self:GetStateTime() < ct then
			self:FinishHolster()
		end
	end
	
	if self:GetHolstering() then
		if self.PassiveAnim then
			self:SetHoldType(self.PassiveAnim)
		else
			self:SetHoldType(SprintHolsterAnim[self.HoldType])
		end
	end
	
	if !self:GetState('idle') or self:GetPAttacking() or self:GetSAttacking() then
		self.Inspecting = false
	end
	
	if self:GetConetime() < ct then
		self:SetConet(math.max(self:GetConet()-self.SpreadRecovery,0))
		self:SetConetime(ct+self.SpreadRecoveryTime)
	end

	if !self:GetState('reload') and !self:GetState('reloadcustom') then
		if self.Owner:KeyDown(IN_RELOAD) then
			self:SetStartReloadB(true)
			self:SetStartReload(self:GetStartReload()+0.01)
			self:SetShowChud(CurTime()+0.01)
		elseif self:GetStartReloadB() then
			self:SetStartReloadB(false)

			if self:GetStartReload() < 0.15 then
				if self.Owner:KeyDown(IN_USE) then
					if self:GetNextPrimaryFire() < CurTime() and IsFirstTimePredicted() then
						self:ToggleFireMode()
						self:SetShowChud(CurTime()+0.5)
						self:SetNextFire(0.2)
					end
				else
					self:Reload2()
				end

				self:SetStartReload(0)
			else
				self:Reload3()
				self:SetStartReload(0)
			end
		end
	elseif (self:GetState('reload') or self:GetState('reloadcustom')) and !self.Shotgun and self:GetStateTime() < CurTime() then
		self:FinishReload()
	end

	if self:GetState('togglesilencer') and self:GetStateTime() < CurTime() then
		self:FinishSilencer()
	end

	if self:GetRoundBurst() and IsFirstTimePredicted() then
		if self:GetNextPrimaryFire() < ct then
			if self:GetRoundBurstn() >= self.FireModeRoundBurstNum then
				self:SetRoundBurstn(0)
				self:SetRoundBurst(false)
				self:SetNextFire(0.2)
			elseif IsFirstTimePredicted() then
				self:SetRoundBurstn(self:GetRoundBurstn()+1)
				self:StartAttack(self.Primary)
				self:TakePrimaryAmmo(self.Primary.TakeAmmo)
				self:SetNextFire(0.07)
			end
		end
	end

	if self:GetDelayFire() and IsFirstTimePredicted() then
		if !self:GetPAttacking() and self.Primary.DelayFireHold then
			QSWEP.SendAnim(self,self.Primary.DelayFireCancelAnim)
			self:SetDelayFire(false)
		elseif !self:GetSAttacking() and self.Secondary.DelayFireHold then
			QSWEP.SendAnim(self,self.Secondary.DelayFireCancelAnim)
			self:SetDelayFire(false)
		end

		if self:GetDelayFireTime() < ct then
			if self:GetPAttacking() and self.Primary.DelayFireHold then
				if self:GetNextPrimaryFire() < ct and self:CanPrimaryAttack(true) and !self:GetState('reload') and !self:GetState('reloadcustom') then
					local r = hook.Run('QTG_DelayPrimaryAttack',self)

					if !r then
						satt(self,self.Primary)
						self:TakePrimaryAmmo(self.Primary.TakeAmmo)
						self:SetNextFire(self.Primary.Delay)
					end
				end
			elseif self:GetSAttacking() and self.Secondary.DelayFireHold then
				if self:GetNextSecondaryFire() < ct and self:CanSecondaryAttack(true) and !self:GetState('reload') and !self:GetState('reloadcustom') then
					local r = hook.Run('QTG_DelaySecondaryAttack',self)

					if !r then
						satt(self,self.Secondary)
						self:TakeSecondaryAmmo(self.Secondary.TakeAmmo)
						self:SetNextFire(self.Secondary.Delay)
					end
				end
			end
		end
	end

	if self:GetStateTime() < ct and (self:GetState('deploy') or self:GetState('deploycustom')) then
		self:SetState('idle')
	end

	if self:GetNextPrimaryFire() < ct and self:GetState('push') then
		self:SetState('idle')
	end
	
	hook.Run('QTG_Think',self,self:GetOwner())
end

function SWEP:NPCThink()
	hook.Run('QTG_NPCThink',self,self:GetOwner())
end

function SWEP:RunningStart()
	self:SetPumping(false)

	if !self.CanRun or !running:GetBool() then return end

	local ct = CurTime()

	if self:GetState('run') then
		if !self.RunningPos and !self.RunningAng then
			for k,v in pairs(self.SprintAnimation['Start']) do
				QSWEP.SendAnim(self,v)
			end
		end
		
		self:ThinkRunning(ct)
	end
end

function SWEP:ThinkRunning(ct)
	if !IsValid(self) or !IsValid(self.Owner) then return end
	if !self:GetHolstering() then
		if self:GetState('run') and self:GetNextPrimaryFire() < CurTime() and self:GetNextSecondaryFire() < CurTime() then
			if self.PassiveAnim then
				self:SetHoldType(self.PassiveAnim)
			else
				self:SetHoldType(SprintHolsterAnim[self.HoldType])
			end
		elseif self:GetState('zoom') and !self:GetState('run') then
			self:SetHoldType(SightsAnim[self.HoldType])
		elseif !self:GetState('zoom') and !self:GetState('pin') then
			self:SetHoldType(self.HoldType != 'revolver' and self.HoldType or 'pistol')
		end
	end
	
	local dist = self.Owner:GetVelocity():LengthSqr()

	if !self:GetState('idle') and !self:GetState('zoom') and !self:GetState('run') and !self:GetPumping() then return end
	if self.Owner:KeyDown(IN_SPEED) and dist > self.Owner:GetWalkSpeed()^2 and self.Owner:OnGround() then
		if self.RunningPos and self.RunningAng then else
			if !self:GetState('run') and self:GetNextPrimaryFire() < ct then
				for k,v in pairs(self.SprintAnimation['Start']) do
					QSWEP.SendAnim(self,v)
				end
			end
		end

		self:SetState('run')
	elseif self:GetState('run') then
		if self:GetNextPrimaryFire() < ct and self.Owner:OnGround() then
			self:SetNextFire(0.05)
		end

		if self.RunningPos and self.RunningAng then else
			if !self:GetState('run') then
				for k,v in pairs(self.SprintAnimation['End']) do
					QSWEP.SendAnim(self,v)
				end
			end
		end
		
		self:SetState(self:GetIsZoom() and 'zoom' or 'idle')
	end
end

function SWEP:Holster(w)
	if CLIENT then return end
	
	local v = hook.Run('QTG_PreHolster',self,self:GetOwner())
	if v != nil then return v end

	self.Inspecting = false
	
	if !IsValid(self.Owner) then return true end
	if self.Owner:IsNPC() then return true end

	if !self.Owner:Alive() or !self.CanHolster then
		self:FinishHolster()

		return true
	end
	
	if !self:GetHolstering() and !self:GetPAttacking() and !self:GetSAttacking() then
		QSWEP.SendAnim(self,self.HolsterAnim)
		self:EmitSound(self.HolsterSound)
		self:SetSelectWeapon(w)
		self:SetState('holster')
		self:SetIsZoom(false)

		if self.SetZoomLvl then
			self:SetZoomLvl(0)
		end
		
		if self.HolsterCustom then
			self:SetState('holstercustom')
			self:SetStateTime(CurTime()+0.4)
			return false
		end
		
		if IsValid(self) then
			self:SetStateTime(CurTime()+math.min(self.__vm:SequenceDuration(),0.6))
		end
		
		return false
	elseif self:GetState('holsterfinish') then
		return true
	end
end

function SWEP:FinishHolster()
	if CLIENT then
		if IsValid(self.Owner) and self.Owner:IsPlayer() then
			self:OffSkin(self.__vm)
			QSWEP.ResetBonePositions(self.__vm)
		end
		
		return
	end

	if !IsValid(self:GetOwner()) then return end
	
	local v2 = hook.Run('QTG_Holster',self,self:GetOwner())
	
	if self.Owner:IsNPC() then return end
	if v2 != nil then return v2 end
	if !self.Owner:Alive() or !self.CanHolster then return end

	if SERVER then
		local w = self:GetSelectWeapon()

		self:SetState('holsterfinish')

		if !IsValid(w) then return end

		self:Holster(w)
		
		if IsValid(self) and w:IsWeapon() then
			self.Owner:SelectWeapon(w:GetClass())
		end
	end
end

function SWEP:Deploy()
	hook.Run('QTG_PreDeploy',self,self:GetOwner())

	self:GetViewModel()
	self:SetWeapon()

	self.Inspecting = false

	timer.Simple(0,function()
		if !IsValid(self) then return end

		self.Inspecting = false
	end)
	
	self:SetHoldType(self.HoldType != 'revolver' and self.HoldType or 'pistol')
	self:EmitSound(self.DeploySound)
	self:SetState('deploy')
	
	if self.DeployCustom then
		self:SetNextFire(self.DeployCustomTime)
		self:SetShowChud(CurTime()+self.DeployCustomTime+0.5)
		self:SetStateTime(CurTime()+self.DeployCustomTime)
		self:SetState('deploycustom')
		self:SetStateTime(CurTime()+self.DeployCustomTime)
		return true
	end
	
	if self:CanPrimaryAttack(true) or !QSWEP.IsValidAnim(self,self.DeployEmptyAnim) then
		QSWEP.SendAnim(self,self:GetSilencer() and self.DeploySilencerAnim or self.DeployAnim)
	else
		QSWEP.SendAnim(self,self.DeployEmptyAnim)
	end

	self:SetNextFire(self.__vm:SequenceDuration())
	self:SetStateTime(CurTime()+self.__vm:SequenceDuration())
	self:SetShowChud(CurTime()+self.__vm:SequenceDuration()+0.5)
	
	if self.CanRun and running:GetBool() then
		self:ThinkRunning(CurTime())

		QSWEP.SimpleTimer(self.__vm:SequenceDuration(),self,function()
			if !self.GetState or !self:GetState('run') then return end

			self:RunningStart()
		end)
	end
	
	local v = hook.Run('QTG_Deploy',self,self:GetOwner())
	if v != nil then
		return v
	end
	
	return true
end

function SWEP:SetWeapon()
	if !QSWEP.IsValidAnim(self,self.HolsterAnim) then
		self.HolsterCustom = true
	end
end

function SWEP:ShootEffects(a,b)
	if !IsValid(self.Owner) then return end

	a = a or self.Primary
	b = b == nil and true or false

	if self.LuaAnimAtt and (self:GetState('zoom') or !self.LuaAnimAttZooming) then
		self:SetLuaAnimAtt(CurTime()+self.LuaAnimAttTime)
	else
		if self.Akimbo then
			if self:GetVMRight() then
				QSWEP.SendAnim(self,self:GetSilencer() and a.AnimSilenced2 or a.Anim2)
			else
				QSWEP.SendAnim(self,self:GetSilencer() and a.AnimSilenced or a.Anim)
			end
		else
			QSWEP.SendAnim(self,self:GetSilencer() and a.AnimSilenced or a.Anim)
		end
	end
	
	self:PlayEffects(self.Akimbo and (self:GetVMRight() and (self.VFireEffectsAtt or 1) or (self.VFireEffectsAtt2 or 2)) or self.VFireEffectsAtt)
	self.Owner:SetAnimation(PLAYER_ATTACK1)
end

function SWEP:ShootBullet(a,bl)
	if !IsValid(self.Owner) then return end

	if self.Akimbo then
		if self.Primary.CanUse and !self.Primary.NoAmmo then
			if self:GetVMRight() then
				self:SetLClip(self:GetLClip()-1)
			else
				self:SetRClip(self:GetRClip()-1)
			end
		end
	
		self:SetVMRight(!self:GetVMRight())
	end

	local b = {}
	
	b.Callback 		= function(at,t,d)
		if self.Akimbo then
			if a.Tracer != 0 then
				local tracer = (a.TracerName != '' and a.Tracer != 0) and a.TracerName or 'qtg_eff_deftracer'
				local e = EffectData()
				e:SetOrigin(t.HitPos)
				e:SetStart(b.Src)
				e:SetEntity(self)
				e:SetAttachment(self:GetVMRight() and (self.VFireEffectsAtt or 1) or (self.VFireEffectsAtt2 or 2))
				QSWEP.Effect(tracer,e,true,nil)
			end
		end
		
		d:SetDamageType(a.DamageType)

		self:RicochetCallback(a,0,at,t,d,a.DamageType)

		local acb = a.AttackCallback(self,at,t,d)
		if acb then
			return acb
		end
	end
	
	b.Num			= a.NumShots
	b.Src			= self.Owner:GetShootPos()
	b.Dir			= self.Owner:GetAimVector()
	b.Spread		= Vector(self:Trajectory(self:GetCone(a),a.NoCone),self:Trajectory(self:GetCone(a),a.NoCone),0)

	if self.Akimbo then
		b.Tracer = 0
		b.TracerName = ''
	else
		b.Tracer = a.Tracer
		b.TracerName = a.TracerName == '' and 'qtg_eff_deftracer' or a.TracerName
	end

	b.Force			= a.Force

	if istable(a.Damage) then
		if #a.Damage > 2 then
			b.Damage = table.Random(a.Damage)
		else
			b.Damage = math.random(a.Damage[1],a.Damage[2])
		end
	else
		b.Damage = a.Damage
	end
	
	b.AmmoType 		= a.Ammo
	
	self.Owner:FireBullets(b)
	self:ShootEffects(a,bl)
end

function SWEP:RicochetCallback(a,b,at,t,d,dt)
	if !IsFirstTimePredicted() then return end

	if t.HitSky then return end

	self.MaxRicochet = 5
	if maxricochettbl[a.Ammo] then
		self.MaxRicochet = maxricochettbl[a.Ammo]
	end
   
	if self.Penetration and penetration:GetBool() and self:BulletPenetrate(a,b,at,t,d,dt) then
		return
	end

	if t.MatType != MAT_METAL then
		if SERVER then
			sound.Play(table.Random(bulletmiss),t.HitPos,75,math.random(75,150),1)
		end

		return
	end

	if !self.Ricochet or !ricochet:GetBool() then return end
   
	if b > self.MaxRicochet then return end

	local DotProduct = t.HitNormal:Dot(t.Normal*-1)
   
	local rb = {}
	rb.Attacker			= self.Owner
	rb.Num              = 1
	rb.Src              = t.HitPos+(t.HitNormal*5)
	rb.Dir              = ((2 * t.HitNormal * DotProduct) + t.Normal) + (VectorRand() * 0.05)
	rb.Spread   		= Vector(0,0,0)
	rb.Tracer   		= 0
	rb.TracerName       = ''
	rb.Force            = d:GetDamage()*0.15
	rb.Damage   		= d:GetDamage()*0.5
	rb.Callback         = function(att,tra,dmg)
		local beTracerName = (a.TracerName != '' and a.Tracer != 0) and a.TracerName or 'qtg_eff_deftracer'
		local be = EffectData()
		be:SetOrigin(tra.HitPos)
		be:SetStart(rb.Src)
		be:SetAttachment(1)

		if tra.Entity then
			be:SetEntity(tra.Entity)
		end

		QSWEP.Effect(beTracerName,be,true,nil)

		dmg:SetDamageType(dt)

		local acb = a.AttackCallback(self,att,tra,dmg)
		if acb then
			return acb
		end

		if self.Ricochet then
			local inum = 1

			if t.MatType == MAT_GLASS then
				inum = 0
			end

			self:RicochetCallback(a,b+inum,att,tra,dmg,dt)
		end
	end

	if IsValid(at) then
		at:FireBullets(rb)
	end
end

function SWEP:BulletPenetrate(a,b,at,t,d,dt)
	local MaxPenetration = 14

	if maxpenetrationtbl[a.Ammo] then
		MaxPenetration = maxpenetrationtbl[a.Ammo]
	end
   
	if t.MatType == MAT_METAL and self.Ricochet and a.Ammo != 'SniperPenetratedRound' then
		return false
	end

	if b > self.MaxRicochet then return false end
   
	local PenetrationDirection = t.Normal * MaxPenetration
   
	if t.MatType == MAT_GLASS or t.MatType == MAT_PLASTIC or t.MatType == MAT_WOOD or t.MatType == MAT_FLESH or t.MatType == MAT_ALIENFLESH then
		PenetrationDirection = t.Normal * (MaxPenetration * 2)
	end
		   
	local tr = {}
	tr.endpos = t.HitPos
	tr.start = t.HitPos + PenetrationDirection
	tr.mask = MASK_SHOT
	tr.filter = {self.Owner}
	   
	local tr = util.TraceLine(tr)
   
	if tr.StartSolid or tr.Fraction >= 1.0 or t.Fraction <= 0.0 then 
		return false 
	end
   
	local fDamageMulti = 0.5
	if a.Ammo == 'SniperPenetratedRound' then
		fDamageMulti = 1
	elseif t.MatType == MAT_CONCRETE or t.MatType == MAT_METAL then
		fDamageMulti = 0.3
	elseif t.MatType == MAT_WOOD or t.MatType == MAT_PLASTIC or t.MatType == MAT_GLASS then
		fDamageMulti = 0.8
	elseif t.MatType == MAT_FLESH or t.MatType == MAT_ALIENFLESH then
		fDamageMulti = 0.9
	end
   
	local damagedice = math.Rand(.85,1.3)
		   
	local pb = {}
	pb.Attacker			= self.Owner
	pb.Num            	= 1
	pb.Src            	= tr.HitPos
	pb.Dir            	= t.Normal
	pb.Spread			= Vector(0,0,0)
	pb.Tracer 			= 0
	pb.TracerName     	= ''
	pb.Force          	= 5
	pb.Damage 			= d:GetDamage() * fDamageMulti
	pb.Callback       	= function(att,tra,dmg)
		local beTracerName = (a.TracerName != '' and a.Tracer != 0) and a.TracerName or 'qtg_eff_deftracer'
		local be = EffectData()
		be:SetOrigin(tra.HitPos)
		be:SetStart(pb.Src)
		be:SetAttachment(1)

		if tra.Entity then
			be:SetEntity(tra.Entity)
		end

		QSWEP.Effect(beTracerName,be,true,nil)
		
		dmg:SetDamageType(dt)

		local acb = a.AttackCallback(self,att,tra,dmg)
		if acb then
			return acb
		end

		if self.Ricochet then
			local inum = 1
			if tr.MatType == MAT_GLASS then
				inum = 0
			end

			return self:RicochetCallback(a,b+inum,att,tra,dmg,dt)
		end
	end

	if IsValid(at) then
		at:FireBullets(pb)
	end
	
	return true
end

function SWEP:TakePrimaryAmmo(n)
	if !IsValid(self.Owner) then return end
	if !self:CanPrimaryAttack() then return end
	if self.Primary.CanUse and !self.Primary.NoAmmo then
		if n > self:Clip1() and self.Primary.ClipSize > 0 then
			n = math.min(self:Clip1(),n)
		end

		if self:Clip1() <= 0 or !reload:GetBool() then
			if self.Owner:IsNPC() then return end
			if self:Ammo1() <= 0 then return end

			self.Owner:RemoveAmmo(n,self:GetPrimaryAmmoType())
			return 
		end
		
		self:SetClip1(self:Clip1()-n)
	end
end

function SWEP:TakeSecondaryAmmo(n)
	if !IsValid(self.Owner) then return end
	if !self:CanSecondaryAttack() then return end
	if self.Secondary.CanUse and !self.Secondary.NoAmmo then
		if n > self:Clip2() and self.Secondary.ClipSize > 0 then
			n = math.min(self:Clip2(),n)
		end
		
		if self:Clip2() <= 0 or !reload:GetBool() then
			if self.Owner:IsNPC() then return end
			if self:Ammo2() <= 0 then return end

			self.Owner:RemoveAmmo(n,self:GetSecondaryAmmoType())
			return 
		end

		self:SetClip2(self:Clip2()-n)
	end
end

function SWEP:SetNextFire(a)
	self:SetNextPrimaryFire(CurTime()+a)
	self:SetNextSecondaryFire(CurTime()+a)
end

function SWEP:CanPrimaryAttack(a)
	local sound = a and '' or self.EmptySound

	if IsValid(self.Owner) and self.Owner:WaterLevel() >= 3 and !self.FireUnderWater then
		self:EmitSound(sound)
		self:SetNextFire(self.Primary.Delay)

		return false,true
	end

	if !self.Primary.CanUse then return end
	if self.Primary.NoAmmo then return true end
	if self:Clip1() < 0 then
		if self:Ammo1() == 1 then
			if !a then
				QSWEP.SendAnim(self,self.EmptyAnim)
			end

			return true,!QSWEP.IsValidAnim(self,self.EmptyAnim)
		end

		if self:Ammo1() <= 0 then
			if !self:GetIsEmpty() and !a then
				QSWEP.SendAnim(self,self.EmptyAnim)
				self:EmitSound(sound)
				self:SetIsEmpty(true)
			end

			self:SetNextFire(self.Primary.Delay)

			return false,true
		end

		return true,true
	end

	if self:Clip1() == 1 then
		if !a then
			QSWEP.SendAnim(self,self.EmptyAnim)
		end

		return true,!QSWEP.IsValidAnim(self,self.EmptyAnim)
	end

	if self:Clip1() <= 0 then
		if !self:GetIsEmpty() and !a then
			QSWEP.SendAnim(self,self.EmptyAnim)
			self:SetNextFire(self.Primary.Delay)
			self:EmitSound(sound)
			self:SetIsEmpty(true)
		end

		return false,true
	end
	
	return true,true
end

function SWEP:CanSecondaryAttack(a)
	local sound = a and '' or self.EmptySound

	if IsValid(self.Owner) and self.Owner:WaterLevel() >= 3 and !self.FireUnderWater then
		self:EmitSound(sound)
		self:SetNextFire(self.Secondary.Delay)
		
		return false,true
	end
	
	if !self.Secondary.CanUse then return end
	if self.Secondary.NoAmmo then return true end
	if self.CanPush then return true end
	if self.Secondary.UsePrimary then
		return self:CanPrimaryAttack(a)
	else
		if self:Clip2() < 0 then
			if self:Ammo2() == 1 then
				if !a then
					QSWEP.SendAnim(self,self.EmptyAnim)
				end
	
				return true,!QSWEP.IsValidAnim(self,self.EmptyAnim)
			end

			if self:Ammo2() <= 0 then
				if !a then
					QSWEP.SendAnim(self,self.EmptyAnim)
					self:EmitSound(sound)
					self:SetNextFire(self.Secondary.Delay)
				end

				return false,true
			end

			return true,true
		end

		if self:Clip2() == 1 then
			if !a then
				QSWEP.SendAnim(self,self.EmptyAnim)
			end
			
			return true,!QSWEP.IsValidAnim(self,self.EmptyAnim)
		end

		if self:Clip2() <= 0 then
			if !a then
				QSWEP.SendAnim(self,self.EmptyAnim)
				self:EmitSound(sound)
				self:SetNextFire(self.Secondary.Delay)
			end

			return false,true
		end
	end

	return true,true
end

function SWEP:CanReload()
	if self:GetState('reload') or self:GetState('reloadcustom') then return false end
	if self:GetRoundBurst() then return false end
	if self.Owner:IsNPC() then self:AIReload() return false end
	if self.Primary.ClipSize>-1 then
		if self:Clip1() < (self.Chambering and self.Primary.ClipSize+1 or self.Primary.ClipSize) and self:Ammo1()>0 then
			if self.Primary.NoAmmo or !self.Primary.CanUse then return false end
			return true
		end
	end
	
	if self.Secondary.ClipSize>-1 then
		if self:Clip2() < (self.Chambering and self.Secondary.ClipSize+1 or self.Secondary.ClipSize) and self:Ammo2()>0 then
			if self.Secondary.NoAmmo or !self.Secondary.CanUse then return false end
			return true
		end
	end
	
	return false
end

function SWEP:OnRemove()
	self:Holster()
	self:QTG_CallFunc('Holster')

	return hook.Run('QTG_OnRemove',self)
end

function SWEP:OwnerChanged() end

function SWEP:Ammo1()
	if IsValid(self.Owner) then
		return self.Owner:IsPlayer() and self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) or 0
	end
end

function SWEP:Ammo2()
	if IsValid(self.Owner) then
		return self.Owner:IsPlayer() and self.Owner:GetAmmoCount(self:GetSecondaryAmmoType()) or 0
	end
end

function SWEP:SetDeploySpeed(s)
	self.m_WeaponDeploySpeed = tonumber(s)
end

function SWEP:DoImpactEffect(tr,nDamageType)
	return false
end

function SWEP:EmitClientSound(a)
	self:EmitSound(a)
end

function SWEP:IsDrawPly()
	if game.SinglePlayer() then
		return self.Owner:GetNW2Bool('qswep_isdrawply')
	else
		if CLIENT then
			return LocalPlayer():ShouldDrawLocalPlayer()
		else
			return false
		end
	end
end

function SWEP:PlayEffects(a)
	if !IsFirstTimePredicted() then return end
	if SERVER and !game.SinglePlayer() then return end
	a = a or 1

	local drawply = self:IsDrawPly()
	
	if drawply then
		if self.WFireEffects != '' then
			local data = EffectData()
			data:SetFlags(0)
			data:SetEntity(self.__vm)
			data:SetAttachment(self.WFireEffectsAtt)
			data:SetScale(1)
			QSWEP.Effect(self.WFireEffects,data)
		end
	else
		if self.VFireEffects != '' and !self:GetSilencer() then
			if self.GetZoomLvl and self:GetZoomLvl() > 0 then return end

			local data = EffectData()
			data:SetFlags(0)
			data:SetEntity(self.__vm)
			data:SetAttachment(a)
			data:SetScale(1.5)
			QSWEP.Effect(self.VFireEffects,data)
		end
	end

	-- if self.LuaAnimAtt and self.LuaAnimAttShells != '' then
	-- 	if self.LuaAnimAttZooming and !self:GetState('zoom') then else
			-- local pos,ang

			-- if IsValid(self.__) then
			-- 	pos = self.__vm:GetAttachment(2).Pos
			-- 	ang = self.__vm:GetAttachment(2).Ang
			-- end

			-- local data = EffectData()
			-- data:SetOrigin(pos)
			-- -- data:SetEntity(self.__vm)
			-- data:SetAngles(ang)
			-- QSWEP.Effect('ShellEject',data)
	-- 	end
	-- end
end