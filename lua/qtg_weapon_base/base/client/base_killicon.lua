local t = {
	function(k,v)
		killicon.Add(v.ClassName,v.KillIconAdd,v.KillIconColor)
	end,
	function(k,v)
		killicon.AddAlias(v.ClassName,v.KillIconAdd)
	end,
	function(k,v)
		killicon.AddFont(v.ClassName,v.KillIconFont,v.KillIconAdd,v.KillIconColor)
	end
}

local function start()
	for k,v in pairs(QSWEP.GetQTGWepList()) do
		if v.KillIconAdd and v.KillIconAdd != '' then
			if t[tonumber(v.KillIconType)+1] then
				t[tonumber(v.KillIconType)+1](k,v)
			end

			if v.KillIconExtraAdd and !table.IsEmpty(v.KillIconExtraAdd) then
				for k,v2 in pairs(v.KillIconExtraAdd) do
					killicon.Add(k,v2,v.KillIconColor)
				end
			end
			
			if v.KillIconExtraAddAlias and !table.IsEmpty(v.KillIconExtraAddAlias) then
				for k,v2 in pairs(v.KillIconExtraAddAlias) do
					killicon.AddAlias(k,v2)
				end
			end
			
			if v.KillIconExtraAddFont and !table.IsEmpty(v.KillIconExtraAddFont) then
				for k,v2 in pairs(v.KillIconExtraAddFont) do
					killicon.AddFont(k,v.KillIconFont,v2,v.KillIconColor)
				end
			end
		end
	end
end

timer.Simple(0,start)
concommand.Add('qswep_reload_killicon',start)