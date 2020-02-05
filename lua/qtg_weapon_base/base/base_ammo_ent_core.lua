QSWEP.addammotype = QSWEP.addammotype or {}

local function tbltotbl(t,t2)
    for k,v in pairs(t) do
        t2[k] = v
    end
end

function QSWEP.AddAmmo(a,b,c,d)
    local class = string.gsub(string.lower(a),' ','_')
    local tbl = {
        name = class,
        tracer = 4,
        maxsplash = 100
    }

    if istable(d) then
        tbltotbl(d,tbl)
    end

    game.AddAmmoType(tbl)

    if CLIENT then language.Add(class..'_ammo',a) end

    QSWEP.addammotype[class] = {name = a,num = b or 20,model = c or 'models/Items/BoxSRounds.mdl'}

    return class
end

local entclass = 'qtg_ent_ammo_'
local function addammoent()
    for k,v in pairs(QSWEP.addammotype) do
        if istable(v) then
            local ENT = {}
            ENT.Type 			= 'anim'
            ENT.Base 			= 'qtg_ent_base_ammo'

            ENT.PrintName       = v.name..' Ammo'
            ENT.Author          = 'Neptune QTG'
            ENT.Category        = 'QTG Weapon Ammo'

            ENT.Model           = v.model
            ENT.AmmoName        = v.name
            ENT.AmmoType        = k
            ENT.AmmoNum         = v.num

            ENT.Spawnable		= true
            ENT.AdminOnly 		= false

            scripted_ents.Register(ENT,entclass..k)
        end
    end
end

timer.Simple(0,function()
    addammoent()
end)

if SERVER then
    concommand.Add('qswep_reload_ammo',function(...)
        addammoent()

        QSWEP.StartNet('reloadammo')
    end)

    QSWEP.ReadNet('reloadammo',function(p)
        addammoent()
    end)
else
    concommand.Add('qswep_reload_ammo',function(...)
        if p:IsAdmin() then
            addammoent()

            QSWEP.StartNet('reloadammo')
        else
            QSWEP.print('You are not an administrator!')
        end
    end)

    QSWEP.ReadNet('reloadammo',function(p)
        addammoent()
    end)
end