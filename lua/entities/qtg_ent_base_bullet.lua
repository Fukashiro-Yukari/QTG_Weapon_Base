AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'base_anim'

ENT.Spawnable		= false
ENT.AdminOnly		= false

local function GiveEntDamage(self,e)
	local d = DamageInfo()
	d:SetAttacker(self.Owner)
	d:SetInflictor(IsValid(self.Weapon) and self.Weapon or self)
	d:SetDamageType(self.Data.DamageType)
	d:SetDamage(self.Data.Damage)
	
	if e:IsPlayer() or e:IsNPC() or type(e) == 'NextBot' then
		d:SetDamageForce(self:GetForward()*10000)
	elseif e:GetPhysicsObject():IsValid() then
		e:GetPhysicsObject():ApplyForceCenter(self:GetForward()*100)
	end
	
	e:TakeDamageInfo(d)
end

if SERVER then
	function ENT:Initialize()
		self:SetModel('models/Items/AR2_Grenade.mdl')
		self:SetMaterial('models/debug/debugwhite')
		self:SetColor(Color(50,50,0))
		self:SetModelScale(self:GetModelScale()/2,0)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_BBOX)
		self:SetCollisionGroup(1)
		self:DrawShadow(true)
		
		util.SpriteTrail(self,0,Color(255,100,0,255),true,2,0,0.06,0,'effects/beam_generic01')
		
		local ph = self:GetPhysicsObject()
		ph:EnableGravity(false)

		self.ang = self:GetAngles()
	end
	
	function ENT:Think()
		local hitSource = self:GetPos()

		for _,e in pairs(ents.FindInSphere(hitSource,10)) do
			if e != self.Owner and e != self and e:Health() > 0 then
				GiveEntDamage(self,e)

				self:SafeRemove()
			end
		end
		
		if self:WaterLevel() == 3 then
			self:SafeRemove()
		end
		
		local ph = self:GetPhysicsObject()
		ph:SetVelocity(self:GetForward()*self.Data.EntBulletSpeed)
		ph:SetAngles(self.ang)

		self:NextThink(CurTime())
		return true
	end
end

function ENT:PhysicsCollide(d,ph)
	local e = d.HitEntity
	
	if e:GetClass() == self:GetClass() then return end
	if IsValid(e) then
		GiveEntDamage(self,e)
	end
	
	local b = {
		Num = 1,
		Src = self:GetPos(),
		Dir = self:GetForward()*1e9,
		Distance = 0.1,
		Spread = Vector(0,0,0),
		Tracer = 0,
		Force = 0,
		Damage = 0,
		AmmoType = 'none'
	}
	
	self:FireBullets(b)
	self:SafeRemove()
end