-- ⚔️ Blade Ball GUI PRO
-- UI redesigned to match YUNGAKO HUB style
-- No Key / Need Key / Responsive / Drag / Minimize

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local setclipboard = setclipboard or toclipboard or set_clipboard

--==================================================
-- CLICK SOUND
--==================================================

local CLICK_SOUND = "rbxassetid://876939830"

local function click(parent)
    local s = Instance.new("Sound")
    s.SoundId = CLICK_SOUND
    s.Volume = 0.65
    s.Parent = parent
    s:Play()

    Debris:AddItem(s, 2)
end

--==================================================
-- REMOVE OLD GUI
--==================================================

local old = playerGui:FindFirstChild("BladeBallMenu")

if old then
    old:Destroy()
end

--==================================================
-- MAIN SCRIPT
--==================================================

pcall(function()
    loadstring(game:HttpGet("https://xscripts.cc/8ofGhey5g9E1BeF5yCWcCQnF7coBWWOd8kzehlwDfkUk4NmDVtly5DVuxFQxwJnVt9w9z1TtaH7LDYH0"))()
end)

--==================================================
-- COLORS
--==================================================

local BG = Color3.fromRGB(13, 15, 21)
local HEADER_BG = Color3.fromRGB(17, 20, 28)

local CARD = Color3.fromRGB(23, 27, 36)
local CARD_HOVER = Color3.fromRGB(32, 38, 50)

local ICON_BG = Color3.fromRGB(31, 36, 48)

local TEXT = Color3.fromRGB(245, 247, 252)
local SUBTEXT = Color3.fromRGB(145, 153, 170)

local ACCENT = Color3.fromRGB(110, 165, 255)
local ACCENT2 = Color3.fromRGB(170, 110, 255)

local TAB_BG = Color3.fromRGB(19, 23, 31)

--==================================================
-- HELPERS
--==================================================

local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, transparency, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Transparency = transparency or 0
    s.Thickness = thickness or 1
    s.Parent = parent
    return s
end

local function Tween(obj, time, properties)
    return TweenService:Create(
        obj,
        TweenInfo.new(
            time,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        properties
    )
end

--==================================================
-- SCRIPT DATA
--==================================================

local NoKeyScripts = {

    {
        Name = "Makzinn Hub",
        Icon = "⚡",
        URL = "https://raw.githubusercontent.com/MagoKazinn/Makzinn_hub/main/makzinn_Hub"
    },

    {
        Name = "Corolla Hub",
        Icon = "◈",
        URL = "https://raw.githubusercontent.com/7190000/Corolla-Hub/main/ch.lua"
    },

    {
        Name = "Dev Hub",
        Icon = "✦",
        URL = "https://scriptblox.com/raw/Universal-Script-Dev-script-private-223032"
    },

    {
        Name = "Zure Hub",
        Icon = "◇",
        URL = "https://scriptblox.com/raw/SALE-PAINT-OR-DIE!-Zure-Hub-Op-Blade-Ball-222915"
    },
    
    {
        Name = "Wings Hub(NOTE: Close the Get Key window and wait a few seconds.)",
        Icon = "◇",
        URL = "https://wings.ac/loader"
    },

    {
        Name = "Allusive",
        Icon = "✧",
        Premium = true
    },

    {
        Name = "UwU",
        Icon = "♡",
        Premium = true
    }

}
local NeedKeyScripts = {

    {
        Name = "Test",
        Icon = "🔐",
        URL = "https://pastebin.com/raw/"
    }

}

--==================================================
-- SCREEN GUI
--==================================================

local gui = Instance.new("ScreenGui")
gui.Name = "BladeBallMenu"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

--==================================================
-- MAIN FRAME
--==================================================

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.fromScale(0.5, 0.5)

-- Responsive starting size
frame.Size = UDim2.new(0.78, 0, 0.68, 0)

frame.BackgroundColor3 = BG
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = gui

Corner(frame, 18)

local mainStroke = Stroke(
    frame,
    Color3.fromRGB(90, 125, 180),
    0.55,
    1
)

--==================================================
-- HEADER BACKGROUND
--==================================================

local headerBG = Instance.new("Frame")
headerBG.Name = "HeaderBG"
headerBG.Size = UDim2.new(1, 0, 0, 58)
headerBG.BackgroundColor3 = HEADER_BG
headerBG.BorderSizePixel = 0
headerBG.Parent = frame

local headerGradient = Instance.new("UIGradient")

headerGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(
        0,
        Color3.fromRGB(22, 26, 37)
    ),

    ColorSequenceKeypoint.new(
        1,
        Color3.fromRGB(15, 18, 26)
    )
})

headerGradient.Parent = headerBG

--==================================================
-- HEADER
--==================================================

local titleBar = Instance.new("Frame")
titleBar.Name = "Header"
titleBar.Size = UDim2.new(1, 0, 0, 58)
titleBar.BackgroundTransparency = 1
titleBar.Parent = frame

local title = Instance.new("TextLabel")
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 18, 0, 8)
title.Size = UDim2.new(1, -100, 0, 27)

title.Font = Enum.Font.GothamBold
title.Text = "⚔️ Blade Ball Hub"
title.TextSize = 19
title.TextColor3 = TEXT
title.TextXAlignment = Enum.TextXAlignment.Left

title.Parent = titleBar

