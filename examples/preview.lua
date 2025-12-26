-- examples/preview.lua
-- Example usage of the UI library

local library = dofile("lib/library.lua")

local Window = library:AddWindow("Preview", {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(500, 600),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

local Tab = library:AddTab(Window, "Tab 1")

Tab:AddLabel("Hello World!")
Tab:AddButton("Button", function() print("Button clicked.") end)
Tab:AddTextBox("TextBox", function(text) print(text) end)
local Switch = Tab:AddSwitch("Switch", function(bool) print(bool) end)
Switch:Set(true)
local Slider = Tab:AddSlider("Slider", function(x) print(x) end)
Slider:Set(50)
Tab:AddKeybind("Keybind", function(key) print(key) end)
local CP = Tab:AddColorPicker(function(color) print(color) end)
CP:Set(Color3.new(1, 0, 0))

local Console = Tab:AddConsole({["source"]="Lua"})
Console:Set("-- Gamer time!\nfor i=1,9 do print(i) end")
print(Console:Get())
