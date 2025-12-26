local TabModule = {}
local Elements = require(script.Parent.Elements) -- access elements

function TabModule.CreateTab(tab_name, parent_window)
    local tab_data = {}
    local new_tab = Instance.new("Frame") -- Your tab prefab
    new_tab.Parent = parent_window

    -- Example element add functions
    function tab_data:AddLabel(text)
        return Elements.Label.Create(new_tab, text)
    end

    function tab_data:AddButton(text, callback)
        return Elements.Button.Create(new_tab, text, callback)
    end

    -- Add all other elements similarly...

    return tab_data, new_tab
end

return TabModule