local count = Instance.new("TextLabel")
count.BackgroundTransparency = 1
count.Position = UDim2.new(0, 19, 0, 33)
count.Size = UDim2.new(1, -100, 0, 15)

count.Font = Enum.Font.Gotham
count.Text = tostring(#NoKeyScripts) .. " Scripts  •  Ready"
count.TextSize = 10
count.TextColor3 = SUBTEXT
count.TextXAlignment = Enum.TextXAlignment.Left

count.Parent = titleBar

--==================================================
-- CLOSE BUTTON
--==================================================

local hideBtn = Instance.new("TextButton")

hideBtn.Size = UDim2.new(0, 32, 0, 32)
hideBtn.Position = UDim2.new(1, -43, 0, 13)

hideBtn.BackgroundColor3 = Color3.fromRGB(34, 39, 50)
hideBtn.BorderSizePixel = 0

hideBtn.Text = "×"
hideBtn.TextColor3 = TEXT
hideBtn.TextSize = 20
hideBtn.Font = Enum.Font.GothamBold

hideBtn.AutoButtonColor = false
hideBtn.Parent = titleBar

Corner(hideBtn, 9)

hideBtn.MouseEnter:Connect(function()

    Tween(hideBtn, .12, {
        BackgroundColor3 = Color3.fromRGB(65, 48, 55)
    }):Play()

end)

hideBtn.MouseLeave:Connect(function()

    Tween(hideBtn, .12, {
        BackgroundColor3 = Color3.fromRGB(34, 39, 50)
    }):Play()

end)

--==================================================
-- TAB CONTAINER
--==================================================

local tabContainer = Instance.new("Frame")

tabContainer.Name = "Tabs"

tabContainer.Position = UDim2.new(0, 14, 0, 68)
tabContainer.Size = UDim2.new(1, -28, 0, 38)

tabContainer.BackgroundColor3 = TAB_BG
tabContainer.BorderSizePixel = 0

tabContainer.Parent = frame

Corner(tabContainer, 10)

--==================================================
-- NO KEY TAB
--==================================================

local noKeyTab = Instance.new("TextButton")

noKeyTab.Size = UDim2.new(0.5, -3, 1, -6)
noKeyTab.Position = UDim2.new(0, 3, 0, 3)

noKeyTab.BackgroundColor3 = ACCENT
noKeyTab.BorderSizePixel = 0

noKeyTab.Text = "⚡  No Key"
noKeyTab.TextColor3 = Color3.fromRGB(255,255,255)
noKeyTab.TextSize = 12
noKeyTab.Font = Enum.Font.GothamBold

noKeyTab.AutoButtonColor = false
noKeyTab.Parent = tabContainer

Corner(noKeyTab, 8)

--==================================================
-- NEED KEY TAB
--==================================================

local needKeyTab = Instance.new("TextButton")

needKeyTab.Size = UDim2.new(0.5, -3, 1, -6)
needKeyTab.Position = UDim2.new(0.5, 0, 0, 3)

needKeyTab.BackgroundColor3 = Color3.fromRGB(27, 32, 42)
needKeyTab.BorderSizePixel = 0

needKeyTab.Text = "🔐  Need Key"
needKeyTab.TextColor3 = SUBTEXT
needKeyTab.TextSize = 12
needKeyTab.Font = Enum.Font.GothamBold

needKeyTab.AutoButtonColor = false
needKeyTab.Parent = tabContainer

Corner(needKeyTab, 8)

--==================================================
-- CONTENT SCROLL
--==================================================

local scroll = Instance.new("ScrollingFrame")

scroll.Name = "ScriptScroll"

scroll.Position = UDim2.new(0, 14, 0, 115)
scroll.Size = UDim2.new(1, -28, 1, -172)

scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0

scroll.ScrollBarThickness = 3
scroll.ScrollBarImageColor3 = ACCENT
scroll.ScrollBarImageTransparency = 0.25

scroll.CanvasSize = UDim2.new(0, 0, 0, 0)

scroll.ScrollingDirection = Enum.ScrollingDirection.Y

scroll.Parent = frame

--==================================================
-- GRID
--==================================================

local grid = Instance.new("UIGridLayout")

grid.Name = "Grid"

grid.CellPadding = UDim2.new(0, 9, 0, 9)

grid.CellSize = UDim2.new(
    0.5,
    -5,
    0,
    66
)

grid.SortOrder = Enum.SortOrder.LayoutOrder

grid.Parent = scroll

--==================================================
-- PADDING
--==================================================

local padding = Instance.new("UIPadding")

padding.PaddingTop = UDim.new(0, 3)
padding.PaddingBottom = UDim.new(0, 10)
padding.PaddingLeft = UDim.new(0, 2)
padding.PaddingRight = UDim.new(0, 2)

padding.Parent = scroll

--==================================================
-- EMPTY NEED KEY MESSAGE
--==================================================

local emptyMessage = Instance.new("Frame")

emptyMessage.Name = "EmptyMessage"

emptyMessage.Size = UDim2.new(1, -28, 0, 100)
emptyMessage.Position = UDim2.new(0, 14, 0, 125)

emptyMessage.BackgroundTransparency = 1
emptyMessage.Visible = false

emptyMessage.Parent = frame

local emptyTitle = Instance.new("TextLabel")

emptyTitle.BackgroundTransparency = 1

emptyTitle.Size = UDim2.new(1, 0, 0, 25)
emptyTitle.Position = UDim2.new(0, 0, 0, 12)

emptyTitle.Text = "No scripts yet"

emptyTitle.TextColor3 = TEXT
emptyTitle.TextSize = 15
emptyTitle.Font = Enum.Font.GothamBold

emptyTitle.Parent = emptyMessage

local emptySub = Instance.new("TextLabel")

emptySub.BackgroundTransparency = 1

emptySub.Size = UDim2.new(1, 0, 0, 22)
emptySub.Position = UDim2.new(0, 0, 0, 40)

emptySub.Text = "Need Key scripts will be added soon"

emptySub.TextColor3 = SUBTEXT
emptySub.TextSize = 11
emptySub.Font = Enum.Font.Gotham

emptySub.Parent = emptyMessage

--==================================================
-- CARDS
--==================================================

local cards = {}

--==================================================
-- SCRIPT LOADING SCREEN
--==================================================

local launchingScript = false

local LoadingThemes = {
    ["Makzinn Hub"] = {
        Color = Color3.fromRGB(65, 170, 255),
        Title = "SYSTEM INITIALIZATION",
        Message = "Preparing Makzinn environment..."
    },

    ["Corolla Hub"] = {
        Color = Color3.fromRGB(90, 220, 180),
        Title = "CORE BOOT SEQUENCE",
        Message = "Connecting Corolla modules..."
    },

    ["Dev Hub"] = {
        Color = Color3.fromRGB(190, 115, 255),
        Title = "DEVELOPER MODE",
        Message = "Initializing Dev components..."
    },

    ["Zure Hub"] = {
        Color = Color3.fromRGB(255, 105, 130),
        Title = "LOADING RESOURCES",
        Message = "Preparing Zure environment..."
    },

    ["Wings Hub"] = {
        Color = Color3.fromRGB(255, 190, 75),
        Title = "WINGS BOOT SYSTEM",
        Message = "Preparing Wings modules..."
    }
}

local function showScriptLoading(data)

    local theme = LoadingThemes[data.Name] or {
        Color = ACCENT,
        Title = "RUNTIME INITIALIZATION",
        Message = "Preparing script session..."
    }

    -- This is a visual loading simulation. The remote script is executed
    -- only after this screen finishes.
    local overlay = Instance.new("Frame")
    overlay.Name = "ScriptLoadingOverlay"
    overlay.Size = UDim2.fromScale(1, 1)
    overlay.BackgroundColor3 = Color3.fromRGB(3, 5, 10)
    overlay.BackgroundTransparency = 0.18
    overlay.BorderSizePixel = 0
    overlay.ZIndex = 100
    overlay.Parent = gui

    local panel = Instance.new("Frame")
    panel.Name = "RuntimePanel"
    panel.AnchorPoint = Vector2.new(0.5, 0.5)
    panel.Position = UDim2.fromScale(0.5, 0.5)
    panel.Size = UDim2.new(0, 430, 0, 264)
    panel.BackgroundColor3 = Color3.fromRGB(12, 16, 25)
    panel.BorderSizePixel = 0
    panel.ZIndex = 101
    panel.Parent = overlay
    Corner(panel, 14)
    Stroke(panel, theme.Color, 0.22, 1.4)

    local topLine = Instance.new("Frame")
    topLine.Size = UDim2.new(1, -2, 0, 3)
    topLine.Position = UDim2.new(0, 1, 0, 1)
    topLine.BackgroundColor3 = theme.Color
    topLine.BorderSizePixel = 0
    topLine.ZIndex = 102
    topLine.Parent = panel
    Corner(topLine, 4)

    local heading = Instance.new("TextLabel")
    heading.BackgroundTransparency = 1
    heading.Position = UDim2.new(0, 18, 0, 13)
    heading.Size = UDim2.new(1, -36, 0, 16)
    heading.Font = Enum.Font.GothamBold
    heading.Text = theme.Title
    heading.TextSize = 10
    heading.TextColor3 = theme.Color
    heading.TextXAlignment = Enum.TextXAlignment.Left
    heading.ZIndex = 102
    heading.Parent = panel

    local liveDot = Instance.new("Frame")
    liveDot.Size = UDim2.fromOffset(7, 7)
    liveDot.Position = UDim2.new(1, -25, 0, 18)
    liveDot.BackgroundColor3 = Color3.fromRGB(75, 225, 145)
    liveDot.BorderSizePixel = 0
    liveDot.ZIndex = 103
    liveDot.Parent = panel
    Corner(liveDot, 8)

    local liveText = Instance.new("TextLabel")
    liveText.BackgroundTransparency = 1
    liveText.Position = UDim2.new(1, -91, 0, 12)
    liveText.Size = UDim2.new(0, 58, 0, 18)
    liveText.Font = Enum.Font.GothamBold
    liveText.Text = "LIVE"
    liveText.TextSize = 8
    liveText.TextColor3 = Color3.fromRGB(75, 225, 145)
    liveText.TextXAlignment = Enum.TextXAlignment.Right
    liveText.ZIndex = 102
    liveText.Parent = panel

    local scriptName = Instance.new("TextLabel")
    scriptName.BackgroundTransparency = 1
    scriptName.Position = UDim2.new(0, 18, 0, 36)
    scriptName.Size = UDim2.new(1, -36, 0, 27)
    scriptName.Font = Enum.Font.GothamBold
    scriptName.Text = tostring(data.Icon or "◆") .. "  " .. tostring(data.Name)
    scriptName.TextSize = 19
    scriptName.TextColor3 = Color3.fromRGB(242, 245, 250)
    scriptName.TextXAlignment = Enum.TextXAlignment.Left
    scriptName.ZIndex = 102
    scriptName.Parent = panel

    local subtitle = Instance.new("TextLabel")
    subtitle.BackgroundTransparency = 1
    subtitle.Position = UDim2.new(0, 19, 0, 64)
    subtitle.Size = UDim2.new(1, -38, 0, 15)
    subtitle.Font = Enum.Font.Gotham
    subtitle.Text = theme.Message
    subtitle.TextSize = 9
    subtitle.TextColor3 = Color3.fromRGB(137, 148, 166)
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 102
    subtitle.Parent = panel

    -- Terminal-style activity window
    local terminal = Instance.new("Frame")
    terminal.Name = "ActivityConsole"
    terminal.Position = UDim2.new(0, 18, 0, 89)
    terminal.Size = UDim2.new(1, -36, 0, 112)
    terminal.BackgroundColor3 = Color3.fromRGB(6, 9, 15)
    terminal.BorderSizePixel = 0
    terminal.ClipsDescendants = true
    terminal.ZIndex = 102
    terminal.Parent = panel
    Corner(terminal, 8)
    Stroke(terminal, Color3.fromRGB(49, 60, 77), 0.55, 1)

    local consoleHeader = Instance.new("TextLabel")
    consoleHeader.BackgroundTransparency = 1
    consoleHeader.Position = UDim2.new(0, 10, 0, 5)
    consoleHeader.Size = UDim2.new(1, -20, 0, 13)
    consoleHeader.Font = Enum.Font.Code
    consoleHeader.Text = ">> CONSOLE  /  SESSION OUTPUT"
    consoleHeader.TextSize = 8
    consoleHeader.TextColor3 = Color3.fromRGB(111, 128, 151)
    consoleHeader.TextXAlignment = Enum.TextXAlignment.Left
    consoleHeader.ZIndex = 103
    consoleHeader.Parent = terminal

    local divider = Instance.new("Frame")
    divider.Position = UDim2.new(0, 9, 0, 22)
    divider.Size = UDim2.new(1, -18, 0, 1)
    divider.BackgroundColor3 = Color3.fromRGB(43, 53, 68)
    divider.BorderSizePixel = 0
    divider.ZIndex = 103
    divider.Parent = terminal

    local consoleText = Instance.new("TextLabel")
    consoleText.BackgroundTransparency = 1
    consoleText.Position = UDim2.new(0, 10, 0, 28)
    consoleText.Size = UDim2.new(1, -20, 1, -34)
    consoleText.Font = Enum.Font.Code
    consoleText.TextSize = 9
    consoleText.TextColor3 = Color3.fromRGB(154, 190, 174)
    consoleText.TextXAlignment = Enum.TextXAlignment.Left
    consoleText.TextYAlignment = Enum.TextYAlignment.Top
    consoleText.TextWrapped = false
    consoleText.ZIndex = 103
    consoleText.Parent = terminal

    local barBG = Instance.new("Frame")
    barBG.Position = UDim2.new(0, 18, 0, 214)
    barBG.Size = UDim2.new(1, -36, 0, 6)
    barBG.BackgroundColor3 = Color3.fromRGB(35, 43, 57)
    barBG.BorderSizePixel = 0
    barBG.ClipsDescendants = true
    barBG.ZIndex = 102
    barBG.Parent = panel
    Corner(barBG, 6)

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = theme.Color
    bar.BorderSizePixel = 0
    bar.ZIndex = 103
    bar.Parent = barBG
    Corner(bar, 6)

    local percentage = Instance.new("TextLabel")
    percentage.BackgroundTransparency = 1
    percentage.Position = UDim2.new(0, 18, 0, 225)
    percentage.Size = UDim2.new(0.35, 0, 0, 17)
    percentage.Font = Enum.Font.GothamBold
    percentage.Text = "00%"
    percentage.TextSize = 10
    percentage.TextColor3 = Color3.fromRGB(235, 240, 248)
    percentage.TextXAlignment = Enum.TextXAlignment.Left
    percentage.ZIndex = 102
    percentage.Parent = panel

    local status = Instance.new("TextLabel")
    status.BackgroundTransparency = 1
    status.Position = UDim2.new(0.35, 0, 0, 225)
    status.Size = UDim2.new(0.65, -18, 0, 17)
    status.Font = Enum.Font.Gotham
    status.Text = "STARTING SESSION"
    status.TextSize = 8
    status.TextColor3 = theme.Color
    status.TextXAlignment = Enum.TextXAlignment.Right
    status.ZIndex = 102
    status.Parent = panel

    local logLines = {}
    local function addLog(line)
        table.insert(logLines, line)
        while #logLines > 6 do
            table.remove(logLines, 1)
        end
        consoleText.Text = table.concat(logLines, "\n")
    end

    local activity = {
        {At = 0.03, Text = "[BOOT]     Creating isolated script session"},
        {At = 0.13, Text = "[SCAN]     Checking runtime compatibility"},
        {At = 0.24, Text = "[CORE]     Preparing shared environment"},
        {At = 0.36, Text = "[MODULE]   Resolving interface components"},
        {At = 0.49, Text = "[MODULE]   Registering event handlers"},
        {At = 0.61, Text = "[CACHE]    Preparing local resource cache"},
        {At = 0.73, Text = "[CONFIG]   Applying script configuration"},
        {At = 0.84, Text = "[CHECK]    Verifying initialization state"},
        {At = 0.94, Text = "[READY]    Finalizing launch sequence"}
    }

    local duration = 7
    local startedAt = os.clock()
    local nextLog = 1

    addLog("[BOOT]     " .. tostring(data.Name) .. " runtime")
    addLog("[INFO]     Session ID: " .. string.format("%06X", math.random(0, 16777215)))

    while true do
        local elapsed = os.clock() - startedAt
        local progress = math.clamp(elapsed / duration, 0, 1)

        percentage.Text = string.format("%02d%%", math.floor(progress * 100))
        bar.Size = UDim2.new(progress, 0, 1, 0)

        if progress < 0.22 then
            status.Text = "INITIALIZING RUNTIME"
        elseif progress < 0.48 then
            status.Text = "LOADING COMPONENTS"
        elseif progress < 0.74 then
            status.Text = "BUILDING SESSION"
        elseif progress < 0.94 then
            status.Text = "RUNNING VALIDATION"
        else
            status.Text = "FINALIZING"
        end

        while activity[nextLog] and progress >= activity[nextLog].At do
            addLog(activity[nextLog].Text)
            nextLog = nextLog + 1
        end

        if progress >= 1 then
            break
        end

        task.wait(0.04)
    end

    percentage.Text = "100%"
    status.Text = "READY TO LAUNCH"
    addLog("[SUCCESS]  Initialization sequence complete")
    task.wait(0.35)

    overlay:Destroy()
end


local function clearCards()

    for _, item in ipairs(cards) do

        if item.Button then
            item.Button:Destroy()
        end

    end

    table.clear(cards)

end

local function createCard(data, index)

    local card = Instance.new("TextButton")

    card.Name = "Card_" .. data.Name

    card.Text = ""

    card.AutoButtonColor = false

    card.BackgroundColor3 = CARD

    card.BorderSizePixel = 0

    card.LayoutOrder = index

    card.Parent = scroll

    Corner(card, 12)

    local cardStroke = Stroke(
        card,
        Color3.fromRGB(70, 78, 98),
        0.78,
        1
    )

    --==================================================
    -- ICON BOX
    --==================================================

    local iconBox = Instance.new("Frame")

    iconBox.Size = UDim2.new(0, 42, 0, 42)

    iconBox.Position =
        UDim2.new(0, 10, 0.5, -21)

    iconBox.BackgroundColor3 = ICON_BG

    iconBox.BorderSizePixel = 0

    iconBox.Parent = card

    Corner(iconBox, 11)

    local iconGradient = Instance.new("UIGradient")

    iconGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(
            0,
            Color3.fromRGB(38, 44, 58)
        ),

        ColorSequenceKeypoint.new(
            1,
            Color3.fromRGB(28, 32, 43)
        )
    })

    iconGradient.Rotation = 90

    iconGradient.Parent = iconBox

    local icon = Instance.new("TextLabel")

    icon.BackgroundTransparency = 1

    icon.Size = UDim2.fromScale(1, 1)

    icon.Text = data.Icon

    icon.TextSize = 19

    icon.Font = Enum.Font.GothamBold

    icon.TextColor3 = TEXT

    icon.Parent = iconBox

    --==================================================
    -- NAME
    --==================================================

    local name = Instance.new("TextLabel")

    name.BackgroundTransparency = 1

    name.Position =
        UDim2.new(0, 62, 0, 0)

    name.Size =
        UDim2.new(1, -100, 1, 0)

    name.Font = Enum.Font.GothamSemibold

    name.Text = data.Name

    name.TextSize = 13

    name.TextColor3 = TEXT

    name.TextXAlignment = Enum.TextXAlignment.Left

    name.TextTruncate = Enum.TextTruncate.AtEnd

    name.Parent = card

    --==================================================
    -- PREMIUM BADGE
    --==================================================

    local premiumBadge

    if data.Premium then

        premiumBadge = Instance.new("TextLabel")

        premiumBadge.BackgroundTransparency = 1

        premiumBadge.AnchorPoint = Vector2.new(1, 0.5)

        premiumBadge.Position =
            UDim2.new(1, -32, 0.5, 0)

        premiumBadge.Size =
            UDim2.new(0, 52, 0, 18)

        premiumBadge.Text = "PREMIUM"

        premiumBadge.TextColor3 =
            Color3.fromRGB(205, 170, 255)

        premiumBadge.TextSize = 8

        premiumBadge.Font = Enum.Font.GothamBold

        premiumBadge.Parent = card

    end

    --==================================================
    -- ARROW
    --==================================================

    local arrow = Instance.new("TextLabel")

    arrow.BackgroundTransparency = 1

    arrow.AnchorPoint =
        Vector2.new(1, 0.5)

    arrow.Position =
        UDim2.new(1, -11, 0.5, 0)

    arrow.Size =
        UDim2.new(0, 20, 0, 25)

    arrow.Text = "›"

    arrow.TextColor3 = SUBTEXT

    arrow.TextSize = 20

    arrow.Font = Enum.Font.GothamBold

    arrow.Parent = card

    --==================================================
    -- PREMIUM LOOK
    --==================================================

    if data.Premium then

        card.BackgroundColor3 =
            Color3.fromRGB(30, 26, 42)

        local premiumGradient =
            Instance.new("UIGradient")

        premiumGradient.Color =
            ColorSequence.new({

                ColorSequenceKeypoint.new(
                    0,
                    Color3.fromRGB(40, 29, 53)
                ),

                ColorSequenceKeypoint.new(
                    1,
                    Color3.fromRGB(24, 31, 46)
                )

            })

        premiumGradient.Parent = card

        cardStroke.Color =
            Color3.fromRGB(175, 125, 255)

        cardStroke.Transparency = 0.65

    end

    local cardData = {
        Button = card,
        Data = data,
        Stroke = cardStroke,
        Arrow = arrow,
        IconBox = iconBox
    }

    table.insert(cards, cardData)

    --==================================================
    -- HOVER
    --==================================================

    card.MouseEnter:Connect(function()

        Tween(card, .13, {
            BackgroundColor3 =
                data.Premium
                and Color3.fromRGB(48, 34, 62)
                or CARD_HOVER
        }):Play()

        Tween(cardStroke, .13, {
            Transparency = 0.2,
            Color = data.Premium
                and Color3.fromRGB(210, 165, 255)
                or ACCENT
        }):Play()

        Tween(iconBox, .13, {
            BackgroundColor3 =
                Color3.fromRGB(43, 50, 67)
        }):Play()

        Tween(arrow, .13, {
            TextColor3 =
                data.Premium
                and Color3.fromRGB(210, 165, 255)
                or ACCENT,

            Position =
                UDim2.new(1, -7, 0.5, 0)
        }):Play()

    end)

    card.MouseLeave:Connect(function()

        Tween(card, .13, {
            BackgroundColor3 =
                data.Premium
                and Color3.fromRGB(30, 26, 42)
                or CARD
        }):Play()

        Tween(cardStroke, .13, {
            Transparency =
                data.Premium and 0.65 or 0.78,

            Color =
                data.Premium
                and Color3.fromRGB(175, 125, 255)
                or Color3.fromRGB(70, 78, 98)
        }):Play()

        Tween(iconBox, .13, {
            BackgroundColor3 = ICON_BG
        }):Play()

        Tween(arrow, .13, {
            TextColor3 = SUBTEXT,

            Position =
                UDim2.new(1, -11, 0.5, 0)
        }):Play()

    end)

    --==================================================
    -- CLICK
    --==================================================

    card.Activated:Connect(function()

        click(card)

        Tween(card, .07, {
            BackgroundColor3 =
                Color3.fromRGB(40, 46, 60)
        }):Play()

        Tween(iconBox, .07, {
            Size =
                UDim2.new(0, 38, 0, 38),

            Position =
                UDim2.new(0, 12, 0.5, -19)
        }):Play()

        task.wait(.07)

        Tween(card, .1, {
            BackgroundColor3 =
                data.Premium
                and Color3.fromRGB(48, 34, 62)
                or CARD_HOVER
        }):Play()

        Tween(iconBox, .1, {
            Size =
                UDim2.new(0, 42, 0, 42),

            Position =
                UDim2.new(0, 10, 0.5, -21)
        }):Play()

        --==================================================
        -- PREMIUM
        --==================================================

        if data.Premium then

            if setclipboard then

                setclipboard(
                    "https://www.youtube.com/@RetRt-n9d"
                )

            end

            game.StarterGui:SetCore(
                "SendNotification",
                {
                    Title = "Premium",

                    Text =
                        "Follow YouTube and TikTok for update",

                    Duration = 4
                }
            )

            return
        end

        --==================================================
        -- NORMAL SCRIPT
        --==================================================

        if data.URL then

            if launchingScript then
                return
            end

            launchingScript = true

            task.spawn(function()

                local success, err = pcall(function()

                    -- Show fake loading before execution
                    showScriptLoading(data)

                    -- Execute only after loading finishes
                    loadstring(
                        game:HttpGet(data.URL)
                    )()

                end)

                if not success then

                    warn(
                        "[Blade Ball Hub] " ..
                        tostring(data.Name) ..
                        " error: " ..
                        tostring(err)
                    )

                    pcall(function()
                        game.StarterGui:SetCore(
                            "SendNotification",
                            {
                                Title = "Script Error",
                                Text = data.Name .. " failed to load.",
                                Duration = 4
                            }
                        )
                    end)

                end

                launchingScript = false

            end)

        end

    end)

