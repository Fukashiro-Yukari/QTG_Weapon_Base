DEFINE_BASECLASS('qtg_weapon_base')

SWEP.PrintName				    = 'Scripted Weapon'

SWEP.DrawCrosshair	    		= false

SWEP.HoldReady		            = 'grenade'
SWEP.HoldType 		            = 'slam'
SWEP.WeaponType		            = 'Grenade'

SWEP.EmptySound		            = ''

SWEP.FireUnderWater				= true

SWEP.DeployViewBob				= false

SWEP.Primary.ThrowAnim          = ACT_VM_THROW
SWEP.Primary.ClipSize		    = -1
SWEP.Primary.Automatic 		    = true
SWEP.Primary.Delay 			    = 1.5
SWEP.Primary.EntAmmo		    = ''
SWEP.Primary.Force			    = 1500
SWEP.Primary.TakeAmmo		    = 1
SWEP.Primary.NumShots			= 1
SWEP.Primary.Ammo			    = 'grenade'
SWEP.Primary.Sound 			    = ''

SWEP.Secondary.ThrowAnim        = ACT_VM_SECONDARYATTACK
SWEP.Secondary.ThrowDelay		= 0
SWEP.Secondary.Sound 			= ''
SWEP.Secondary.CanUse			= true
SWEP.Secondary.NoAmmo			= true
SWEP.Secondary.Automatic 		= true
SWEP.Secondary.Delay 			= 1.5
SWEP.Secondary.EntAmmo			= ''
SWEP.Secondary.NumShots			= 1
SWEP.Secondary.Force			= 400
SWEP.Secondary.UsePrimary		= true

SWEP.ThrowDelay					= 0
SWEP.ThrowTime                  = 0.4

SWEP.FireModeShow				= false

function SWEP:AltSetupDataTables()
	self:AddNWVar('Bool','Type')
end

function SWEP:PrimaryAttack()
	if self:GetHolstering() then return end
	if self:GetSAttacking() then return end

	local alta = self:AltPrePrimaryAttack()
	if alta then
		return
	end

	local alta = hook.Run('QTG_PrePrimaryAttack',self)
	if alta then
		return
	end

	if !self.Primary.CanUse then return end
	
	self:StartAttack(self.Primary)
	self:AltPrimaryAttack()
	hook.Run('QTG_PrimaryAttack',self)
end

function SWEP:SecondaryAttack()
	if self:GetHolstering() then return end
	if self:GetPAttacking() then return end

	local alta = self:AltPreSecondaryAttack()
	if alta then
		return
	end

	local alta = hook.Run('QTG_PreSecondaryAttack',self)
	if alta then
		return
	end

	if self.CanPush then self:PushSway() return end
	if !self.Secondary.CanUse then return end

	self:StartAttack(self.Secondary)
	self:AltSecondaryAttack()
	hook.Run('QTG_SecondaryAttack',self)
end

function SWEP:StartAttack(a)
	if !self:CanPrimaryAttack() then return end

	local b = a == self.Primary and true or false
	local vm = QSWEP.GetPlyVM(self:GetOwner())
	
	if a.NotDoing then
		self:DoNotDoing(a)

		if b then
			self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
		else
			self:SetNextSecondaryFire(CurTime()+self.Secondary.Delay)
		end

		return
	end
    
    if self:GetState('pin') then return end
	
	QSWEP.SendAnim(self,a.Anim)
	self:SetState('pin')
	self:SetStateTime(CurTime()+vm:SequenceDuration())
	self:SetType(b)
	self:SetHoldType(self.HoldReady)
end

function SWEP:Think()
	if self:GetState('pin') then
		if !self.Owner:KeyDown(IN_ATTACK) and !self.Owner:KeyDown(IN_ATTACK2) and self:GetStateTime() < CurTime() then
            self:TakePrimaryAmmo(self.Primary.TakeAmmo)
			self:EmitSound(self:GetType() and self.Primary.Sound or self.Secondary.Sound)
			QSWEP.SendAnim(self,self:GetType() and self.Primary.ThrowAnim or self.Secondary.ThrowAnim)
			self.Owner:SetAnimation(PLAYER_ATTACK1)
			self:SetState('idle')
			
			timer.Simple(self.ThrowDelay,function()
				if !IsValid(self) or !IsFirstTimePredicted() then return end

				self:EntAmmoFire(self:GetType() and self.Primary or self.Secondary)
			end)

			timer.Simple(self.ThrowTime,function()
				if !IsValid(self) or !IsFirstTimePredicted() then return end

				hook.Run('QTG_OnThrow',self)
				QSWEP.SendAnim(self,self.DeployAnim)
					
				self:SetHoldType(self.HoldType)
			end)
        end
        
		self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
		self:SetNextSecondaryFire(CurTime()+self.Secondary.Delay)
	end
    
	BaseClass.Think(self)
end