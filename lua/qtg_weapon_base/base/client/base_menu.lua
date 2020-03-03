local QSWEPC = {}

local function ServerOption(p)
	p:CheckBox('Enable Ironsights','sv_qswep_ironsights')
	p:CheckBox('Enable Hold Ironsights','sv_qswep_holdironsights')
	p:CheckBox('Enable Changelog','sv_qswep_changelog')
	p:CheckBox('Enable Running','sv_qswep_running')
	p:CheckBox('Enable Reload','sv_qswep_reload')
	p:CheckBox('Use (+attack3) for alt fire','sv_qswep_altatt_key')
	p:CheckBox('Flashbang affect npc','sv_qswep_flashbang_affect_npc')
	p:CheckBox('Smokegrenade affect npc','sv_qswep_smokegrenade_affect_npc')
end

local function BulletOption(p)
	p:CheckBox('Enable Bullet Ricochet','sv_qswep_ricochet')
	p:CheckBox('Enable Bullet Renetration','sv_qswep_penetration')
	p:CheckBox('Enable Bullet Air Diffusion','sv_qswep_spreadinair')
end

local function HudOption(p)
	p:Help('--HUD Options--')

	p:CheckBox('Enable Custom HUD','cl_qswep_custom_hud')

	p:AddControl('color',{
		label = 'Custom HUD Color',
		red = 'cl_qswep_custom_hud_r',
		green = 'cl_qswep_custom_hud_g',
		blue = 'cl_qswep_custom_hud_b'
	})

	p:Help('--C-MENU Options--')

	p:CheckBox('Enable Custom C-MENU','cl_qswep_custom_menu')

	p:AddControl('Numpad',{
		Label = 'Custom C-MENU Key',
		Command = 'cl_qswep_custom_menu_key'
	})

	p:Help('--Crosshair Options--')

	p:CheckBox('Enable Custom Crosshair','cl_qswep_crosshair')
	p:CheckBox('Enable Crosshair Dot','cl_qswep_crosshair_dot')
	p:CheckBox('Enable Crosshair Aiming aid','cl_qswep_crosshair_aid')

	p:AddControl('color',{
		label = 'Ccrosshair Color',
		red = 'cl_qswep_crosshair_r',
		green = 'cl_qswep_crosshair_g',
		blue = 'cl_qswep_crosshair_b',
		alpha = 'cl_qswep_crosshair_a'
	})

	p:CheckBox('Enable Team Crosshair Color','cl_qswep_crosshair_team')

	p:AddControl('color',{
		label = 'Ccrosshair Friendly Color',
		red = 'cl_qswep_crosshair_good_r',
		green = 'cl_qswep_crosshair_good_g',
		blue = 'cl_qswep_crosshair_good_b'
	})

	p:AddControl('color',{
		label = 'Ccrosshair Enemy Color',
		red = 'cl_qswep_crosshair_bad_r',
		green = 'cl_qswep_crosshair_bad_g',
		blue = 'cl_qswep_crosshair_bad_b'
	})

	p:Help('--Blur Options--')

	p:CheckBox('Enable blur when reload','cl_qswep_blur_reload')
	p:CheckBox('Enable blur when deploy','cl_qswep_blur_deploy')

	p:Help('--Inspect Menu Options--')

	p:AddControl('color',{
		label = 'Inspect Menu Name Color',
		red = 'cl_qswep_insp_color_r',
		green = 'cl_qswep_insp_color_g',
		blue = 'cl_qswep_insp_color_b'
	})

	p:AddControl('color',{
		label = 'Inspect Menu Text Color',
		red = 'cl_qswep_insp_color2_r',
		green = 'cl_qswep_insp_color2_g',
		blue = 'cl_qswep_insp_color2_b'
	})

	p:AddControl('color',{
		label = 'Inspect Menu Category Color',
		red = 'cl_qswep_insp_color3_r',
		green = 'cl_qswep_insp_color3_g',
		blue = 'cl_qswep_insp_color3_b'
	})

	p:AddControl('color',{
		label = 'Inspect Menu Instructions Color',
		red = 'cl_qswep_insp_color4_r',
		green = 'cl_qswep_insp_color4_g',
		blue = 'cl_qswep_insp_color4_b'
	})

	p:AddControl('color',{
		label = 'Inspect Menu information Color',
		red = 'cl_qswep_insp_color5_r',
		green = 'cl_qswep_insp_color5_g',
		blue = 'cl_qswep_insp_color5_b'
	})

	p:AddControl('color',{
		label = 'Inspect Menu Infographic Color',
		red = 'cl_qswep_insp_color6_r',
		green = 'cl_qswep_insp_color6_g',
		blue = 'cl_qswep_insp_color6_b'
	})

	p:NumSlider('Darkness in inspection','cl_qswep_insp_darkness',0,255)
