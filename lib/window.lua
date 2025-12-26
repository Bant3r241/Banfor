local TabClass = require(script.tab)
local Utils = require(script.utils)

local Window = {}
Window.__index = Window

function Window.new(title, options)
    local self = setmetatable({}, Window)
    
    -- Create the main window (Prefab clone assumed)
    self.Instance = Prefabs:FindFirstChild("Window"):Clone()
    self.Instance.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    self.Instance.Title.Text = title
    self.Options = options
    self.Tabs = {}
    
    function self:AddTab(tab_name)
        local tab_data, tab_instance = TabClass.new(tab_name, self.Instance, self.Options)
        table.insert(self.Tabs, tab_data)
        return tab_data, tab_instance
    end

    function self:FormatWindows()
        -- Update ZIndex of descendants
        for i,v in pairs(self.Instance:GetDescendants()) do
            if v:IsA("GuiObject") then
                v.ZIndex = v.ZIndex + 10
            end
        end
    end

    return self
end

return Window
