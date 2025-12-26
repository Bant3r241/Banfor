local Button = {}
Button.__index = Button

function Button.new(parent_tab, options, text, callback)
    local btn = Prefabs:FindFirstChild("Button"):Clone()
    btn.Parent = parent_tab
    btn.Text = text or "Button"
    callback = typeof(callback) == "function" and callback or function() end

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return btn
end

return Button