end

local function VMOption(p)
	p:NumSlider('Gun Bob Intensity','cl_qswep_vm_bob',0,2)
	p:NumSlider('Gun Idle Intensity','cl_qswep_vm_idle',0,2)
	p:NumSlider('Gun Sway Intensity','cl_qswep_vm_sway',0,10)
	p:NumSlider('Gun Tilt strength','cl_qswep_view_tilt',0,2)

	p:CheckBox('Change angle after crouching','cl_qswep_vm_crouch')
end

local function Version(p)
	p:Button('Changelog','cl_qswep_OpenChangelogMenu')
	p:Help('Version: '..QSWEP.Version)
end

local id = 0
local function addoption(n,f)
	id = id+1

	spawnmenu.AddToolMenuOption('Options','QTG Weapon Base','QTG_Base_Settings_'..id,n,'','',f)
end

function QSWEP.AddOption()
	addoption('Admin / Server',ServerOption)
	addoption('Bullet',BulletOption)
	addoption('HUD / Crosshair',HudOption)
	addoption('Viewmodel',VMOption)
	addoption('Version',Version)
end

hook.Add('PopulateToolMenu','QTG_Base_Settings',QSWEP.AddOption)

local w,h = 480,460
local menubg = Color(0,0,255,120)
local menupr = Color(80,20,30,120)
local menucbg = Color(150,150,150,255)
local titlec = Color(0,0,0,255)
local contentc = Color(0,0,0,255)

local menuname = 'QTG Weapon Base Changelog | Version: '..QSWEP.Version
local menunamec = Color(255,255,255,255)

function QSWEPC:Init()
	local p = LocalPlayer()
	w,h = 480,460
	self:SetSize(1000,1000)
	self:Center()
	self:MakePopup()
	self:SetKeyboardInputEnabled(false)

	local frame = self:Add('DPanel')
	frame:SetSize(500,500)
	frame:Center()
	frame.Paint = function(self,w,h)
		surface.SetDrawColor(menubg)
		surface.DrawRect(0,0,w,h)
	end

	local label_choose = frame:Add('DLabel')
	label_choose:SetFont('QTG_ChangelogMenu')
	label_choose:SetText(menuname)
	label_choose:SetSize(480,20)
	label_choose:SetTextColor(menunamec)
	label_choose:SetPos(0,5)
	label_choose:CenterHorizontal()

	local CloseButton = frame:Add('DButton')
	CloseButton:SetPos(479,2)
	CloseButton:SetFont('marlett')
	CloseButton:SetText('r')

	CloseButton.Paint = function(self,w,h)
		if CloseButton:IsHovered() then
			surface.SetDrawColor(menupr)
			surface.DrawRect(0,0,w,h)
		end
	end

	CloseButton:SetColor(Color(255,255,255))
	CloseButton:SetSize(20,20)
	CloseButton.DoClick = function()
		self:Remove()
	end

	local frame2 = frame:Add('DPanel')
	frame2:SetSize(480,460)
	frame2:Center()
	frame2:CenterVertical(0.52)

	frame2.Paint = function(self,w,h)
		surface.SetDrawColor(menubg)
		surface.DrawRect(0,0,w,h)
	end

	local Scroll = frame2:Add('DScrollPanel')

	Scroll:Dock(FILL)

	local sbar = Scroll:GetVBar()
	local sbar2 = Scroll

	function sbar:Paint(w,h)
		draw.RoundedBox(3,5,0,w-5,h,menubg)
	end

	function sbar.btnUp:Paint(w,h)
		draw.RoundedBox(3,5,0,w-5,h-5,menubg)
	end

	function sbar.btnDown:Paint(w,h)
		draw.RoundedBox(3,5,5,w-5,h-5,menubg)
	end

	function sbar.btnGrip:Paint(w,h)
		draw.RoundedBox(3,5,0,w-5,h,menupr)
		
		if self.Hovered then
			draw.RoundedBox(3,5,0,w-5,h,menupr)
		end

		if self.Depressed then
			draw.RoundedBox(3,5,0,w-5,h,Color(60,0,100))
		end
	end

	self.frame = Scroll:Add('DPanel')
	self.frame:SetPos(0,0)
	
	self.frame.Paint = function(self,w,h)
		surface.SetDrawColor(menucbg)
		surface.DrawRect(0,0,w,h)
	end

	self:ChangelogMenu()
