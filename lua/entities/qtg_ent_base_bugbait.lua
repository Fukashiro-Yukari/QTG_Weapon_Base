AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'base_anim'

ENT.Spawnable		= false
ENT.AdminOnly		= false

ENT.Model			= 'models/weapons/w_bugbait.mdl'

ENT.CollideDecal	= ''
ENT.CollideSound	= ''

ENT.RemoveTime		= 0

function ENT:SetupDataTables()
	self:AltSetupDataTables()
end

function ENT:AltSetupDataTables() end

function ENT:Initialize()
    if SERVER then
		self:SetModel(self.Model)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_BBOX)
		self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
	end

	local p = self:GetPhysicsObject()
	if IsValid(p) then
		p:AddAngleVelocity(p:GetAngleVelocity()+Vector(200,1000,-500))
	end
	
	self:AltInitialize(p)
end

function ENT:AltInitialize(p) end

function ENT:PhysicsCollide(d,p)
	if self.isCollide then return end
	
	self.isCollide = true

	if self.CollideDecal != '' then
		util.Decal(self.CollideDecal,d.HitPos+d.HitNormal,d.HitPos-d.HitNormal)
	end

	if self.CollideSound != '' then
		self:EmitSound(self.CollideSound)
	end

	self:DoCollide(d,p)

	if self.RemoveTime > -1 then
		QSWEP.Remove(self,self.RemoveTime)
	end
end

function ENT:DoCollide(d,p) end

function ENT:OnTakeDamage(d) return end

function ENT:OnRemove() end