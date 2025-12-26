-- lib/elements.lua
-- Buttons, sliders, switches, textboxes, keybinds, color pickers

local library = dofile("lib/library.lua") -- make sure library is loaded

-- ===== Buttons =====
function library:AddButton(tab, name, callback)
    local button = Instance.new("TextButton")
    button.Text = name
    button.Parent = tab
    button.MouseButton1Click:Connect(callback)
    return button
end

-- ===== TextBox =====
function library:AddTextBox(tab, name, callback, options)
    local textBox = Instance.new("TextBox")
    textBox.Text = name
    textBox.Parent = tab
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(textBox.Text)
            if options and options.clear ~= false then
                textBox.Text = ""
            end
        end
    end)
    return textBox
end

-- ===== Switch =====
function library:AddSwitch(tab, name, callback)
    local switch = Instance.new("TextButton")
    switch.Text = name
    switch.Parent = tab
    local state = false
    switch.MouseButton1Click:Connect(function()
        state = not state
        callback(state)
    end)
    function switch:Set(value)
        state = value
        callback(state)
    end
    return switch
end

-- ===== Slider =====
function library:AddSlider(tab, name, callback, options)
    local slider = Instance.new("Frame")
    slider.Name = name
    slider.Parent = tab
    options = options or {min = 0, max = 100, readonly = false}
    local value = (options.max - options.min) / 2
    function slider:Set(v)
        value = v
        callback(value)
    end
    return slider
end

-- ===== Keybind =====
function library:AddKeybind(tab, name, callback, options)
    local keybind = Instance.new("TextButton")
    keybind.Text = name
    keybind.Parent = tab
    keybind.MouseButton1Click:Connect(function()
        -- simplified: just call callback
        callback(Enum.KeyCode.RightShift)
    end)
    return keybind
end

-- ===== ColorPicker =====
function library:AddColorPicker(tab, callback)
    local picker = Instance.new("Frame")
    picker.Parent = tab
    picker.BackgroundColor3 = Color3.new(1, 0, 0)
    function picker:Set(color)
        picker.BackgroundColor3 = color
        callback(color)
    end
    return picker
end
