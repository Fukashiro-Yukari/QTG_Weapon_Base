AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'qtg_ent_base_grenade'

ENT.Spawnable		= false
ENT.AdminOnly		= false

ENT.Model           = 'models/weapons/w_eq_flashbang_thrown.mdl'

ENT.ExplodeSound    = 'Flashbang.Explode'

ENT.TouchNonPlayer	= 'Flashbang.Bounce'

ENT.Icon			= 'P'

local convar

if CLIENT then
	killicon.AddFont('qtg_ent_flashbang','QTG_CSKillIcons',ENT.Icon,Color(255,80,0))
else
	convar = CreateConVar('sv_qswep_flashbang_affect_npc',0,{FCVAR_REPLICATED,FCVAR_ARCHIVE,FCVAR_NOTIFY})
end

QSWEP_Flashbang = QSWEP_Flashbang or {}

function ENT:Explode()
    if CLIENT then
		local pos = self:GetPos()
		local lp = LocalPlayer()
		
		if lp:IsLineOfSightClear(pos) then
			local dist = lp:GetPos():Distance(pos)
            local FlashTime = 10 - dist / 300
			
			if FlashTime < 2 then
				FlashTime = 2
			end
			
			if dist > 50 and !pos:ToScreen().visible then
				FlashTime = FlashTime * 0.2
			end
			
			local time = CurTime() + FlashTime
			
			if QSWEP_FlashEndTime and QSWEP_FlashEndTime < time or !QSWEP_FlashEndTime then
				QSWEP_FlashEndTime = time
			else
				return
			end
			
			if FlashTime > 3 then
				QSWEP_FlashbangSoundID = QSWEP_FlashbangSoundID and QSWEP_FlashbangSoundID+1 or 0
				
				sound.Generate('flashbangsound'..QSWEP_FlashbangSoundID,11025,FlashTime-0.5,function(t)
					return math.sin(t*math.pi*2/11025*3500)*(1-t/(11025*(FlashTime-0.5)))/2
				end)
				
				surface.PlaySound('flashbangsound'..QSWEP_FlashbangSoundID)
			end
		end

		self:EmitSound('BaseExplosionEffect.Sound')
	else
		local l = ents.Create('light_dynamic')
		l:SetPos(self:GetPos())
		l:Spawn()
		l:SetKeyValue('_light','255 255 255')
		l:SetKeyValue('distance',10000)
		l:Fire('kill','',0.1)

		if convar:GetBool() then
			local dis = 1000
			
			for k,v in pairs(ents.FindInSphere(self:GetPos(),dis)) do
				if v:IsNPC() then
					local dist = v:GetPos():Distance(self:GetPos())
					local FlashTime = 20-dist/(dis/2)
					
					if FlashTime < 2 then
						FlashTime = 2
					end
					
					if dist > 50 then
						FlashTime = FlashTime * 0.2
					end

					local time = CurTime()+FlashTime

					if v.FlashEndTime and v.FlashEndTime < time or !v.FlashEndTime then
						v.FlashEndTime = time
						QSWEP_Flashbang[v] = v
					end
				end
			end
		end
	end
end

hook.Add('RenderScreenspaceEffects','qtg_ent_flashbang',function()
    if QSWEP_FlashEndTime then
		if QSWEP_FlashEndTime > CurTime() then
			local alpha = (QSWEP_FlashEndTime - CurTime())/4
			
			DrawMotionBlur(0.2, alpha, 0.05)
		elseif QSWEP_FlashEndTime + 0.3 > CurTime() then
			DrawMotionBlur(0.2, 0.1, 0.05)
		end
	end
end)

hook.Add('HUDPaint','qtg_ent_flashbang',function()
	if QSWEP_FlashEndTime and QSWEP_FlashEndTime > CurTime() then
		local alpha = 255 * (QSWEP_FlashEndTime - CurTime())/6
		
		surface.SetDrawColor(255,255,255,alpha)
		surface.DrawRect(0,0,ScrW(),ScrH())
	end
end)

if CLIENT then return end

hook.Add('Think','qtg_ent_flashbang',function()
	if CLIENT or !convar:GetBool() then return end

	for k,v in pairs(QSWEP_Flashbang) do
		if IsValid(v) and v.FlashEndTime then
			if v.FlashEndTime > CurTime() then
				if !v.OldDisposition then
					v.OldDisposition = {}

					for k,p in pairs(player.GetAll()) do
						v.OldDisposition[p] = v:Disposition(p)
					end
				end

				if !v.mDisposition then
					for k,p in pairs(player.GetAll()) do
						v:AddEntityRelationship(p,D_LI,99)
					end

					v.mDisposition = true
				end
			else
				for k,p in pairs(player.GetAll()) do
					if v.OldDisposition and v.OldDisposition[p] then
						v:AddEntityRelationship(p,v.OldDisposition[p],99)
					end
				end

				v.mDisposition = false
			end
		else
			QSWEP_Flashbang[k] = nil
		end
	end
end)