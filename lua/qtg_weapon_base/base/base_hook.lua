IN_ATTACK3 = 33554432

local addhook = QSWEP.AddHook

local hide = {
    ['CHudAmmo'] = true,
	['CHudSecondaryAmmo'] = true
}

addhook('HUDShouldDraw',function(n)
	if hide[n] and QSWEP.PlyUseQWEP() and QSWEP.GetConvar('custom_hud',true):GetBool() then
		return false
	end
end)

local key
local cmenu = QSWEP.GetConvar('custom_menu',true)
local cmenukey = QSWEP.GetConvar('custom_menu_key',true)

local function GetInspectionKey()
	if cmenukey and cmenukey:GetInt() > 0 then
		key = cmenukey:GetInt()
	else
		key = input.GetKeyCode(input.LookupBinding('+menu_context',true) or 'c')
	end
	
	return key
end

addhook('ContextMenuOpen',function()
	local p = LocalPlayer()

	if !IsValid(p) then return end
	if GetViewEntity() != p then return end

	local w = p.GetActiveWeapon and p:GetActiveWeapon() or nil
	
	if !IsValid(w) then return end

	if GetInspectionKey() == input.GetKeyCode(input.LookupBinding('+menu_context',true) or 'c') and QSWEP.PlyUseQWEP() and !p:KeyDown(IN_USE) and cmenu:GetBool() then
		return false
	end
end)

addhook('PlayerCanPickupWeapon',function(p,w)
	if w.NPCWeaponsOnly and w:IsQSWEP() then
		return false
	end
end)

local kd_old
local attalt = QSWEP.GetConvar('altatt_key','sv')
local ironsights = QSWEP.GetConvar('ironsights')
addhook('StartCommand',function(c,u)
	if !IsFirstTimePredicted() then return end
	if c:InVehicle() and !c:GetAllowWeaponsInVehicle() then return end
	if !QSWEP.PlyUseQWEP(c) then return end

	local w = c:GetActiveWeapon()
	local key = attalt:GetBool() and IN_ATTACK3 or IN_ZOOM

	if !ironsights:GetBool() and w.Base != 'qtg_weapon_sniper_base' then return end
	
	c:QTG_SetALTKeyDown(u:KeyDown(key))

	local kd = c:QTG_ALTKeyDown()
	
	if u:KeyDown(key) and w.IronSightsPos and w.IronSightsAng and w.Secondary.CanUse then
		if !w:GetPAttacking() and w:GetNextSecondaryFire() < CurTime() and w:GetNextPrimaryFire() < CurTime() then
			if !w.Secondary.Automatic and kd == kd_old then else
				if w:CanSecondaryAttack(true) and !w:GetPAttacking() then
					w:SecondaryAttack(true)
					w:QTG_CallFunc('SecondaryAttack',true)
				elseif w:GetNextAltFire() < CurTime() then
					w:QTG_CallFunc('EmitClientSound',w.EmptySound)
					w:SetNextAltFire(CurTime()+w.Secondary.Delay)
				end
			end
		end

		if !attalt:GetBool() then
			u:RemoveKey(key)
		end
	end

	kd_old = kd
end)

local function fixholster(p,e)
	local w = p.GetActiveWeapon and p:GetActiveWeapon() or nil

	if !QSWEP.PlyUseQWEP(p) or !IsValid(w) then return end

	w:SetState('holsterfinish')
	w:SetSelectWeapon(w)
	w:FinishHolster()
end

addhook('AllowPlayerPickup',function(p,e)
	fixholster(p,e)
end)

addhook('CanPlayerEnterVehicle',function(p,v,r)
	if p:GetAllowWeaponsInVehicle() then return end
	
	fixholster(p,v)
end)

