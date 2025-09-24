-- Blade Ball GUI phụ (hiện đại + auto resize + hiệu ứng)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Xoá gui cũ nếu có
local old = playerGui:FindFirstChild("BladeBallMenu")
if old then old:Destroy() end

-- ⚡ Chạy script chính trước
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/trybb/refs/heads/main/tryV3.lua"))()
end)

-- GUI chính
local subGui = Instance.new("ScreenGui", playerGui)
subGui.Name = "BladeBallMenu"
subGui.ResetOnSpawn = false

-- Frame chính (có shadow & bo góc)
local frame = Instance.new("Frame", subGui)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

local shadow = Instance.new("ImageLabel", frame)
shadow.ZIndex = 0
shadow.Size = UDim2.new(1, 60, 1, 60)
shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Image = "rbxassetid://6015897843" -- shadow mềm
shadow.ImageTransparency = 0.4
shadow.BackgroundTransparency = 1

-- Hàm auto resize
local function resizeFrame()
    local screenSize = workspace.CurrentCamera.ViewportSize
    local w = math.clamp(screenSize.X * 0.45, 320, 650)
    local h = math.clamp(screenSize.Y * 0.45, 260, 520)
    frame.Size = UDim2.new(0, w, 0, h)
end
resizeFrame()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(resizeFrame)

-- Tiêu đề neon
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 45)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(180, 255, 200)
title.TextStrokeTransparency = 0.5
title.Text = "⚔️ Blade Ball Scripts"

-- Scroll để chứa scripts
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, -20, 1, -65)
scroll.Position = UDim2.new(0, 10, 0, 55)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)

local list = Instance.new("UIListLayout", scroll)
list.Padding = UDim.new(0, 8)
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder

-- Hàm tạo nút script hiện đại
local function createScriptBtn(text, url, premium)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.AutoButtonColor = false
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.Text = text
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    -- Hover effect
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 90)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
    end)

    -- Premium glow (rainbow)
    if premium then
        task.spawn(function()
            local hue = 0
            while btn.Parent do
                hue = (hue + 1) % 360
                btn.TextColor3 = Color3.fromHSV(hue/360, 0.8, 1)
                task.wait(0.05)
            end
        end)
    end

    btn.MouseButton1Click:Connect(function()
        local ok, err = pcall(function()
            if url then
                loadstring(game:HttpGet(url))()
            else
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Premium",
                    Text = "Follow my TikTok để nhận update!",
                    Duration = 5
                })
            end
        end)
        if not ok then warn("⚠️ Script lỗi:", err) end
    end)

    -- Update scroll
    scroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 20)
end

-- Scripts
createScriptBtn("Argon Hub X", "https://raw.githubusercontent.com/AgentX771/ArgonHubX/main/Loader.lua")
createScriptBtn("Sinaloa Hub", "https://api.luarmor.net/files/v3/loaders/63e751ce9ac5e9bcb4e7246c9775af78.lua")
createScriptBtn("RX Hub", "https://raw.githubusercontent.com/NodeX-Enc/NodeX/refs/heads/main/Main.lua")
createScriptBtn("Allusive (Premium)", nil, true)
createScriptBtn("UwU (Premium)", nil, true)

-- Toggle nút (fade in/out)
local toggleBtn = Instance.new("TextButton", subGui)
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 15, 0.75, 0)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
toggleBtn.Text = "≡"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

local visible = true
toggleBtn.MouseButton1Click:Connect(function()
    visible = not visible
    if visible then
        frame.Visible = true
        frame.BackgroundTransparency = 1
        TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play()
    else
        TweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        task.delay(0.3, function()
            if not visible then frame.Visible = false end
        end)
    end
end)
