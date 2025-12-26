local Switch = {}
Switch.__index = Switch

function Switch.new(parent_tab, options, text, callback)
    local switch = Prefabs:FindFirstChild("Switch"):Clone()
    switch.Parent = parent_tab
    switch.Text = text or "Switch"
    callback = typeof(callback) == "function" and callback or function() end

    local switch_data = {}
    local toggled = false

    -- Update color
    spawn(function()
        while true do
            if switch and switch:GetChildren()[1] then
                switch:GetChildren()[1].ImageColor3 = options.main_color
            end
            game:GetService("RunService").Heartbeat:Wait()
        end
    end)

    switch.MouseButton1Click:Connect(function()
        toggled = not toggled
        switch.Text = toggled and utf8.char(10003) or ""
        pcall(callback, toggled)
    end)

    function switch_data:Set(bool)
        toggled = (typeof(bool) == "boolean") and bool or false
        switch.Text = toggled and utf8.char(10003) or ""
        pcall(callback, toggled)
    end

    return switch_data, switch
end

return Switch