end

local function rtbl(t)
	local tbl = {}
	local k = #t

	for i = 1,#t do
		k = k-1
		tbl[i] = t[k]
	end

	return tbl
end

function QSWEPC:ChangelogMenu()
	local x,y = 5,0

	local t = table.Reverse(QSWEP.Changelog)
	for k,v in ipairs(t) do
		y = y+10
		x = 5

		local title = self.frame:Add('DLabel')
		title:SetPos(x,y)
		title:SetFont('QTG_Changelogtitle')
		title:SetTextColor(titlec)
		title:SetText(v.id)
		title:SizeToContents()

		y = y+25

		for k,v in ipairs(t[k].c) do
			x = 20

			local content = self.frame:Add('DLabel')
			content:SetPos(x,y)
			content:SetFont('QTG_Changelogcontent')
			content:SetTextColor(contentc)
			content:SetText(k..'. '..v)
			content:SizeToContents()

			y = y+20
		end
	end

	self.frame:SetSize(w,math.max(h,y))
end

vgui.Register('QSWEP_ChangelogMenu',QSWEPC)

function QSWEP:OpenChangelogMenu()
	if IsValid(qswepc) then
		if !qswepc:IsVisible() then
			qswepc:Show()
		end
	else
		qswepc = vgui.Create('QSWEP_ChangelogMenu')
	end
end

concommand.Add('cl_qswep_OpenChangelogMenu',function(p,c,a)
	QSWEP:OpenChangelogMenu()
end)

local HoldTypeList = {
	['pistol'] = 'Pistol',
	['smg'] = 'Sub-Machine Gun',
	['grenade'] = 'Grenade',
	['ar2'] = 'Rifle',
	['shotgun'] = 'Shotgun',
	['rpg'] = 'RPG',
	['physgun'] = 'Physgun',
	['crossbow'] = 'Crossbow',
	['melee'] = 'Melee',
	['slam'] = 'SLAM',
	['fist'] = 'Fist',
	['melee2'] = 'Melee',
	['knife'] = 'Melee',
	['duel'] = 'Duel Pistol',
	['camera'] = 'Camera',
	['magic'] = 'Fist',
	['revolver'] = 'Revolver',
}

if IsValid(QSWEP.InspectMenu) then
	QSWEP.InspectMenu:Remove()
end

local p = {}

