local SWEP = QSWEP.Base or {}

SWEP.Slot					= 0
SWEP.SlotPos				= 10
SWEP.DrawAmmo				= true
SWEP.RenderGroup			= RENDERGROUP_OPAQUE
SWEP.SwayScale 				= 0
SWEP.BobScale 				= 0

local h_reload = 0
local h_use = 0
local h_Inspect = 0

function SWEP:QSWEPToggleInspect()
	if gui.IsGameUIVisible() then return end
	if self.Owner:IsNPC() then return end
	if !self:GetState('idle') or self:GetPAttacking() or self:GetSAttacking() then return end
	if self:GetToggleInspectTime() < CurTime() then
		self.Inspecting = !self.Inspecting

		if IsValid(QSWEP.InspectMenu) then
			if !QSWEP.InspectMenu:IsVisible() then
				QSWEP.InspectMenu:Show()
			end

			QSWEP.InspectMenu:Setup(self,self.Owner)
		else
			QSWEP.InspectMenu = vgui.Create('QSWEP_InspectMenu')
			QSWEP.InspectMenu:Setup(self,self.Owner)
		end

		self:SetToggleInspectTime(CurTime()+0.1)
	end
end

function SWEP:FreezeMovement()
	return false
end

function SWEP:OnRestore() end

function SWEP:CustomAmmoDisplay() end

function SWEP:TranslateFOV(f)
	return f
end

function SWEP:DrawWorldModelTranslucent()
	self:DrawModel()
end

function SWEP:AdjustMouseSensitivity()
	return nil
end

function SWEP:GetTracerOrigin() end