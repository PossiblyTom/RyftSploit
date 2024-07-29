local a=game:GetService"UserInputService"
local b=game:GetService"CoreGui"


local function checkIfUIExists()
for c,d in pairs(b:GetChildren())do
if d:IsA"ScreenGui"and d.Name=="TomHubUI"then
print"stop"
return true
end
end
return false
end


local function createUI()
if checkIfUIExists()then
return
end

local c=Instance.new"ScreenGui"
c.Name="TomHubUI"
local d=Instance.new"Frame"
local e=Instance.new"TextLabel"
local f=Instance.new"Frame"
local g=Instance.new"TextButton"
local h=Instance.new"TextButton"
local i=Instance.new"TextButton"
local j=Instance.new"TextButton"
local k=Instance.new"Frame"
local l=Instance.new"Frame"
local m=Instance.new"Frame"
local n=Instance.new"Frame"


c.Parent=b


d.Parent=c
d.BackgroundColor3=Color3.fromRGB(40,40,40)
d.Size=UDim2.new(0,450,0,600)
d.Position=UDim2.new(0.5,-225,0.5,-300)
d.Active=true
d.Draggable=true


e.Parent=d
e.Text="Tom's Hub | Who needs sex anyways?"
e.Font=Enum.Font.SourceSans
e.TextSize=24
e.TextColor3=Color3.fromRGB(255,255,255)
e.BackgroundColor3=Color3.fromRGB(30,30,30)
e.BackgroundTransparency=0
e.Position=UDim2.new(0,0,0,0)
e.Size=UDim2.new(1,0,0,50)
e.BorderSizePixel=0


f.Parent=d
f.BackgroundColor3=Color3.fromRGB(30,30,30)
f.Size=UDim2.new(1,0,0,30)
f.Position=UDim2.new(0,0,0,45)
f.BorderSizePixel=0


local o=Instance.new"Frame"
o.Parent=d
o.BackgroundColor3=Color3.fromRGB(50,50,50)
o.Size=UDim2.new(1,0,1,-80)
o.Position=UDim2.new(0,0,0,80)
o.Visible=true
o.BorderSizePixel=0


local function createTab(p,q,r,s,t)
p.Parent=f
p.Size=UDim2.new(0,80,0,30)
p.Position=q
p.BackgroundColor3=Color3.fromRGB(60,60,60)
p.TextColor3=Color3.fromRGB(255,255,255)
p.Font=Enum.Font.SourceSans
p.TextSize=18
p.Text=r
p.BorderSizePixel=0


s.Parent=o
s.BackgroundColor3=Color3.fromRGB(50,50,50)
s.Size=UDim2.new(1,0,1,0)
s.Position=UDim2.new(0,0,0,0)
s.Visible=false
s.Name=r


local u=0
local v=10
for w,x in ipairs(t)do
u=u+50+v
end
u=u-v


local y=(s.AbsoluteSize.Y-u)/2


for z,A in ipairs(t)do
local B=Instance.new"TextButton"
B.Parent=s
B.Size=UDim2.new(0,177,0,50)
B.Position=UDim2.new(0.5,-88.5,0,y+(z-1)*(50+v))
B.BackgroundColor3=Color3.fromRGB(70,70,70)
B.TextColor3=Color3.fromRGB(255,255,255)
B.Font=Enum.Font.SourceSans
B.TextSize=20
B.Text=A.text
B.BorderSizePixel=0


B.MouseButton1Click:Connect(function()
loadstring(A.loadStringCode)()
end)
end
end


local p={
{text="Aimbot + ESP",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-MainLoader"))()
        ]]},
{text="Infinite Ammo",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-InfAmmo"))()
        ]]},
{text="Fire Rate",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-FireRateTesting"))()
        ]]},
{text="No Equip Time",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/EquipTimeChanger"))()
        ]]},
{text="No Spread",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-NoSpread"))()
        ]]},
{text="Auto All",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-FullAutoEverything"))()
        ]]},
{text="No Recoil",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-NoRecoil"))()
        ]]}
}

local q={
{text="Aimbot + ESP",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Rivals-MainLoader"))()
        ]]},
}

local r={
{text="ESP",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/PhantomForces-BoxESP"))()
        ]]}
}

local s={
{text="Fly",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/arsenalfly"))()
        ]]},
{text="Aimbot (NO ESP)",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/gurraim"))()
        ]]},
{text="Noclip",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/noclip"))()
        ]]},
{text="Fullbright",loadStringCode=[[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/fullbright"))()
        ]]}
}


local t=80
local u=10
local v=(t*4)+(u*3)
local w=(f.AbsoluteSize.X-v)/2

createTab(g,UDim2.new(0,w,0,0),"Arsenal",k,p)
createTab(h,UDim2.new(0,w+t+u,0,0),"Rivals",l,q)
createTab(i,UDim2.new(0,w+2*(t+u),0,0),"Phantom Forces",m,r)
createTab(j,UDim2.new(0,w+3*(t+u),0,0),"Universal",n,s)


local x


local function selectTab(y)
for z,A in ipairs(o:GetChildren())do
if A:IsA"Frame"and A.Name~=y then
A.Visible=false
end
end

local B=o:FindFirstChild(y)
if B then
B.Visible=true
end


for C,D in ipairs(f:GetChildren())do
if D:IsA"TextButton"then
if D.Text==y then
D.BackgroundColor3=Color3.fromRGB(80,80,80)
x=D
else
D.BackgroundColor3=Color3.fromRGB(60,60,60)
end
end
end
end


g.MouseButton1Click:Connect(function()selectTab"Arsenal"end)
h.MouseButton1Click:Connect(function()selectTab"Rivals"end)
i.MouseButton1Click:Connect(function()selectTab"Phantom Forces"end)
j.MouseButton1Click:Connect(function()selectTab"Universal"end)


selectTab"Arsenal"


local function toggleGuiVisibility(y)
if y.KeyCode==Enum.KeyCode.RightShift then
c.Enabled=not c.Enabled
end
end


a.InputBegan:Connect(toggleGuiVisibility)
end


createUI()
