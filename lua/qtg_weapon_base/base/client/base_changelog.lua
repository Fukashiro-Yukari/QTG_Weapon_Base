QSWEP.Version = 1.24123
QSWEP.Changelog = {}
QSWEP.ChangelogDisplay = false

local function addlog(a,b)
	QSWEP.Changelog[#QSWEP.Changelog+1] = {
		id = a,
		c = b
	}
end

addlog('2019/4/13',{
	'Fix some minor bugs',
	'Add the Changelog menu',
	'C-Menu Add a black background',
	'Add Blur',
	'Add more settings',
	'Ballistic adjustment',
	'HUD adjustment',
	'Increase Changelog'
})

addlog('2019/4/30',{
	'Fix some minor bugs',
	'Add weaponicon error detection'
})

addlog('2019/5/1',{
	'Fix Changelog menu arrangement problem',
	'Fix H0L-D4 HUD Mod picking weapon bug'
})

addlog('2019/6/3',{
	'Fix weapon action error',
	'View weapons menu is now always at the top of all interfaces',
	'Weapon tilt modification',
	'Modify weapon font size'
})

addlog('2019/6/23',{
	'Adjust bullet trajectory',
	'Modify the swing amplitude'
})

addlog('2019/6/24',{
	'Fix most bugs',
	'Adjust +zoom weapon to fire'
})

addlog('2019/7/1',{
	'Fix various bugs in single player games (OMG)',
	'Adjust some HUD styles'
})

addlog('2019/7/13',{
	'Fix bugs that need to get twice when picking up items',
	'Fix the crosshair error',
	'Fix custom hud error',
	'Adjust fov'
})

addlog('2019/7/15',{
	'Repair NPC gun action',
	'Fix some minor bugs'
})

addlog('2019/7/24',{
	'Fix single player serious bug'
})

addlog('2019/8/7',{
	'Repair NPC gun action, again',
	'Fix some minor bugs'
})

addlog('2019/8/30',{
	'Add new base: qtg_weapon_sniper_base',
	'Add new weapon: AWP, Water pipe',
	'Add new hook: QTG_DrawHUD, QTG_DrawScope'
})

addlog('2019/8/31',{
	'Add new base: qtg_weapon_grenade_base',
	'Add new weapon: Flashbang, He Grenade, Smoke Grenade',
	'Fix anim error'
})

addlog('2019/9/9',{
	'Fix Grenade base bug'
})

addlog('2019/9/10',{
	'Add new base option'
})

addlog('2019/9/11',{
	'Add bullet penetration and bullet Ricochet',
	'Fix Wep Reloading bug'
})

addlog('2019/9/13',{
	'Fix most bugs',
	'Base default setting adjustment',
	'Add base settings list:',
	'(lua/qtg_weapon_base/documentation)',
	'Can Use (+attack3) for alt fire'
})

addlog('2019/9/14',{
	'Fix bug',
	'Increase the quick add kill icon function',
})

addlog('2019/9/15',{
	'Fix skin problem',
	'Fix single player melee bug'
})

addlog('2019/11/24',{
	'Fix grenade base bug'
})

addlog('2019/11/26',{
	'IsPump works on Sniper base'
})

addlog('2019/11/30',{
	'Big optimization'
})

addlog('2019/12/1',{
	'Fix log menu again',
	'Fixed single-player crosshair display',
	'Fix empty sound bug'
})

addlog('2019/12/4',{
	'Fix melee bug'
})

addlog('2019/12/10',{
	'fix log system again'
})

addlog('2019/12/18',{
	'fix skin bug',
	'fix melee bug'
})

addlog('2019/12/22',{
	'Add fire mode system',
	'Add new weapon',
	'Add more settings'
})

addlog('2019/12/24',{
	'Add hold ironsights',
	'Add lua anim'
})

addlog('2019/12/25',{
	'New gun bob',
	'Add viewmodel option'
})

addlog('2019/12/30',{
	'New gun base "qtg_weapon_akimbo_base"',
	'Add more variables',
	'Added iron sights sound effect'
})

addlog('2020/1/17',{
	'Fix: Melee Running bug',
	'Fix: Grenade Throw bug',
	'Fix: Idle bug',
	'Add: State Function',
	'Add: Deploy and Reload View Bob',
	'Add: New Weapon Crosshair'
})

addlog('2020/1/19',{
	'Fix: Spawn icon fix',
	'Add: Spawn icon support model',
})

addlog('2020/1/30',{
	'Fix: Pickup fix',
})

addlog('2020/2/5',{
	'Fix: off holster bug fix',
	'Add: Add SafeRemove function',
	'Add: DelayFireCancelAnim'
})

addlog('2020/2/7',{
	'Fix: Toggle silencer bug fix',
})

addlog('2020/2/8',{
	'Fix: Network function bug fix',
})

addlog('2020/2/15',{
	'Fix: Shotgun reload fix',
	'Fix: Single player games will also call the client Think function',
	'Add: Grenade weapon will be automatically deleted if there is no remaining ammunition'
})

addlog("2020/3/2",{
	'Fix: Flashbang and smokegrenade optimization',
	'Add: Change angle after crouching',
	'Add: Weapon bob change'
})

addlog("2020/3/3",{
	'Fix: Fix playerspawn hook error',
	'Add: New Inspect Menu',
	'Add: Added Bump action',
	'Add: Added weapon template'
})

local version = tostring(QSWEP.Version)
local versions = tonumber(QSWEP.Version)
local oldversion = ''
local changelog

if !file.Exists('qtg_weapon_base_version.txt','DATA') then
	file.Write('qtg_weapon_base_version.txt',versions)

	QSWEP.ChangelogDisplay = true
end

local f = file.Open('qtg_weapon_base_version.txt','r','DATA')
if f then
	local v = f:ReadLine()
	local vn = tonumber(v or '')
	
	if vn then
		if vn < versions then
			QSWEP.ChangelogDisplay = true
			oldversion = vn
		end

		file.Write('qtg_weapon_base_version.txt',versions)
	end
end

hook.Add('HUDPaint','QTG_DisplayChangelog',function()
	if !IsValid(LocalPlayer()) then return end

	if !changelog then
		changelog = QSWEP.GetConvar('changelog')
	end
	
	if QSWEP.ChangelogDisplay and changelog:GetBool() then
		chat.AddText(Color(0,255,255),'Updated to QTG Weapon Base Version: ',Color(255,0,0),oldversion != '' and oldversion..' ' or '',Color(255,156,0),oldversion != '' and '--> ' or '',Color(0,255,0),version)
		chat.AddText(Color(0,255,0),(QSWEP.Changelog[#QSWEP.Changelog].id)..':')

		for k,v in ipairs(QSWEP.Changelog[#QSWEP.Changelog].c) do
			chat.AddText(Color(255,156,0),'	'..k..'. ',Color(255,255,255),v)
		end
	end
	
	hook.Remove('HUDPaint','QTG_DisplayChangelog')
end)