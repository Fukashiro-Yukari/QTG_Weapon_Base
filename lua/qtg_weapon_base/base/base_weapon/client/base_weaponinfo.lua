local SWEP = QSWEP.Base or {}

SWEP.WepSelectIcon			= surface.GetTextureID('weapons/swep')
SWEP.SpeechBubbleLid		= surface.GetTextureID('gui/speech_lid')

SWEP.DrawWeaponInfoBox		= false
SWEP.BounceWeaponIcon		= true
SWEP.OldBounceWeaponIcon	= false

SWEP.WeaponInfoDisplayAmmo	= true
SWEP.WeaponInfoType			= 0
SWEP.WeaponInfoModelCustom	= ''
SWEP.WeaponInfoModelSize	= 45
SWEP.WeaponInfoFontCustom	= 'QTG_HL2SelectIcons'
SWEP.WeaponIconFontScanLines= 'QTG_HL2SelectIcons2'
SWEP.WeaponInfoFontIcon		= 'd'
SWEP.WeaponInfoFontColor	= Color(255,210,0)
SWEP.WeaponInfoPNGCustom	= ''
SWEP.WeaponInfoColor		= Color(100,100,100)
SWEP.WeaponInfoTitleColor	= Color(0,0,255)
SWEP.WeaponInfoTextColor	= Color(0,0,0)

local function CheckModel(a)
	if file.Exists(a,'GAME') then
		return a
	end
	
	return 'models/error.mdl'
end

SWEP.MaterialErrer = false
local function CheckMaterial(self,a)
	if self.MaterialErrer then
		return 'icon16/gun.png'
	end
	
	if Material(a):IsError() and !self.MaterialErrer then
		self.MaterialErrer = true
		Msg('Warning: WeaponIcon not found "'..a..'"\n')
		return 'icon16/gun.png'
	end
	
	return a
end

local wepinfot = {
	function(self,x,y,wide,tall,alpha,fsin)
		if !IsValid(QSWEP.WepModelInfo) then
			QSWEP.WepModelInfo = ClientsideModel(self.WeaponInfoModelCustom != '' and self.WeaponInfoModelCustom or CheckModel(self.WorldModel),RENDER_GROUP_OPAQUE_ENTITY)

			if IsValid(QSWEP.WepModelInfo) then
				QSWEP.WepModelInfo:SetNoDraw(true)
				QSWEP.WepModelInfo:SetColor(Color(0,0,255))
			end
		else
			QSWEP.WepModelInfo:SetModel(self.WeaponInfoModelCustom != '' and self.WeaponInfoModelCustom or CheckModel(self.WorldModel))
			QSWEP.WepModelInfo:SetColor(Color(0,0,255))
			
			local size = self.WeaponInfoModelSize
			local vec = Vector(size,size,size)
			local ang = Vector(-size,-size,-size):Angle()
			
			cam.Start3D(vec,ang,20,x,y+35,wide,tall,5,4096)
				cam.IgnoreZ(true)

				render.SuppressEngineLighting(true)
				render.SetLightingOrigin(self:GetPos())
				render.ResetModelLighting(50/255,50/255,50/255)
				render.SetColorModulation(1,1,1)
				render.SetBlend(alpha/255)
				render.SetModelLighting(4,1,1,1)

				QSWEP.WepModelInfo:SetRenderAngles(Angle(0,RealTime()*30%360,0))
				QSWEP.WepModelInfo:DrawModel()
				QSWEP.WepModelInfo:SetRenderAngles()

				render.SetColorModulation(1,1,1)
				render.SetBlend(1)
				render.SuppressEngineLighting(false)
				
				cam.IgnoreZ(false)
			cam.End3D()
		end
	end,
	function(self,x,y,wide,tall,alpha,fsin)
		local color = self.WeaponInfoFontColor
		local color2 = Color(color.r,color.g,color.b,math.Rand(10,120))
		local fx,fy = x+wide/2,self.OldBounceWeaponIcon and y+tall*0.10 or y+tall*0.10-fsin

		if QSWEP.__scanlinesfont[self.WeaponInfoFontCustom] then
			draw.SimpleText(self.WeaponInfoFontIcon,self.WeaponInfoFontCustom..'2',fx,fy,color,TEXT_ALIGN_CENTER)
		elseif self.WeaponIconFontScanLines != 'QTG_HL2SelectIcons2' then
			draw.SimpleText(self.WeaponInfoFontIcon,self.WeaponIconFontScanLines,fx,fy,color,TEXT_ALIGN_CENTER)
		end

		draw.SimpleText(self.WeaponInfoFontIcon,self.WeaponInfoFontCustom,fx,fy,color,TEXT_ALIGN_CENTER)
		
		if self.OldBounceWeaponIcon then
			draw.SimpleText(self.WeaponInfoFontIcon,self.WeaponInfoFontCustom,x+wide/2+math.Rand(-4,4),y+tall*0.10+math.Rand(-14,14),color2,TEXT_ALIGN_CENTER)
			draw.SimpleText(self.WeaponInfoFontIcon,self.WeaponInfoFontCustom,x+wide/2+math.Rand(-4,4),y+tall*0.10+math.Rand(-9,9),color2,TEXT_ALIGN_CENTER)
		end
	end,
	function(self,x,y,wide,tall,alpha,fsin)
		local mat = CheckMaterial(self,self.WeaponInfoPNGCustom != '' and self.WeaponInfoPNGCustom or 'entities/'..self.ClassName..'.png')

		if !self.__oldweppngicon or self.__oldweppngicon != mat then
			self.__oldweppngicon = mat

			self.__weppngiconmat = Material(mat)
		end

		surface.SetDrawColor(255,255,255,alpha)
		surface.SetMaterial(self.__weppngiconmat)

		if self.OldBounceWeaponIcon then
			surface.DrawTexturedRect(x+wide/4+0.5+fsin,y-fsin,wide/2-fsin*2,(wide/2)+fsin)
		else
			surface.DrawTexturedRect(x+wide/4+0.5,y-fsin,wide/2,wide/2)
		end
	end
}

