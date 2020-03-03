local SWEP = QSWEP.Base or {}

local blurmat = Material('pp/blurscreen')
local c_blur = 0
local c_blur2 = 0
local blur_r = QSWEP.GetConvar('blur_reload')
local blur_d = QSWEP.GetConvar('blur_deploy')
local darkness = QSWEP.GetConVar('insp_darkness')

function SWEP:PreDrawViewModel(vm)
	c_blur = math.Approach(c_blur or 0,self.Inspecting and 1 or 0,FrameTime()*3)
	
	if c_blur > 0 then
		cam.Start2D()
			surface.SetDrawColor(255,255,255)
			surface.SetMaterial(blurmat)

			local b = 5
			local w,h = ScrW(),ScrH()

			for i = 1,b do
				blurmat:SetFloat('$blur',i*c_blur)
				blurmat:Recompute()
				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(0,0,w,h)
			end

			surface.SetDrawColor(0,0,0,darkness:GetFloat()*c_blur)
			surface.DrawRect(0,0,ScrW(),ScrH())
		cam.End2D()
	end
	
	if ((self:GetState('reload') or self:GetState('reloadcustom')) and blur_r:GetBool()) or ((self:GetState('deploy') or self:GetState('deploycustom')) and blur_d:GetBool()) then
		c_blur2 = math.Approach(c_blur2 or 0,1,FrameTime()*1.25)
	else
		c_blur2 = math.Approach(c_blur2 or 0,0,FrameTime())
	end
	
	if c_blur2 > 0 then
		cam.Start2D()
			surface.SetDrawColor(255,255,255)
			surface.SetMaterial(blurmat)

			local b = 3
			local w,h = ScrW(),ScrH()
			for i = 1, b do
				blurmat:SetFloat('$blur',i*c_blur2)
				blurmat:Recompute()
				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(0,0,w,h)
			end

		cam.End2D()
	end

	if !self.ShowViewModel then
		render.SetBlend(0)
	end
	
	if IsValid(vm) then
		vm:SetModel(self.ViewModel)

		if self.ViewModelTxd and istable(self.ViewModelTxd) and !table.IsEmpty(self.ViewModelTxd) then
			for k,v in pairs(self.ViewModelTxd) do
				k = tonumber(k)
				v = tostring(v)

				if isnumber(k) and isstring(v) and !Material(v):IsError() then
					vm:SetSubMaterial(k-1,v)
				end
			end
		end
	end
end

function SWEP:OffSkin(vm)
	if IsValid(vm) and self.ViewModelTxd and istable(self.ViewModelTxd) and !table.IsEmpty(self.ViewModelTxd) then
		for k,v in pairs(self.ViewModelTxd) do
			k = tonumber(k)

			if isnumber(k) then
				vm:SetSubMaterial(k-1,'')
			end
		end
	end
end

function SWEP:FireAnimationEvent(pos,ang,event,options)
	if event == 21 or event == 5001 then
		return true
	end

	if self.WFireEffects != '' and event == 5003 then
		return true
	end
end