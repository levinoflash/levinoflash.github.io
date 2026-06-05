local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local KeySystemFrame = Instance.new("Frame")
KeySystemFrame.Size = UDim2.new(0, 235, 0, 0)
KeySystemFrame.Position = UDim2.new(0.5, -117, 0.5, -100)
KeySystemFrame.AutomaticSize = Enum.AutomaticSize.Y
KeySystemFrame.BorderSizePixel = 0
KeySystemFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeySystemFrame.Parent = ScreenGui

local KeySystemStroke = Instance.new("UIStroke")
KeySystemStroke.Color = Color3.fromRGB(80, 80, 80)
KeySystemStroke.Transparency = 0.85
KeySystemStroke.Thickness = 1
KeySystemStroke.Parent = KeySystemFrame

local KeySystemTopBar = Instance.new("Frame")
KeySystemTopBar.Size = UDim2.new(1, 0, 0, 28)
KeySystemTopBar.BorderSizePixel = 0
KeySystemTopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeySystemTopBar.Parent = KeySystemFrame

local KeySystemTitle = Instance.new("TextLabel")
KeySystemTitle.Size = UDim2.new(1, 0, 1, 0)
KeySystemTitle.BackgroundTransparency = 1
KeySystemTitle.Font = Enum.Font.Code
KeySystemTitle.TextSize = 13
KeySystemTitle.Text = "Levino Key System"
KeySystemTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
KeySystemTitle.TextXAlignment = Enum.TextXAlignment.Center
KeySystemTitle.Parent = KeySystemTopBar

local KeySystemContent = Instance.new("Frame")
KeySystemContent.Size = UDim2.new(1, 0, 0, 0)
KeySystemContent.Position = UDim2.new(0, 0, 0, 28)
KeySystemContent.AutomaticSize = Enum.AutomaticSize.Y
KeySystemContent.BackgroundTransparency = 1
KeySystemContent.Parent = KeySystemFrame

local KeySystemLayout = Instance.new("UIListLayout")
KeySystemLayout.SortOrder = Enum.SortOrder.LayoutOrder
KeySystemLayout.Padding = UDim.new(0, 4)
KeySystemLayout.Parent = KeySystemContent

local KeySystemPadding = Instance.new("UIPadding")
KeySystemPadding.PaddingTop = UDim.new(0, 6)
KeySystemPadding.PaddingBottom = UDim.new(0, 8)
KeySystemPadding.PaddingLeft = UDim.new(0, 10)
KeySystemPadding.PaddingRight = UDim.new(0, 10)
KeySystemPadding.Parent = KeySystemContent

local KeyTextboxFrame = Instance.new("Frame")
KeyTextboxFrame.Size = UDim2.new(1, 0, 0, 36)
KeyTextboxFrame.BackgroundTransparency = 1
KeyTextboxFrame.Parent = KeySystemContent

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Size = UDim2.new(1, 0, 0, 14)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Font = Enum.Font.Code
KeyLabel.TextSize = 13
KeyLabel.Text = "Enter Key"
KeyLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
KeyLabel.Parent = KeyTextboxFrame

local KeyBoxOuter = Instance.new("Frame")
KeyBoxOuter.Size = UDim2.new(1, 2, 0, 20)
KeyBoxOuter.Position = UDim2.new(0, -1, 0, 16)
KeyBoxOuter.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
KeyBoxOuter.BackgroundTransparency = 0.85
KeyBoxOuter.BorderSizePixel = 0
KeyBoxOuter.Parent = KeyTextboxFrame

local KeyInputBox = Instance.new("TextBox")
KeyInputBox.Size = UDim2.new(1, -2, 1, -2)
KeyInputBox.Position = UDim2.new(0, 1, 0, 1)
KeyInputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInputBox.BorderSizePixel = 0
KeyInputBox.Font = Enum.Font.Code
KeyInputBox.TextSize = 13
KeyInputBox.Text = ""
KeyInputBox.PlaceholderText = "Enter your key here..."
KeyInputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
KeyInputBox.TextColor3 = Color3.fromRGB(180, 180, 180)
KeyInputBox.TextXAlignment = Enum.TextXAlignment.Left
KeyInputBox.ClearTextOnFocus = false
KeyInputBox.Parent = KeyBoxOuter

