AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'qtg_ent_base_grenade'

ENT.Spawnable		= false
ENT.AdminOnly		= false

ENT.Model           = 'models/weapons/w_eq_fraggrenade.mdl'

ENT.ExplodeSound    = 'BaseGrenade.Explode'

ENT.TouchNonPlayer	= 'HEGrenade.Bounce'

ENT.Icon			= 'O'

if CLIENT then
	killicon.AddFont('qtg_ent_hegrenade','QTG_CSKillIcons',ENT.Icon,Color(255, 80, 0))
end

function ENT:Explode()
	if SERVER then
		local cpos = self:GetPos()
		local effectdata = EffectData()
		effectdata:SetStart(cpos)
		effectdata:SetOrigin(cpos)
		effectdata:SetScale(1)
		QSWEP.Effect("Explosion", effectdata)
		util.BlastDamage(self,IsValid(self.Owner) and self.Owner or self,cpos,300,200)
	end
end