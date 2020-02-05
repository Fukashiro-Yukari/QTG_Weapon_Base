function QSWEP.AddFont(a,b,c,d,e)
	surface.CreateFont(a,{
		font = b, 
		size = c,
		weight = d,
		additive = e
	})
end

QSWEP.AddFont('QTG_HL2SelectIcons','HALFLIFE2',ScreenScale(40),nil,true)
QSWEP.AddFont('QTG_CSSelectIcons','csd',ScreenScale(40),nil,true)
QSWEP.AddFont('QTG_SelectIcons','qtg_wepinfo',ScreenScale(40),nil,true)
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