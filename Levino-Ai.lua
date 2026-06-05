local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local API_KEY = "AQ.Ab8RN6JmkHeuHMnNxoxGVTMxaw4vxNDPBPOBJobi3g1R6lnGfw"
local API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite:generateContent"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(80, 80, 80)
MainStroke.Transparency = 0.85
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 28)
TopBar.BorderSizePixel = 0
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TopBar.Parent = MainFrame

local TopStroke = Instance.new("UIStroke")
TopStroke.Color = Color3.fromRGB(80, 80, 80)
TopStroke.Transparency = 0.85
TopStroke.Thickness = 1
TopStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
TopStroke.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Code
Title.TextSize = 16
Title.Text = "Levino Assistant"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = TopBar

local ChatFrame = Instance.new("ScrollingFrame")
ChatFrame.Size = UDim2.new(1, -20, 1, -90)
ChatFrame.Position = UDim2.new(0, 10, 0, 38)
ChatFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ChatFrame.BorderSizePixel = 0
ChatFrame.ScrollBarThickness = 4
ChatFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
ChatFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ChatFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ChatFrame.Parent = MainFrame

local ChatStroke = Instance.new("UIStroke")
ChatStroke.Color = Color3.fromRGB(80, 80, 80)
ChatStroke.Transparency = 0.85
ChatStroke.Thickness = 1
ChatStroke.Parent = ChatFrame

local ChatLayout = Instance.new("UIListLayout")
ChatLayout.SortOrder = Enum.SortOrder.LayoutOrder
ChatLayout.Padding = UDim.new(0, 6)
ChatLayout.Parent = ChatFrame

local ChatPadding = Instance.new("UIPadding")
ChatPadding.PaddingLeft = UDim.new(0, 8)
ChatPadding.PaddingRight = UDim.new(0, 8)
ChatPadding.PaddingTop = UDim.new(0, 8)
ChatPadding.PaddingBottom = UDim.new(0, 8)
ChatPadding.Parent = ChatFrame

local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, -20, 0, 42)
InputFrame.Position = UDim2.new(0, 10, 1, -52)
InputFrame.BackgroundTransparency = 1
InputFrame.Parent = MainFrame

local InputBoxOuter = Instance.new("Frame")
InputBoxOuter.Size = UDim2.new(1, 2, 0, 40)
InputBoxOuter.Position = UDim2.new(0, -1, 0, 0)
InputBoxOuter.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
InputBoxOuter.BackgroundTransparency = 0.85
InputBoxOuter.BorderSizePixel = 0
InputBoxOuter.Parent = InputFrame

local InputBox = Instance.new("TextBox")
InputBox.Size = UDim2.new(1, -2, 1, -2)
InputBox.Position = UDim2.new(0, 1, 0, 1)
InputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
InputBox.BorderSizePixel = 0
InputBox.Font = Enum.Font.Code
InputBox.TextSize = 13
InputBox.Text = ""
InputBox.PlaceholderText = "Ask something..."
InputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
InputBox.TextColor3 = Color3.fromRGB(180, 180, 180)
InputBox.TextXAlignment = Enum.TextXAlignment.Left
InputBox.TextTruncate = Enum.TextTruncate.AtEnd
InputBox.ClearTextOnFocus = false
InputBox.MultiLine = false
InputBox.Parent = InputBoxOuter

local InputPadding = Instance.new("UIPadding")
InputPadding.PaddingLeft = UDim.new(0, 8)
InputPadding.Parent = InputBox

local chatHistory = {}

