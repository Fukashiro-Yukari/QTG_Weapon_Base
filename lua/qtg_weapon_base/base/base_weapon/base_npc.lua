local SWEP = QSWEP.Base or {}

SWEP.NPCCanPicked				= true

SWEP.NPCRestTimesMax			= 0.6
SWEP.NPCRestTimesMin			= 0.3

SWEP.NPCBulletSpreadPoor		= 1
SWEP.NPCBulletSpreadAverage		= 1
SWEP.NPCBulletSpreadGood		= 1
SWEP.NPCBulletSpreadVeryGood	= 1
SWEP.NPCBulletSpreadPerect		= 1

function SWEP:SetNpc()
	if self.Owner:GetClass() == 'npc_combine_s' then
		self.Owner:SetKeyValue('Numgrenades',-1)
	end

	self:SetHoldType(self.HoldType)
	
	hook.Run('QTG_OnSetNpc',self,self.Owner)
end

function SWEP:Equip(n)
	if self.Owner:IsNPC() then
		self:SetNpc()
		hook.Add('QTG_NPCWeaponThink',self,self.NPCWeaponThinkHook)
	end
end

function SWEP:NPCWeaponThinkHook()
	if !self.Owner:IsNPC() then
		hook.Remove('QTG_NPCWeaponThink',self)
		return
	end
	
	self:NPCThink()
end

function SWEP:CanBePickedUpByNPCs()
	return self.NPCCanPicked
end

function SWEP:GetNPCRestTimes()
	return self.NPCRestTimesMin,self.NPCRestTimesMax
end

function SWEP:GetNPCBurstSettings()
	return 1,self.Primary.ClipSize,self.Primary.Delay
end

local ptbl = {
	[WEAPON_PROFICIENCY_POOR] = function(self)
		return self.NPCBulletSpreadPoor
	end,
	[WEAPON_PROFICIENCY_AVERAGE] = function(self)
		return self.NPCBulletSpreadAverage
	end,
	[WEAPON_PROFICIENCY_GOOD] = function(self)
		return self.NPCBulletSpreadGood
	end,
	[WEAPON_PROFICIENCY_VERY_GOOD] = function(self)
		return self.NPCBulletSpreadVeryGood
	end,
	[WEAPON_PROFICIENCY_PERFECT] = function(self)
		return self.NPCBulletSpreadPerect
	end
}

function SWEP:GetNPCBulletSpread(p)
	if ptbl[p] then
		return ptbl[p](self)
	end
end