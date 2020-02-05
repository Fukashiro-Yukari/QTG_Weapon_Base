DEFINE_BASECLASS('qtg_weapon_base')

SWEP.PrintName				    = 'Scripted Weapon'

SWEP.Primary.Automatic		    = false
SWEP.Primary.CrosshairCone		= 1
SWEP.Primary.CrosshairRecoil	= 1
SWEP.Primary.MouseSensitivity	= {}

SWEP.Secondary.ScopeSound		= 'Default.Zoom'

if CLIENT then
    SWEP.Secondary.Scope		= surface.GetTextureID('sprites/scope')
    SWEP.Secondary.ScopeBorder  = true
    SWEP.Secondary.ScopeEffect  = true
end

SWEP.DrawCrosshair              = false

SWEP.ZoomLevels					= {}

function SWEP:AltSetupDataTables()
    self:AddNWVar('Int','ZoomLvl')
    self:AddNWVar('Float','SniperPumping')
    self:AddNWVar('Bool','Zooming2')
end

function SWEP:Initialize()
    self.__OldPrimaryDelay = self.Primary.Delay

    BaseClass.Initialize(self)
end

function SWEP:SetNpc()
    self.Primary.Recoil = self.Primary.CrosshairRecoil
    self.Primary.Cone = self.Primary.CrosshairCone
    
    BaseClass.SetNpc(self)
end

function SWEP:SetZoom()
    if self:GetState('idle') or self:GetState('zoom') then
        self:SetState('zoom')
    end

    self:SetZooming2(true)
    self:SetIsZoom(true)

    timer.Simple(0.05,function()
        if IsValid(self) then
            self:SetZooming2(false)
            self:SetZoomLvl(self:GetZoomLvl()+1)
            self:EmitSound(self.Secondary.ScopeSound)

            if self:GetZoomLvl() > #self.ZoomLevels then
                self:SetZoomLvl(0)
                self:SetIsZoom(false)

                if self:GetState('idle') or self:GetState('zoom') then
                    self:SetState('idle')
                end
            end
        end
    end)
end

function SWEP:Think()
    if !IsValid(self.Owner) or (IsValid(self.Owner) and self.Owner:IsNPC()) then return end
    
    if !self:GetZooming2() then
        self.Owner:DrawViewModel(self:GetSniperPumping() > CurTime() or !self:GetState('zoom') or self:GetState('run') or self:GetState('reload') or self:GetState('holster'))
    end

    if !self.Owner:QTG_ALTKeyDown() and self:GetNextSights() < CurTime() then
		if self.Owner:KeyPressed(IN_ATTACK2) then
			self:SetZoom()
			self:SetNextSights(CurTime()+0.1)
		end
    end

    if self.Secondary.ScopeDelay then
        if self:GetZoomLvl() > 0 then
            self.Primary.Delay = self.Secondary.ScopeDelay
        else
            self.Primary.Delay = self.__OldPrimaryDelay
        end
    end
    
    BaseClass.Think(self)
end

if CLIENT then
    function SWEP:AdjustMouseSensitivity()
        if !self:GetState('zoom') or self:GetState('run') or self:GetState('reload') or self:GetSniperPumping() > CurTime() then return end

		return self.Primary.MouseSensitivity[self:GetZoomLvl()]
	end
end