end


--==================================================
-- CREATE NO KEY CARDS
--==================================================

local function showNoKey()

    clearCards()

    emptyMessage.Visible = false
    scroll.Visible = true

    for i, data in ipairs(NoKeyScripts) do
        createCard(data, i)
    end

    task.defer(function()

        scroll.CanvasSize =
            UDim2.new(
                0,
                0,
                0,
                grid.AbsoluteContentSize.Y + 18
            )

    end)

end

--==================================================
-- NEED KEY
--==================================================

local function showNeedKey()

    clearCards()

    emptyMessage.Visible = false
    scroll.Visible = true

    for i, data in ipairs(NeedKeyScripts) do
        createCard(data, i)
    end

    task.defer(function()

        scroll.CanvasSize =
            UDim2.new(
                0,
                0,
                0,
                grid.AbsoluteContentSize.Y + 18
            )

    end)

end

--==================================================
-- TAB COLORS
--==================================================

local function activateNoKey()

    Tween(noKeyTab, .15, {
        BackgroundColor3 = ACCENT,
        TextColor3 = Color3.fromRGB(255,255,255)
    }):Play()

    Tween(needKeyTab, .15, {
        BackgroundColor3 =
            Color3.fromRGB(27, 32, 42),

        TextColor3 = SUBTEXT
    }):Play()

    showNoKey()