function p:Init()
	self.Ammo2 = self:Add('DLabel')
	self.Ammo2:SetFont('QTG_InspectCat')
	self.Ammo2:SetTextColor(Color(0,255,255,255))
    self.Ammo2:Dock(BOTTOM)
    self.Ammo2:DockMargin(30,0,0,30)
	self.Ammo2:SetContentAlignment(4)
	self.Ammo2:SizeToContents()

	self.Clip2 = self:Add('DLabel')
	self.Clip2:SetFont('QTG_InspectCat')
	self.Clip2:SetTextColor(Color(0,255,255,255))
    self.Clip2:Dock(BOTTOM)
    self.Clip2:DockMargin(30,0,0,0)
	self.Clip2:SetContentAlignment(4)
	self.Clip2:SizeToContents()

	self.Ammo1 = self:Add('DLabel')
	self.Ammo1:SetFont('QTG_InspectCat')
	self.Ammo1:SetTextColor(Color(0,255,255,255))
    self.Ammo1:Dock(BOTTOM)
	self.Ammo1:DockMargin(30,0,0,0)
	self.Ammo1:SetContentAlignment(4)
	self.Ammo1:SizeToContents()

	self.Clip1 = self:Add('DLabel')
	self.Clip1:SetFont('QTG_InspectCat')
	self.Clip1:SetTextColor(Color(0,255,255,255))
    self.Clip1:Dock(BOTTOM)
	self.Clip1:DockMargin(30,0,0,0)
	self.Clip1:SetContentAlignment(4)
	self.Clip1:SizeToContents()

	self.Author = self:Add('DLabel')
	self.Author:SetFont('QTG_InspectCat')
	self.Author:SetTextColor(Color(0,255,255,255))
    self.Author:Dock(BOTTOM)
	self.Author:DockMargin(30,0,0,0)
	self.Author:SetContentAlignment(4)
	self.Author:SetExpensiveShadow(2,Color(0,0,0,200))
	self.Author:SizeToContents()

	self.Cat = self:Add('DLabel')
	self.Cat:SetFont('QTG_InspectCat')
	self.Cat:SetTextColor(Color(0,255,255,255))
    self.Cat:Dock(BOTTOM)
    self.Cat:DockMargin(0,0,0,250)
    self.Cat:SizeToContents()
	self.Cat:SetContentAlignment(5)

	self.PrintName2 = self:Add('DLabel')
	self.PrintName2:SetFont('QTG_InspectName2')
	self.PrintName2:SetTextColor(Color(255,255,255,255))
    self.PrintName2:Dock(BOTTOM)
    self.PrintName2:DockMargin(0,0,0,30)
    self.PrintName2:SizeToContents()
	self.PrintName2:SetContentAlignment(5)
	self.PrintName2:SetExpensiveShadow(3,Color(0,0,0,200))
	
	self.PrintName = self:Add('DLabel')
	self.PrintName:SetFont('QTG_InspectName')
	self.PrintName:SetTextColor(Color(255,255,255,255))
    self.PrintName:Dock(BOTTOM)
    self.PrintName:DockMargin(0,0,0,-5)
	self.PrintName:SizeToContents()
	self.PrintName:SetContentAlignment(5)
	self.PrintName:SetExpensiveShadow(3,Color(0,0,0,200))

	self.Instructions = self:Add('DPanel')
	self.Instructions:SetPos(ScrW()-530,ScrH()-500)
	self.Instructions:SetSize(500,ScrH()-600)

	self.Instructions.Paint = function(me,w,h)
		if IsValid(me.Text) then
			surface.SetDrawColor(0,0,0,200)
			surface.DrawRect(0,0,w,h)
		end
	end

	self.h_Inspect = 0
end

function p:Setup(w,p)
	self.wep = w
	self.p = p
end

local color
local color2
local color3
local color4

