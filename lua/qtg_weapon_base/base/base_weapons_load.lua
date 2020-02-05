QSWEP.Weps = QSWEP.Weps or {}

local function load(b)
    local path = 'qtg_weapon_base/weapons'
    local f1,d1 = file.Find(path..'/*','LUA')

    for k,v in pairs(f1) do
        local id = string.sub(v,0,string.len(v)-4)
        QWEP = {Primary = {},Secondary = {}}

        QSWEP:includefile(path..'/'..v,b)

        QSWEP.Weps[id] = QWEP
        QWEP = nil
        weapons.Register(QSWEP.Weps[id],id)
    end
end
load()

local pass = function() end
local old = getmetatable(_G) or {}
local new = table.Copy(old)
local oldf = old.__index or pass

function new.__index(t,k,...)
    if k == 'QWEP' then
        load(true)

        return {Primary = {},Secondary = {}}
    end

    return oldf(t,k,...)
end

setmetatable(_G,new)