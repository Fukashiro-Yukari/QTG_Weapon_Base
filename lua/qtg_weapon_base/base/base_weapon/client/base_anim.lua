local SWEP = QSWEP.Base or {}

local c_jump = 0
local c_look = 0
local c_move = 0
local c_move2 = 0
local c_sight = 0
local c_Inspect = 0
local c_runb = 0
local c_crouch = 0
local c_safety = 0
local c_runview = 0

local c_iron = 0
local c_iron2 = 0
local c_runing = 0
local c_holster = 0
local c_reload = 0
local c_luaatt = 0

local c_oang = Angle()

SWEP.InspectionPos 			= Vector(13.748,-12.551,0.303)
SWEP.InspectionAng 			= Vector(35.715,43.609,35.206)

SWEP.LuaAnimAttPos			= Vector(0,-2,0)

SWEP.CrouchingChangeAng	= true

function SWEP:GetViewModelPosition(pos,ang)
	local ct,ft = CurTime(),FrameTime()
	local iftp = game.SinglePlayer() or IsFirstTimePredicted()
	
	if self:GetState('deploycustom') then
		if (self:GetStateTime()-0.01) > ct then
			local p = (self:GetStateTime()-ct)/0.8
			ang:RotateAroundAxis(ang:Right(), -(8 * p)^2)
			ang:RotateAroundAxis(ang:Up(), -(2 * p)^2)
			ang:RotateAroundAxis(ang:Forward(), -(8 * p)^2)
		elseif self:GetStateTime() > ct then
			ang:RotateAroundAxis(ang:Right(), -64)
			ang:RotateAroundAxis(ang:Up(), -4)
			ang:RotateAroundAxis(ang:Forward(), -64)
		end
	end
	
	if iftp then
		c_holster = self:GetState('holstercustom') and Lerp(math.min(ft*2,1),c_holster,1) or 0
	end
	
	ang:RotateAroundAxis(ang:Right(),-25.768*c_holster)
	ang:RotateAroundAxis(ang:Up(),-8.435*c_holster)
	pos = pos+(self.ViewModelFlip and -10 or 10)*c_holster*ang:Right()
	pos = pos+-10.148*c_holster*ang:Forward()
	pos = pos+-15.321*c_holster*ang:Up()
	
	pos,ang = self:Sway(pos,ang,ft,iftp)
	pos,ang = self:Movement(pos,ang,ct,ft,iftp)
	
	if self.InspectionPos and self.InspectionAng then
		pos,ang	= self:Inspection(pos,ang,ft,iftp)
	end
	
	if self.IronSightsPos and self.IronSightsAng then
		pos,ang = self:Sights(pos,ang,ft,iftp)
	end
	
	if self.RunningPos and self.RunningAng then
		pos,ang = self:Run(pos,ang,ft,iftp)
	end

	if self.ReloadPos and self.ReloadAng then
		pos,ang = self:Reloading(pos,ang,ft,iftp)
	end

	pos,ang = self:LuaAnimAttf(pos,ang,ft,iftp)
	
	return pos,ang
end

function SWEP:Inspection(pos,ang,ft,iftp)
	if iftp then
		c_Inspect = Lerp(math.min(ft*8,1),c_Inspect or 0,self.Inspecting and 1 or 0)
	end
	
	local offset = self.InspectionPos
	
	if self.InspectionAng then
		ang:RotateAroundAxis(ang:Right(),self.InspectionAng.x*c_Inspect)
		ang:RotateAroundAxis(ang:Up(),self.InspectionAng.y*c_Inspect)
		ang:RotateAroundAxis(ang:Forward(),self.InspectionAng.z*c_Inspect)
	end
	
	pos = pos+offset.x*c_Inspect*ang:Right()
	pos = pos+offset.y*c_Inspect*ang:Forward()
	pos = pos+offset.z*c_Inspect*ang:Up()
	
	return pos,ang
end

