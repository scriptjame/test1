-- ⚔️ Blade Ball GUI phụ (PRO UI UPDATE)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local setclipboard = setclipboard or toclipboard or set_clipboard

-- Xoá gui cũ nếu có
local old = playerGui:FindFirstChild("BladeBallMenu")
if old then old:Destroy() end

-- ⚡ Chạy script chính
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/bladeball/refs/heads/main/Protected_2903763962339231.lua"))()
end)

-- GUI
local gui = Instance.new("ScreenGui",playerGui)
gui.Name = "BladeBallMenu"
gui.ResetOnSpawn = false

-- SOUND CLICK
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://6026984224"
clickSound.Volume = 1
clickSound.Parent = gui

-- MAIN FRAME
local frame = Instance.new("Frame",gui)
frame.Size = UDim2.new(0,420,0,320)
frame.Position = UDim2.new(0.5,-210,0.5,-160)
frame.BackgroundColor3 = Color3.fromRGB(20,20,25)
frame.BorderSizePixel = 0

Instance.new("UICorner",frame).CornerRadius = UDim.new(0,12)

-- GRADIENT
local grad = Instance.new("UIGradient",frame)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,40)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(15,15,20))
}

-- RGB BORDER
local stroke = Instance.new("UIStroke",frame)
stroke.Thickness = 2

task.spawn(function()
    local h=0
    while frame.Parent do
        h=(h+1)%360
        stroke.Color = Color3.fromHSV(h/360,1,1)
        task.wait(0.03)
    end
end)

-- TITLE
local title = Instance.new("TextLabel",frame)
title.Size = UDim2.new(1,-60,0,35)
title.Position = UDim2.new(0,10,0,5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "⚔️ Blade Ball Scripts"
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(200,255,200)
title.TextXAlignment = Enum.TextXAlignment.Left

-- HIDE BUTTON (-)
local hideBtn = Instance.new("TextButton",frame)
hideBtn.Size = UDim2.new(0,30,0,30)
hideBtn.Position = UDim2.new(1,-35,0,5)
hideBtn.Text = "-"
hideBtn.Font = Enum.Font.GothamBold
hideBtn.TextSize = 22
hideBtn.TextColor3 = Color3.fromRGB(255,255,255)
hideBtn.BackgroundColor3 = Color3.fromRGB(45,45,55)
Instance.new("UICorner",hideBtn).CornerRadius = UDim.new(1,0)

-- OPEN BUTTON
local openBtn = Instance.new("TextButton",gui)
openBtn.Size = UDim2.new(0,40,0,40)
openBtn.Position = UDim2.new(0,20,0.6,0)
openBtn.Text = "≡"
openBtn.Font = Enum.Font.GothamBold
openBtn.TextSize = 20
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BackgroundColor3 = Color3.fromRGB(40,40,50)
openBtn.Visible = false
Instance.new("UICorner",openBtn).CornerRadius = UDim.new(1,0)

-- SCROLL
local scroll = Instance.new("ScrollingFrame",frame)
scroll.Size = UDim2.new(1,-20,1,-90)
scroll.Position = UDim2.new(0,10,0,45)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 5

local list = Instance.new("UIListLayout",scroll)
list.Padding = UDim.new(0,6)
list.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- SCRIPT BUTTON
local function createScriptBtn(text,url,premium,copyTikTok)

    local btn = Instance.new("TextButton",scroll)
    btn.Size = UDim2.new(0.9,0,0,40)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,45)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 15
    btn.TextColor3 = Color3.fromRGB(230,230,230)
    btn.Text = text
    btn.AutoButtonColor = false

    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(60,60,90)}):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(35,35,45)}):Play()
    end)

    if premium then
        task.spawn(function()
            local h=0
            while btn.Parent do
                h=(h+1)%360
                btn.TextColor3 = Color3.fromHSV(h/360,0.8,1)
                task.wait(0.05)
            end
        end)
    end

    btn.MouseButton1Click:Connect(function()
        clickSound:Play()

        if copyTikTok then
            if setclipboard then
                setclipboard("www.tiktok.com/@renan1627")
            end

            game.StarterGui:SetCore("SendNotification",{
                Title="Copied!",
                Text="Follow my TikTok and Youtube!",
                Duration=5
            })

        else
            if url then
                loadstring(game:HttpGet(url))()
            end
        end
    end)

end

-- SCRIPTS (GIỮ NGUYÊN)
createScriptBtn("Makzinn Hub","https://raw.githubusercontent.com/MagoKazinn/Makzinn_hub/main/makzinn_Hub")
createScriptBtn("Argon Hub X","https://raw.githubusercontent.com/AgentX771/ArgonHubX/main/Loader.lua")
createScriptBtn("Frostware Hub need key","https://raw.githubusercontent.com/Fsploit/F-R-O-S-T-W-A-R-E/refs/heads/main/Main")
createScriptBtn("Catsus Hub","https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua")
createScriptBtn("RX Hub","https://raw.githubusercontent.com/NodeX-Enc/NodeX/refs/heads/main/Main.lua")
createScriptBtn("Allusive",nil,true,true)
createScriptBtn("UwU",nil,true,true)

-- HIDE GUI
hideBtn.MouseButton1Click:Connect(function()
    clickSound:Play()
    frame.Visible=false
    openBtn.Visible=true
end)

-- OPEN GUI
openBtn.MouseButton1Click:Connect(function()
    clickSound:Play()
    frame.Visible=true
    openBtn.Visible=false
end)

-- DRAG SYSTEM
local function makeDraggable(obj)

    local dragging=false
    local dragInput
    local start
    local startPos

    obj.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 then
            dragging=true
            start=input.Position
            startPos=obj.Position

            input.Changed:Connect(function()
                if input.UserInputState==Enum.UserInputState.End then
                    dragging=false
                end
            end)
        end
    end)

    obj.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement then
            dragInput=input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input==dragInput and dragging then
            local delta=input.Position-start
            obj.Position=UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset+delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset+delta.Y
            )
        end
    end)

end

makeDraggable(frame)
makeDraggable(openBtn)
