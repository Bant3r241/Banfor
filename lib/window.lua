local WindowModule = {}

function WindowModule.CreateWindow(title, options)
    local window_data = {}
    local Window = Instance.new("Frame") -- Your prefab or custom UI
    -- Setup main window: draggable, toggle key, min_size, etc.

    -- Format ZIndex
    for _, v in next, Window:GetDescendants() do
        if pcall(function() return v.ZIndex end) then
            v.ZIndex = v.ZIndex + 10 -- Example
        end
    end

    function window_data:AddTab(tab_name)
        return require(script.Parent.tab).CreateTab(tab_name, Window)
    end

    return window_data, Window
end

return WindowModule
