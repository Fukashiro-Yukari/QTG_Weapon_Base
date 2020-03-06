local SWEP = QSWEP.Base or {}

local c_crosshair = 0
local c_crosshair2 = 0
local c_cone = 0

SWEP.DrawCrosshair			= true
SWEP.IronSightsCrosshair	= false

function SWEP:CanDrawCrosshair()
	local drawply = LocalPlayer():ShouldDrawLocalPlayer()

	return (((self:GetState('zoom') and (drawply or self.IronSightsCrosshair)) or self:GetState('idle')) and !self.Inspecting and self:GetFireModeName() != 'Safety')
end

function SWEP:CanDrawCrosshair2()
	local drawply = LocalPlayer():ShouldDrawLocalPlayer()

	return self:GetState('push') and !self.Inspecting and self:GetFireModeName() != 'Safety'
end

function SWEP:DoDrawCrosshair(x,y)
	local drawply = LocalPlayer():ShouldDrawLocalPlayer()
	
	if !self.DrawCustomCrosshair then return true end
	
	if QSWEP.GetConvar('crosshair'):GetBool() then
		local pos = {x=x,y=y}
		local pos2 = self.Owner:GetEyeTrace().HitPos:ToScreen()
		local dot = QSWEP.GetConvar('crosshair_dot'):GetBool()
		local aid = QSWEP.GetConvar('crosshair_aid'):GetBool()
		
		c_cone = Lerp(math.Clamp(FrameTime()*5,0,1),c_cone or 0,self:Trajectory(self:GetCone(self.Primary),self.Primary.NoCone)*1000)
		c_crosshair = Lerp(math.Clamp(FrameTime()*15,0,1),c_crosshair or 0,self:CanDrawCrosshair() and 1 or 0)
		c_crosshair2 = Lerp(math.Clamp(FrameTime()*15,0,1),c_crosshair2 or 0,self:CanDrawCrosshair2() and 1 or 0)

		local t = util.TraceLine({
			start = self.Owner:GetShootPos(),
			endpos = self.Owner:GetShootPos()+self.Owner:GetAimVector()*self.PushHitDistance,
			filter = self.Owner,
			mask = MASK_SHOT_HULL
		})

		if drawply then
			pos = self.Owner:GetEyeTrace().HitPos:ToScreen()
		end
		
		local cr,cg,cb = QSWEP.GetCrosshairColor().r,QSWEP.GetCrosshairColor().g,QSWEP.GetCrosshairColor().b
		local ca = QSWEP.GetConvar('crosshair_a'):GetInt()
		local ccolor = Color(cr,cg,cb,ca*c_crosshair)
		local ccolord = Color(0,0,0,(ca-55)*c_crosshair)
		local bool = true

		if t.Hit then
			bool = false
		end

		local cr2,cg2,cb2 = QSWEP.GetCrosshairColor(bool).r,QSWEP.GetCrosshairColor(bool).g,QSWEP.GetCrosshairColor(bool).b
		local ccolor2 = Color(cr2,cg2,cb2,ca*c_crosshair2)
		local ccolord2 = Color(0,0,0,(ca-55)*c_crosshair2)
		
		if c_crosshair > 0 then
			if !hook.Run('QTG_PreDrawCrosshair',self,c_cone) then
				if self.Primary.EntAmmo != '' then
					local x,y,w,h = 30,60,30,1

					draw.RoundedBox(0,pos.x-2,pos.y-(y+1),h+2,w,ccolord)
					draw.RoundedBox(0,pos.x-(y+1),pos.y-2,w,h+2,ccolord)
					draw.RoundedBox(0,pos.x+(x+1),pos.y-2,w,h+2,ccolord)

					draw.RoundedBox(0,pos.x-(x+1),pos.y+29,(x+1)*2,3,ccolord)
					draw.RoundedBox(0,pos.x-(x-4),pos.y+44,(x-4)*2,3,ccolord)
					draw.RoundedBox(0,pos.x-(x-10),pos.y+59,(x-10)*2,3,ccolord)
					draw.RoundedBox(0,pos.x-(x-17),pos.y+74,(x-17)*2,3,ccolord)
					draw.RoundedBox(0,pos.x-(x-25),pos.y+89,(x-25)*2,3,ccolord)
					draw.RoundedBox(0,pos.x-1.5,pos.y+24,3,72,ccolord)

					draw.RoundedBox(0,pos.x-1,pos.y-y,h,w,ccolor)
					draw.RoundedBox(0,pos.x-y,pos.y-1,w,h,ccolor)
					draw.RoundedBox(0,pos.x+x,pos.y-1,w,h,ccolor)

					draw.RoundedBox(0,pos.x-x,pos.y+30,x*2,1,ccolor)
					draw.RoundedBox(0,pos.x-(x-5),pos.y+45,(x-5)*2,1,ccolor)
					draw.RoundedBox(0,pos.x-(x-11),pos.y+60,(x-11)*2,1,ccolor)
					draw.RoundedBox(0,pos.x-(x-18),pos.y+75,(x-18)*2,1,ccolor)
					draw.RoundedBox(0,pos.x-(x-26),pos.y+90,(x-26)*2,1,ccolor)
					draw.RoundedBox(0,pos.x-0.5,pos.y+25,1,70,ccolor)
				elseif self.Shotgun then
					draw.RoundedBox(0,pos.x-20-c_cone,pos.y-2,12,3,ccolord) --Left
					draw.RoundedBox(0,pos.x+7+c_cone,pos.y-2,12,3,ccolord) --Right
					draw.RoundedBox(0,pos.x-2,pos.y+7+c_cone,3,12,ccolord) --Bottom
	
					draw.RoundedBox(0,pos.x-19-c_cone,pos.y-1,12,1,ccolor) --Left
					draw.RoundedBox(0,pos.x+6+c_cone,pos.y-1,12,1,ccolor) --Right
					draw.RoundedBox(0,pos.x-1,pos.y+6+c_cone,1,12,ccolor) --Bottom

					draw.RoundedBox(0,pos.x-2,pos.y-20-c_cone,3,12,ccolord) --Top
					draw.RoundedBox(0,pos.x-1,pos.y-19-c_cone,1,12,ccolor) --Top
					
					if aid and !drawply then
						draw.RoundedBox(5,pos2.x-2.5,pos2.y-2.5,4,4,Color(255,0,0,ccolord.a))
					end
					
					if dot then
						draw.RoundedBox(5,pos.x-3.5,pos.y-3.5,6,6,ccolord)
						draw.RoundedBox(5,pos.x-2.5,pos.y-2.5,4,4,ccolor)
					end
				else
					draw.RoundedBox(0,pos.x-20-c_cone,pos.y-2,12,3,ccolord) --Left
					draw.RoundedBox(0,pos.x+7+c_cone,pos.y-2,12,3,ccolord) --Right
					draw.RoundedBox(0,pos.x-2,pos.y+7+c_cone,3,12,ccolord) --Bottom
	
					draw.RoundedBox(0,pos.x-19-c_cone,pos.y-1,12,1,ccolor) --Left
					draw.RoundedBox(0,pos.x+6+c_cone,pos.y-1,12,1,ccolor) --Right
					draw.RoundedBox(0,pos.x-1,pos.y+6+c_cone,1,12,ccolor) --Bottom

					if self.Primary.Automatic then
						draw.RoundedBox(0,pos.x-2,pos.y-20-c_cone,3,12,ccolord) --Top
						draw.RoundedBox(0,pos.x-1,pos.y-19-c_cone,1,12,ccolor) --Top
					end
					
					if aid and !drawply then
						draw.RoundedBox(5,pos2.x-2.5,pos2.y-2.5,4,4,Color(255,0,0,ccolord.a))
					end
					
					if dot then
						draw.RoundedBox(5,pos.x-3.5,pos.y-3.5,6,6,ccolord)
						draw.RoundedBox(5,pos.x-2.5,pos.y-2.5,4,4,ccolor)
					end
				end

				hook.Run('QTG_DrawCrosshair',self,c_cone)
			end
		end
		
		if c_crosshair2 > 0 then
			if !hook.Run('QTG_PreDrawCrosshair',self,c_cone) then
				draw.RoundedBox(0,pos.x-20,pos.y-2,40,3,ccolord2)
				draw.RoundedBox(0,pos.x-2,pos.y-10,3,20,ccolord2)

				draw.RoundedBox(0,pos.x-19,pos.y-1,38,1,ccolor2)
				draw.RoundedBox(0,pos.x-1,pos.y-9,1,18,ccolor2)

				hook.Run('QTG_DrawCrosshair',self,0)
			end
		end
		
		return true
	else
		if self:CanDrawCrosshair() then return false end
		
		return true
	end
end