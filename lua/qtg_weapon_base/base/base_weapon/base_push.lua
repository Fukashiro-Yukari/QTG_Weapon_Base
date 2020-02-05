local SWEP = QSWEP.Base or {}

SWEP.CanPush					= false
SWEP.PushAnim					= 'melee'
SWEP.PushSwingSound				= ''
SWEP.PushHitWorldSound			= ''
SWEP.PushHitInfectedSound		= ''
SWEP.PushHitDistance			= 75
SWEP.PushHitDamageType			= bit.bor(DMG_CLUB,DMG_SLASH)

function SWEP:SetPush()
	if self.CanPush then
		self.Secondary.Automatic = true
	end
end

function SWEP:PushSway()
	self.Owner:LagCompensation(true)

	local t = util.TraceLine({
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*self.PushHitDistance,
		filter = self.Owner,
		mask = MASK_SHOT_HULL
	})

	if !IsValid(t.Entity) then
		t = util.TraceHull({
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*self.PushHitDistance,
			filter = self.Owner,
			mins = Vector(-10,-10,-8),
			maxs = Vector(10,10,8),
			mask = MASK_SHOT_HULL
		})
	end
	
	if SERVER then
		if t.Hit then
			local d = DamageInfo()
			local a = QSWEP.GetOwner(self)

			if IsValid(t.Entity) then
				d:SetAttacker(a)
				d:SetInflictor(self)
				d:SetDamage(math.random(15,25))
				d:SetDamageForce(self.Owner:GetForward() * 9989)
				d:SetDamageType(self.PushHitDamageType)
				t.Entity:TakeDamageInfo(d)
				
				local hitDirection = (t.Entity:GetPos() - self.Owner:GetPos()):GetNormal()
				
				if t.Entity:IsNPC() or t.Entity:IsPlayer() or type(t.Entity) == 'NextBot' then
					t.Entity:SetLocalVelocity(hitDirection*2000+vector_up*30)
					self.Owner:EmitSound(self.PushHitInfectedSound)
				else
					local ph = t.Entity:GetPhysicsObject()

					if IsValid(ph) then
						ph:ApplyForceOffset(self.Owner:GetAimVector()*80*ph:GetMass(),t.HitPos)
					end
					
					self.Owner:EmitSound(self.PushHitWorldSound)
				end
			else
				self.Owner:EmitSound(self.PushHitWorldSound)
			end
		else
			self.Owner:EmitSound(self.PushSwingSound)
		end
	end
	
	QSWEP.SendAnim(self,self.PushAnim)
	self.Owner:DoAnimationEvent(ACT_GMOD_GESTURE_MELEE_SHOVE_2HAND)
	self:SetNextFire(self.__vm:SequenceDuration())
	self.Owner:LagCompensation(false)
	self:SetState('push')
end