local repwep = 'qtg_weapon_pipe'
local function createwep(e)
	for k,v in pairs(ents.FindInSphere(e:GetPos(),100)) do
		if v:GetClass() == 'prop_physics' and v:GetModel() == 'models/props_canal/mattpipe.mdl' then
			local w = ents.Create(repwep)
			if IsValid(w) then
				w:SetPos(v:GetPos())
				w:Spawn()
				v:Remove()
			end
		end
	end
end

addhook('AcceptInput',function(e,i,a,c,v)
	if game.GetMap() == 'd1_canals_03' then
		if (IsValid(e) and e:GetClass() == 'env_entity_maker') and i == 'ForceSpawn' and (IsValid(a) and a:GetClass() == 'npc_citizen') and (IsValid(c) and c:GetClass() == 'logic_choreographed_scene') then
			timer.Simple(0,function()
				if IsValid(a) then
					createwep(a)
				end
			end)
		end
	end
end)

addhook('PlayerDroppedWeapon',function(p,w)
	local vm = p.GetViewModel and p:GetViewModel() or nil

	if IsValid(w) then
		w.Inspecting = false

		timer.Simple(0,function()
			if IsValid(w) then
				w.Inspecting = false
			end
		end)
	end
	
	if p:IsPlayer() then
		QSWEP.StartNet('Fixfuckingbug',vm,w,'Send',p)
	end
end)

local hookoff = false
local nodmgt = {
	['npc_combinegunship'] = 50,
	['npc_strider'] = 26
}

local nodmgent = {
	['crossbow_bolt'] = true
}

addhook('EntityTakeDamage',function(t,d)
	if hookoff then return end
	if nodmgt[t:GetClass()] and d:GetDamage() < nodmgt[t:GetClass()] then
		hookoff = true

		t:TakeDamage(d:GetDamage(),d:GetAttacker(),d:GetInflictor())

		hookoff = false
	end

	local i = d:GetInflictor()
	
	if !IsValid(i) then return end

	if nodmgent[i:GetClass()] and i.Data and i.Data.Damage then
		QSWEP.BloodEffect(t,d:GetDamagePosition())

		d:SetDamage(i.Data.Damage or 100)

		if (t:IsPlayer() or t:IsNPC() or type(t) == 'NextBot') then
			d:SetDamageForce(i:GetForward()*(i.Data.Damage*300))
		elseif IsValid(t:GetPhysicsObject()) then
			t:GetPhysicsObject():ApplyForceCenter(i:GetForward()*(i.Data.Damage*300))
		end
	end

	if Ekillicon and i.GetClass and i:GetClass() != 'env_fire' then return end
    
    if i.WeaponClass then
        local w = i.Weapon

        if IsValid(w) and w.KillIconEntShowWepIcon then
            d:SetInflictor(w)
            d:SetAttacker(QSWEP.GetOwner(i))
        end
    end
end)

addhook('EntityEmitSound',function(t)
	for k,v in pairs(QSWEP.__repsoundt) do
		if v.func(t) then
			if t.OriginalSoundName == v[1] then
				t.Entity:EmitSound(v[2])

				return false
			elseif t.SoundName == v[1] then
				t.SoundName = v[2]

				return true
			end
		end
	end
end)

