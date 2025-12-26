-- lib/library.lua
-- Core UI library: handles windows, tabs, folders, and basic layout

local library = {}
library.windows = {}

-- ===== Helper Functions =====
local function hasprop(obj, prop)
    local success = pcall(function() return obj[prop] end)
    return success
end

local function create(name, parent, props)
    local obj = Instance.new(name)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    if parent then obj.Parent = parent end
    return obj
end

-- ===== Window Creation =====
function library:AddWindow(title, options)
    options = options or {}
    local Window = create("ScreenGui")
    Window.Name = title or "Window"

    -- main frame, title bar, resizer etc. (copy relevant code from your original main.lua)
    
    -- store window
    table.insert(library.windows, Window)
    
    local window_data = {} -- store tab/folder objects
    return window_data, Window
end

-- ===== Tab / Folder Functions =====
function library:AddTab(window, name)
    -- create a tab object for a window
    local tab_data = {}
    local new_tab = create("Frame", window) -- simplified example
    return tab_data, new_tab
end

function library:AddFolder(tab, name)
    -- create a folder object inside a tab
    local folder_data = {}
    local folder = create("Frame", tab)
    return folder_data, folder
end

-- ===== Utilities =====
function library:FormatWindows()
    for _, Window in next, library.windows do
        for i, v in next, Window:GetDescendants() do
            if hasprop(v, "ZIndex") then
                v.ZIndex = v.ZIndex + (#library.windows * 10)
            end
        end
    end
end

return library
