DEFINE_BASECLASS('qtg_weapon_base')

SWEP.PrintName				= 'Scripted Weapon'

SWEP.DeployViewBob			= false

SWEP.Primary.NoAmmo			= true
SWEP.Primary.MaxDistance	= 100
SWEP.Primary.AminMiss		= ACT_VM_MISSCENTER
SWEP.Primary.AminHit		= ACT_VM_PRIMARYATTACK
SWEP.Primary.SlashSound		= 'Weapon_Knife.Hit'
SWEP.Primary.MissSound		= 'Weapon_Knife.Slash'
SWEP.Primary.HitWallSound	= 'Weapon_Knife.HitWall'
SWEP.Primary.HitWallType	= 0
SWEP.Primary.DamageType		= bit.bor(DMG_CLUB,DMG_SLASH)
SWEP.Primary.DamageView		= Angle(0,0,0)
SWEP.Primary.Force			= 10000
SWEP.Primary.DelayMelee		= QSWEP.ENUM.MELEEHIT.CUT
SWEP.Primary.DelaySound		= ''

SWEP.Secondary.NoAmmo		= true
SWEP.Secondary.MaxDistance	= 80
SWEP.Secondary.AminMiss		= ACT_VM_MISSCENTER
SWEP.Secondary.AminHit		= ACT_VM_SECONDARYATTACK
SWEP.Secondary.CanBack		= true
SWEP.Secondary.BackDamage	= 150
SWEP.Secondary.BackSound	= 'Weapon_Knife.Stab'
SWEP.Secondary.SlashSound	= 'Weapon_Knife.Hit'
SWEP.Secondary.MissSound	= 'Weapon_Knife.Slash'
SWEP.Secondary.HitWallSound	= 'Weapon_Knife.HitWall'
SWEP.Secondary.HitWallType	= QSWEP.ENUM.MELEEHIT.CUT
SWEP.Secondary.DamageType	= bit.bor(DMG_CLUB,DMG_SLASH)
SWEP.Secondary.DamageView	= Angle(0,0,0)
SWEP.Secondary.Force		= 10000
SWEP.Secondary.DelayMelee	= 0
SWEP.Secondary.DelaySound	= ''

SWEP.FireModeShow			= false

local hitwalltype = {
	function(self,tbl,t)
		util.Decal('ManhackCut',t.HitPos+t.HitNormal,t.HitPos-t.HitNormal)
	end,
	function(self,tbl,t)
		local b = {
			Num = 1,
			Src = self.Owner:GetShootPos(),
			Dir = self.Owner:GetAimVector(),
			Distance = tbl.MaxDistance+5,
			Spread = Vector(0,0,0),
			Tracer = 0,
			Force = 0,
			Damage = 0,
			AmmoType = 'none'
		}

		self.Owner:FireBullets(b)
	end
}

local function itre(self,tbl)
	local spos = self.Owner:GetShootPos()
	local sdest = spos + self.Owner:GetAimVector() * tbl.MaxDistance
	local t = util.TraceLine({
		start = spos,
		endpos = sdest,
		filter = self.Owner,
		mask = MASK_SHOT_HULL
	})

	return t
end

local function slash(self,tbl,b,b2)
	local spos = self.Owner:GetShootPos()
	local sdest = spos + self.Owner:GetAimVector() * tbl.MaxDistance
	local t = itre(self,tbl)
	
	if tbl.DelayMelee == 0 or b then
		timer.Simple(0,function()
			if IsValid(self) and IsFirstTimePredicted() then
				self.Owner:SetAnimation(PLAYER_ATTACK1)
			end
		end)

		self.Owner:ViewPunch(tbl.DamageView)
	end
	
	local e = t.Entity
	if !IsValid(e) and !e:IsWorld() then
		if !b then
			QSWEP.SendAnim(self,tbl.AminMiss)
		end

		if tbl.DelayMelee == 0 or b then
			if tbl.DelayMelee == 0 then
				self:EmitSound(tbl.MissSound)
			else
				self:EmitSound(tbl.DelaySound)
			end
			
			if self.Owner:IsPlayer() then
				self.Owner:LagCompensation(false)
			end
		elseif !b then
			self:Slash2(tbl,e)
		end
		
		return
	end
	
	local dif = math.AngleDifference(self.Owner:GetAngles().y, e:GetAngles().y)
	local IsBack = (e:IsPlayer() or e:IsNPC()) and dif >= -45 and dif <= 45 and tbl.CanBack
	
	if IsValid(e) and (e:IsPlayer() or e:IsNPC() or e:GetClass() == 'prop_ragdoll') then
		if !b then
			QSWEP.SendAnim(self,tbl.AminHit)
		end
		
		if tbl.DelayMelee == 0 or b then
			if !b2 and SERVER then
				QSWEP.BloodEffect(e,t.HitPos)
			end

			if CLIENT or game.SinglePlayer() then
				self.Owner:EmitSound(IsBack and tbl.BackSound or tbl.SlashSound)
			end
		elseif !b then
			self:Slash2(tbl,e)
		end
	else
		if !b then
			QSWEP.SendAnim(self,tbl.AminHit)
		end
		
		if tbl.DelayMelee == 0 or b then
			if CLIENT or game.SinglePlayer() then
				local TDecal
				
				if !b2 then
					if hitwalltype[tbl.HitWallType+1] then
						hitwalltype[tbl.HitWallType+1](self,tbl,t)
					end
				end

				self:EmitSound(tbl.HitWallSound)
			end
			
			if SERVER and IsValid(e) and !b2 then
				local phys = e:GetPhysicsObject()
				
				if IsValid(phys) then
					local vel = self.Owner:GetAimVector()
					local ang = self.Owner:GetAngles()
					
					phys:SetVelocity((vel + ang:Up() * 0.2) * GetConVar('phys_pushscale'):GetInt() * 150 / phys:GetMass())
				end
			end
		elseif !b then
			self:Slash2(tbl,e)
		end
	end
	
	if tbl.DelayMelee == 0 or b then
		if SERVER and t.Hit and t.HitNonWorld and !b2 then
			local d = DamageInfo()
			d:SetDamage(IsBack and tbl.BackDamage or tbl.Damage)
			d:SetAttacker(self.Owner)
			d:SetInflictor(self or self)
			d:SetDamageForce(self.Owner:GetAimVector() * tbl.Force)
			d:SetDamagePosition(self.Owner:GetPos())
			d:SetDamageType(tbl.DamageType)
			e:DispatchTraceAttack(d, spos + self.Owner:GetAimVector() * 3, sdest)
		end

		hook.Run('QTG_MeleeHit',self,tbl == self.Primary)
		
		if self.Owner:IsPlayer() then
			self.Owner:LagCompensation(false)
		end
	end
