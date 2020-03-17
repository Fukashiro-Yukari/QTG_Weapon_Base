local dofunc = {
    function(self,tbl,w,h)
        if !self.ModelPanel then return end

        if !self.ModelPanel.__qtgisdraw then
            local model = ''

            if tbl.WorldModel and tbl.WorldModel != '' then
                model = tbl.WorldModel
            end

            if tbl.WeaponInfoModelCustom and tbl.WeaponInfoModelCustom != '' then
                model = tbl.WeaponInfoModelCustom
            end

            if model != '' then
                self.ModelPanel:SetVisible(true)
                self.ModelPanel:SetModel(model)
            end

            self.ModelPanel.__qtgisdraw = true
        end

        self.ModelPanel:SetSize(128-10-(self.Border*2),128-10-(self.Border*2))
        self.ModelPanel:SetPos(5+self.Border,5+self.Border)
    end,
    function(self,tbl,w,h)
        if !self.Label2 then return end

        if !self.Label2.__qtgisdraw then
            self.Label2:SetVisible(true)
            self.Label2:SetFont(tbl.WeaponInfoFontCustom)
            self.Label2:SetText(tbl.WeaponInfoFontIcon)
            self.Label2:SetTextColor(tbl.WeaponInfoFontColor)

            self.Label2.__qtgisdraw = true
        end

        self.Label2:SetSize(128-10-(self.Border*2),128-10-(self.Border*2))
        self.Label2:SetPos(5+self.Border,5+self.Border)
    end
}

local function start()
    local p = vgui.GetControlTable('ContentIcon')

    if p then
        p.__oldinit = p.__oldinit or p.Init

        function p:Init()
            self:__oldinit()

            self.Image2 = self:Add('DImage')
            self.Image2:SetPos(3,3)
            self.Image2:SetSize(128-6,128-6)
            self.Image2:SetVisible(false)

            self.Label2 = self:Add('DLabel')
            self.Label2:SetPos(5,5)
            self.Label2:SetSize(128-10,128-10)
            self.Label2:SetVisible(false)

            self.ModelPanel = self:Add('SpawnIcon')
            self.ModelPanel:SetPos(5,5)
            self.ModelPanel:SetSize(128-10,128-10)
            self.ModelPanel:SetVisible(false)
            self.ModelPanel:SetMouseInputEnabled(false)
            self.ModelPanel:SetKeyBoardInputEnabled(false)
            self.ModelPanel:SetZPos(-99)
        end

        p.__oldpaint = p.__oldpaint or p.Paint

        function p:Paint(w,h,...)
            self:__oldpaint(w,h,...)

            if !self.Image:GetMaterial() and self:GetSpawnName() then
                if istable(self.__qtgsweptbl) then
                    local tbl = self.__qtgsweptbl

                    if !hook.Run('QTG_PrePaintContentIcon',tbl,w,h,...) then
                        if tbl.WeaponInfoType and dofunc[tbl.WeaponInfoType] then
                            dofunc[tbl.WeaponInfoType](self,tbl,w,h)
                        end
                    end

                    hook.Run('QTG_PaintContentIcon',tbl,w,h,...)

                    if IsValid(self) and self:GetContentType() == 'weapon' and tbl.WeaponInfoType == 1 and !self.__qtgisofuncopenmenu then
                        local tbl2 = {}
    
                        self:ToTable(tbl)
    
                        local obj = tbl[1]
    
                        self.OpenMenu = function(icon)
                            local menu = DermaMenu()
    
                            menu:AddOption('#spawnmenu.menu.copy',function()
                                SetClipboardText(obj.spawnname)
                            end):SetIcon('icon16/page_copy.png')
    
                            menu:AddOption('#spawnmenu.menu.spawn_with_toolgun',function()
                                RunConsoleCommand('gmod_tool','creator')
                                RunConsoleCommand('creator_type','3')
                                RunConsoleCommand('creator_name',obj.spawnname)
                            end):SetIcon('icon16/brick_add.png')
    
                            if icon.ModelPanel then
                                menu:AddOption('#spawnmenu.menu.rerender',function()
                                    icon.ModelPanel:RebuildSpawnIcon()
                                end):SetIcon('icon16/picture.png')

                                menu:AddOption('#spawnmenu.menu.edit_icon',function()
                                    local editor = vgui.Create('IconEditor')
                                    editor:SetIcon(icon.ModelPanel)
                                    editor:Refresh()
                                    editor:MakePopup()
                                    editor:Center()
                                end):SetIcon('icon16/pencil.png')
                            end
                            
                            menu:AddSpacer()
    
                            menu:AddOption('#spawnmenu.menu.delete',function()
                                icon:Remove()
                                hook.Run('SpawnlistContentChanged',icon)
                            end):SetIcon('icon16/bin_closed.png')
    
                            menu:Open()
                        end

                        self.__qtgisofuncopenmenu = true
                    end
                elseif self.__qtgsweptbl != true then
                    local t = QSWEP.GetQTGWep(self:GetSpawnName())

                    if istable(t) then
                        self.__qtgsweptbl = t
                    else
                        self.__qtgsweptbl = true
                    end
                end
            end
        end
    end
end

timer.Simple(0,start)