function SWEP:Sights(pos,ang,ft,iftp)
	if iftp then
		local spump = true
		if self.GetSniperPumping then
			spump = self:GetSniperPumping() < CurTime()
		end

		c_iron = Lerp(math.min(ft*15,1),c_iron or 0,(self:GetState('zoom') and spump) and 1 or 0)
		c_iron2 = Lerp(math.min(ft*8,1),c_iron2 or 0,(c_iron > 0.1 and c_iron < 0.9) and 10 or 0)
	end
	
	local offset = self.IronSightsPos
	
	if self.IronSightsAng then
		ang:RotateAroundAxis(ang:Right(),self.IronSightsAng.x*c_iron)
		ang:RotateAroundAxis(ang:Up(),self.IronSightsAng.y*c_iron)
		ang:RotateAroundAxis(ang:Forward(),(self.IronSightsAng.z+(self.ViewModelFlip and -c_iron2 or c_iron2))*c_iron)
	end
	
	pos = pos+offset.x*c_iron*ang:Right()
	pos = pos+offset.y*c_iron*ang:Forward()
	pos = pos+offset.z*c_iron*ang:Up()
	
	return pos,ang
end

function SWEP:Run(pos,ang,ft,iftp)
	if iftp then
		c_runing = Lerp(math.min(ft*10,1),c_runing or 0,self:GetState('run') and !self:GetPAttacking() and !self:GetSAttacking() and self:GetNextPrimaryFire() < CurTime() and self:GetNextSecondaryFire()<CurTime() and 1 or 0)
	end
	
	local offset = self.RunningPos
	
	if self.RunningAng then
		ang:RotateAroundAxis(ang:Right(),self.RunningAng.x*c_runing)
		ang:RotateAroundAxis(ang:Up(),self.RunningAng.y*c_runing)
		ang:RotateAroundAxis(ang:Forward(),self.RunningAng.z*c_runing)
	end
	
	pos = pos+offset.x*c_runing*ang:Right()
	pos = pos+offset.y*c_runing*ang:Forward()
	pos = pos+offset.z*c_runing*ang:Up()
	
	return pos,ang
end

function SWEP:Reloading(pos,ang,ft,iftp)
	if iftp then
		c_reload = Lerp(math.min(ft*2,1),c_reload or 0,(self:GetState('reloadcustom') and self:GetStateTime() > CurTime()) and 1 or 0)
	end
	
	local offset = self.ReloadPos
	
	if self.ReloadAng then
		ang:RotateAroundAxis(ang:Right(),self.ReloadAng.x*c_reload)
		ang:RotateAroundAxis(ang:Up(),self.ReloadAng.y*c_reload)
		ang:RotateAroundAxis(ang:Forward(),self.ReloadAng.z*c_reload)
	end
	
	pos = pos+offset.x*c_reload*ang:Right()
	pos = pos+offset.y*c_reload*ang:Forward()
	pos = pos+offset.z*c_reload*ang:Up()
	
	return pos,ang
end

function SWEP:LuaAnimAttf(pos,ang,ft,iftp)
	if iftp then
		c_luaatt = Lerp(math.min(ft*10,1),c_luaatt or 0,(self.LuaAnimAtt and self:GetLuaAnimAtt() > CurTime()) and 1 or 0)
	end

	local offset = self.LuaAnimAttPos

	if self.LuaAnimAttAng then
		ang:RotateAroundAxis(ang:Right(),self.LuaAnimAttAng.x*c_reload)
		ang:RotateAroundAxis(ang:Up(),self.LuaAnimAttAng.y*c_reload)
		ang:RotateAroundAxis(ang:Forward(),self.LuaAnimAttAng.z*c_reload)
	end

	pos = pos+offset.x*c_luaatt*ang:Right()
	pos = pos+offset.y*c_luaatt*ang:Forward()
	pos = pos+offset.z*c_luaatt*ang:Up()

	return pos,ang
end

local sway = QSWEP.GetConVar('vm_sway')
function SWEP:Sway(pos,ang,ft,iftp)
	if !IsValid(self.Owner) then return pos,ang end
	if sway:GetFloat() < 0.01 then return pos,ang end

	self.c_oang = LerpAngle(math.Clamp(ft*10,0,1),self.c_oang or ang,ang)
	c_oang = LerpAngle(math.Clamp(ft*5,0,1),c_oang,self.c_oang-ang)
	c_oang.p = math.Clamp(c_oang.p,-20,20)
	c_oang.y = math.Clamp(c_oang.y,-20,20)
	c_oang.r = math.Clamp(c_oang.r,-20,20)

	c_oang = c_oang*(sway:GetFloat()*0.1)
	
	if self:GetState('zoom') then
		c_oang = c_oang/1.2
	end

	ang = self.ViewModelFlip and ang-c_oang or ang+c_oang
	
    return pos,ang
