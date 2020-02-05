QSWEP.__ofunc = QSWEP.__ofunc or {}

local function ofunction(a,b,c,d,e,f,g)
    local n = b

    if isstring(g) then
        n = g
    end

	if type(a) ~= 'table' then a = _G end
    if not a[b] then return end
    if QSWEP.__ofunc[n] then return end
	
    QSWEP.__ofunc[n] = a[b]

    local old = QSWEP.__ofunc[b]
	a[b] = function(...)
		local tbl = {...}

		if type(d) == 'function' then
			local r = d(...)
			
			if r and #tbl ~= c then
				if r == true then
					if type(e) == 'function' then
						return e(...)
					elseif type(e) == 'table' then
						return unpack(e)
					else
						return
					end
				else
					tbl = {d(...)}
				end
			end
		end

		if type(f) == 'function' then
			local r2 = f(old(...))

			if r2 ~= nil then
				return unpack({f(old(...))})
			end
		end

		return old(unpack(tbl))
	end
end

-- ofunction(surface,'CreateFont',nil,function(n,t)
--     if !t or !t.font then return end

--     QSWEP.FontTbl = QSWEP.FontTbl or {}
--     QSWEP.FontTbl[n] = t
-- end)