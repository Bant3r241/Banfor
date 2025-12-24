-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BlackTabGUI"
ScreenGui.Parent = PlayerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Title.Text = "Black GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MainFrame

-- Tabs Frame
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(0, 120, 1, -35)
Tabs.Position = UDim2.new(0, 0, 0, 35)
Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Tabs.BorderSizePixel = 0
Tabs.Parent = MainFrame

-- Content Frame
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -120, 1, -35)
Content.Position = UDim2.new(0, 120, 0, 35)
Content.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Content.BorderSizePixel = 0
Content.Parent = MainFrame

-- Tab Buttons
local function CreateTabButton(text, yPos)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, 0, 0, 40)
	button.Position = UDim2.new(0, 0, 0, yPos)
	button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	button.Text = text
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	button.Parent = Tabs
	return button
end

local MainTabButton = CreateTabButton("Main", 0)
local MiscTabButton = CreateTabButton("Misc", 40)

-- Pages
local function CreatePage()
	local page = Instance.new("Frame")
	page.Size = UDim2.new(1, 0, 1, 0)
	page.BackgroundTransparency = 1
	page.Visible = false
	page.Parent = Content
	return page
end

local MainPage = CreatePage()
local MiscPage = CreatePage()

MainPage.Visible = true

-- Example content
local MainLabel = Instance.new("TextLabel")
MainLabel.Size = UDim2.new(1, 0, 0, 40)
MainLabel.Text = "Main Tab Content"
MainLabel.TextColor3 = Color3.fromRGB(255,255,255)
MainLabel.BackgroundTransparency = 1
MainLabel.Font = Enum.Font.Gotham
MainLabel.TextSize = 14
MainLabel.Parent = MainPage

local MiscLabel = MainLabel:Clone()
MiscLabel.Text = "Misc Tab Content"
MiscLabel.Parent = MiscPage

-- Tab Switching
local function SwitchTab(page)
	MainPage.Visible = false
	MiscPage.Visible = false
	page.Visible = true
end

MainTabButton.MouseButton1Click:Connect(function()
	SwitchTab(MainPage)
end)

MiscTabButton.MouseButton1Click:Connect(function()
	SwitchTab(MiscPage)
end)
