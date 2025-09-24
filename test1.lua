local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 🔥 Tự chạy script chính ngay khi load
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anhlinh1136/bladeball/refs/heads/main/Protected_2903763962339231.lua"))()
end)

-- GUI chính Blade Ball (phụ)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BladeBallMenu"
screenGui.Parent = playerGui

-- Nút Toggle (≡)
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 40, 0, 40)
toggleButton.Position = UDim2.new(0, 20, 1, -60) -- góc trái dưới
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Text = "≡"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 24
toggleButton.Parent = screenGui
toggleButton.Active = true
toggleButton.Draggable = true

-- Khung chính GUI phụ
local frame = Instance.new("Frame")
frame.Name = "BladeBallFrame"
frame.Size = UDim2.new(0, 300, 0, 350) -- nhỏ hơn bản cũ
frame.Position = UDim2.new(0.5, -150, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = screenGui

-- Bo tròn
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- ScrollFrame để chứa nút script
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -10, 1, -10)
scroll.Position = UDim2.new(0, 5, 0, 5)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 6)
listLayout.FillDirection = Enum.FillDirection.Vertical
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scroll

-- Hàm thêm nút script
local function createScriptButton(name, url)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Parent = scroll

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        pcall(function()
            loadstring(game:HttpGet(url))()
        end)
    end)

    -- cập nhật chiều cao scroll
    scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end

-- ⚡ Thêm các script nút
createScriptButton("UwU Hub", "https://raw.githubusercontent.com/anhlinh1136/bladeball/refs/heads/main/Protected_2903763962339231.lua")
createScriptButton("Allusive", "https://raw.githubusercontent.com/anhlinh1136/bladeball/refs/heads/main/Protected_2903763962339231.lua")
createScriptButton("RX Hub", "https://pastebin.com/raw/RXhub123")
createScriptButton("Zen Hub", "https://pastebin.com/raw/Zenhub123")
-- Bạn có thể thêm nhiều nút khác theo format trên ↑

-- Toggle ẩn/hiện GUI
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