end

function SWEP:Slash(tbl)
	local t = itre(self,tbl)
	if t.Hit and tbl.DelayHit then
		self:SetNextFire(tbl.DelayHit)
	else
		self:SetNextFire(tbl.Delay)
	end
	
	if self.Owner:IsPlayer() then
		self.Owner:LagCompensation(false)
		self.Owner:LagCompensation(true)
	end
	
	slash(self,tbl,false,tbl.NotDoing)
end

function SWEP:Slash2(tbl,e)
	self:EmitSound(tbl.MissSound)

	timer.Simple(tbl.DelayMelee,function()
		if IsValid(self) then
			slash(self,tbl,true,tbl.NotDoing)
		end
	end)
end

function SWEP:PrimaryAttack()
	local alta = self:AltPrePrimaryAttack()
	if alta then
		return
	end

	local alta = hook.Run('QTG_PrePrimaryAttack',self)
	if alta then
		return
	end
	
	if !self.Primary.CanUse then return end
	
	self:Slash(self.Primary)
	self:AltPrimaryAttack()
	hook.Run('QTG_PrimaryAttack',self)
end

function SWEP:SecondaryAttack()
	local alta = self:AltPreSecondaryAttack()
	if alta then
		return
	end

	local alta = hook.Run('QTG_PreSecondaryAttack',self)
	if alta then
		return
	end

	if self.CanPush then self:PushSway() return end
	if !self.Secondary.CanUse then return end

	self:Slash(self.Secondary)
	self:AltSecondaryAttack()
	hook.Run('QTG_SecondaryAttack',self)
end

function SWEP:IsPAttacking()
	local piskey = self.Primary.Automatic and self.Owner.KeyDown or self.Owner.KeyPressed

	return piskey(self.Owner,IN_ATTACK) and !self:GetSAttacking() and !self:GetHolstering()
end

function SWEP:IsSAttacking()
	local siskey = self.Secondary.Automatic and self.Owner.KeyDown or self.Owner.KeyPressed

	return siskey(self.Owner,IN_ATTACK2) and !self:GetPAttacking() and !self:GetHolstering()
end

function SWEP:CanDrawCrosshair()
	local drawply = LocalPlayer():ShouldDrawLocalPlayer()

	return !self.Inspecting and (self:GetState('run') or self:GetState('idle'))
end

local c_crosshair = 0
local c_cone = 0

function SWEP:DoDrawCrosshair(x,y)
	local drawply = LocalPlayer():ShouldDrawLocalPlayer()
	
	if !self.DrawCustomCrosshair then return true end
	
	if QSWEP.GetConvar('crosshair'):GetBool() then
		local pos = {x=x,y=y}
		
		c_crosshair = Lerp(math.Clamp(FrameTime()*15,0,1),c_crosshair or 0,self:CanDrawCrosshair() and 1 or 0)

		if drawply then
			pos = self.Owner:GetEyeTrace().HitPos:ToScreen()
		end

		local t = itre(self,self.Primary)
		local bool = true

		if t.Hit then
			bool = false
		end
		
		local cr,cg,cb = QSWEP.GetCrosshairColor(bool).r,QSWEP.GetCrosshairColor(bool).g,QSWEP.GetCrosshairColor(bool).b
		local ca = QSWEP.GetConvar('crosshair_a'):GetInt()
		local ccolor = Color(cr,cg,cb,ca*c_crosshair)
		local ccolord = Color(0,0,0,(ca-55)*c_crosshair)
		
		if c_crosshair > 0 then
			if !hook.Run('QTG_PreDrawCrosshair',self,c_cone) then
				draw.RoundedBox(0,pos.x-20,pos.y-2,40,3,ccolord)
				draw.RoundedBox(0,pos.x-2,pos.y-10,3,20,ccolord)

				draw.RoundedBox(0,pos.x-19,pos.y-1,38,1,ccolor)
				draw.RoundedBox(0,pos.x-1,pos.y-9,1,18,ccolor)

				hook.Run('QTG_DrawCrosshair',self,0)
			end
		end
		
		return true
	else
		if self:CanDrawCrosshair() then return false end
		
		return true
	end
end