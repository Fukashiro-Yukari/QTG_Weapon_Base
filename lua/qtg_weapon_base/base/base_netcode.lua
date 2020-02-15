if SERVER then
	QSWEP.ReadNet('GetNPCdisposition',function(p,e)
		if IsValid(p) and IsValid(e) then
			if e:IsNPC() then
				e:SetNW2Int('QSWEP_GetNPCdisposition',e:Disposition(p))
			end
		end
	end)

	QSWEP.ReadNet('isdrawply',function(p,b)
		p:SetNW2Bool('qswep_isdrawply',b)
	end)
else
	QSWEP.ReadNet('Fixfuckingbug',function(p,vm,w)
		if !IsValid(vm) then return end

		if w.OffSkin then
			w:OffSkin(vm)
		end
		
		QSWEP.ResetBonePositions(vm)
	end)
end

QSWEP.ReadNet('callfunc',function(p,w,n,...)
	if !IsValid(w) then return end

	if w[n] then
		w[n](w,...)
	end
end)