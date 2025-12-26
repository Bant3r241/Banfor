local Elements = {}
Elements.Button = require(script.elements.button)
Elements.Switch = require(script.elements.switch)
Elements.Slider = require(script.elements.slider)
Elements.TextBox = require(script.elements.textbox)
Elements.Keybind = require(script.elements.keybind)
Elements.Dropdown = require(script.elements.dropdown)
Elements.ColorPicker = require(script.elements.colorpicker)
Elements.Console = require(script.elements.console)
Elements.Folder = require(script.elements.folder)
Elements.HorizontalAlignment = require(script.elements.horizontalalignment)
Elements.Label = require(script.elements.label)

local Tab = {}
Tab.__index = Tab

function Tab.new(tab_name, parent_window, options)
    local self = setmetatable({}, Tab)
    
    self.Instance = Prefabs:FindFirstChild("Tab"):Clone()
    self.Instance.Parent = parent_window
    self.Options = options

    for element_name, element_module in pairs(Elements) do
        self["Add" .. element_name] = function(...)
            return element_module.new(self.Instance, options, ...)
        end
    end

    function self:Show()
        self.Instance.Visible = true
    end

    return self, self.Instance
end

return Tab
