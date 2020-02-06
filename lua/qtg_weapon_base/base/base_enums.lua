QSWEP.ENUM = {}

function QSWEP.GetEnumStr(a,b)
    if !isstring(a) then
        QSWEP.Error('Variables need strings, not '..type(a),true)

        return
    end

    a = string.upper(a)
    b = tonumber(b)

    if QSWEP.ENUM[a] then
        for k,v in pairs(QSWEP.ENUM[a]) do
            if v == b then
                return string.lower(k)
            end
        end

        QSWEP.Error('Id not find! ('..b..')',true)

        return
    end

    QSWEP.Error('Id not find! ('..a..')',true)
end

function QSWEP.GetEnum(a,b)
    if !isstring(a) or !isstring(b) then
        QSWEP.Error('Variable needs a string, variable 1 is '..type(a)..', variable 2 is '..type(b),true)

        return
    end

    a = string.upper(a)
    b = string.upper(b)

    if QSWEP.ENUM[a] then
        if QSWEP.ENUM[a][b] then
            return QSWEP.ENUM[a][b]
        end

        QSWEP.Error('Id not find! ('..b..')',true)

        return
    end

    QSWEP.Error('Id not find! ('..a..')',true)
end

function QSWEP.IsValidEnum(a,b)
    if !isstring(a) or !isstring(b) then
        QSWEP.Error('Variable needs a string, variable 1 is '..type(a)..', variable 2 is '..type(b),true)

        return
    end

    a = string.upper(a)
    b = string.upper(b)

    if QSWEP.ENUM[a] and QSWEP.ENUM[a][b] then
        return true
    end

    return false
end

function QSWEP.AddEnum(a,b,c)
    if !isstring(a) or !isstring(b) then
        QSWEP.Error('Variable needs a string, variable 1 is '..type(a)..', variable 2 is '..type(b),true)

        return
    end

    a = string.upper(a)
    b = string.upper(b)
    c = c or 0

    QSWEP.ENUM[a] = QSWEP.ENUM[a] or {}
    QSWEP.ENUM[a].__idi = QSWEP.ENUM[a].__idi or c
    QSWEP.ENUM[a][b] = QSWEP.ENUM[a].__idi
    QSWEP.ENUM[a].__idi = QSWEP.ENUM[a].__idi+1
end

local addid = QSWEP.AddEnum
local type = 'MeleeHit'

addid(type,'Null',-1)
addid(type,'Cut')
addid(type,'Bullet')

local type = 'WepInfo'

addid(type,'Def')
addid(type,'Model')
addid(type,'Font')
addid(type,'PNG')

local type = 'Killicon'

addid(type,'Def')
addid(type,'Alias')
addid(type,'Font')

local type = 'State'

addid(type,'Idle')
addid(type,'Deploy')
addid(type,'DeployCustom')
addid(type,'Holster')
addid(type,'HolsterCustom')
addid(type,'HolsterFinish')
addid(type,'Zoom')
addid(type,'Run')
addid(type,'Reload')
addid(type,'ReloadCustom')
addid(type,'Push')
addid(type,'Pump')
addid(type,'Pin')
addid(type,'ToggleSilencer')