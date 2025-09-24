-- Blade Ball GUI phụ (thu nhỏ + thêm scroll + giữ hiệu ứng cũ)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Xoá gui cũ nếu có
local old = playerGui:FindFirstChild("BladeBallMenu")
if old then old:Destroy() end

-- Tạo ScreenGui
local subGui = Instance.new("ScreenGui", playerGui)
subGui.Name = "BladeBallMenu"
subGui.ResetOnSpawn = false

-- Khung chính (Frame nhỏ hơn 25%)
local frame = Instance.new("Frame", subGui)
frame.Size = UDim2.new(0.5, 0, 0.45, 0) -- nhỏ hơn trước
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Tiêu đề
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(230, 230, 230)
title.Text = "⚔️ Blade Ball Scripts"

-- ScrollFrame để chứa danh sách scripts
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)

local list = Instance.new("UIListLayout", scroll)
list.Padding = UDim.new(0, 8)
list.FillDirection = Enum.FillDirection.Vertical
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.VerticalAlignment = Enum.VerticalAlignment.Top
list.SortOrder = Enum.SortOrder.LayoutOrder

-- Hàm tạo nút Script
local function createScriptBtn(text, url, premium)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(0.9, 0, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    -- Hiệu ứng rainbow cho script premium
    if premium then
        task.spawn(function()
            local hue = 0
            while btn.Parent do
                hue = (hue + 1) % 360
                btn.BackgroundColor3 = Color3.fromHSV(hue / 360, 0.8, 0.8)
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
                    Text = "Follow my TikTok and wait for update!",
                    Duration = 5
                })
            end
        end)
        if not ok then warn("⚠️ Script lỗi:", err) end
    end)

    -- Auto cập nhật chiều cao canvas để scroll hoạt động
    scroll.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 20)
end

-- Các scripts
createScriptBtn("Argon Hub X", "https://raw.githubusercontent.com/AgentX771/ArgonHubX/main/Loader.lua")
createScriptBtn("Sinaloa Hub", "https://api.luarmor.net/files/v3/loaders/63e751ce9ac5e9bcb4e7246c9775af78.lua")
createScriptBtn("RX Hub", "https://raw.githubusercontent.com/NodeX-Enc/NodeX/refs/heads/main/Main.lua")
createScriptBtn("Allusive (Premium)", nil, true)
createScriptBtn("UwU (Premium)", nil, true)

-- Nút toggle ẩn/hiện
local toggleBtn = Instance.new("TextButton", subGui)
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(0, 10, 0.8, 0) -- ở góc trái màn hình
toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggleBtn.Text = "≡"
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

toggleBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
end)
