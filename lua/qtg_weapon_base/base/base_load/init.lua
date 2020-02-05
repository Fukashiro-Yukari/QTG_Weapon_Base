local tname = 'QSWEP'

_G[tname] = {}

local t = _G[tname]
t.Name = 'QTG Wepaon Base'
t.Author = 'Neptune QTG'
t.IsGM = false
t.Path = {
	{'qtg_weapon_base/base','sh'},
	{'qtg_weapon_base','sh'},
	{'qtg_weapon_base/base/client','cl'},
	{'qtg_weapon_base/client','cl'},
	{'qtg_weapon_base/base/server','sv'},
	{'qtg_weapon_base/server','sv'}
}

if t.IsGM then
	setmetatable(GM,{__index = function(tbl,k) return rawget(t,k) end})
end

function t.print(a)
	MsgC(Color(0,255,255),'['..t.Name..'] '..a..'\n')
end

local print = t.print

local ift = {
	['doc_'] = function(self,p)
	end,
	['cl_'] = function(self,p)
		self:includeclientfile(p)
	end,
	['sv_'] = function(self,p)
		self:includeserverfile(p)
	end,
	['sh'] = function(self,p)
		self:includefile(p)
	end,
}

function t:includefile(f,b)
	if !file.Exists(f,'LUA') then return end
	
	if SERVER then
		AddCSLuaFile(f)
	end
	
	include(f)
	
	if !b then
		print('Loading shared file: '..f)
	end
end

function t:includeclientfile(f,b)
	if !file.Exists(f,'LUA') then return end
	
	if SERVER then
		AddCSLuaFile(f)
	else
		include(f)

		if !b then
			print('Loading client file: '..f)
		end
	end
end

function t:includeserverfile(f,b)
	if !file.Exists(f,'LUA') then return end
	
	if SERVER then
		AddCSLuaFile(f)
		include(f)

		if !b then
			print('Loading server file: '..f)
		end
	end
end

function t:includedirectory(d,b)
	local f,dir = file.Find(d..'/*.lua','LUA')
	for _,v in pairs(f) do
		local type

		if b and ift[b..'_'] then
			type = b..'_'
		end

		if !type then
			for k,_ in pairs(ift) do
				if v:StartWith(k) then
					type = k
				end
			end
		end

		ift[type or 'sh'](self,d..'/'..v)
	end
end

function t:includegamemodedirectory(d,b)
	local _,dir = file.Find(d..'/gamemode/*','LUA')
	for _,v in pairs(dir) do
		local f2,d2 = file.Find(d..'/gamemode/'..v..'/*','LUA')
		for _,v2 in pairs(f2) do
			local type

			if b and ift[b..'_'] then
				type = b..'_'
			end

			if !type then
				for k,_ in pairs(ift) do
					if v2:StartWith(k) then
						type = k
					end
				end
			end

			ift[type or 'sh'](self,d..'/gamemode/'..v..'/'..v2)
		end
	end
end

function t:init()
    print(SERVER and 'Loading server...' or 'Loading client...')

	if self.IsGM then
		self:includefile(GM.FolderName..'/gamemode/shared.lua')
		self:includegamemodedirectory(GM.FolderName)
		self:includedirectory(GM.FolderName)
	end

	for k,v in ipairs(self.Path) do
		self:includedirectory(unpack(v))
	end

	print(SERVER and 'Server loading completed!' or 'Client loading completed!')
end
t:init()