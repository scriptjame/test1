local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- chạy script chính NGAY LẬP TỨC
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/newbb/refs/heads/main/tryV3.lua"))()
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

-- ✨ Thêm quảng bá TikTok
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

-- Click mở TikTok
tiktokLabel.MouseButton1Click:Connect(function()
    openLink("https://www.tiktok.com/@evenher6?is_from_webapp=1&sender_device=pc")
end)

-- Fade-in background + text
TweenService:Create(backgroundFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.3}):Play()
TweenService:Create(infoLabel, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

-- 🔽 Toàn bộ phần còn lại của script 1 (loading, Blade Ball menu, danh sách game, fade-in card, toggle nút) giữ nguyên
-- (phần này rất dài, mình sẽ gửi tiếp ở tin nhắn sau để không bị cắt)
-- Loading GUI
local loadingFrame = Instance.new("Frame", hubGui)
loadingFrame.Size = UDim2.new(1,0,1,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
loadingFrame.ZIndex = 100

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1,0,1,0)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextSize = 40
loadingLabel.TextColor3 = Color3.fromRGB(255,255,255)
loadingLabel.Text = "Loading..."
loadingLabel.ZIndex = 101

-- Fade-out loading
task.delay(2, function()
    TweenService:Create(loadingFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    TweenService:Create(loadingLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
    task.wait(1)
    loadingFrame:Destroy()
end)

-- 🏆 Blade Ball Card (đặc biệt)
local function createBladeBallCard()
    local card = Instance.new("Frame")
    card.BackgroundColor3 = Color3.fromRGB(40,40,40)
    card.Size = UDim2.new(0,200,0,150)
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,12)
    Instance.new("UIStroke", card).Thickness = 2

    local img = Instance.new("ImageLabel", card)
    img.Size = UDim2.new(1,0,0.6,0)
    img.BackgroundTransparency = 1
    img.Image = "rbxassetid://14941224990"

    local title = Instance.new("TextLabel", card)
    title.Size = UDim2.new(1,0,0.2,0)
    title.Position = UDim2.new(0,0,0.6,0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Text = "Blade Ball"

    local btn = Instance.new("TextButton", card)
    btn.Size = UDim2.new(0.8,0,0.15,0)
    btn.Position = UDim2.new(0.1,0,0.8,0)
    btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = "Execute"
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/newbb/refs/heads/main/tryV3.lua"))()
    end)

    return card
end

-- Card game chung
local function createGameCard(gameName, scriptUrl)
    local card = Instance.new("Frame")
    card.BackgroundColor3 = Color3.fromRGB(40,40,40)
    card.Size = UDim2.new(0,200,0,150)
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,12)
    Instance.new("UIStroke", card).Thickness = 2

    local title = Instance.new("TextLabel", card)
    title.Size = UDim2.new(1,0,0.2,0)
    title.Position = UDim2.new(0,0,0.1,0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.Text = gameName

    local btn = Instance.new("TextButton", card)
    btn.Size = UDim2.new(0.8,0,0.2,0)
    btn.Position = UDim2.new(0.1,0,0.7,0)
    btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Text = "Execute"
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)

    return card
end

-- Danh sách game
local games = {
    {name = "Prison Life", url = "https://raw.githubusercontent.com/banbanhuy2/T/main/PL.lua"},
    {name = "Pet Simulator 99", url = "https://raw.githubusercontent.com/banbanhuy2/T/main/Pet99.lua"},
    {name = "Prison Tycoon", url = "https://raw.githubusercontent.com/banbanhuy2/T/main/PT.lua"},
    {name = "MM2", url = "https://raw.githubusercontent.com/banbanhuy2/T/main/MM2.lua"}
}

-- Render game cards
task.spawn(function()
    -- Blade Ball trước
    local bladeCard = createBladeBallCard()
    bladeCard.Parent = container
    bladeCard.BackgroundTransparency = 1
    TweenService:Create(bladeCard, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()

    task.wait(0.3)

    -- Các game khác
    for _, g in ipairs(games) do
        local c = createGameCard(g.name, g.url)
        c.Parent = container
        c.BackgroundTransparency = 1
        TweenService:Create(c, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
        task.wait(0.2)
    end
end)

-- Toggle Button (luôn hiện, kể cả khi ẩn hub)
local toggleBtn = Instance.new("TextButton", playerGui)
toggleBtn.Size = UDim2.new(0,40,0,40)
toggleBtn.Position = UDim2.new(0,10,0,10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Text = "+"
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1,0)

toggleBtn.MouseButton1Click:Connect(function()
    hubGui.Enabled = not hubGui.Enabled
end)
