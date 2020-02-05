AddCSLuaFile()

ENT.Type 			= 'anim'
ENT.Base 			= 'base_anim'

ENT.PrintName       = 'Ammo Base'
ENT.Author          = 'Neptune QTG'
ENT.Category        = 'QTG Weapon Ammo'

ENT.Model           = 'models/Items/BoxSRounds.mdl'

ENT.AmmoName        = ''
ENT.AmmoType        = ''
ENT.AmmoNum         = 0

ENT.Spawnable		= false
ENT.AdminOnly 		= false

if SERVER then

function ENT:Initialize()
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:DrawShadow(true)
    self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
    end
end

function ENT:PhysicsCollide(d,p)
    if d.Speed > 80 and d.DeltaTime > 0.2 then
        self:EmitSound('Default.ImpactSoft')
    end
end

function ENT:OnTakeDamage(d)
    self:TakePhysicsDamage(d)
end

function ENT:Use(a,c)
    if a:IsPlayer() then
        a:GiveAmmo(self.AmmoNum,self.AmmoType)
    end

    self:Remove()
end

else

function ENT:Initialize() end

local function getfs(a,b)
    surface.SetFont(b or '')
    return surface.GetTextSize(a)
end

function ENT:Draw()
    local p = LocalPlayer()

    self:DrawModel()
    
    local ang = p:GetAngles()
    local fixr = Vector(0,-90,90)
    local pos = self:LocalToWorld(self:OBBCenter())+Vector(0,0,self:OBBMaxs().z*1.5)
    ang.p = 0
    ang:RotateAroundAxis(ang:Right(),fixr.x)
    ang:RotateAroundAxis(ang:Up(),fixr.y)
    ang:RotateAroundAxis(ang:Forward(),fixr.z)

    cam.Start3D2D(pos,ang,0.1)
        local x,y = 0,0

        local function drawtext(a)
            local fx,fy = getfs(a,'QTG_Ammo2')
            draw.SimpleText(a,'QTG_Ammo2',x+3,y+3,Color(0,0,0,200),1,1)
            draw.SimpleText(a,'QTG_Ammo2',x,y,Color(255,255,255,255),1,1)

            y = y+fy
        end

        local fx,fy = getfs(self.AmmoName,'QTG_Ammo2')
        surface.SetDrawColor(0,0,0,200)
        local w = math.max(200,fx+20)
        surface.DrawRect(x-(w/2),y,w,100)

        y = y+20

        drawtext('Ammo:')
        drawtext(self.AmmoName)
        drawtext(self.AmmoNum)
    cam.End3D2D()
end

end