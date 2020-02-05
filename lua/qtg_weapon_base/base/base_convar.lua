function QSWEP.AddConvar(a,b,c)
	if c then
		if !ConVarExists('cl_qswep_'..a) then CreateClientConVar('cl_qswep_'..a,b,true,true) end
	else
		if !ConVarExists('sv_qswep_'..a) then CreateConVar('sv_qswep_'..a,b,CLIENT and {FCVAR_REPLICATED} or {FCVAR_REPLICATED,FCVAR_ARCHIVE,FCVAR_NOTIFY}) end
	end
end

function QSWEP.GetConvar(a,b)
	if ConVarExists('sv_qswep_'..a) or b == 'sv' then
		return GetConVar('sv_qswep_'..a)
	elseif ConVarExists('cl_qswep_'..a) or b == 'cl' then
		return GetConVar('cl_qswep_'..a)
	end
	
	error('"'..a..'" QTG Weapon Base Convar Not Found!')
end

QSWEP.GetConVar = QSWEP.GetConvar

QSWEP.AddConvar('crosshair',1,true)
QSWEP.AddConvar('crosshair_dot',0,true)
QSWEP.AddConvar('crosshair_aid',0,true)
QSWEP.AddConvar('crosshair_r',255,true)
QSWEP.AddConvar('crosshair_g',255,true)
QSWEP.AddConvar('crosshair_b',255,true)
QSWEP.AddConvar('crosshair_a',255,true)
QSWEP.AddConvar('crosshair_team',1,true)
QSWEP.AddConvar('crosshair_good_r',0,true)
QSWEP.AddConvar('crosshair_good_g',255,true)
QSWEP.AddConvar('crosshair_good_b',0,true)
QSWEP.AddConvar('crosshair_bad_r',255,true)
QSWEP.AddConvar('crosshair_bad_g',0,true)
QSWEP.AddConvar('crosshair_bad_b',0,true)
QSWEP.AddConvar('custom_hud',1,true)
QSWEP.AddConvar('custom_hud_r',255,true)
QSWEP.AddConvar('custom_hud_g',255,true)
QSWEP.AddConvar('custom_hud_b',255,true)
QSWEP.AddConvar('custom_menu',1,true)
QSWEP.AddConvar('custom_menu_key',0,true)
QSWEP.AddConvar('blur_reload',1,true)
QSWEP.AddConvar('blur_deploy',0,true)
QSWEP.AddConvar('vm_bob',1,true)
QSWEP.AddConvar('vm_idle',1,true)
QSWEP.AddConvar('view_tilt',0,true)

QSWEP.AddConvar('altatt_key',0)
QSWEP.AddConvar('ironsights',1)
QSWEP.AddConvar('holdironsights',0)
QSWEP.AddConvar('changelog',1)
QSWEP.AddConvar('running',1)
QSWEP.AddConvar('penetration',1)
QSWEP.AddConvar('ricochet',1)
QSWEP.AddConvar('reload',1)
QSWEP.AddConvar('spreadinair',1)