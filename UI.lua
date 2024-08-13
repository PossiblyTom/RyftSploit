local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local lastPosition -- Variable to store the last position of the UI

local function checkIfUIExists()
    for _, child in pairs(CoreGui:GetChildren()) do
        if child:IsA("ScreenGui") and child.Name == "TomHubUI" then
            print("UI already exists.")
            return true
        end
    end
    return false
end

local function createUI()
    if checkIfUIExists() then
        return
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TomHubUI"

    local mainFrame = Instance.new("Frame")
    local titleBar = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local tabBar = Instance.new("Frame")
    local contentFrame = Instance.new("Frame")
    
    local function addUIStroke(element, thickness, color)
        local stroke = Instance.new("UIStroke")
        stroke.Thickness = thickness
        stroke.Color = color
        stroke.Parent = element
    end

    screenGui.Parent = CoreGui

    mainFrame.Parent = screenGui
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45) -- Darker background for better contrast
    mainFrame.Size = UDim2.new(0, 450, 0, 600)
    mainFrame.Position = UDim2.new(0.5, -225, 0.5, -300) -- Initial position
    mainFrame.Active = true
    mainFrame.Draggable = true
    addUIStroke(mainFrame, 2, Color3.fromRGB(255, 255, 255)) -- White outline for main frame

    titleBar.Parent = mainFrame
    titleBar.BackgroundColor3 = Color3.fromRGB(70, 130, 180) -- ImGui top bar blue
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BorderSizePixel = 0
    addUIStroke(titleBar, 1, Color3.fromRGB(255, 255, 255)) -- White line for title bar

    titleLabel.Parent = titleBar
    titleLabel.Text = "Tom's Hub | No Seriously, Who needs sex anyways?"
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextStrokeTransparency = 0.7
    titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) -- Black stroke for better readability

    tabBar.Parent = mainFrame
    tabBar.BackgroundColor3 = Color3.fromRGB(55, 55, 55) -- Slightly lighter background for tabs
    tabBar.Size = UDim2.new(0, 80, 1, -30)
    tabBar.Position = UDim2.new(0, 0, 0, 30)
    tabBar.BorderSizePixel = 0
    addUIStroke(tabBar, 1, Color3.fromRGB(255, 255, 255)) -- White line for side bar

    contentFrame.Parent = mainFrame
    contentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Even darker background for content
    contentFrame.Size = UDim2.new(1, -80, 1, -30)
    contentFrame.Position = UDim2.new(0, 80, 0, 30)
    contentFrame.BorderSizePixel = 0

    local function createTab(button, position, text, frame, items)
        button.Parent = tabBar
        button.Size = UDim2.new(1, 0, 0, 50)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 16
        button.Text = text
        button.BorderSizePixel = 0
        

        frame.Parent = contentFrame
        frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.Position = UDim2.new(0, 0, 0, 0)
        frame.Visible = false
        frame.Name = text

        local yOffset = 10
        for _, item in ipairs(items) do
            local itemButton = Instance.new("TextButton")
            itemButton.Parent = frame
            itemButton.Size = UDim2.new(0, 371, 0, 40)
            itemButton.Position = UDim2.new(0.537, -200, 0, yOffset)
            itemButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            itemButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            itemButton.Font = Enum.Font.SourceSans
            itemButton.TextSize = 14
            itemButton.Text = item.text
            itemButton.BorderSizePixel = 0
            

            itemButton.MouseButton1Click:Connect(function()
                loadstring(item.loadStringCode)()
            end)

            yOffset = yOffset + 50
        end
    end

    local arsenalItems = {
        {text = "Aimbot + ESP", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-MainLoader"))()]]},
        {text = "Infinite Ammo", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-InfAmmo"))()]]},
        {text = "Fire Rate (Very Blatant)", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-FireRateTesting"))()]]},
        {text = "No Equip Time", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/EquipTimeChanger"))()]]},
        {text = "No Spread (Blatant)", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-NoSpread"))()]]},
        {text = "Auto All (Blatant)", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-FullAutoEverything"))()]]},
        {text = "No Recoil", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Arsenal-NoRecoil"))()]]}
    }

    local rivalsItems = {
        {text = "Aimbot + ESP (HEAD ONLY)", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Rivals-MainLoader"))()]]},
        {text = "Aimbot + ESP(BODY + HEAD)", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/Rivals-TestLoader"))()]]}
    }

    local pfItems = {
        {text = "ESP", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/PhantomForces-BoxESP"))()]]}
    }

    local universalItems = {
        {text = "Fly", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/flying"))()]]},
        {text = "Aimbot (NO ESP)", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/gurraim"))()]]},
        {text = "Noclip", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/noclip"))()]]},
        {text = "Fullbright", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/fullbright"))()]]},
        {text = "FOV Slider", loadStringCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TomsStuff/Toms-Executor/main/FOV-SLIDER"))()]]}
    }

    local tabButtons = {}
    local contentFrames = {}

    local function setupTabs()
        tabButtons[1] = Instance.new("TextButton")
        tabButtons[2] = Instance.new("TextButton")
        tabButtons[3] = Instance.new("TextButton")
        tabButtons[4] = Instance.new("TextButton")

        contentFrames[1] = Instance.new("Frame")
        contentFrames[2] = Instance.new("Frame")
        contentFrames[3] = Instance.new("Frame")
        contentFrames[4] = Instance.new("Frame")

        createTab(tabButtons[1], UDim2.new(0, 0, 0, 0), "Arsenal", contentFrames[1], arsenalItems)
        createTab(tabButtons[2], UDim2.new(0, 0, 0, 50), "Rivals", contentFrames[2], rivalsItems)
        createTab(tabButtons[3], UDim2.new(0, 0, 0, 100), "PF", contentFrames[3], pfItems)
        createTab(tabButtons[4], UDim2.new(0, 0, 0, 150), "Universal", contentFrames[4], universalItems)
    end

    setupTabs()

    local function selectTab(tabName)
        for _, frame in ipairs(contentFrame:GetChildren()) do
            if frame:IsA("Frame") then
                frame.Visible = frame.Name == tabName
            end
        end

        for _, button in ipairs(tabBar:GetChildren()) do
            if button:IsA("TextButton") then
                if button.Text == tabName then
                    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                else
                    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                end
            end
        end
    end

    for _, button in ipairs(tabButtons) do
        button.MouseButton1Click:Connect(function()
            selectTab(button.Text)
        end)
    end

    selectTab("Arsenal")

    local function toggleGuiVisibility(input)
        if input.KeyCode == Enum.KeyCode.RightShift then
            if screenGui.Enabled then
                lastPosition = mainFrame.Position -- Save the current position
                local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5), { Position = UDim2.new(0.5, -225, 1.5, 0) })
                tween:Play()
                tween.Completed:Connect(function()
                    screenGui.Enabled = false
                end)
            else
                screenGui.Enabled = true
                local targetPosition = lastPosition or UDim2.new(0.5, -225, 0.5, -300) -- Restore the saved position or default if none
                mainFrame.Position = UDim2.new(0.5, -225, 1.5, 0) -- Move UI off-screen
                local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5), { Position = targetPosition })
                tween:Play()
            end
        end
    end

    UserInputService.InputBegan:Connect(toggleGuiVisibility)
end

createUI()
