AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'base_anim'

ENT.Spawnable		= false
ENT.AdminOnly		= false

ENT.Model           = 'models/weapons/w_eq_fraggrenade.mdl'

ENT.HitDamage       = 1

ENT.ExplodeTime     = 4
ENT.ExplodeSound	= ''
ENT.TouchNonPlayer	= 'Flashbang.Bounce'
ENT.PhysicalSound	= {'player/kevlar%s.wav',1,5}
ENT.BeepSound		= ''

ENT.DontRemove		= false

ENT.HP				= 1

ENT.TimeDo			= {}

function ENT:SetupDataTables()
	self:AddNWVar('Float','ExplodeTime')
	self:AddNWVar('Bool','IsExplode')

	self:AltSetupDataTables()
end

function ENT:AltSetupDataTables() end

function ENT:Initialize()
    if SERVER then
		self:SetModel(self.Model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		-- self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)

		if self.HP > 0 and !self.DontRemove then
			self:SetMaxHealth(self.HP)
		end
	end

	self.__timeisdo = {}
	
	if self.HP > 0 and !self.DontRemove then
		self:SetHealth(self.HP)
	end
	
	self:SetInit()
	self:AltInitialize(self:GetPhysicsObject())
	self:SetExplodeTime(CurTime()+self.ExplodeTime)
end

function ENT:SetInit()
	if self.DontRemove then
		self.HP = 0
	end
end

function ENT:AltInitialize(p) end

function ENT:Explode() end

function ENT:Think()
	if self.ExplodeTime < 0 then return end

	local time = math.Round(self:GetExplodeTime()-CurTime(),1)

	if self.TimeDo[time] and !self.__timeisdo[time] then
		self:EmitSound(self.BeepSound)

		self.TimeDo[time](self)
	end

	self.__timeisdo[time] = true
	
	if (self:GetExplodeTime() < CurTime() or (self.HP > 0 and self:Health() < 1)) and !self:GetIsExplode() then
		if CLIENT or game.SinglePlayer() then
			self:EmitSound(self.ExplodeSound)
		end

		local t = util.TraceLine({
			start = self:GetPos(),
			endpos = self:GetPos()+Vector(0,0,-1e9),
			collisiongroup = COLLISION_GROUP_WORLD
		})
		
		self:Explode(t.Hit and t.HitPos:Distance(self:GetPos()) < 10 or false)
		self:SetIsExplode(true)

		if !self.DontRemove and SERVER then
			self:SafeRemove()
		end
	end

	local time = CurTime()
	local r = self:AltThink()

	if r then
		time = r
	end

	self:NextThink(time)

	return true
end

function ENT:AltThink() end

function ENT:PhysicsCollide(d,p)
	self:DoCollide(d,p)

    if d.Speed < 100 then return end
    
    local e = d.HitEntity
	
	if IsValid(e) and (e:IsPlayer() or e:IsNPC()) then
		if self.PhysicalSound != '' then
			local sound = 'player/kevlar'..math.random(1,5)..'.wav'

			if istable(self.PhysicalSound) then
				sound = string.format(self.PhysicalSound[1],math.random(self.PhysicalSound[2],self.PhysicalSound[3]))
			elseif isstring(self.PhysicalSound) then
				sound = self.PhysicalSound
			end

			self:EmitSound(sound)
		end
		
		if self.HitDamage > 0 then
			local dmg = DamageInfo()
			dmg:SetDamageType(DMG_CRUSH)
			dmg:SetDamage(self.HitDamage)
			dmg:SetAttacker(IsValid(self.Owner) and self.Owner or self)
			dmg:SetInflictor(self)
			dmg:SetDamageForce(d.OurOldVelocity)
			
			e:TakeDamageInfo(dmg)
		end
		
		return
	end
	
	self:EmitSound(self.TouchNonPlayer)
end

function ENT:DoCollide(d,p) end

function ENT:OnTakeDamage(d)
	if self.HP > 0 then
		self:SetHealth(self:Health()-d:GetDamage())
	end
end