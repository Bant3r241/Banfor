local ButtonModule = {}

function ButtonModule.Create(parent, text, callback)
    local button = Instance.new("TextButton") -- Your prefab
    button.Parent = parent
    button.Text = text or "Button"
    
    if callback then
        button.MouseButton1Click:Connect(callback)
    end

    return button
end

return ButtonModule