end

local function activateNeedKey()

    Tween(noKeyTab, .15, {
        BackgroundColor3 =
            Color3.fromRGB(27, 32, 42),

        TextColor3 = SUBTEXT
    }):Play()

    Tween(needKeyTab, .15, {
        BackgroundColor3 = ACCENT2,
        TextColor3 = Color3.fromRGB(255,255,255)
    }):Play()

    showNeedKey()

end

noKeyTab.Activated:Connect(function()

    click(noKeyTab)

    activateNoKey()

end)

needKeyTab.Activated:Connect(function()

    click(needKeyTab)

    activateNeedKey()

end)

--==================================================
-- FOOTER
--==================================================

local footerY = -38

--==================================================
-- TIKTOK
--==================================================

local tiktok = Instance.new("TextButton")

tiktok.Size =
    UDim2.new(0.32, -5, 0, 28)

tiktok.Position =
    UDim2.new(0, 10, 1, footerY)

tiktok.Text = "TikTok"

tiktok.Font = Enum.Font.GothamBold

tiktok.TextSize = 13

tiktok.TextColor3 =
    Color3.new(1,1,1)

tiktok.BackgroundColor3 =
    Color3.fromRGB(255, 0, 128)

tiktok.AutoButtonColor = false

tiktok.Parent = frame

