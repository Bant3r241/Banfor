local Slider = {}
Slider.__index = Slider
local Utils = require(script.Parent.Parent.utils)
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

function Slider.new(parent_tab, options, slider_text, callback, slider_options)
    local slider_data = {}
    slider_text = slider_text or "Slider"
    callback = typeof(callback) == "function" and callback or function() end
    slider_options = slider_options or {}
    slider_options.min = slider_options.min or 0
    slider_options.max = slider_options.max or 100
    slider_options.readonly = slider_options.readonly or false

    local slider = Prefabs:FindFirstChild("Slider"):Clone()
    slider.Parent = parent_tab
    local title = slider:FindFirstChild("Title")
    local indicator = slider:FindFirstChild("Indicator")
    local value = slider:FindFirstChild("Value")
    title.Text = slider_text

    local Entered = false
    slider.MouseEnter:Connect(function()
        Entered = true
    end)
    slider.MouseLeave:Connect(function()
        Entered = false
    end)

    local Held = false
    UIS.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Held = true
            spawn(function()
                if Entered and not slider_options.readonly then
                    while Held do
                        local mouse_location = UIS:GetMouseLocation()
                        local x = (slider.AbsoluteSize.X - (slider.AbsoluteSize.X - ((mouse_location.X - slider.AbsolutePosition.X)) + 1)) / slider.AbsoluteSize.X
                        local min = 0
                        local max = 1
                        local size = math.clamp(x, min, max)
                        Utils.Resize(indicator, {Size = UDim2.new(size, 0, 0, 20)}, options.tween_time)
                        local p = math.floor(size * 100)
                        local diff = slider_options.max - slider_options.min
                        local sel_value = math.floor(((diff / 100) * p) + slider_options.min)
                        value.Text = tostring(sel_value)
                        pcall(callback, sel_value)
                        RS.Heartbeat:Wait()
                    end
                end
            end)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            Held = false
        end
    end)

    function slider_data:Set(new_value)
        new_value =
