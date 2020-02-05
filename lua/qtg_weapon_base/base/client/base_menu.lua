local QSWEPC = {}

local function ServerOption(p)
	p:CheckBox('Enable Ironsights','sv_qswep_ironsights')
	p:CheckBox('Enable Hold Ironsights','sv_qswep_holdironsights')
	p:CheckBox('Enable Changelog','sv_qswep_changelog')
	p:CheckBox('Enable Running','sv_qswep_running')
	p:CheckBox('Enable Bullet Ricochet','sv_qswep_ricochet')
	p:CheckBox('Enable Bullet Renetration','sv_qswep_penetration')
	p:CheckBox('Enable Bullet Air Diffusion','sv_qswep_spreadinair')
	p:CheckBox('Enable Reload','sv_qswep_reload')
	p:CheckBox('Use (+attack3) for alt fire','sv_qswep_altatt_key')
end

local function HudOption(p)
	p:Help('--HUD Options--')

	p:CheckBox('Enable Custom HUD','cl_qswep_custom_hud')

	p:AddControl('color',
	{ label = 'Custom HUD Color',
	red = 'cl_qswep_custom_hud_r', 
	green = 'cl_qswep_custom_hud_g', 
	blue = 'cl_qswep_custom_hud_b'})

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

	p:AddControl('color',
	{ label = 'Ccrosshair Color',
	red = 'cl_qswep_crosshair_r', 
	green = 'cl_qswep_crosshair_g', 
	blue = 'cl_qswep_crosshair_b',
	alpha = 'cl_qswep_crosshair_a'})

	p:CheckBox('Enable Team Crosshair Color','cl_qswep_crosshair_team')

	p:AddControl('color',
	{ label = 'Ccrosshair Friendly Color',
	red = 'cl_qswep_crosshair_good_r', 
	green = 'cl_qswep_crosshair_good_g', 
	blue = 'cl_qswep_crosshair_good_b'})

	p:AddControl('color',
	{ label = 'Ccrosshair Enemy Color',
	red = 'cl_qswep_crosshair_bad_r', 
	green = 'cl_qswep_crosshair_bad_g', 
	blue = 'cl_qswep_crosshair_bad_b'})

	p:Help('--Blur Options--')

	p:CheckBox('Enable blur when reload','cl_qswep_blur_reload')
	p:CheckBox('Enable blur when deploy','cl_qswep_blur_deploy')
end

local function VMOption(p)
	p:NumSlider('Gun Bob Intensity','cl_qswep_vm_bob',0,2)
	p:NumSlider('Gun Idle Intensity','cl_qswep_vm_idle',0,2)
	p:NumSlider('Gun Tilt strength','cl_qswep_view_tilt',0,2)
end

local function Version(p)
	p:Button('Changelog','cl_qswep_OpenChangelogMenu')
	p:Help('Version: '..QSWEP.Version)
end

function QSWEP:AddOption()
	spawnmenu.AddToolMenuOption('Options','QTG Weapon Base','QTG_Base_Settings_HUD','Admin / Server','','',ServerOption)
	spawnmenu.AddToolMenuOption('Options','QTG Weapon Base','QTG_Base_Settings_HUD2','HUD / Crosshair','','',HudOption)
	spawnmenu.AddToolMenuOption('Options','QTG Weapon Base','QTG_Base_Settings_HUD3','Viewmodel','','',VMOption)
	spawnmenu.AddToolMenuOption('Options','QTG Weapon Base','QTG_Base_Settings_HUD4','Version','','',Version)
end

hook.Add('PopulateToolMenu','QTG_Base_Settings',QSWEP.AddOption)

local w,h = 480,460
local menubg = Color(0,0,255,120)
local menupr = Color(80,20,100,120)
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

vgui.Register('QSWEPChangelogMenu',QSWEPC)

function QSWEP:OpenChangelogMenu()
	if IsValid(qswepc) then
		if !qswepc:IsVisible() then
			qswepc:Show()
		end
	else
		qswepc = vgui.Create('QSWEPChangelogMenu')
	end
end

concommand.Add('cl_qswep_OpenChangelogMenu',function(p,c,a)
	QSWEP:OpenChangelogMenu()
end)