function SWEP:DrawWeaponSelection(x,y,wide,tall,alpha)
	y = y + 10
	x = x + 10
	wide = wide - 20
	tall = tall - 20
	
	self:PrintWeaponInfo(x+wide+20,y+tall*0.95,alpha-50)

	if !hook.Run('QTG_PreDrawWeaponSelection',self,x,y,wide,tall,alpha,fsin) then
		local fsin = self.BounceWeaponIcon and (self.OldBounceWeaponIcon and math.sin(CurTime()*10)*5 or math.sin(CurTime()*5)*10) or 0

		if wepinfot[self.WeaponInfoType] then
			wepinfot[self.WeaponInfoType](self,x,y,wide,tall,alpha,fsin)
		else
			if !isnumber(self.WepSelectIcon) then
				self.WepSelectIcon = surface.GetTextureID(self.WepSelectIcon)
			end

			surface.SetDrawColor(255,255,255,alpha)
			surface.SetTexture(self.WepSelectIcon)
			
			if self.OldBounceWeaponIcon then
				surface.DrawTexturedRect(x+fsin,y-fsin,wide-fsin*2,(wide/2)+fsin)
			else
				surface.DrawTexturedRect(x,y-fsin,wide,wide/2)
			end
		end

		hook.Run('QTG_DrawWeaponSelection',self,x,y,wide,tall,alpha,fsin)
	end
	
	if self.Primary.CanUse and !self.Primary.NoAmmo and self.WeaponInfoDisplayAmmo and IsValid(self.Owner) then
		local color = Color(255,0,0,alpha)
		local Text = ''
		
		if self.Primary.ClipSize > 0 then
			color = self:Clip1()/self.Primary.ClipSize > 0.25 and Color(255,230,0,alpha) or Color(255,0,0,alpha)
			Text = (self.Chambering and self:Clip1() > self.Primary.ClipSize and self.Primary.ClipSize..'+'..self:Clip1()-self.Primary.ClipSize or self:Clip1())..'/'..self:Ammo1()
		elseif self:Ammo1() > 0 then
			color = self:Ammo1() >= 2 and Color(255,230,0,alpha) or Color(255,0,0,alpha)
			Text = self:Ammo1()
		end
		
		draw.SimpleText(Text,'HudSelectionText',x+wide/2,y+tall-(tall/9),color,TEXT_ALIGN_CENTER,TEXT_ALIGN_BOTTOM)
	end
end

function SWEP:PrintWeaponInfo(x,y,alpha)
	if !self.DrawWeaponInfoBox then return end
	
	if self.InfoMarkup == nil then
		local str
		local title_color = '<color='..self.WeaponInfoTitleColor.r..','..self.WeaponInfoTitleColor.g..','..self.WeaponInfoTitleColor.b..',255>'
		local text_color = '<color='..self.WeaponInfoTextColor.r..','..self.WeaponInfoTextColor.g..','..self.WeaponInfoTextColor.b..',255>'
		
		str = '<font=HudSelectionText>'
		
		if self.Author != '' then
			str=str ..title_color..'Author:</color>\t'..text_color..self.Author..'</color>\n'
		else
			str=str..title_color..'Base Author:</color>\t'..text_color..'Neptune QTG</color>\n'
		end
		
		if self.Contact != '' then str=str ..title_color..'Contact:</color>\t'..text_color..self.Contact..'</color>\n\n' end
		if self.Purpose != '' then str=str ..title_color..'Purpose:</color>\n'..text_color..self.Purpose..'</color>\n\n' end
		if self.Instructions != '' then str=str..title_color..'Instructions:</color>\n'..text_color..self.Instructions..'</color>\n' end
		
		str = str .. '</font>'
		self.InfoMarkup = markup.Parse(str,250)
	end
	
	surface.SetDrawColor(self.WeaponInfoColor.r,self.WeaponInfoColor.g,self.WeaponInfoColor.b,alpha)
	surface.SetTexture(self.SpeechBubbleLid)
	surface.DrawTexturedRect(x,y-64-5,128,64)
	draw.RoundedBox(8,x-5,y-6,260,self.InfoMarkup:GetHeight()+18,Color(self.WeaponInfoColor.r,self.WeaponInfoColor.g,self.WeaponInfoColor.b,alpha))
	self.InfoMarkup:Draw(x+5,y+5,nil,nil,alpha)
end