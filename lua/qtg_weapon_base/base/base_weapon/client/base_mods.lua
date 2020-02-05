local SWEP = QSWEP.Base or {}

SWEP.ViewModelBoneMods 			= {}
SWEP.VElements 					= {}
SWEP.WElements 					= {}

SWEP.ShowViewModel 				= true
SWEP.ShowWorldModel 			= true

function SWEP:InitMods()
	self.WElements = table.FullCopy(self.WElements)
	self:CreateModels(self.WElements)
	
	if !self.Owner:IsNPC() then
		self.VElements = table.FullCopy(self.VElements)
		self.ViewModelBoneMods = table.FullCopy(self.ViewModelBoneMods)
		self:CreateModels(self.VElements)

		if IsValid(self.Owner) then
			if IsValid(self.__vm) then
				QSWEP.ResetBonePositions(self.__vm)
			end
		end	
	end
end

function SWEP:ViewModelDrawn()
	render.SetBlend(1)

	if !IsValid(self.__vm) then return end
	if !self:GetOwner().GetHands then return end

	if self.UseHands then
		local hands = self:GetOwner():GetHands()

		if IsValid(hands) then
			hands:SetParent(self.__vm)
		end
	end
	
	self:UpdateBonePositions(self.__vm)
	
	if !self.vRenderOrder then
		self.vRenderOrder = {}
		
		for k, v in pairs(self.VElements) do
			if v.type == 'Model' then
				table.insert(self.vRenderOrder, 1, k)
			elseif v.type == 'Sprite' or v.type == 'Quad' then
				table.insert(self.vRenderOrder, k)
			end
		end
	end
	
	for k, name in ipairs(self.vRenderOrder) do
		local v = self.VElements[name]
		
		if !v then self.vRenderOrder = nil break end
		if v.hide then continue end
		
		local model = v.modelEnt
		local sprite = v.spriteMaterial
		if !v.bone then continue end
		
		local pos, ang = self:GetBoneOrientation(self.VElements,v,self.__vm)
		if !pos then continue end
		if v.type == 'Model' and IsValid(model) then
			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)
			ang:RotateAroundAxis(ang:Up(),v.angle.y)
			ang:RotateAroundAxis(ang:Right(),v.angle.p)
			ang:RotateAroundAxis(ang:Forward(),v.angle.r)
			model:SetAngles(ang)
			local matrix = Matrix()
			matrix:Scale(v.size)
			model:EnableMatrix('RenderMultiply',matrix)
			
			if v.material == '' then
				model:SetMaterial('')
			elseif model:GetMaterial() != v.material then
				model:SetMaterial(v.material)
			end
			
			if v.skin and v.skin != model:GetSkin() then
				model:SetSkin(v.skin)
			end
			
			if v.bodygroup then
				for k, v in pairs(v.bodygroup) do
					if model:GetBodygroup(k) != v then
						model:SetBodygroup(k,v)
					end
				end
			end
			
			if v.surpresslightning then
				render.SuppressEngineLighting(true)
			end
			
			render.SetColorModulation(v.color.r/255,v.color.g/255,v.color.b/255)
			render.SetBlend(v.color.a/255)
			model:DrawModel()
			render.SetBlend(1)
			render.SetColorModulation(1,1,1)
			
			if v.surpresslightning then
				render.SuppressEngineLighting(false)
			end
		elseif v.type == 'Sprite' and sprite then
			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			render.SetMaterial(sprite)
			render.DrawSprite(drawpos, v.size.x, v.size.y, v.color)
		elseif v.type == 'Quad' and v.draw_func then
			local drawpos = pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z
			ang:RotateAroundAxis(ang:Up(), v.angle.y)
			ang:RotateAroundAxis(ang:Right(), v.angle.p)
			ang:RotateAroundAxis(ang:Forward(), v.angle.r)
			cam.Start3D2D(drawpos, ang, v.size)
				v.draw_func( self )
			cam.End3D2D()
		end
	end
end

