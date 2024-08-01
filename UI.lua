local a=game:GetService"UserInputService"
local b=game:GetService"CoreGui"
local c=game:GetService"TweenService"

local function checkIfUIExists()
for d,e in pairs(b:GetChildren())do
if e:IsA"ScreenGui"and e.Name=="TomHubUI"then
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

local d=Instance.new"ScreenGui"
d.Name="TomHubUI"

local e=Instance.new"Frame"
local f=Instance.new"TextLabel"
local g=Instance.new"Frame"
local h=Instance.new"Frame"

local function addUICorner(i,j)
local k=Instance.new"UICorner"
k.CornerRadius=UDim.new(0,j)
k.Parent=i
end

d.Parent=b

e.Parent=d
e.BackgroundColor3=Color3.fromRGB(40,40,40)
e.Size=UDim2.new(0,450,0,600)
e.Position=UDim2.new(0.5,-225,0.5,-300)
e.Active=true
e.Draggable=true
addUICorner(e,15)

f.Parent=e
f.Text="Tom's Hub | Who needs sex anyways?"
f.Font=Enum.Font.SourceSans
f.TextSize=24
f.TextColor3=Color3.fromRGB(255,255,255)
f.BackgroundColor3=Color3.fromRGB(30,30,30)
f.Size=UDim2.new(1,0,0,50)
f.BorderSizePixel=0


g.Parent=e
g.BackgroundColor3=Color3.fromRGB(30,30,30)
g.Size=UDim2.new(1,0,0,30)
g.Position=UDim2.new(0,0,0,45)
g.BorderSizePixel=0


h.Parent=e
h.BackgroundColor3=Color3.fromRGB(50,50,50)
h.Size=UDim2.new(1,0,1,-80)
h.Position=UDim2.new(0,0,0,80)
h.Visible=true
h.BorderSizePixel=0
addUICorner(h,15)

local function createTab(i,j,k,l,m)
i.Parent=g
i.Size=UDim2.new(0,80,0,30)
i.Position=j
i.BackgroundColor3=Color3.fromRGB(60,60,60)
i.TextColor3=Color3.fromRGB(255,255,255)
i.Font=Enum.Font.SourceSans
i.TextSize=18
i.Text=k
i.BorderSizePixel=0
addUICorner(i,10)

l.Parent=h
l.BackgroundColor3=Color3.fromRGB(50,50,50)
l.Size=UDim2.new(1,0,1,0)
l.Position=UDim2.new(0,0,0,0)
l.Visible=false
l.Name=k
addUICorner(l,15)

local n=(l.AbsoluteSize.Y-#m*60)/2

for o,p in ipairs(m)do
local q=Instance.new"TextButton"
q.Parent=l
q.Size=UDim2.new(0,177,0,50)
q.Position=UDim2.new(0.5,-88.5,0,n+(o-1)*60)
q.BackgroundColor3=Color3.fromRGB(70,70,70)
q.TextColor3=Color3.fromRGB(255,255,255)
q.Font=Enum.Font.SourceSans
q.TextSize=20
q.Text=p.text
q.BorderSizePixel=0
addUICorner(q,10)

q.MouseButton1Click:Connect(function()
loadstring(p.loadStringCode)()
end)
end
end

local i={
{text="Aimbot + ESP",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-MainLoader"))()
        ]]},
{text="Infinite Ammo",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-InfAmmo"))()
        ]]},
{text="Fire Rate (Very Blatant)",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-FireRateTesting"))()
        ]]},
{text="No Equip Time",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/EquipTimeChanger"))()
        ]]},
{text="No Spread (Blatant)",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-NoSpread"))()
        ]]},
{text="Auto All (Blatant)",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-FullAutoEverything"))()
        ]]},
{text="No Recoil",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-NoRecoil"))()
        ]]}
}

local j={
{text="Aimbot + ESP (HEAD ONLY)",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Rivals-MainLoader"))()
        ]]},
{text="Aimbot + ESP(BODY + HEAD)",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Rivals-TestLoader"))()
        ]]}
}

local k={
{text="ESP",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/PhantomForces-BoxESP"))()
        ]]}
}

local l={
{text="Fly",loadStringCode=[[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/flying"))()
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

local m=Instance.new"TextButton"
local n=Instance.new"TextButton"
local o=Instance.new"TextButton"
local p=Instance.new"TextButton"
local q=Instance.new"Frame"
local r=Instance.new"Frame"
local s=Instance.new"Frame"
local t=Instance.new"Frame"

local u=80
local v=10
local w=(u*4)+(v*3)
local x=(g.AbsoluteSize.X-w)/2

createTab(m,UDim2.new(0,x,0,0),"Arsenal",q,i)
createTab(n,UDim2.new(0,x+u+v,0,0),"Rivals",r,j)
createTab(o,UDim2.new(0,x+2*(u+v),0,0),"PF",s,k)
createTab(p,UDim2.new(0,x+3*(u+v),0,0),"Universal",t,l)

local function selectTab(y)
for z,A in ipairs(h:GetChildren())do
if A:IsA"Frame"then
A.Visible=false
end
end

local B=h:FindFirstChild(y)
if B then
B.Visible=true
end

for C,D in ipairs(g:GetChildren())do
if D:IsA"TextButton"then
if D.Text==y then
D.BackgroundColor3=Color3.fromRGB(80,80,80)
else
D.BackgroundColor3=Color3.fromRGB(60,60,60)
end
end
end
end

m.MouseButton1Click:Connect(function()selectTab"Arsenal"end)
n.MouseButton1Click:Connect(function()selectTab"Rivals"end)
o.MouseButton1Click:Connect(function()selectTab"PF"end)
p.MouseButton1Click:Connect(function()selectTab"Universal"end)

selectTab"Arsenal"

local function toggleGuiVisibility(y)
if y.KeyCode==Enum.KeyCode.RightShift then
if d.Enabled then
local A=c:Create(e,TweenInfo.new(0.5),{Position=UDim2.new(0.5,-225,1.5,0)})
A:Play()
A.Completed:Connect(function()
d.Enabled=false
end)
else
d.Enabled=true
local A=c:Create(e,TweenInfo.new(0.5),{Position=UDim2.new(0.5,-225,0.5,-300)})
A:Play()
end
end
end

a.InputBegan:Connect(toggleGuiVisibility)
end

createUI()