function p:Think()
	if !IsValid(self.wep) then
		self:Remove()

		return
	end

	if !IsValid(self.p) or !IsValid(self.wep) then return self:Remove() end
	if self.p != self.wep.Owner then
		self:Remove()

		return
	end

	local w = self.wep

	self.h_Inspect = Lerp(math.Clamp(FrameTime()*10,0,1),self.h_Inspect or 0,w.Inspecting and 1 or 0)

	if self.h_Inspect < 0.1 then
		self:Hide()
	end

	local ammotype,ammotype2 = w.Primary.Ammo,w.Secondary.Ammo
	local typetext,type2text = language.GetPhrase(ammotype..'_ammo'),language.GetPhrase(ammotype2..'_ammo')
	local colorb = gui.IsGameUIVisible() and 0 or 1
	local dcolor = Color(0,0,0,200*self.h_Inspect*colorb)

	color = QSWEP.GetConVarColor('insp_color')
	color2 = QSWEP.GetConVarColor('insp_color2')
	color3 = QSWEP.GetConVarColor('insp_color3')
	color4 = QSWEP.GetConVarColor('insp_color4')

	color.a = 255*self.h_Inspect*colorb
	color2.a = 255*self.h_Inspect*colorb
	color3.a = 255*self.h_Inspect*colorb

	if HoldTypeList[w.HoldType] or w.WeaponType then
		self.PrintName2:SetText(w.WeaponType != '' and w.WeaponType or HoldTypeList[w.HoldType])
		self.PrintName2:SetTextColor(color)
		self.PrintName2:SetExpensiveShadow(3,dcolor)
	end

	if !self.oldPrintName or self.oldPrintName != w.PrintName then
		self.oldPrintName = w.PrintName

		self.PrintName:SetText(self.oldPrintName)
	end

	self.PrintName:SetTextColor(color)
	self.PrintName:SetExpensiveShadow(3,dcolor)

	if !self.oldCat or self.oldCat != (w.Category or 'Other') then
		self.oldCat = w.Category or 'Other'

		self.Cat:SetText(self.oldCat)
	end

	self.Cat:SetTextColor(color3)
	self.Cat:SetExpensiveShadow(2,dcolor)

	self.Author:SetText(w.Author != '' and 'Author: '..w.Author or 'Base Author: Neptune QTG')
	self.Author:SetTextColor(color2)
	self.Author:SetExpensiveShadow(2,dcolor)

	if w:Clip1() >= 0 then
		self.Clip1:SetText('Capacity: '..(w.Chambering and (w.Akimbo and w.Primary.ClipSize..' + 2 Rounds' or w.Primary.ClipSize..' + 1 Rounds') or w.Primary.ClipSize..' Rounds'))
		self.Clip1:SizeToContents()
	else
		self.Clip1:SetText('')
		self.Clip1:SetHeight(0)
	end

	self.Clip1:SetTextColor(color2)
	self.Clip1:SetExpensiveShadow(2,dcolor)

	if w:GetPrimaryAmmoType() != -1 then
		self.Ammo1:SetText('Ammo: '..typetext)
		self.Ammo1:SizeToContents()
	else
		self.Ammo1:SetText('')
		self.Ammo1:SetHeight(0)
	end

	self.Ammo1:SetTextColor(color2)
	self.Ammo1:SetExpensiveShadow(2,dcolor)

	if w:Clip2() >= 0 then
		self.Clip2:SetText('ALT-Capacity: '..(w.Chambering and (w.Akimbo and w.Secondary.ClipSize..' + 2 Rounds' or w.Secondary.ClipSize..' + 1 Rounds') or w.Secondary.ClipSize..' Rounds'))
		self.Clip2:SizeToContents()
	else
		self.Clip2:SetText('')
		self.Clip2:SetHeight(0)
	end

	self.Clip2:SetTextColor(color2)
	self.Clip2:SetExpensiveShadow(2,dcolor)

	if w:GetSecondaryAmmoType() != -1 then
		self.Ammo2:SetText('ALT-Ammo: '..type2text)
		self.Ammo2:SizeToContents()
	else
		self.Ammo2:SetText('')
		self.Ammo2:SetHeight(0)
	end

	self.Ammo2:SetTextColor(color2)
	self.Ammo2:SetExpensiveShadow(2,dcolor)

	if IsValid(self.Instructions) then
		if w.Instructions != '' and w.Inspecting then
			if !IsValid(self.Instructions.Text) then
				self.Instructions.Text = self.Instructions:Add('RichText')
				self.Instructions.Text:Dock(FILL)
				self.Instructions.Text:DockMargin(0,0,30,0)
				self.Instructions.Text:SetVerticalScrollbarEnabled(false)
    			self.Instructions.Text:SetMouseInputEnabled(false)

				self.Instructions.Text.Paint = function(me,w,h)
					me:SetFontInternal('QTG_InspectCat')
				end

				self.Instructions.Text:InsertColorChange(color4.r,color4.g,color4.b,color4.a)
				self.Instructions.Text:AppendText(w.Instructions)
			end
		elseif IsValid(self.Instructions.Text) then
			self.Instructions.Text:Remove()
		end
	end
end

function p:PerformLayout()
    self:SetSize(ScrW(),ScrH())
	self:SetPos(0,0)
end

local at = {}
local at2 = {}
local color5
local color6

local function drawtext(a,b,c,d,e,f,g)
	draw.SimpleText(a,b,c+2,d+2,Color(0,0,0,e.a-55),f,g)
	draw.SimpleText(a,b,c,d,e,f,g)
end

