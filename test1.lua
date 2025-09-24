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

-- Frame chính
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
shadow.Image = "rbxassetid://6015897843"
shadow.ImageTransparency = 0.4
shadow.BackgroundTransparency = 1

-- Auto resize
local function resizeFrame()
    local screenSize = workspace.CurrentCamera.ViewportSize
    local w = math.clamp(screenSize.X * 0.45, 320, 650)
    local h = math.clamp(screenSize.Y * 0.45, 260, 520)
    frame.Size = UDim2.new(0, w, 0, h)
end
resizeFrame()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(resizeFrame)

-- Tiêu đề
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 45)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(180, 255, 200)
title.TextStrokeTransparency = 0.5
title.Text = "⚔️ Blade Ball Scripts"

-- Scroll
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

-- Hàm loading trước khi chạy script
local function runWithLoading(url)
    local loading = Instance.new("TextLabel", frame)
    loading.Size = UDim2.new(1, -20, 0, 30)
    loading.Position = UDim2.new(0, 10, 1, -40)
    loading.BackgroundTransparency = 1
    loading.Font = Enum.Font.Gotham
    loading.TextSize = 16
    loading.TextColor3 = Color3.fromRGB(200, 200, 255)
    loading.Text = "⏳ Loading..."
    task.wait(3)
    loading:Destroy()
    loadstring(game:HttpGet(url))()
end

-- Hàm tạo nút script
local function createScriptBtn(text, url, premium, socialType)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    btn.AutoButtonColor = false
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.Text = text
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    -- Hover
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 90)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 45)}):Play()
    end)

    -- Rainbow cho script đặc biệt
    if premium or socialType then
        task.spawn(function()
            local hue = 0
            while btn.Parent do
                hue = (hue + 1) % 360
                btn.TextColor3 = Color3.fromHSV(hue/360, 0.8, 1)
                task.wait(0.05)
            end
        end)
    end

    -- Khi bấm
    btn.MouseButton1Click:Connect(function()
        local ok, err = pcall(function()
            if socialType == "tiktok" then
                setclipboard("https://www.tiktok.com/@evenher6?is_from_webapp=1&sender_device=pc")
                game.StarterGui:SetCore("SendNotification", {
                    Title = "TikTok",
                    Text = "Link copied! Paste in browser 🔗",
                    Duration = 5
                })
            elseif socialType == "youtube" then
                setclipboard("https://youtube.com/")
                game.StarterGui:SetCore("SendNotification", {
                    Title = "YouTube",
                    Text = "Link copied! Subscribe for more 🔔",
                    Duration = 5
                })
            elseif socialType == "discord" then
                setclipboard("https://discord.com/")
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Discord",
                    Text = "Link copied! Join community 💬",
                    Duration = 5
                })
            elseif url then
                -- 3 script đầu có loading
                if text == "Argon Hub X" or text == "Sinaloa Hub" or text == "RX Hub" then
                    runWithLoading(url)
                else
                    loadstring(game:HttpGet(url))()
                end
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
createScriptBtn("Allusive", nil, true)
createScriptBtn("UwU", nil, true)

-- Social buttons
createScriptBtn("⭐ Follow my TikTok for script updates!", nil, false, "tiktok")
createScriptBtn("📺 Subscribe my YouTube for more scripts!", nil, false, "youtube")
createScriptBtn("💬 Join my Discord for more game scripts!", nil, false, "discord")

-- Toggle nút
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