end

local bob = QSWEP.GetConVar('vm_bob')
local idle = QSWEP.GetConVar('vm_idle')
local crouch = QSWEP.GetConVar('vm_crouch')
function SWEP:Movement(pos,ang,ct,ft,iftp)
	if !IsValid(self.Owner) then return pos,ang end
	if bob:GetFloat() < 0.01 and idle:GetFloat() < 0.01 then return pos,ang end

	local s = self.Owner:GetVelocity():LengthSqr()
	local run = ((s/self.Owner:GetRunSpeed()^2)*100)/2
	local m = math.min((s*0.000001)*run,1)

	local v = self.Owner:GetVelocity():GetNormalized()
	local rd = self.Owner:GetRight():Dot(v)*20

	if iftp then
		local ftt = math.min(ft*8,1)
		c_move = Lerp(ftt,c_move or 0,self.Owner:OnGround() and m or 0)
		c_sight = Lerp(ftt, c_sight or 0,self:GetState('zoom') and self.Owner:OnGround() and 0.15 or 1)
		c_move2 = self:GetState('run') and 12 or 9

		local jump = math.Clamp(self.Owner:GetVelocity().z/120,-0.2,0.2)
		local jump2 = math.Clamp(self.Owner:GetVelocity().z/120,-2,1.5)
		c_jump = Lerp(ftt,c_jump or 0,(self.Owner:GetMoveType() == MOVETYPE_NOCLIP or self:GetState('zoom')) and jump or jump2)
		c_look = Lerp(math.Clamp(ft*5,0,1),c_look or 0,m < 0.01 and 0 or rd)
		c_runb = Lerp(math.Clamp(ft*5,0,1),c_runb or 0,m > 0.9 and 2 or 1)
		c_crouch = Lerp(math.Clamp(ft*10,0,1),c_crouch or 0,self.Owner:Crouching() and self.Owner:OnGround() and self:GetState('idle') and crouch:GetBool() and self:GetFireModeName() != 'Safety' and !self.Inspecting and 1 or 0)
		c_safety = Lerp(math.Clamp(ft*10,0,1),c_safety or 0,self:GetFireModeName() == 'Safety' and self:GetState('idle') and !self.Inspecting and 1 or 0)
		c_runview = Lerp(math.Clamp(ft*12,0,1),c_runview or 0,self.Owner:GetForward():Dot(self.Owner:EyePos():GetNormalized()))
	end

	pos = pos+1.5*c_jump*ang:Up()
	pos = pos+-(2*c_jump)*ang:Forward()
	ang.p = ang.p+(c_jump or 0)*6
	ang.r = ang.r+(self.ViewModelFlip and -(c_jump or 0) or (c_jump or 0))*10
	ang.r = ang.r+(self.ViewModelFlip and -(c_look/2) or c_look/2)

	if c_runview != 0 then
		ang.p = ang.p+-65*c_runview*c_runing

		pos = pos+-15*c_runview*c_runing*ang:Forward()
		pos = pos+-5*c_runview*c_runing*ang:Up()
	end

	if c_safety > 0 then
		ang.p = ang.p+15*c_safety
	end

	if self.CrouchingChangeAng and c_crouch > 0 and (self.Base == 'qtg_weapon_base' or self.Base == 'qtg_weapon_sniper_base') then
		pos = pos+(self.ViewModelFlip and 5 or -5)*c_crouch*ang:Right()
		pos = pos+5*c_crouch*ang:Forward()
		pos = pos+-8*c_crouch*ang:Up()

		ang.r = ang.r+(self.ViewModelFlip and 45 or -45)*c_crouch
	end

	if bob:GetFloat() > 0 and c_move > 0 then
		ang.y = ang.y+math.sin(ct*c_move2)*(0.5*c_runb)*c_move*c_sight*bob:GetFloat()
		ang.p = ang.p+math.sin(ct*(c_move2*2))*(1.5*c_runb)*c_move*c_sight*bob:GetFloat()
		ang.r = ang.r+-(math.cos(ct*c_move2)*(1.2*c_runb)*c_move*c_sight*bob:GetFloat())

		pos = pos+(math.sin(ct*c_move2)*(0.9*c_runb)*c_move*c_sight*bob:GetFloat())*ang:Right()
		pos = pos+(math.sin(ct*(c_move2*2))*(0.6*c_runb)*c_move*c_sight*bob:GetFloat())*ang:Up()
		pos = pos+-(2*c_move*c_sight*bob:GetFloat())*ang:Forward()
	end

	if idle:GetFloat() > 0 then
		local p = (1-c_move)*c_sight*idle:GetFloat()
		
		ang.p = ang.p + math.sin(ct*0.5)*1*p
		ang.y = ang.y + math.sin(ct*1)*0.5*p
		ang.r = ang.r + math.sin(ct*2)*0.25*p
	end
	
	return pos,ang
