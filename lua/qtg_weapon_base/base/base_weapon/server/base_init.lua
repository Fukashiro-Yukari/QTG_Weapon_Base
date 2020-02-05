local SWEP = QSWEP.Base or {}

SWEP.Weight			= 5
SWEP.AutoSwitchTo	= true
SWEP.AutoSwitchFrom	= true

function SWEP:OnRestore() end

function SWEP:AcceptInput(name,activator,caller,data)
	return false
end

function SWEP:KeyValue(key,value) end

function SWEP:Equip(newOwner) end

function SWEP:EquipAmmo(newOwner) end

function SWEP:OnDrop()
	self:Holster()
	self:QTG_CallFunc('Holster')

	return hook.Run('QTG_OnDrop',self)
end

function SWEP:ShouldDropOnDie() return true end

function SWEP:GetCapabilities()
	return bit.bor(CAP_WEAPON_RANGE_ATTACK1,CAP_INNATE_RANGE_ATTACK1)
end

function SWEP:NPCShoot_Secondary(shootPos,shootDir)
	self:SecondaryAttack()
end

function SWEP:NPCShoot_Primary(shootPos,shootDir)
	self:PrimaryAttack()
end

AccessorFunc(SWEP,'fNPCMinBurst',		'NPCMinBurst')
AccessorFunc(SWEP,'fNPCMaxBurst',		'NPCMaxBurst')
AccessorFunc(SWEP,'fNPCFireRate',		'NPCFireRate')
AccessorFunc(SWEP,'fNPCMinRestTime',	'NPCMinRest')
AccessorFunc(SWEP,'fNPCMaxRestTime',	'NPCMaxRest')