if CLIENT then
	local blurmat = Material('pp/blurscreen')
	
	local c_blur = 0
	local h_Inspect = 0
	
	local HoldTypeList = {
		['pistol'] = 'Pistol',
		['smg'] = 'Sub-Machine Gun',
		['grenade'] = 'Grenade',
		['ar2'] = 'Rifle',
		['shotgun'] = 'Shotgun',
		['rpg'] = 'RPG',
		['physgun'] = 'Physgun',
		['crossbow'] = 'Crossbow',
		['melee'] = 'Melee',
		['slam'] = 'SLAM',
		['fist'] = 'Fist',
		['melee2'] = 'Melee',
		['knife'] = 'Melee',
		['duel'] = 'Duel Pistol',
		['camera'] = 'Camera',
		['magic'] = 'Fist',
		['revolver'] = 'Revolver',
	}
	
	addhook('RenderScreenspaceEffects',function()
		if !QSWEP.PlyUseQWEP() then return end

		local p = LocalPlayer()

		if !IsValid(p) then return end
		if GetViewEntity() != p then return end

		local drawply = p:ShouldDrawLocalPlayer()
		local w = p.GetActiveWeapon and p:GetActiveWeapon() or nil

		if !IsValid(w) then return end

		c_blur = math.Approach(c_blur or 0,w.Inspecting and 1 or 0,FrameTime()*3)
		
		if c_blur > 0 and drawply then
			surface.SetDrawColor(255,255,255)
			surface.SetMaterial(blurmat)
			
			local b = 5
			local w,h = ScrW(),ScrH()
			
			for i = 1,b do
				blurmat:SetFloat('$blur',i*c_blur)
				blurmat:Recompute()
				render.UpdateScreenEffectTexture()
				surface.DrawTexturedRect(0,0,w,h)
			end
			
			surface.SetDrawColor(0,0,0,120*c_blur)
			surface.DrawRect(0,0,ScrW(),ScrH())
		end
	end)

	local function drawtext(a,b,c,d,e,f,g)
		draw.SimpleText(a,b,c+2,d+2,Color(0,0,0,e.a-55),f,g)
		draw.SimpleText(a,b,c,d,e,f,g)
	end
	
	addhook('DrawOverlay',function()
		if gui.IsGameUIVisible() then return end
		
		local p = LocalPlayer()

		if !IsValid(p) then return end
		if GetViewEntity() != p then return end

		local pos = {x=50,y=150}
		local x = pos.x
		local y = pos.y
		local w = p.GetActiveWeapon and p:GetActiveWeapon() or nil
		
		if !IsValid(w) then return end
		if !QSWEP.PlyUseQWEP() then return end
		
		local clip1,clip2 = w:Clip1(),w:Clip2()
		local ammotype,ammotype2 = w.Primary.Ammo,w.Secondary.Ammo
		local ammocount,ammocount2 = w.Owner:GetAmmoCount(ammotype),w.Owner:GetAmmoCount(ammotype2)
		local captext = 'Capacity : '..(w.Chambering and (w.Akimbo and w.Primary.ClipSize..' + 2 Rounds' or w.Primary.ClipSize..' + 1 Rounds') or w.Primary.ClipSize..' Rounds')
		local cap2text = 'ALT-Capacity : '..(w.Chambering and (w.Akimbo and w.Secondary.ClipSize..' + 2 Rounds' or w.Secondary.ClipSize..' + 1 Rounds') or w.Secondary.ClipSize..' Rounds')
		local ammotext,ammo2text = 'RESERVE: '..ammocount,'ALT-Ammo: '..ammocount2
		local typetext,type2text = language.GetPhrase(ammotype..'_ammo'),language.GetPhrase(ammotype2..'_ammo')
		
		h_Inspect = math.Approach(h_Inspect or 0,w.Inspecting and 1 or 0,FrameTime()*3)
		
		if h_Inspect > 0 then
			local icolor = Color(255,255,255,255*h_Inspect)

			drawtext(w.PrintName,'QTG_InspectName',x,y,icolor,TEXT_ALIGN_LIFE)
			
			if HoldTypeList[w.HoldType] or w.WeaponType then
				y = y+55
				local HoldTypeText = w.WeaponType != '' and w.WeaponType or HoldTypeList[w.HoldType]
				drawtext(HoldTypeText,'QTG_InspectName2',x,y,icolor,TEXT_ALIGN_LIFE)
			end
			
			if w.Instructions != '' then
				y = y+100
				
				if w.InspectMarkup == nil then
					local str
					local text_color='<color=0,0,0,0>'
					str = '<font=QTG_InspectCat>'..text_color..w.Instructions..'</color>\n</font>'
					
					w.InspectMarkup = markup.Parse(str,500)
				end
				
				if w.InspectMarkupT == nil then
					local str
					local text_color='<color='..icolor.r..','..icolor.g..','..icolor.b..','..icolor.a..'>'
					str = '<font=QTG_InspectCat>'..text_color..w.Instructions..'</color>\n</font>'

					w.InspectMarkupT = markup.Parse(str,500)
				end
				
				if w.Inspecting then
					w.InspectMarkup:Draw(x+3,y+3,nil,nil,255)
					w.InspectMarkupT:Draw(x,y,nil,nil,255)

					if w.InspectMarkupT['totalHeight'] < 400 then
						y = y+w.InspectMarkupT['totalHeight']+50
					else
						x = x+505
					end
				end
			else
				y = y+100
			end
			
			icolor = Color(100,100,255,255*h_Inspect)
			
			local cat = w.Category or 'Other'
			
			drawtext(cat,'QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			
			x = x+10
			y = y+30
			
			if w.Author != '' then
				drawtext('Author : '..w.Author,'QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			else
				drawtext('Base Author : Neptune QTG','QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			end
			
			if clip1>=0 then
				y = y+30

				drawtext(captext,'QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			end
			
			if w:GetPrimaryAmmoType() != -1 then
				y = y+30

				drawtext('Ammo : '..typetext,'QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			end
			
			if clip2>=0 then
				y = y+30

				drawtext(cap2text,'QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			end
			
			if w:GetSecondaryAmmoType() != -1 then
				y = y+30

				drawtext('ALT-Ammo : '..type2text,'QTG_InspectCat',x,y,icolor,TEXT_ALIGN_LIFE)
			end
		end
	end)
	
	local kd_old
	addhook('Think',function()
		local p = LocalPlayer()
		
		if !IsValid(p) then return end
		if GetViewEntity() != p then return end
		
		local w = p.GetActiveWeapon and p:GetActiveWeapon() or nil
		
		if !IsValid(w) then return end
		if !w.QSWEPToggleInspect then return end
		
		local key = GetInspectionKey()
		local kd = input.IsKeyDown(key)
		
		if IsValid(vgui.GetKeyboardFocus()) then
			kd = false
		end
		
		if kd != kd_old and kd and cmenu:GetBool() and !(p:KeyDown(IN_USE) and !w.Inspecting) then
			w:QSWEPToggleInspect()
		end
		
		kd_old = kd
	end)

	local h_text = 0

	local function ciammo(a)
		if isnumber(a) then
			return string.format('%.0f',a)
		elseif a != nil then
			return a
		end
		
		return -1
	end

	local reload = QSWEP.GetConvar('reload')

	local function drawhud(w,pos,clip1,clip2,pclip,sclip)
		local ct = CurTime()
		local custom = isfunction(w.CustomAmmoDisplay) and w:CustomAmmoDisplay() or nil
		local chud = QSWEP.GetConvar('custom_hud'):GetBool()
		local cclip1,cclip2
		local cammocount,cammocount2
		local ammotype,ammotype2 = w.Primary.Ammo,w.Secondary.Ammo
		local ammocount,ammocount2 = w.Owner:GetAmmoCount(ammotype),w.Owner:GetAmmoCount(ammotype2)
		local clip1text = 'MAG: '..(clip1 > pclip and pclip..' + '..clip1-pclip or clip1)
		local clip2text = 'ALT-MAG: '..(clip2 > sclip and sclip..' + '..clip2-sclip or clip2)
		local ammotext,ammo2text = 'RESERVE: '..ammocount,'ALT-Ammo: '..ammocount2
		local typetext,type2text = language.GetPhrase(ammotype..'_ammo'),language.GetPhrase(ammotype2..'_ammo')
		
		surface.SetFont('QTG_Ammo1')
		
		local x = pos.x-30
		local y = pos.y-50
		
		if chud then
			local pr,pr2 = math.Clamp(clip1/pclip,0,1),math.Clamp(clip2/sclip,0,1)
			local pr3,pr4 = ammocount > 0 and 1 or 0,ammocount2 > 0 and 1 or 0
			local chr,chg,chb = QSWEP.GetConvar('custom_hud_r'):GetInt(),QSWEP.GetConvar('custom_hud_g'):GetInt(),QSWEP.GetConvar('custom_hud_b'):GetInt()
			
			h_text = math.Approach(h_text or 0,w:GetShowChud() > ct and !w.Inspecting and 1 or 0,FrameTime()*2)
			
			if h_text > 0 then
				if custom then
					cclip1,cclip2 = custom.PrimaryClip,custom.SecondaryClip
					cammocount,cammocount2 = custom.PrimaryAmmo,custom.SecondaryAmmo
					
					local cclip1text,cclip2text = 'MAG: '..ciammo(cclip1),'ALT-MAG: '..ciammo(cclip2)
					local cammotext,cammo2text = 'RESERVE: '..ciammo(cammocount),'ALT-Ammo: '..ciammo(cammocount2)
					
					if ciammo(cclip1) != -1 then
						drawtext(cclip1text,'QTG_Ammo1',x-5,y,Color(chr,chg,chb,255*h_text),TEXT_ALIGN_RIGHT)

						x = x-15
						y = y+40
					end
					
					if ciammo(cammocount) != -1 then
						drawtext(cammotext,'QTG_Ammo2',x-5,y,Color(chr,chg,chb,255*h_text),TEXT_ALIGN_RIGHT)

						x = x-10
						y = y+30
					end
					
					if ciammo(cclip2) != -1 then
						drawtext(cclip2text,'QTG_Ammo3',x-5,y,Color(chr,chg,chb,255*h_text),TEXT_ALIGN_RIGHT)

						x = x-10
						y = y+25
					end
					
					if ciammo(cammocount2) != -1 then
						drawtext(cammo2text,'QTG_Ammo3',x-5,y,Color(chr,chg,chb,255*h_text),TEXT_ALIGN_RIGHT)

						x = x-10
						y = y+25
					end
				end
				
				if clip1 >= 0 and reload:GetBool() then
					drawtext(clip1text,'QTG_Ammo1',x-5,y,Color(255*(1-pr)+chr*pr,chg*pr,chb*pr,255*h_text),TEXT_ALIGN_RIGHT)

					x = x-15
					y = y+40
				end
				
				if w:GetPrimaryAmmoType() != -1 then
					drawtext(ammotext,'QTG_Ammo2',x-5,y,Color(255*(1-pr3)+chr*pr3,chg*pr3,chb*pr3,255*h_text),TEXT_ALIGN_RIGHT)

					x = x-10
					y = y+30
				end
				
				if clip2 >= 0 and reload:GetBool() then
					drawtext(clip2text,'QTG_Ammo3',x-5,y,Color(255*(1-pr2)+chr*pr2,chg*pr2,chb*pr2,255*h_text),TEXT_ALIGN_RIGHT)

					x = x-10
					y = y+25
				end
				
				if w:GetSecondaryAmmoType() != -1 then
					drawtext(ammo2text,'QTG_Ammo3',x-5,y,Color(255*(1-pr4)+chr*pr4,chg*pr4,chb*pr4,255*h_text),TEXT_ALIGN_RIGHT)

					x = x-10
					y = y+25
				end

				if !table.IsEmpty(w:GetFireModeTbl()) and w:GetFireModeTbl()[w:GetFireMode()].name then
					local s = #w:GetFireModeTbl() > 1 and ' | +' or ''
					local name = w:GetFireModeTbl()[w:GetFireMode()].name
					name = name == 'Round Burst' and w.FireModeRoundBurstNum..' '..name or name

					drawtext(name..s,'QTG_Ammo3',x-5,y,Color(chr,chg,chb,255*h_text),TEXT_ALIGN_RIGHT)

					x = x-10
					y = y+25
				end
			end
		end
	end

	addhook('HUDPaint',function()
		if !QSWEP.PlyUseQWEP() then return end

		local p = LocalPlayer()

		if !IsValid(p) then return end
		if GetViewEntity() != p then return end

		local w = p.GetActiveWeapon and p:GetActiveWeapon() or nil
	
		if !IsValid(w) then return end

		local pos = {x = ScrW()/2+300,y = ScrH()/2+300}
		local pos2 = {x = ScrW()/2-300,y = ScrH()/2+300}
		local drawply = p:ShouldDrawLocalPlayer()
		
		if drawply then
			local att = w:GetAttachment(w.FireEffectsAtt or 1)
			local att2 = w:GetAttachment(w.FireEffectsAtt2 or 2)

			if att then
				pos = att.Pos:ToScreen()
			end

			if att2 then
				pos2 = att2.Pos:ToScreen()
			end
		else
			local vm = w.Owner:GetViewModel()

			if IsValid(vm) then
				local att = vm:GetAttachment(w.FireEffectsAtt or 1)
				local att2 = vm:GetAttachment(w.FireEffectsAtt2 or 2)

				if att then
					pos = att.Pos:ToScreen()
				end

				if att2 then
					pos2 = att2.Pos:ToScreen()
				end
			end
		end

		local clip1,clip2 = w:Clip1(),w:Clip2()
		local pclip,sclip = w.Primary.ClipSize,w.Secondary.ClipSize

		if w.Akimbo then
			drawhud(w,pos,w:GetRClip(),clip2,math.Round(pclip/2),sclip)
			drawhud(w,pos2,w:GetLClip(),clip2,math.Round(pclip/2),sclip)
		else
			drawhud(w,pos,clip1,clip2,pclip,sclip)
		end

		if w.GetZoomLvl and w:GetZoomLvl() != 0 and w:GetState('zoom') and w.GetSniperPumping and w:GetSniperPumping() < CurTime() then
			local sw = ScrW()
			local sh = ScrH()
			
			local x = sw / 2
			local y = sh / 2

			local b = hook.Run('QTG_PreDrawScope',w)

			if w.Secondary.ScopeEffect then
				surface.SetDrawColor(w.Secondary.ScopeColor or Color(255,255,255))
				surface.SetTexture(surface.GetTextureID('effects/lens'))
				surface.DrawTexturedRectRotated(x,y,sh,sh,0)
			end

			if w.Secondary.Scope and w.Secondary.Scope != '' then
				surface.SetDrawColor(w.Secondary.ScopeColor or Color(255,255,255))
				surface.SetTexture(w.Secondary.Scope)
				surface.DrawTexturedRectRotated(x,y,sh,sh,0)
			end
			
			surface.SetDrawColor(0,0,0)
			
			local ls = x-y+2

			if w.Secondary.ScopeBorder then
				surface.DrawRect(0,0,ls,sh)
				surface.DrawRect(x+y-2,0,ls,sh)
				
				surface.DrawLine(0,0,sw,0)
				surface.DrawLine(0,sh-1,sw,sh-1)
			end

			local b2 = hook.Run('QTG_DrawScope',w)
			if !b2 and !b then
				local weight = 5
				local gap = 80
				
				surface.DrawRect(ls, y - weight / 2, y - gap, weight)
				surface.DrawRect(x - weight / 2, y + gap, weight, y - gap)
				surface.DrawRect(x + gap, y - weight / 2, y - gap, weight)
				
				surface.DrawLine(x - gap, y - 1, x + gap, y - 1)
				surface.DrawLine(x - 1, 0, x - 1, y + gap)
				
				draw.NoTexture()
				surface.SetDrawColor(255, 0, 0, 255)
				draw.Circle(x, y - 1, 2, 48)
			end
		end

		hook.Run('QTG_DrawHUD',w)
	end)
end