local library = {}

-- Load core modules
library.Window = require(script.window)
library.Tab = require(script.tab)

-- Load elements
library.Elements = {
    Label = require(script.elements.label),
    Button = require(script.elements.button),
    TextBox = require(script.elements.textbox),
    Switch = require(script.elements.switch),
    Slider = require(script.elements.slider),
    Keybind = require(script.elements.keybind),
    Dropdown = require(script.elements.dropdown),
    ColorPicker = require(script.elements.colorpicker),
    Console = require(script.elements.console),
    HorizontalAlignment = require(script.elements.horizontalalignment),
    Folder = require(script.elements.folder),
}

function library:AddWindow(title, options)
    return library.Window.CreateWindow(title, options)
end

return library