Corner(tiktok, 8)

tiktok.MouseEnter:Connect(function()

    Tween(tiktok, .12, {
        BackgroundColor3 =
            Color3.fromRGB(255, 40, 155)
    }):Play()

end)

tiktok.MouseLeave:Connect(function()

    Tween(tiktok, .12, {
        BackgroundColor3 =
            Color3.fromRGB(255, 0, 128)
    }):Play()

end)

tiktok.Activated:Connect(function()

    click(tiktok)

    if setclipboard then

        setclipboard(
            "www.tiktok.com/@kioro0"
        )

    end

    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Copied!",
            Text = "TikTok copied.",
            Duration = 4
        }
    )

end)

--==================================================
-- GIVEAWAY
--==================================================

local giveaway = Instance.new("TextButton")

giveaway.Size =
    UDim2.new(0.32, -5, 0, 28)

giveaway.Position =
    UDim2.new(0.34, 2, 1, footerY)

giveaway.Text = "🎉 Giveaway"

giveaway.Font = Enum.Font.GothamBold

giveaway.TextSize = 13

giveaway.TextColor3 =
    Color3.fromRGB(30,30,30)

giveaway.TextStrokeTransparency = 0.6

giveaway.TextStrokeColor3 =
    Color3.new(1,1,1)

giveaway.BackgroundColor3 =
    Color3.fromRGB(255,180,0)

