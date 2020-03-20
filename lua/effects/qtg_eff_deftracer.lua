EFFECT.Mat = Material('effects/yellowflare')

function EFFECT:Init(d)
	self.StartPos = d:GetStart()
	self.EndPos = d:GetOrigin()
	self.Ent = d:GetEntity()

	local e = d:GetEntity()
	local a = d:GetAttachment()

	if IsValid(e) and a > 0 then
		local p = LocalPlayer()
		
		if e.Owner == p and !p:GetViewModel() != LocalPlayer() and !p:ShouldDrawLocalPlayer() then
			if e.GetViewModel then
				e = e:GetViewModel()
			elseif IsValid(e.Owner) then
				e = e.Owner:GetViewModel()
			end
		end

		local a = e:GetAttachment(a)
		if a then
			if !game.SinglePlayer() then
				self.StartPos = a.Pos+Vector(0,0,1)
			else
				self.StartPos = a.Pos
			end

			if IsValid(self.Ent) and isfunction(self.Ent.GetSilencer) and self.Ent:GetSilencer() then
				self.StartPos = self.StartPos+a.Ang:Forward()*4
			end
		end
	end

	self.Dir = self.EndPos-self.StartPos
	self.Length = self.Dir:Length()
	self:SetRenderBoundsWS(self.StartPos,self.EndPos)
	self.Dir:Normalize()
	self.TracerTime = 0.00025*self.Length
	self.DieTime = CurTime()+self.TracerTime
end

function EFFECT:Think()
	if CurTime() > self.DieTime then
		return false
	end

	return true
end

function EFFECT:Render()
	local fDelta = (self.DieTime-UnPredictedCurTime())/self.TracerTime
	fDelta = 1-math.Clamp(fDelta,0,1)

	render.SetMaterial(self.Mat)

	local color = Color(255,255,255,255)

	render.DrawBeam(self.StartPos+self.Dir*self.Length*fDelta,self.StartPos+self.Dir*self.Length*fDelta+self.Dir*20,1,0.5,0.5,color)
end
