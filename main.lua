-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BlackTabGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame (BIGGER)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 550, 0, 330)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Black GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- Close Button
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 14
Close.TextColor3 = Color3.fromRGB(255, 80, 80)
Close.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Close.Parent = TitleBar

-- Minimize Button
local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Position = UDim2.new(1, -70, 0, 5)
Minimize.Text = "-"
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 18
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Minimize.Parent = TitleBar

-- Tabs
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(0, 140, 1, -40)
Tabs.Position = UDim2.new(0, 0, 0, 40)
Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Tabs.BorderSizePixel = 0
Tabs.Parent = MainFrame

-- Content
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -140, 1, -40)
Content.Position = UDim2.new(0, 140, 0, 40)
Content.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Content.BorderSizePixel = 0
Content.Parent = MainFrame

-- Tab Button Creator
local function CreateTab(text, y)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, 0, 0, 45)
	b.Position = UDim2.new(0, 0, 0, y)
	b.Text = text
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.TextColor3 = Color3.fromRGB(255,255,255)
	b.BackgroundColor3 = Color3.fromRGB(35,35,35)
	b.Parent = Tabs
	return b
end

local MainTab = CreateTab("Main", 0)
local MiscTab = CreateTab("Misc", 45)

-- Pages
local function CreatePage()
	local p = Instance.new("Frame")
	p.Size = UDim2.new(1, 0, 1, 0)
	p.BackgroundTransparency = 1
	p.Visible = false
	p.Parent = Content
	return p
end

local MainPage = CreatePage()
local MiscPage = CreatePage()
MainPage.Visible = true

-- Example Labels
local function PageLabel(text, parent)
	local l = Instance.new("TextLabel")
	l.Size = UDim2.new(1, 0, 0, 40)
	l.Text = text
	l.Font = Enum.Font.Gotham
	l.TextSize = 14
	l.TextColor3 = Color3.fromRGB(255,255,255)
	l.BackgroundTransparency = 1
	l.Parent = parent
end

PageLabel("Main Tab Content", MainPage)
PageLabel("Misc Tab Content", MiscPage)

-- Tab Switch
local function Switch(page)
	MainPage.Visible = false
	MiscPage.Visible = false
	page.Visible = true
end

MainTab.MouseButton1Click:Connect(function()
	Switch(MainPage)
end)

MiscTab.MouseButton1Click:Connect(function()
	Switch(MiscPage)
end)

-- Floating Restore Button
local RestoreButton = Instance.new("TextButton")
RestoreButton.Size = UDim2.new(0, 60, 0, 60)
RestoreButton.Position = UDim2.new(0, 20, 0.5, -30)
RestoreButton.Text = "GUI"
RestoreButton.Font = Enum.Font.GothamBold
RestoreButton.TextSize = 14
RestoreButton.TextColor3 = Color3.fromRGB(255,255,255)
RestoreButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
RestoreButton.Visible = false
RestoreButton.Active = true
RestoreButton.Draggable = true
RestoreButton.Parent = ScreenGui

-- Button Logic
Minimize.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	RestoreButton.Visible = true
end)

RestoreButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	RestoreButton.Visible = false
end)

Close.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
