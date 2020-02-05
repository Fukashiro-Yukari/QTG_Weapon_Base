local addhook = QSWEP.AddHook

addhook('PopulateMenuBar',function(m)
	local name = language.GetPhrase('menubar.npcs') == 'menubar.npcs' and 'NPCs' or '#menubar.npcs'

	m = m:AddOrGetMenu(name)

	local ms = m:AddSubMenu('QTG Weapon Override')
	ms:SetDeleteSelf(false)
	ms:AddCVar('Default Weapon','gmod_npcweapon','')
	ms:AddCVar('None','gmod_npcweapon','none')
	ms:AddSpacer()
	
	local wlist = {}

	for k,v in pairs(QSWEP.GetQTGWepList()) do
		if v.Spawnable and !v.PLYWeaponsOnly then
			local c = v.Category or 'Other'

			wlist[c] = wlist[c] or {}
			wlist[c][#wlist[c]+1] = {
				class = v.ClassName,
				title = v.PrintName or v.ClassName
			}
		end
	end

	local ck = table.GetKeys(wlist)
	table.sort(ck,function(a,b) return a < b end)

	for _,k in ipairs(ck) do
		local v = wlist[k]
		local ws = ms:AddSubMenu(k)
		ws:SetDeleteSelf(false)
		table.SortByMember(v,'title',true)

		for k,v2 in ipairs(v) do
			ws:AddCVar(v2.title,'gmod_npcweapon',v2.class)
		end
	end
end,'QTG_Base_NpcMenu') -- fuck the shit name

local nwl = list.GetForEdit('NPCUsableWeapons')
addhook('PlayerSpawnNPC',function(p,n,w)
	if !isstring(w) or w == '' then return end

	if !nwl[w] then
		local wt = weapons.GetStored(w)

		if wt and wt.Spawnable and !wt.AdminOnly and !wt.PLYWeaponsOnly and weapons.IsBasedOn(wt.ClassName,'qtg_weapon_base') then
			nwl[w] = {
				class = wt.ClassName,
				title = wt.PrintName or wt.ClassName
			}
		end
	end
end)