function SWEP:DrawWorldModel()
	if self.ShowWorldModel == nil or self.ShowWorldModel then
		self:DrawModel()
	end
	
	if !self.WElements then return end
	if !self.wRenderOrder then
		self.wRenderOrder = {}
		
		for k,v in pairs(self.WElements) do
			if v.type == 'Model' then
				table.insert(self.wRenderOrder,1,k)
			elseif v.type == 'Sprite' or v.type == 'Quad' then
				table.insert(self.wRenderOrder,k)
			end
		end
	end
	
	if IsValid(self.Owner) then
		bone_ent = self.Owner
	else
		bone_ent = self
	end
	
	for k,name in pairs(self.wRenderOrder) do
		local v = self.WElements[name]
		if !v then self.wRenderOrder = nil break end
		if v.hide then continue end
		
		local pos,ang
		if v.bone then
			pos,ang = self:GetBoneOrientation(self.WElements,v,bone_ent)
		else
			pos,ang = self:GetBoneOrientation(self.WElements,v,bone_ent,'ValveBiped.Bip01_R_Hand')
		end
		
		if !pos then continue end
		
		local model = v.modelEnt
		local sprite = v.spriteMaterial
		if v.type == 'Model' and IsValid(model) then
			model:SetPos(pos + ang:Forward() * v.pos.x + ang:Right() * v.pos.y + ang:Up() * v.pos.z)

			ang:RotateAroundAxis(ang:Up(),v.angle.y)
			ang:RotateAroundAxis(ang:Right(),v.angle.p)
			ang:RotateAroundAxis(ang:Forward(),v.angle.r)

			model:SetAngles(ang)
			
			local matrix = Matrix()
			
			matrix:Scale(v.size)
			model:EnableMatrix('RenderMultiply',matrix)
			
			if v.material == '' then
				model:SetMaterial('')
			elseif model:GetMaterial() != v.material then
				model:SetMaterial(v.material)
			end
			
			if v.skin and v.skin != model:GetSkin() then
				model:SetSkin(v.skin)
			end
			
			if v.bodygroup then
				for k, v in pairs(v.bodygroup) do
					if model:GetBodygroup(k) != v then
						model:SetBodygroup(k,v)
					end
				end
			end
			
			if v.surpresslightning then
				render.SuppressEngineLighting(true)
			end

			render.SetColorModulation(v.color.r/255, v.color.g/255, v.color.b/255)
			render.SetBlend(v.color.a/255)

			model:DrawModel()

			render.SetBlend(1)
			render.SetColorModulation(1,1,1)
			
			if v.surpresslightning then
				render.SuppressEngineLighting(false)
			end
		elseif v.type == 'Sprite' and sprite then
			local drawpos = pos+ang:Forward()*v.pos.x+ang:Right()*v.pos.y+ang:Up()*v.pos.z

			render.SetMaterial(sprite)
			render.DrawSprite(drawpos,v.size.x,v.size.y,v.color)
		elseif v.type == 'Quad' and v.draw_func then
			local drawpos = pos+ang:Forward()*v.pos.x+ang:Right()*v.pos.y+ang:Up()*v.pos.z

			ang:RotateAroundAxis(ang:Up(),v.angle.y)
			ang:RotateAroundAxis(ang:Right(),v.angle.p)
			ang:RotateAroundAxis(ang:Forward(),v.angle.r)

			cam.Start3D2D(drawpos,ang,v.size)
				v.draw_func(self)
			cam.End3D2D()
		end
	end
end

