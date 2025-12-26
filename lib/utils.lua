local Utils = {}

function Utils.Resize(guiObject, properties, time)
    -- Tweening logic
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(time or 0.25)
    local tween = tweenService:Create(guiObject, tweenInfo, properties)
    tween:Play()
end

function Utils.gMouse()
    return game.Players.LocalPlayer:GetMouse()
end

function Utils.rgbtohsv(r, g, b)
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, v = 0, 0, max

    local d = max - min
    s = max == 0 and 0 or d / max

    if max == min then
        h = 0
    elseif max == r then
        h = (g - b) / d + (g < b and 6 or 0)
    elseif max == g then
        h = (b - r) / d + 2
    elseif max == b then
        h = (r - g) / d + 4
    end

    h = h / 6
    return h, s, v
end

function Utils.gNameLen(guiTextLabel)
    return #guiTextLabel.Text * 8
end

return Utils
