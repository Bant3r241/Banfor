local WindowClass = require(script.window)

local library = {}

function library:AddWindow(title, options)
    options = options or {}
    options.main_color = options.main_color or Color3.fromRGB(41, 74, 122)
    options.min_size = options.min_size or Vector2.new(500, 600)
    options.toggle_key = options.toggle_key or Enum.KeyCode.RightShift
    options.can_resize = options.can_resize ~= false

    local window_data = WindowClass.new(title, options)
    return window_data, window_data.Instance
end

return library