function p:Paint(w,h)
	if self.h_Inspect and self.h_Inspect > 0 and IsValid(self.wep) then
		local w = self.wep
		local colorb = gui.IsGameUIVisible() and 0 or 1

		color5 = QSWEP.GetConVarColor('insp_color5')
		color6 = QSWEP.GetConVarColor('insp_color6')

		color5.a = 255*self.h_Inspect*colorb
		color6.a = 200*self.h_Inspect*colorb
		
		draw.NoTexture()

		at = draw.GetCircleTbl(ScrW()/2,ScrH()-150,100,6)

		surface.SetDrawColor(0,0,0,200*self.h_Inspect*colorb)
		surface.DrawPoly(at)

		draw.Circle(ScrW()/2,ScrH()-150,60,6,Color(0,0,0,100*self.h_Inspect*colorb))
		draw.Circle(ScrW()/2,ScrH()-150,20,6,Color(0,0,0,100*self.h_Inspect*colorb))

		at2 = draw.GetCircleTbl(ScrW()/2,ScrH()-150,5,6)

		local dmg = w.Primary.Damage
		local dmgt = w.Primary.Damage

		if istable(dmg) then
			dmg = dmg[1]
		end

		if istable(dmgt) then
			dmgt = dmgt[1]..' ~ '..dmgt[#dmgt]
		end

		if w.Primary.NumShots > 1 then
			dmg = dmg*w.Primary.NumShots
			dmgt = dmgt..' x '..w.Primary.NumShots
		end

		at2[1].x = at2[1].x+((at[2].x-at2[1].x)*math.Clamp(dmg/80,0,2))
		at2[1].y = at2[1].y+((at[2].y-at2[1].y)*math.Clamp(dmg/80,0,2))
		
		local recoil = w.Primary.Recoil

		if isangle(recoil) then
			local p,y,r = recoil:Unpack()

			recoil = math.abs(p+y+r)
		end

		at2[3].x = at2[3].x+((at[3].x-at2[3].x)*math.Clamp(recoil/2,0,2))
		at2[3].y = at2[3].y+((at[3].y-at2[3].y)*math.Clamp(recoil/2,0,2))

		local cone = w.Primary.Cone*100

		at2[4].x = at2[4].x+((at[4].x-at2[4].x)*math.Clamp(cone/3,0,2))
		at2[4].y = at2[4].y+((at[4].y-at2[4].y)*math.Clamp(cone/3,0,2))

		local rpm = math.Round(60/w.Primary.Delay)

		at2[5].x = at2[5].x+((at[5].x-at2[5].x)*math.Clamp(rpm/1200,0,2))
		at2[5].y = at2[5].y+((at[5].y-at2[5].y)*math.Clamp(rpm/1200,0,2))

		local spreadr = w.SpreadRecovery/w.SpreadRecoveryTime
		local spreadt = w.SpreadRecovery..' / '..w.SpreadRecoveryTime..' s'

		at2[6].x = at2[6].x+((at[6].x-at2[6].x)*math.Clamp(spreadr/0.5,0,2))
		at2[6].y = at2[6].y+((at[6].y-at2[6].y)*math.Clamp(spreadr/0.5,0,2))

		at2[7].x = at2[7].x+((at[7].x-at2[7].x)*0)
		at2[7].y = at2[7].y+((at[7].y-at2[7].y)*0)

		surface.SetDrawColor(color6)
		surface.DrawPoly(at2)

		drawtext('Damage: '..dmgt,'QTG_InspectCat',at[2].x,at[2].y+20,color5,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		drawtext('Recoil: '..recoil,'QTG_InspectCat',at[3].x-25,at[3].y,color5,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		drawtext('Spread: '..cone,'QTG_InspectCat',at[4].x-25,at[4].y,color5,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		drawtext('Firerate: '..rpm..' RPM','QTG_InspectCat',at[5].x,at[5].y-25,color5,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		drawtext('Spread Recovery: '..spreadt,'QTG_InspectCat',at[6].x+20,at[6].y,color5,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
		drawtext('','QTG_InspectCat',at[7].x+20,at[7].y,color5,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end
end

vgui.Register('QSWEP_InspectMenu',p,'EditablePanel')