local KeyInputPadding = Instance.new("UIPadding")
KeyInputPadding.PaddingLeft = UDim.new(0, 6)
KeyInputPadding.Parent = KeyInputBox

local CheckButtonFrame = Instance.new("Frame")
CheckButtonFrame.Size = UDim2.new(1, 0, 0, 24)
CheckButtonFrame.BackgroundTransparency = 1
CheckButtonFrame.Parent = KeySystemContent

local CheckButtonOuter = Instance.new("Frame")
CheckButtonOuter.Size = UDim2.new(1, 2, 0, 22)
CheckButtonOuter.Position = UDim2.new(0, -1, 0, 2)
CheckButtonOuter.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
CheckButtonOuter.BackgroundTransparency = 0.85
CheckButtonOuter.BorderSizePixel = 0
CheckButtonOuter.Parent = CheckButtonFrame

local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Size = UDim2.new(1, -2, 1, -2)
CheckKeyButton.Position = UDim2.new(0, 1, 0, 1)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CheckKeyButton.BorderSizePixel = 0
CheckKeyButton.Text = "Check Key"
CheckKeyButton.Font = Enum.Font.Code
CheckKeyButton.TextSize = 13
CheckKeyButton.TextColor3 = Color3.fromRGB(180, 180, 180)
CheckKeyButton.AutoButtonColor = false
CheckKeyButton.Parent = CheckButtonOuter

local CheckButtonPadding = Instance.new("UIPadding")
CheckButtonPadding.PaddingTop = UDim.new(0, 2)
CheckButtonPadding.Parent = CheckKeyButton

local CopyButtonFrame = Instance.new("Frame")
CopyButtonFrame.Size = UDim2.new(1, 0, 0, 24)
CopyButtonFrame.BackgroundTransparency = 1
CopyButtonFrame.Parent = KeySystemContent

local CopyButtonOuter = Instance.new("Frame")
CopyButtonOuter.Size = UDim2.new(1, 2, 0, 22)
CopyButtonOuter.Position = UDim2.new(0, -1, 0, 2)
CopyButtonOuter.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
CopyButtonOuter.BackgroundTransparency = 0.85
CopyButtonOuter.BorderSizePixel = 0
CopyButtonOuter.Parent = CopyButtonFrame

local CopyLinkButton = Instance.new("TextButton")
CopyLinkButton.Size = UDim2.new(1, -2, 1, -2)
CopyLinkButton.Position = UDim2.new(0, 1, 0, 1)
CopyLinkButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CopyLinkButton.BorderSizePixel = 0
CopyLinkButton.Text = "Copy Get Key Link"
CopyLinkButton.Font = Enum.Font.Code
CopyLinkButton.TextSize = 13
CopyLinkButton.TextColor3 = Color3.fromRGB(180, 180, 180)
CopyLinkButton.AutoButtonColor = false
CopyLinkButton.Parent = CopyButtonOuter

local CopyButtonPadding = Instance.new("UIPadding")
CopyButtonPadding.PaddingTop = UDim.new(0, 2)
CopyButtonPadding.Parent = CopyLinkButton

local keyLink = "https://example.com/getkey"
local validKey = "LEVINO2024"

CheckKeyButton.Activated:Connect(function()
    local enteredKey = KeyInputBox.Text
    if enteredKey == validKey then
        KeySystemFrame:Destroy()
        loadstring(game:HttpGet("https://example.com/script.lua"))()
    else
        KeyInputBox.Text = ""
    end
end)

CopyLinkButton.Activated:Connect(function()
    if setclipboard then
        setclipboard(keyLink)
    end
end)

local dragging, dragInput, dragStart, startPos
KeySystemTopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = KeySystemFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
KeySystemTopBar.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        KeySystemFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
