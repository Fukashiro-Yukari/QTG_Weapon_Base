local SWEP = QSWEP.Base or {}

local function EntType(a)
	if a == nil then return end
	if util.IsValidRagdoll(a) then
		a = 'prop_ragdoll'
	elseif util.IsValidProp(a) then
		a = 'prop_physics'
	end
	
	return a
end

local function EntTypeI(a)
	if !a then return end
	if util.IsValidModel(a) then
		return a
	end
end

local function EntUndoText(a)
	if !a then return end
	if util.IsValidRagdoll(a) then
		return 'Ragdoll'
	elseif util.IsValidProp(a) then
		return 'Prop'
	end
	
	return 'Ent'
end

function SWEP:EntBulletFire(a)
	if CLIENT then return end
	if !IsValid(self.Owner) then return end
	
	local isshotgun = a.Shotgun and a.Cone*600 or self:Trajectory(a.Cone)*600
	local t = self.Owner:EyeAngles()
	
	for i = 1,a.NumShots do
		QSWEP.CreateEnt(self,'qtg_ent_base_bullet',QSWEP.GetOwner(self),nil,true,function(e)
			e.Weapon = self
			e.WeaponClass = self.ClassName
			e.Data = table.Copy(a)

			e:SetPos(self.Owner:IsPlayer() and self.Owner:GetShootPos()+t:Right()*6-t:Up()*4+Vector(math.Rand(isshotgun,-isshotgun),math.Rand(isshotgun*2,-(isshotgun*2)),math.Rand(isshotgun,-isshotgun)) or self.Owner:GetShootPos())
			e:SetAngles(self.Owner:EyeAngles())
		end)
	end
end

function SWEP:EntAmmoFire(a)
	if CLIENT then return end
	if !IsValid(self.Owner) then return end
	
	local f = self.Owner:EyeAngles()
	
	for i = 1,a.NumShots do
		local e,p = QSWEP.CreateEnt(self,EntType(a.EntAmmo),QSWEP.GetOwner(self),EntTypeI(a.EntAmmo),true)

		e.Weapon = self
		e.WeaponClass = self.ClassName
		e.Data = table.Copy(a)
		
		e:SetPos(self.Owner:IsPlayer() and self.Owner:GetShootPos()+f:Forward()*10+f:Right()*6-f:Up()*4 or self.Owner:GetShootPos())
		e:SetAngles(self.Owner:EyeAngles())

		if IsValid(p) then
			p:SetVelocity(f:Forward()*a.Force)
		else
			e:SetVelocity(f:Forward()*a.Force)
		end

		if a.EntAmmoCanUndo then
			undo.Create(EntUndoText(a.EntAmmo))
				undo.AddEntity(e)
				undo.SetPlayer(self.Owner)
				undo.SetCustomUndoText('Undone '..EntUndoText(a.EntAmmo))
			undo.Finish()
		end

		a.EntAmmoSetting(self,e,p)
	end
end