QSWEP.Base = {Primary = {},Secondary = {}}

QSWEP:includedirectory('qtg_weapon_base/base/base_weapon')
QSWEP:includedirectory('qtg_weapon_base/base/base_weapon/client','cl')
QSWEP:includedirectory('qtg_weapon_base/base/base_weapon/server','sv')

QSWEP.OldBase = QSWEP.Base
QSWEP.Base = nil

weapons.Register(QSWEP.OldBase,'qtg_weapon_base')

setmetatable(QSWEP,{__index = function(t,k)
    if k == 'Base' then
        weapons.Register(t.OldBase,'qtg_weapon_base')

        return rawget(t,'OldBase')
    end
end})