end

function SWEP:GetZoomFov()
	if self.GetZoomLvl then
		if self.ZoomLevels and self.ZoomLevels[self:GetZoomLvl()] then
			return self.ZoomLevels[self:GetZoomLvl()]
		end
	end

    return self.ZoomFov
end

local v_zoom,v_run,v_look,v_tilt,v_vm = 0,0,0,QSWEP.GetConVar('view_tilt'),Angle(0,0,0)

function SWEP:CalcView(ply,pos,ang,fov)
	if LocalPlayer():ShouldDrawLocalPlayer() then return end
	
	local ft,ct = FrameTime(),CurTime()
	local intensity = 1
	local p,y = 0,0
	local s = self.Owner:GetVelocity():LengthSqr()
	local run = ((s/self.Owner:GetRunSpeed()^2)*100)/2
	local m = math.min((s*0.000001)*run,1)
	local att = IsValid(self.__vm) and self.__vm:GetAttachment(1) or nil

	if self.ReloadViewBob or self.DeployViewBob then
		if ((self:GetState('reload') and (self:GetStateTime()-0.3) > ct and self.ReloadViewBob) or ((self:GetState('deploy') or self:GetState('deploycustom')) and self.DeployViewBob)) and !self:GetState('holster') then
			local bool = true
			local bool2 = true

			if !att then
				att = self.Owner:GetAttachment(self.WFireEffectsAtt)
				bool2 = false

				if !att then
					bool = false
				end
			end

			if bool then
				if self:GetState('deploy') and (self:GetStateTime()-0.05) > ct and !bool2 then
				else
					v_vm = LerpAngle(ft*8,v_vm,(ang-(att.Ang+((self:GetState('reload') and (self:GetStateTime()-0.3) > ct) and self.ReloadViewBobAng or self.DeployViewBobAng)))*0.05)
				end
			end
		else
			v_vm = LerpAngle(ft*10,v_vm,Angle(0,0,0))
		end

		ang:RotateAroundAxis(ang:Right(),v_vm.p)
		ang:RotateAroundAxis(ang:Up(),v_vm.r)
		ang:RotateAroundAxis(ang:Forward(),v_vm.p+v_vm.r)
	end

	local rd = self.Owner:GetRight():Dot(self.Owner:GetVelocity():GetNormalized())*5*v_tilt:GetFloat()
	v_look = Lerp(math.Clamp(ft*5,0,1),v_look or 0,m < 0.01 and 0 or rd)
	ang.r = ang.r+v_look

	local spump = true
	if self.GetSniperPumping then
		spump = self:GetSniperPumping() < CurTime()
	end

	v_zoom = Lerp(ft * 10,v_zoom,self:GetState('zoom') and !self:GetState('run') and !self:GetState('reload') and !self:GetState('reloadcustom') and spump and self:GetZoomFov() or 0)
	v_run = Lerp(ft * 5,v_run,self:GetState('run') and self.Owner:OnGround() and !self:GetState('reload') and !self:GetState('reloadcustom') and 10 or 0)
	return pos,ang,fov+v_run-v_zoom
end