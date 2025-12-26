-- lib/console.lua
-- Console UI element

local library = dofile("lib/library.lua")

function library:AddConsole(tab, options)
    options = options or {}
    local console = Instance.new("TextBox")
    console.MultiLine = true
    console.Size = UDim2.new(1, 0, 0, 200)
    console.Text = options.source or ""
    console.Parent = tab

    function console:Set(text)
        console.Text = text
    end

    function console:Get()
        return console.Text
    end

    return console
end
