function QSWEP.AddFont(a,b,c,d,e)
	surface.CreateFont(a,{
		font = b, 
		size = c,
		weight = d,
		additive = e
	})
end

QSWEP.__scanlinesfont = {}

function QSWEP.AddWepFont(n,f,s,b)
	surface.CreateFont(n,{
		font = f,
		size = ScreenScale(s),
		weight = 0,
		additive = true
	})

	surface.CreateFont(n..'2',{
		font = f,
		size = ScreenScale(s),
		scanlines = 4,
		weight = 0,
		blursize = QSWEP.ScreenScaleH(5),
		additive = true,
		antialias = true
	})

	QSWEP.__scanlinesfont[n] = true
end

QSWEP.AddWepFont('QTG_HL2SelectIcons','HALFLIFE2',40)
QSWEP.AddWepFont('QTG_CSSelectIcons','csd',40)
QSWEP.AddWepFont('QTG_SelectIcons','qtg_wepinfo',40)

QSWEP.AddFont('QTG_CSKillIcons','csd',ScreenScale(30),nil,true)
QSWEP.AddFont('QTG_KillIcons','qtg_wepinfo',ScreenScale(30),nil,true)
QSWEP.AddFont('QTG_TextKillIcons','Roboto Bk',ScreenScale(8),nil,true)
QSWEP.AddFont('QTG_Ammo1','Roboto Bk',40,1000,false)
QSWEP.AddFont('QTG_Ammo2','Roboto Bk',30,1000,false)
QSWEP.AddFont('QTG_Ammo3','Roboto Bk',25,1000,false)
QSWEP.AddFont('QTG_InspectName','Roboto Bk',60,1000,false)
QSWEP.AddFont('QTG_InspectName2','Roboto Bk',40,1000,false)
QSWEP.AddFont('QTG_InspectCat','Roboto Bk',25,1000,false)
QSWEP.AddFont('QTG_ChangelogMenu','Roboto',18,500,false)
QSWEP.AddFont('QTG_Changelogtitle','Roboto',23,500,false)
QSWEP.AddFont('QTG_Changelogcontent','Roboto',18,500,false)