function SWEP:GetBoneOrientation(basetab,tab,ent,bone_override)
	local bone, pos, ang

	if tab.rel and tab.rel != '' then
		local v = basetab[tab.rel]
		if !v then return end

		pos, ang = self:GetBoneOrientation( basetab, v, ent )

		if !pos then return end

		pos = pos + ang:Forward()*v.pos.x+ang:Right()*v.pos.y+ang:Up()*v.pos.z

		ang:RotateAroundAxis(ang:Up(), v.angle.y)
		ang:RotateAroundAxis(ang:Right(), v.angle.p)
		ang:RotateAroundAxis(ang:Forward(), v.angle.r)
	else
		bone = ent:LookupBone(bone_override or tab.bone)

		if !bone then return end

		pos, ang = Vector(0,0,0), Angle(0,0,0)

		local m = ent:GetBoneMatrix(bone)

		if m then
			pos, ang = m:GetTranslation(), m:GetAngles()
		end

		if IsValid(self.Owner) and self.Owner:IsPlayer() and 
			ent == (self.Owner:GetViewModel() and self.ViewModelFlip) then
			ang.r = -ang.r
		end
	end
	
	return pos, ang
end

function SWEP:CreateModels(tab)
	if !tab then return end
	
	for k, v in pairs(tab) do
		if (v.type == 'Model' and v.model and v.model != '' and !IsValid(v.modelEnt) or v.createdModel != v.model) and (string.find(v.model, '.mdl') and file.Exists(v.model, 'GAME')) then
			v.modelEnt = ClientsideModel(v.model, RENDER_GROUP_VIEW_MODEL_OPAQUE)
			
			if (IsValid(v.modelEnt)) then
				v.modelEnt:SetPos(self:GetPos())
				v.modelEnt:SetAngles(self:GetAngles())
				v.modelEnt:SetParent(self)
				v.modelEnt:SetNoDraw(true)
				v.createdModel = v.model
			else
				v.modelEnt = nil
			end
		elseif (v.type == 'Sprite' and v.sprite and v.sprite != '' and (!v.spriteMaterial or v.createdSprite != v.sprite) and file.Exists('materials/'..v.sprite..'.vmt', 'GAME')) then
			local name = v.sprite..'-'
			local params = {['$basetexture'] = v.sprite}
			local tocheck = {'nocull','additive','vertexalpha','vertexcolor','ignorez'}
			
			for i,j in pairs(tocheck) do
				if (v[j]) then
					params['$'..j] = 1
					name = name..'1'
				else
					name = name..'0'
				end
			end
			
			v.createdSprite = v.sprite
			v.spriteMaterial = CreateMaterial(name,'UnlitGeneric',params)
		end
	end		
end

local allbones
local hasGarryFixedBoneScalingYet = false

function SWEP:UpdateBonePositions(vm)
	if self.ViewModelBoneMods then
		if !vm:GetBoneCount() then return end
		
		local loopthrough = self.ViewModelBoneMods
		if (!hasGarryFixedBoneScalingYet) then
			allbones = {}
			for i=0, vm:GetBoneCount() do
				local bonename = vm:GetBoneName(i)
				if (self.ViewModelBoneMods[bonename]) then 
					allbones[bonename] = self.ViewModelBoneMods[bonename]
				else
					allbones[bonename] = { 
						scale = Vector(1,1,1),
						pos = Vector(0,0,0),
						angle = Angle(0,0,0)
					}
				end
			end
			
			loopthrough = allbones
		end
		
		for k, v in pairs( loopthrough ) do
			local bone = vm:LookupBone(k)
			if (!bone) then continue end
			local s = Vector(v.scale.x,v.scale.y,v.scale.z)
			local p = Vector(v.pos.x,v.pos.y,v.pos.z)
			local ms = Vector(1,1,1)
			if (!hasGarryFixedBoneScalingYet) then
				local cur = vm:GetBoneParent(bone)
				while(cur >= 0) do
					local pscale = loopthrough[vm:GetBoneName(cur)].scale
					ms = ms * pscale
					cur = vm:GetBoneParent(cur)
				end
			end
			
			s = s * ms
			
			if vm:GetManipulateBoneScale(bone) != s then
				vm:ManipulateBoneScale( bone, s )
			end
			
			if vm:GetManipulateBoneAngles(bone) != v.angle then
				vm:ManipulateBoneAngles(bone, v.angle )
			end
			
			if vm:GetManipulateBonePosition(bone) != p then
				vm:ManipulateBonePosition(bone,p)
			end
		end
	else
		QSWEP.ResetBonePositions(vm)
	end		   
end