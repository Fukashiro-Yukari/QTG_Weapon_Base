QSWEP.NetTbl = QSWEP.NetTbl or {}

function QSWEP.StartNet(a,...)
    net.Start('QSWEP_NetHook')
	net.WriteString(a)

	local args = {...}
	local t,v = nil,{}

	if SERVER and #args > 0 then
		local n = -1

		for i = 0,#args do
			if t then
				n = #args-(i-1)

				break
			elseif args[#args-i] and net[args[#args-i]] then
				t = args[#args-i]
			end
		end

		if t and n > -1 then
			if args[n+1] then
				for i = n+1,#args do
					v[#v+1] = table.remove(args,n+1)
				end
			end

			table.remove(args,n)
		end
	elseif CLIENT then
		table.insert(args,1,LocalPlayer())
	end

    net.WriteTable(args)

	if SERVER then
		if !t then
			t = 'Broadcast'
		end

		if !net[t] then
			QSWEP.Error('Wrong network type ("'..t..'")')
		else
			net[t](unpack(v))

            return true
		end

		return false
    else
        net.SendToServer()

        return true
    end

    return false
end

net.Receive('QSWEP_NetHook',function(_,p)
    local id = net.ReadString()
	local t = net.ReadTable()
	
	if CLIENT then
		table.insert(t,1,LocalPlayer())
	end

    if QSWEP.NetTbl[id] then
        QSWEP.NetTbl[id](unpack(t))
    end
end)

function QSWEP.ReadNet(a,b)
    if !isfunction(b) then return end

    QSWEP.NetTbl[a] = b
end

function QSWEP.AddHook(a,b,c)
	hook.Add(a,c or 'qtg_weapon_base',b)
end

function QSWEP.Error(s,b)
	if !isstring(s) then
		s = 'Unknown error'
	end

	if b then
		error('['..QSWEP.Name..'] Error: '..s)
	else
		MsgC(Color(255,90,90),'['..QSWEP.Name..'] Error: '..s..'\n')
	end
end

function QSWEP.Assert(b,s,b2)
	if tobool(b) then return true end

	QSWEP.Error(s,b2)

	return false
end

local function isvalid(obj)
	if !obj or isstring(obj) then return false end

	local v = obj.IsValid
	if !v then return false end

	return v(obj)
end

function QSWEP.IsValid(...)
	local args = {...}
	local obj = args[1]

	if #args > 1 then
		obj = args
	end

	if istable(obj) then
		for i = 1,#obj do
			if !isvalid(obj[i]) then
				return false
			end
		end

		return true
	end
	
	return isvalid(obj)
end

IsValid = QSWEP.IsValid

function QSWEP.PlyUseQWEP(p)
	if !IsValid(p) then
		if CLIENT then
			if IsValid(LocalPlayer()) then
				p = LocalPlayer()
			else
				return false
			end
		elseif game.SinglePlayer() then
			p = Entity(1)
		else
			return false
		end
	end

	if !(IsValid(p) and p:IsPlayer() and p:Alive()) then return false end

	local w = p:GetActiveWeapon()

	if IsValid(w) then
		if w.IsQTGWeapon then return true end

		return false
	end

	return false
end

QSWEP.PlayerCarryingQTGWeapon = QSWEP.PlyUseQWEP

if CLIENT then
	function QSWEP.GetCrosshairColor(b)
		local cgeneral = Color(QSWEP.GetConvar('crosshair_r',true):GetInt(),QSWEP.GetConvar('crosshair_g',true):GetInt(),QSWEP.GetConvar('crosshair_b',true):GetInt())
		local cgood = Color(QSWEP.GetConvar('crosshair_good_r',true):GetInt(),QSWEP.GetConvar('crosshair_good_g',true):GetInt(),QSWEP.GetConvar('crosshair_good_b',true):GetInt())
		local cbad = Color(QSWEP.GetConvar('crosshair_bad_r',true):GetInt(),QSWEP.GetConvar('crosshair_bad_g',true):GetInt(),QSWEP.GetConvar('crosshair_bad_b',true):GetInt())
		local cteam = QSWEP.GetConvar('crosshair_team',true):GetBool()
		local p = LocalPlayer()
		local t = p:GetEyeTrace()
		local e = t.Entity
		
		if cteam and !b then
			QSWEP.StartNet('GetNPCdisposition',e)
			
			if e:IsPlayer() then
				if e:Team() == p:Team() then
					return cgood
				else
					return cbad
				end
			elseif e:IsNPC() then
				local disp = e:GetNW2Int('QSWEP_GetNPCdisposition')
				if disp>0 then
					if disp == (D_FR or 2) or disp == (D_HT or 1) then
						return cbad
					else
						return cgood
					end
				end
			end
		end
		
		return cgeneral
	end

	function draw.Circle(x,y,radius,seg,color)
		if color then
			surface.SetDrawColor(color)
			draw.NoTexture()
		end

		local cir = {}
	
		table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
		for i = 0, seg do
			local a = math.rad( ( i / seg ) * -360 )
			table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
		end
	
		local a = math.rad( 0 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	
		surface.DrawPoly( cir )
	end

	function draw.HollowCircle(x,y,radius,s,color) -- Not recommended for use
		if color then
			surface.SetDrawColor(color)
		end

		s = s or 1
		
		for i = 1,s do
			local center = Vector(x,y-i/20,0)
			local scale = Vector(radius+(i/2),radius+(i/2),0)
			local segmentdist = 360/(2*math.pi*math.max(scale.x,scale.y)/2)

			for a = 0,360-segmentdist,segmentdist do
				surface.DrawLine( center.x + math.cos( math.rad( a ) ) * scale.x, center.y - math.sin( math.rad( a ) ) * scale.y, center.x + math.cos( math.rad( a + segmentdist ) ) * scale.x, center.y - math.sin( math.rad( a + segmentdist ) ) * scale.y )
			end
		end
	end
end

function QSWEP.AddSound(a,b,c,d,e,f)
	sound.Add({name = a,channel = b,volume = c,soundlevel = d,pitch = e,sound = f})
end

function QSWEP.AddSoundTbl(t)
	if !istable(t) then
		QSWEP.Error('Need a table, not a '..type(t))
		
		return
	end

	for k,v in pairs(t) do
		local t = {
			name = k,
			channel = v.channel,
			volume = v.volume,
			soundlevel = v.soundlevel,
			pitch = v.pitch,
			sound = v.sound
		}

		sound.Add(t)
	end
end

local function vdatatotbl(s)
	s = string.gsub(s,'\'','"')
	s = string.Split(s,'\n')

	local tbl = {}
	local n = 0
	local lv = ''
	local lv2 = ''
	local tbln = ''

	for k,v in pairs(s) do
		v = string.gsub(v,'	','')
		v = string.gsub(v,' ','')

		if v != '' then
			if string.find(v,'{') then
				n = n+1
			end

			if string.find(v,'}') then
				n = n-1
			end

			if !string.find(v,'{') and !string.find(v,'}') and !string.find(v,'//') then
				if n == 0 then
					v = string.gsub(v,'"','')

					tbl[v] = {}
					tbln = v
					lv = v
				else
					v = string.Split(v,'""')
					v[1] = string.gsub(v[1],'"','')

					if v[1] == 'wave' and lv == 'rndwave' then
						v[1] = v[1]..lv2
						lv2 = lv2..'_'
					end

					if v[2] then
						v[2] = string.gsub(v[2],'"','')

						if n > 1 then
							tbl[tbln][lv][v[1]] = v[2]
						else
							tbl[tbln][v[1]] = v[2]
						end
					else
						if n > 1 then
							tbl[tbln][lv][v[1]] = {}
							lv = v[1]
						else
							tbl[tbln][v[1]] = {}
							lv = v[1]
						end
					end
				end
			end
		end
	end

	return tbl
end

local slt = {
	['SNDLVL_NONE']		= 0,
	['SNDLVL_20dB']		= 20,
	['SNDLVL_25dB']		= 25,
	['SNDLVL_30dB']		= 30,
	['SNDLVL_35dB']		= 35,
	['SNDLVL_40dB']		= 40,
	['SNDLVL_45dB']		= 45,
	['SNDLVL_50dB']		= 50,
	['SNDLVL_55dB']		= 55,
	['SNDLVL_60dB']		= 60,
	['SNDLVL_IDLE']		= 60,
	['SNDLVL_65dB']		= 65,
	['SNDLVL_STATIC']	= 66,
	['SNDLVL_70dB']		= 70,
	['SNDLVL_75dB']		= 75,
	['SNDLVL_NORM']		= 75,
	['SNDLVL_80dB']		= 80,
	['SNDLVL_TALKING']	= 80,
	['SNDLVL_85dB']		= 85,
	['SNDLVL_90dB']		= 90,
	['SNDLVL_95dB']		= 95,
	['SNDLVL_100dB']	= 100,
	['SNDLVL_105dB']	= 105,
	['SNDLVL_110dB']	= 110,
	['SNDLVL_120dB']	= 120,
	['SNDLVL_130dB']	= 130,
	['SNDLVL_140dB']	= 140,
	['SNDLVL_GUNFIRE']	= 140,
	['SNDLVL_150dB']	= 150,	
	['SNDLVL_180dB']	= 180
}

function QSWEP.AddSoundStr(s)
	s = vdatatotbl(s)

	local t = {}

	for k,v in pairs(s) do
		local n = #t+1
		t[n] = {}
		t[n].name = k
		
		if v.channel then
			if _G[v.channel] then
				v.channel = _G[v.channel]
			end

			t[n].channel = v.channel
		end

		if v.volume then
			v.volume = tonumber(v.volume)
			t[n].volume = v.volume
		end

		if v.soundlevel then
			if slt[v.soundlevel] then
				v.soundlevel = slt[v.soundlevel]
			end

			t[n].soundlevel = v.soundlevel
		end

		if v.pitch then
			v.pitch = string.Split(v.pitch,',')

			t[n].pitch = v.pitch
		end

		if v.wave then
			t[n].sound = v.wave
		elseif v.rndwave then
			local tbl = {}

			for k,v in pairs(v.rndwave) do
				tbl[#tbl+1] = v
			end

			t[n].sound = tbl
		end
	end

	for k,v in pairs(t) do
		sound.Add(v)
	end
end

function QSWEP.SendAnim(self,a,f)
	if !IsValid(self) then return end
	if !IsValid(self.Owner) then return end
	if self.Owner:IsNPC() then return end
	if !a then return end

	f = f or function() return true end

	if !f then return end
	
	if istable(a) then
		a = table.Random(a)
	end
	
	local vm = self.Owner:GetViewModel()
	if !IsValid(vm) then return end

	if isstring(a) then
		if a != '' then
			vm:SendViewModelMatchingSequence(vm:LookupSequence(a))
		end
	else
		self:SendWeaponAnim(a)
	end
	
	if self.UpdateNextIdle then
		self:UpdateNextIdle()
	end
end

function QSWEP.IsValidAnim(self,a)
	if !IsValid(self) then return false end
	if !IsValid(self.Owner) then return false end
	if self.Owner:IsNPC() then return false end

	local vm = self.Owner:GetViewModel()

	if !IsValid(vm) then return false end

	if isstring(a) then
		a = vm:LookupSequence(a)
	end

	return a != -1 and vm:SelectWeightedSequence(a or 0) != -1
end

function QSWEP.GetQTGWepList()
	local tbl = {}

	for k,v in pairs(weapons.GetList()) do
		if weapons.IsBasedOn(v.ClassName,'qtg_weapon_base') then
			tbl[#tbl+1] = v
		end
	end

	return tbl
end

function QSWEP.GetQTGWep(s,b)
	if !isstring(s) then
		QSWEP.Error('Requires a string variable, not a '..type(s),true)

		return
	end

	local tbl

	if b then
		tbl = weapons.GetStored(s)
	else
		tbl = weapons.Get(s)
	end

	if tbl and weapons.IsBasedOn(tbl.ClassName,'qtg_weapon_base') then
		return tbl
	end
end

function QSWEP.AddKillIcon(a,...)
	local t = {
		function(...)
			killicon.AddAlias(...)
		end,
		function(...)
			killicon.AddFont(...)
		end
	}

	local def = function(...)
		killicon.Add(...)
	end

	if t[a] then
		t[a](...)
	else
		def(...)
	end
end

function QSWEP.AddKillIconText(a,b)
	if !b then
		if weapons.GetStored(a).PrintName then
			b = weapons.GetStored(a).PrintName
		else
			b = 'Undefined'
		end
	end

	killicon.AddFont(a,'QTG_TextKillIcons',b,Color(255,80,0))
end

function QSWEP.ResetBonePositions(vm)
	if !IsValid(vm) then return end
	if !vm:GetBoneCount() then return end
	
	for i=0,vm:GetBoneCount() do
		vm:ManipulateBoneScale(i,Vector(1,1,1))
		vm:ManipulateBoneAngles(i,Angle(0,0,0))
		vm:ManipulateBonePosition(i,Vector(0,0,0))
	end	
end

QSWEP.__inittbl = QSWEP.__inittbl or {}
function QSWEP.AddWepInit(a,b)
	QSWEP.__inittbl[a] = b
end

function QSWEP.GetWepInit(a)
	if QSWEP.__inittbl[a] then
		return QSWEP.__inittbl[a]
	end

	return QSWEP.__inittbl
end

function QSWEP.Effect(...)
	if !IsFirstTimePredicted() then return end

	util.Effect(...)
end

local bloodtbl = {
	[BLOOD_COLOR_ANTLION] = 'blood_impact_yellow_01',
	[BLOOD_COLOR_ANTLION_WORKER] = 'blood_impact_yellow_01',
	[BLOOD_COLOR_GREEN] = 'blood_impact_yellow_01',
	[BLOOD_COLOR_YELLOW] = 'blood_impact_yellow_01',
	[BLOOD_COLOR_ZOMBIE] = 'blood_impact_yellow_01',
	[BLOOD_COLOR_RED] = 'blood_impact_red_01'
}

local enttbl = {
	['npc_hunter'] = 'blood_impact_synth_01'
}

local function ceff(a,b)
	local p = ents.Create('info_particle_system')
	p:SetKeyValue('effect_name',a)
	p:SetKeyValue('start_active',1)
	p:Spawn()
	p:Activate()
	p:SetPos(b)
	p:Remove(1)
end

function QSWEP.BloodEffect(e,pos)
	if !IsValid(e) then return end
	if CLIENT then return end

	if isfunction(e.GetBloodColor) and bloodtbl[e:GetBloodColor()] then
		ceff(bloodtbl[e:GetBloodColor()],pos)
	end
	
	if isfunction(e.GetClass) and enttbl[e:GetClass()] then
		ceff(enttbl[e:GetClass()],pos)
	end
end

function QSWEP.GetOwner(e)
	QSWEP.Assert(IsValid(e),'Entity is NULL or nil')

	return IsValid(e:GetOwner()) and e:GetOwner() or e
end

function QSWEP.CreateEnt(self,n,owner,m,b,f)
	if !IsValid(self) then return end

	local e = ents.Create(n)
	
	if !QSWEP.Assert(IsValid(e),'Non-existent entities!',true) then return end
	if !b then
		if self.Data then
			e.Data = self.Data
		end

		if self.Weapon then
			e.Weapon = self.Weapon
		end

		if self.WeaponClass then
			e.WeaponClass = self.WeaponClass
		end
	end

	if IsValid(owner) then
		e:SetOwner(owner)
	end

	if isstring(m) then
		if util.IsValidModel(m) then
			e:SetModel(m)
		else
			QSWEP.Error('Model ('..m..') is invalid!')
		end
	end

	if isfunction(f) then
		f(e)
	end

	e:Spawn()
	e:Activate()

	return e,e.GetPhysicsObject and e:GetPhysicsObject() or NULL
end

QSWEP.__repsoundt = QSWEP.__repsoundt or {}
function QSWEP.AddRepSound(a,b,f)
	QSWEP.__repsoundt[#QSWEP.__repsoundt+1] = {
		[1] = a,
		[2] = b,
		func = f
	}
end

function QSWEP.GetRepSound()
	return QSWEP.__repsoundt
end

function QSWEP.GetPlyVM(p)
	if !IsValid(p) then
		if CLIENT then
			if IsValid(LocalPlayer()) then
				p = LocalPlayer()
			end
		elseif game.SinglePlayer() then
			p = Entity(1)
		end
	end

	if !(IsValid(p) and p:IsPlayer() and p:Alive()) then return end
	if IsValid(p) and p:IsNPC() then return end
	if !p.GetViewModel then return end

	local vm = p:GetViewModel()

	if !IsValid(vm) then return end

	return vm
end

function QSWEP.SimpleTimer(n,...)
	local args = {...}
	local func = table.remove(args)

	timer.Simple(n,function()
		if !IsFirstTimePredicted() then return end
		if #args > 0 and !IsValid(args) then return end

		if isfunction(func) then
			return func(unpack(args))
		end
	end)
end

function QSWEP.SafeRemove(e,n)
	if !IsValid(e) or e:IsPlayer() then return end

	e:SafeRemove()
end

QSWEP.Remove = QSWEP.SafeRemove

function table.FullCopy(tab)
	if !tab then return end
	
	local res = {}
	for k, v in pairs(tab) do
		if type(v) == 'table' then
			res[k] = table.FullCopy(v)
		elseif type(v) == 'Vector' then
			res[k] = Vector(v.x,v.y,v.z)
		elseif type(v) == 'Angle' then
			res[k] = Angle(v.p,v.y,v.r)
		else
			res[k] = v
		end
	end
	
	return res
end