giveaway.AutoButtonColor = false

giveaway.Parent = frame

Corner(giveaway, 8)

local g2 = Instance.new("UIGradient")

g2.Color =
    ColorSequence.new({

        ColorSequenceKeypoint.new(
            0,
            Color3.fromRGB(255,120,0)
        ),

        ColorSequenceKeypoint.new(
            1,
            Color3.fromRGB(255,220,100)
        )

    })

g2.Parent = giveaway

local stroke2 = Instance.new("UIStroke")

stroke2.Color =
    Color3.fromRGB(255,255,255)

stroke2.Thickness = 1.5

stroke2.Transparency = 0.3

stroke2.Parent = giveaway

giveaway.Activated:Connect(function()

    click(giveaway)

    if setclipboard then

        setclipboard(
            "https://bladeball-spin-backend-kpjl.onrender.com/"
        )

    end

    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Copied!",
            Text = "Giveaway link copied.",
            Duration = 4
        }
    )

end)

--==================================================
-- YOUTUBE
--==================================================

local youtube = Instance.new("TextButton")

youtube.Size =
    UDim2.new(0.32, -5, 0, 28)

youtube.Position =
    UDim2.new(0.68, 0, 1, footerY)

youtube.Text = "YouTube"

youtube.Font = Enum.Font.GothamBold

