local e 		= FindMetaTable('Entity')
local p 		= FindMetaTable('Player')
local w 		= FindMetaTable('Weapon')
local n 		= FindMetaTable('NPC')

function w:IsQSWEP()
	return tobool(self.IsQTGWeapon)
end

function p:QTG_ALTKeyDown(a)
	if !IsValid(self) then return end

	return self:GetNW2Bool('QTG_ALTKeyDown')
end

function p:QTG_SetALTKeyDown(a)
	if !IsValid(self) then return end

	self:SetNW2Bool('QTG_ALTKeyDown',a)
end

function w:QTG_CallFunc(n,...)
	if !IsValid(self:GetOwner()) then return end
	if !self:GetOwner():IsPlayer() then return end

	if SERVER then
		local args = {}

		for i = 1,select('#',...) do
			args[i] = select(i,...)
		end

		args[#args+1] = 'Send'
		args[#args+1] = self:GetOwner()

		QSWEP.StartNet('callfunc',self,n,unpack(args))
	else
		QSWEP.StartNet('callfunc',self,n,...)
	end
end

function e:AddNWVar(a,b,...)
	if !istable(self.__nwvarn) then
		self.__nwvarn = {
			['String'] = 0,
			['Bool'] = 0,
			['Float'] = 0,
			['Int'] = 0,
			['Vector'] = 0,
			['Angle'] = 0,
			['Entity'] = 0
		}
	end

	if self.__nwvarn[a] then
		self:NetworkVar(a,self.__nwvarn[a],b,...)
		self.__nwvarn[a] = self.__nwvarn[a]+1
	end
end

e.__oldRemove = e.__oldRemove or e.Remove

function e:SafeRemove(n)
	if !n then
		n = 0
	end

	timer.Simple(n,function()
		if !IsValid(self) or self:IsPlayer() then return end

		self:__oldRemove()
	end)
end

function e:Remove(n,...)
	if isnumber(n) then
		return self:SafeRemove(n,...)
	end

	return self:__oldRemove(n,...)
end

function e:SafeSetParent(e,n)
	if !n then
		n = 0
	end

	timer.Simple(n,function()
		if !IsValid(self) or !IsValid(e) then return end

		self:SetParent(e)
	end)
end