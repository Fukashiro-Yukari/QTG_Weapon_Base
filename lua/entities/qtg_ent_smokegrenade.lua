AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'qtg_ent_base_grenade'

ENT.Spawnable		= false
ENT.AdminOnly		= false

ENT.Model           = 'models/weapons/w_eq_smokegrenade.mdl'

ENT.ExplodeSound    = 'BaseSmokeEffect.Sound'

ENT.TouchNonPlayer	= 'SmokeGrenade.Bounce'

ENT.Icon			= 'Q'

if CLIENT then
	killicon.AddFont('qtg_ent_smokegrenade','QTG_CSKillIcons',ENT.Icon,Color(255,80,0))
end

function ENT:Explode()
    if CLIENT then
        local particles = {
			Model("particle/particle_smokegrenade"),
			Model("particle/particle_noisesphere")
		}
		
		local pos = self:GetPos()
		
		local em = ParticleEmitter(pos)
		
		for i = 1, 40 do
			local prpos = VectorRand() * 20
			prpos.z = prpos.z + 32
			
			local p = em:Add(table.Random(particles), pos + prpos)
			
			if p then
				local gray = math.random(120, 200)
				
				p:SetColor(gray, gray, gray)
				p:SetStartAlpha(255)
				p:SetEndAlpha(200)
				p:SetVelocity(VectorRand() * math.Rand(900, 1300))
				p:SetLifeTime(0)
				p:SetDieTime(math.Rand(40, 50))
				p:SetStartSize(math.Rand(150, 250))
				p:SetEndSize(math.Rand(1, 50))
				p:SetRoll(math.random(-180, 180))
				p:SetRollDelta(math.Rand(-0.1, 0.1))
				p:SetAirResistance(600)
				p:SetCollide(true)
				p:SetBounce(0.4)
				p:SetLighting(false)
			end
		end
		
        em:Finish()
    end
end

QTG_Smokegranade_Pos = QTG_Smokegranade_Pos or {}

hook.Add('Think','qtg_ent_smokegranade',function()
	for k,v in pairs(QTG_Smokegranade_Pos) do
		if v.time < CurTime() then
			for a,b in pairs(ents.FindInSphere(v.pos,150)) do
				b:RemoveFlags(FL_NOTARGET)
			end

			v = nil
		end

		if istable(v) then
			for a,b in pairs(ents.FindInSphere(v.pos,150)) do
				local dist = b:GetPos():Distance(v.pos)
				if b:IsPlayer() and dist < 130 then
					b:AddFlags(FL_NOTARGET)
				else
					b:RemoveFlags(FL_NOTARGET)
				end
			end
		end
	end
end)

hook.Add('EntityRemoved','qtg_ent_smokegranade',function(e)
	if e:GetClass() == 'qtg_ent_smokegrenade' then
		QTG_Smokegranade_Pos[#QTG_Smokegranade_Pos+1] = {
			pos = e:GetPos(),
			time = CurTime()+35
		}
	end
end)