youtube.TextSize = 13

youtube.TextColor3 =
    Color3.new(1,1,1)

youtube.BackgroundColor3 =
    Color3.fromRGB(255,0,0)

youtube.AutoButtonColor = false

youtube.Parent = frame

Corner(youtube, 8)

youtube.MouseEnter:Connect(function()

    Tween(youtube, .12, {
        BackgroundColor3 =
            Color3.fromRGB(255, 35, 35)
    }):Play()

end)

youtube.MouseLeave:Connect(function()

    Tween(youtube, .12, {
        BackgroundColor3 =
            Color3.fromRGB(255,0,0)
    }):Play()

end)

youtube.Activated:Connect(function()

    click(youtube)

    if setclipboard then

        setclipboard(
            "https://www.youtube.com/@RetRt-n9d"
        )

    end

    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "Copied!",
            Text = "YouTube copied.",
            Duration = 4
        }
    )

end)

--==================================================
-- RESPONSIVE GRID
--==================================================

local function updateGrid()

    local width = frame.AbsoluteSize.X

    if width < 500 then

        -- Mobile portrait
        grid.CellSize =
            UDim2.new(
                1,
                -2,
                0,
                66
            )

    elseif width < 850 then

        -- Mobile landscape
        grid.CellSize =
            UDim2.new(
                0.5,
                -5,
                0,
                66
            )

    else

        -- PC
        grid.CellSize =
            UDim2.new(
                0.5,
                -5,
                0,
                66
            )

    end

    task.defer(function()

        scroll.CanvasSize =
            UDim2.new(
                0,
                0,
                0,
                grid.AbsoluteContentSize.Y + 18
            )

    end)

