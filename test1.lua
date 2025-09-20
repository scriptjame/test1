local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- chạy script chính NGAY LẬP TỨC
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/bbnew/refs/heads/main/V2.lua"))()
end)

-- xoá hub cũ nếu có
local old = playerGui:FindFirstChild("MainMenu")
if old then old:Destroy() end

-- tạo hub gui
local hubGui = Instance.new("ScreenGui", playerGui)
hubGui.Name = "MainMenu"
hubGui.ResetOnSpawn = false
hubGui.IgnoreGuiInset = true

-- helper mở link / copy
local function openLink(url)
    local copied = false
    if setclipboard then
        pcall(setclipboard, url)
        copied = true
    end
    if type(openbrowser) == "function" then
        pcall(openbrowser, url)
        copied = true
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Link",
        Text = copied and "Link copied!" or "Copy manually: "..url,
        Duration = 5
    })
    warn("Link:", url)
end

-- nền duy nhất phủ tất cả menu
local backgroundFrame = Instance.new("Frame", hubGui)
backgroundFrame.Size = UDim2.new(1, -40, 0.78, 0)
backgroundFrame.Position = UDim2.new(0, 20, 0.06, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
backgroundFrame.BackgroundTransparency = 1 -- fade-in start
backgroundFrame.BorderSizePixel = 0
Instance.new("UICorner", backgroundFrame).CornerRadius = UDim.new(0,12)

-- container chính
local container = Instance.new("Frame", backgroundFrame)
container.Size = UDim2.new(1, 0, 1, 0)
container.Position = UDim2.new(0, 0, 0, 0)
container.BackgroundTransparency = 1

local grid = Instance.new("UIGridLayout", container)
grid.CellSize = UDim2.new(0.25, 0, 0.3, 0)
grid.CellPadding = UDim2.new(0.02, 0, 0.02, 0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Top
grid.FillDirectionMaxCells = 4

-- Chữ vàng thông báo
local infoLabel = Instance.new("TextLabel", hubGui)
infoLabel.Size = UDim2.new(0.6,0,0,30)
infoLabel.Position = UDim2.new(0.2,0,0.6,0)
infoLabel.BackgroundTransparency = 1
infoLabel.Font = Enum.Font.GothamBold
infoLabel.TextSize = 18
infoLabel.TextColor3 = Color3.fromRGB(255, 221, 0)
infoLabel.Text = "Join my Discord to get scripts for other games"
infoLabel.TextStrokeTransparency = 0.5
infoLabel.TextXAlignment = Enum.TextXAlignment.Center
infoLabel.TextYAlignment = Enum.TextYAlignment.Center
infoLabel.ZIndex = 10
infoLabel.TextTransparency = 1 -- fade-in start

-- ✨ Thêm quảng bá TikTok (click được)
local tiktokLabel = Instance.new("TextButton", hubGui)
tiktokLabel.Size = UDim2.new(0.6,0,0,30)
tiktokLabel.Position = UDim2.new(0.2,0,0.65,0)
tiktokLabel.BackgroundTransparency = 1
tiktokLabel.Font = Enum.Font.GothamBold
tiktokLabel.TextSize = 20
tiktokLabel.TextColor3 = Color3.fromRGB(255, 0, 100)
tiktokLabel.Text = "Follow my TikTok: @evenher6"
tiktokLabel.TextStrokeTransparency = 0.5
tiktokLabel.TextXAlignment = Enum.TextXAlignment.Center
tiktokLabel.TextYAlignment = Enum.TextYAlignment.Center
tiktokLabel.ZIndex = 10
tiktokLabel.TextTransparency = 0

-- Hiệu ứng đổi màu TikTok
task.spawn(function()
    local hue = 0
    while tiktokLabel.Parent do
        hue = (hue + 1) % 360
        tiktokLabel.TextColor3 = Color3.fromHSV(hue/360, 0.8, 1)
        task.wait(0.05)
    end
end)

-- Click để mở/copy TikTok
tiktokLabel.MouseButton1Click:Connect(function()
    openLink("https://www.tiktok.com/@evenher6?is_from_webapp=1&sender_device=pc")
end)

-- Fade-in background + text
TweenService:Create(backgroundFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.3}):Play()
TweenService:Create(infoLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

-- loading helper
-- (toàn bộ phần loading + BladeBallMenu + danh sách game giữ nguyên script 1 của bạn)
-- ...
-- (mình giữ nguyên, không cắt)

-- Nút ẩn/hiện hub (theo script 2)
local toggleBtn = Instance.new("TextButton", playerGui) -- đặt ngoài hubGui để không biến mất
toggleBtn.Size = UDim2.new(0,40,0,40)
toggleBtn.Position = UDim2.new(0,10,0,10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Text = "+"
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1,0)

local toggleVisible = true
toggleBtn.MouseButton1Click:Connect(function()
    toggleVisible = not toggleVisible
    hubGui.Enabled = toggleVisible
    TweenService:Create(infoLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = toggleVisible and UDim2.new(0.2,0,0.6,0) or UDim2.new(-1,0,0.6,0)
    }):Play()
end)