local function AddMessage(sender, message, isError, streamFrame)
    local MessageFrame = streamFrame or Instance.new("Frame")
    if not streamFrame then
        MessageFrame.Size = UDim2.new(1, 0, 0, 0)
        MessageFrame.AutomaticSize = Enum.AutomaticSize.Y
        MessageFrame.BackgroundColor3 = isError and Color3.fromRGB(60, 20, 20) or (sender == "You" and Color3.fromRGB(40, 40, 45) or Color3.fromRGB(35, 40, 35))
        MessageFrame.BorderSizePixel = 0
        MessageFrame.Parent = ChatFrame

        local MsgStroke = Instance.new("UIStroke")
        MsgStroke.Color = Color3.fromRGB(80, 80, 80)
        MsgStroke.Transparency = 0.85
        MsgStroke.Thickness = 1
        MsgStroke.Parent = MessageFrame

        local SenderLabel = Instance.new("TextLabel")
        SenderLabel.Size = UDim2.new(1, -16, 0, 16)
        SenderLabel.Position = UDim2.new(0, 8, 0, 6)
        SenderLabel.BackgroundTransparency = 1
        SenderLabel.Font = Enum.Font.Code
        SenderLabel.TextSize = 13
        SenderLabel.Text = sender
        SenderLabel.TextColor3 = sender == "You" and Color3.fromRGB(100, 150, 255) or Color3.fromRGB(100, 255, 150)
        SenderLabel.TextXAlignment = Enum.TextXAlignment.Left
        SenderLabel.TextYAlignment = Enum.TextYAlignment.Top
        SenderLabel.Parent = MessageFrame

        local MessageLabel = Instance.new("TextLabel")
        MessageLabel.Name = "MessageText"
        MessageLabel.Size = UDim2.new(1, -16, 0, 0)
        MessageLabel.Position = UDim2.new(0, 8, 0, 24)
        MessageLabel.AutomaticSize = Enum.AutomaticSize.Y
        MessageLabel.BackgroundTransparency = 1
        MessageLabel.Font = Enum.Font.Code
        MessageLabel.TextSize = 13
        MessageLabel.Text = message
        MessageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
        MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
        MessageLabel.TextWrapped = true
        MessageLabel.Parent = MessageFrame

        local MsgPadding = Instance.new("UIPadding")
        MsgPadding.PaddingBottom = UDim.new(0, 8)
        MsgPadding.Parent = MessageFrame
    else
        local MessageLabel = MessageFrame:FindFirstChild("MessageText")
        if MessageLabel then MessageLabel.Text = message end
    end

    task.wait()
    ChatFrame.CanvasPosition = Vector2.new(0, ChatFrame.AbsoluteCanvasSize.Y)
    return MessageFrame
end

local function CallAI(userMessage)
    local systemPrompt = [[You are Levino, the AI assistant for Levino Cheat (Roblox exploit). Your only goal is to solve user problems and explain features.

- Explain how the exploit's features work (e.g., ESP, Aimbot, Fly) in simple terms.
- Provide clear troubleshooting steps if a feature or the exploit itself is not working (e.g., crashing, keys not registering, features failing to load).
- Keep answers short, direct, and focused only on the solution.
- NEVER make up information. If you do not know the answer or lack details about a specific issue/feature, state clearly that you do not know.
- Use plain text only. No markdown, no bold text, no bullet points unless necessary.
- NEVER write, generate, or modify any code (Lua/Luau, C++, etc.).]]

    table.insert(chatHistory, {role = "user", parts = {{text = userMessage}}})

    local body = {
        contents = chatHistory,
        systemInstruction = {parts = {{text = systemPrompt}}},
        generationConfig = {temperature = 0.7, maxOutputTokens = 15000}
    }
    
    local httpRequest = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
    if not httpRequest then return false end
    
    local success, response = pcall(function()
        return httpRequest({
            Url = API_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json", ["X-goog-api-key"] = API_KEY},
            Body = HttpService:JSONEncode(body)
        })
    end)
    
    if not success or response.StatusCode ~= 200 then return false end
    
    local ok, decoded = pcall(function() return HttpService:JSONDecode(response.Body) end)
    if not ok or decoded.error then return false end
    
    if decoded.candidates and decoded.candidates[1] and decoded.candidates[1].content then
        local aiText = decoded.candidates[1].content.parts[1].text
        table.insert(chatHistory, {role = "model", parts = {{text = aiText}}})
        return true, aiText
    end
    return false
end

local isSending = false
local isTyping = false

local function SendMessage()
    if isSending or isTyping or InputBox.Text == "" then return end
    isSending = true
    
    local userMessage = InputBox.Text
    InputBox.Text = ""
    AddMessage("You", userMessage)
    
    local streamFrame = AddMessage("Levino", ".")
    local messageLabel = streamFrame:FindFirstChild("MessageText")
    
    local dotsAnimation
    local dots = 1
    dotsAnimation = task.spawn(function()
        while isSending do
            if messageLabel then
                messageLabel.Text = string.rep(".", dots)
                dots = (dots % 3) + 1
                task.wait(0.4)
            end
        end
    end)
    
    task.spawn(function()
        local success, aiResponse = CallAI(userMessage)
        
        isSending = false
        if dotsAnimation then task.cancel(dotsAnimation) end
        
        if success and aiResponse and aiResponse ~= "" then
            isTyping = true
            for i = 1, #aiResponse do
                if messageLabel then
                    messageLabel.Text = aiResponse:sub(1, i)
                    ChatFrame.CanvasPosition = Vector2.new(0, ChatFrame.AbsoluteCanvasSize.Y)
                    task.wait(0.015)
                end
            end
            isTyping = false
        else
            streamFrame:Destroy()
            AddMessage("Levino", "Error, try again later", true)
        end
    end)
end

InputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then SendMessage() end
end)

local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

MainFrame.Visible = true
AddMessage("System", "Levino Assistant ready!")