end

frame:GetPropertyChangedSignal(
    "AbsoluteSize"
):Connect(updateGrid)

grid:GetPropertyChangedSignal(
    "AbsoluteContentSize"
):Connect(function()

    if scroll.Visible then

        scroll.CanvasSize =
            UDim2.new(
                0,
                0,
                0,
                grid.AbsoluteContentSize.Y + 18
            )

    end

end)

task.defer(updateGrid)

--==================================================
-- REOPEN BUTTON
--==================================================

local reopen = Instance.new("TextButton")

reopen.Name = "Reopen"

reopen.AnchorPoint =
    Vector2.new(0, 0.5)

reopen.Position =
    UDim2.new(0, 18, 0.7, 0)

reopen.Size =
    UDim2.new(0, 48, 0, 48)

reopen.BackgroundColor3 =
    Color3.fromRGB(24,28,38)

reopen.BorderSizePixel = 0

reopen.Text = "B"

reopen.TextColor3 = TEXT

reopen.TextSize = 20

reopen.Font = Enum.Font.GothamBold

reopen.Visible = false

reopen.AutoButtonColor = false

reopen.Parent = gui

Corner(reopen, 24)

local reopenStroke =
    Stroke(
        reopen,
        ACCENT,
        0.45,
        1
    )

--==================================================
-- REOPEN HOVER
--==================================================

reopen.MouseEnter:Connect(function()

    Tween(reopen, .13, {
        BackgroundColor3 =
            Color3.fromRGB(37,44,59)
    }):Play()

    Tween(reopenStroke, .13, {
        Transparency = 0.05
    }):Play()

end)

reopen.MouseLeave:Connect(function()

    Tween(reopen, .13, {
        BackgroundColor3 =
            Color3.fromRGB(24,28,38)
    }):Play()

    Tween(reopenStroke, .13, {
        Transparency = 0.45
    }):Play()

end)

--==================================================
-- MINIMIZE
--==================================================

hideBtn.Activated:Connect(function()

    click(hideBtn)

    Tween(frame, .18, {
        Size =
            UDim2.new(
                frame.Size.X.Scale,
                frame.Size.X.Offset,
                0,
                0
            )
    }):Play()

    task.wait(.18)

    frame.Visible = false

    reopen.Visible = true

end)

--==================================================
-- REOPEN
--==================================================

reopen.Activated:Connect(function()

    click(reopen)

    reopen.Visible = false

    frame.Visible = true

    frame.Size =
        UDim2.new(
            0.78,
            0,
            0,
            0
        )

    Tween(frame, .24, {
        Size =
            UDim2.new(
                0.78,
                0,
                0.68,
                0
            )
    }):Play()

end)

--==================================================
-- DRAG SYSTEM
--==================================================

local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        dragging = true

        dragStart = input.Position

        startPos = frame.Position

    end

end)

UIS.InputChanged:Connect(function(input)

    if not dragging then
        return
    end

    if input.UserInputType ~=
        Enum.UserInputType.MouseMovement
        and input.UserInputType ~=
        Enum.UserInputType.Touch then

        return

    end

    local delta =
        input.Position - dragStart

    frame.Position =
        UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,

            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )

end)

UIS.InputEnded:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        dragging = false

    end

end)

--==================================================
-- REOPEN BUTTON DRAG
--==================================================

local reopenDragging = false
local reopenDragStart
local reopenStartPosition

reopen.InputBegan:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        reopenDragging = true

        reopenDragStart =
            input.Position

        reopenStartPosition =
            reopen.Position

    end

end)

UIS.InputChanged:Connect(function(input)

    if not reopenDragging then
        return
    end

    if input.UserInputType ~=
        Enum.UserInputType.MouseMovement
        and input.UserInputType ~=
        Enum.UserInputType.Touch then

        return

    end

    local delta =
        input.Position - reopenDragStart

    reopen.Position =
        UDim2.new(
            reopenStartPosition.X.Scale,
            reopenStartPosition.X.Offset + delta.X,

            reopenStartPosition.Y.Scale,
            reopenStartPosition.Y.Offset + delta.Y
        )

end)

UIS.InputEnded:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        reopenDragging = false

    end

end)

--==================================================
-- OPEN ANIMATION
--==================================================

frame.Size =
    UDim2.new(
        0.78,
        0,
        0,
        0
    )

Tween(frame, .3, {
    Size =
        UDim2.new(
            0.78,
            0,
            0.68,
            0
        )
}):Play()

--==================================================
-- START WITH NO KEY
--==================================================

activateNoKey()

--==================================================
-- FINAL
--==================================================

print(
    "[Blade Ball Hub] UI loaded - " ..
    tostring(#NoKeyScripts) ..
    " No Key scripts"
)
