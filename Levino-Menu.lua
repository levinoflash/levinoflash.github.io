local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Library = {}

function Library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 500)
    MainFrame.Position = UDim2.new(0.37, 0, 0.23, 0)
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
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(200, 200, 200)
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.Parent = TopBar

    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(1, 0, 0, 28)
    TabContainer.Position = UDim2.new(0, 0, 0, 28)
    TabContainer.BorderSizePixel = 0
    TabContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabContainer.Parent = MainFrame

    local TabStroke = Instance.new("UIStroke")
    TabStroke.Color = Color3.fromRGB(80, 80, 80)
    TabStroke.Transparency = 0.85
    TabStroke.Thickness = 1
    TabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    TabStroke.Parent = TabContainer

    local ContentContainer = Instance.new("Frame")
    ContentContainer.Size = UDim2.new(1, 0, 1, -56)
    ContentContainer.Position = UDim2.new(0, 0, 0, 56)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.ClipsDescendants = true
    ContentContainer.Parent = MainFrame

    local KeybindsFrame = Instance.new("Frame")
    KeybindsFrame.Size = UDim2.new(0, 235, 0, 0)
    KeybindsFrame.Position = UDim2.new(0, 10, 0.5, -100)
    KeybindsFrame.AutomaticSize = Enum.AutomaticSize.Y
    KeybindsFrame.BorderSizePixel = 0
    KeybindsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    KeybindsFrame.Parent = ScreenGui

    local KeybindsStroke = Instance.new("UIStroke")
    KeybindsStroke.Color = Color3.fromRGB(80, 80, 80)
    KeybindsStroke.Transparency = 0.85
    KeybindsStroke.Thickness = 1
    KeybindsStroke.Parent = KeybindsFrame

    local KeybindsHeader = Instance.new("Frame")
    KeybindsHeader.Size = UDim2.new(1, 0, 0, 28)
    KeybindsHeader.BorderSizePixel = 0
    KeybindsHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    KeybindsHeader.Parent = KeybindsFrame

    local KeybindsTitle = Instance.new("TextLabel")
    KeybindsTitle.Size = UDim2.new(1, 0, 1, 0)
    KeybindsTitle.BackgroundTransparency = 1
    KeybindsTitle.Font = Enum.Font.Code
    KeybindsTitle.TextSize = 13
    KeybindsTitle.Text = "Keybinds"
    KeybindsTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    KeybindsTitle.TextXAlignment = Enum.TextXAlignment.Center
    KeybindsTitle.Parent = KeybindsHeader

    local KeybindsContainer = Instance.new("Frame")
    KeybindsContainer.Size = UDim2.new(1, 0, 0, 0)
    KeybindsContainer.Position = UDim2.new(0, 0, 0, 28)
    KeybindsContainer.AutomaticSize = Enum.AutomaticSize.Y
    KeybindsContainer.BackgroundTransparency = 1
    KeybindsContainer.Parent = KeybindsFrame

    local KeybindsLayout = Instance.new("UIListLayout")
    KeybindsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    KeybindsLayout.Padding = UDim.new(0, 4)
    KeybindsLayout.Parent = KeybindsContainer

    local KeybindsPadding = Instance.new("UIPadding")
    KeybindsPadding.PaddingLeft = UDim.new(0, 10)
    KeybindsPadding.PaddingRight = UDim.new(0, 10)
    KeybindsPadding.PaddingTop = UDim.new(0, 4)
    KeybindsPadding.PaddingBottom = UDim.new(0, 8)
    KeybindsPadding.Parent = KeybindsContainer

    local Watermark = Instance.new("Frame")
    Watermark.Size = UDim2.new(0, 400, 0, 25)
    Watermark.Position = UDim2.new(1, -410, 0, 10)
    Watermark.BorderSizePixel = 0
    Watermark.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Watermark.Visible = false
    Watermark.Parent = ScreenGui

    local WatermarkStroke = Instance.new("UIStroke")
    WatermarkStroke.Color = Color3.fromRGB(80, 80, 80)
    WatermarkStroke.Transparency = 0.85
    WatermarkStroke.Thickness = 1
    WatermarkStroke.Parent = Watermark

    local WatermarkText = Instance.new("TextLabel")
    WatermarkText.Size = UDim2.new(1, -10, 1, 0)
    WatermarkText.Position = UDim2.new(0, 5, 0, 0)
    WatermarkText.BackgroundTransparency = 1
    WatermarkText.Font = Enum.Font.Code
    WatermarkText.TextSize = 13
    WatermarkText.Text = title
    WatermarkText.TextColor3 = Color3.fromRGB(200, 200, 200)
    WatermarkText.TextXAlignment = Enum.TextXAlignment.Left
    WatermarkText.Parent = Watermark

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

    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.RightControl then MainFrame.Visible = not MainFrame.Visible end
    end)

    local Window = {}
    Window.ScreenGui = ScreenGui
    Window.MainFrame = MainFrame
    Window.TabContainer = TabContainer
    Window.ContentContainer = ContentContainer
    Window.KeybindsContainer = KeybindsContainer
    Window.Watermark = Watermark
    Window.WatermarkText = WatermarkText
    Window.tabs = {}
    Window.tabContents = {}
    Window.activeBinds = {}
    Window.currentTab = 1

    function Window:CreateTabs(tabNames)
        for i, name in ipairs(tabNames) do
            local Tab = Instance.new("TextButton")
            Tab.Size = UDim2.new(1 / #tabNames, 0, 1, 0)
            Tab.Position = UDim2.new((i - 1) / #tabNames, 0, 0, 0)
            Tab.BackgroundTransparency = 1
            Tab.BorderSizePixel = 0
            Tab.Font = Enum.Font.Code
            Tab.TextSize = 14
            Tab.Text = name
            Tab.TextColor3 = (i == 1) and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(120, 120, 120)
            Tab.TextXAlignment = Enum.TextXAlignment.Center
            Tab.Parent = self.TabContainer
            table.insert(self.tabs, Tab)

            local TabContent = Instance.new("Frame")
            TabContent.Name = "TabContent" .. i
            TabContent.Size = UDim2.new(1, 0, 1, 0)
            TabContent.BackgroundTransparency = 1
            TabContent.Visible = (i == 1)
            TabContent.Parent = self.ContentContainer

            local Padding = Instance.new("UIPadding")
            Padding.PaddingTop = UDim.new(0, 10)
            Padding.Parent = TabContent

            table.insert(self.tabContents, TabContent)
        end

        for i, tab in ipairs(self.tabs) do
            tab.Activated:Connect(function()
                if self.currentTab == i then return end
                self.tabContents[self.currentTab].Visible = false
                self.tabContents[i].Visible = true
                self.currentTab = i
                for j, t in ipairs(self.tabs) do
                    TweenService:Create(t, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = (j == i) and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(120, 120, 120)
                    }):Play()
                end
            end)
        end
    end

    function Window:GetTab(index)
        return self.tabContents[index]
    end

    function Window:CreateColumnContainer(parent)
        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1, 0, 0, 0)
        Container.AutomaticSize = Enum.AutomaticSize.Y
        Container.BackgroundTransparency = 1
        Container.Parent = parent

        local LeftColumn = Instance.new("Frame")
        LeftColumn.Size = UDim2.new(0, 235, 0, 0)
        LeftColumn.Position = UDim2.new(0, 10, 0, 0)
        LeftColumn.AutomaticSize = Enum.AutomaticSize.Y
        LeftColumn.BackgroundTransparency = 1
        LeftColumn.Parent = Container

        local LeftLayout = Instance.new("UIListLayout")
        LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
        LeftLayout.Padding = UDim.new(0, 10)
        LeftLayout.Parent = LeftColumn

        local RightColumn = Instance.new("Frame")
        RightColumn.Size = UDim2.new(0, 235, 0, 0)
        RightColumn.Position = UDim2.new(0, 255, 0, 0)
        RightColumn.AutomaticSize = Enum.AutomaticSize.Y
        RightColumn.BackgroundTransparency = 1
        RightColumn.Parent = Container

        local RightLayout = Instance.new("UIListLayout")
        RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
        RightLayout.Padding = UDim.new(0, 10)
        RightLayout.Parent = RightColumn

        return LeftColumn, RightColumn
    end

    function Window:CreateSection(name, parent)
        local Section = Instance.new("Frame")
        Section.Size = UDim2.new(1, 0, 0, 0)
        Section.AutomaticSize = Enum.AutomaticSize.Y
        Section.BorderSizePixel = 0
        Section.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Section.Parent = parent

        local SectionStroke = Instance.new("UIStroke")
        SectionStroke.Color = Color3.fromRGB(80, 80, 80)
        SectionStroke.Transparency = 0.85
        SectionStroke.Thickness = 1
        SectionStroke.Parent = Section

        local Header = Instance.new("Frame")
        Header.Size = UDim2.new(1, 0, 0, 28)
        Header.BorderSizePixel = 0
        Header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Header.Parent = Section

        local HeaderText = Instance.new("TextLabel")
        HeaderText.Size = UDim2.new(1, 0, 1, 0)
        HeaderText.BackgroundTransparency = 1
        HeaderText.Font = Enum.Font.Code
        HeaderText.TextSize = 13
        HeaderText.Text = name
        HeaderText.TextColor3 = Color3.fromRGB(200, 200, 200)
        HeaderText.TextXAlignment = Enum.TextXAlignment.Center
        HeaderText.Parent = Header

        local Container = Instance.new("Frame")
        Container.Size = UDim2.new(1, 0, 0, 0)
        Container.Position = UDim2.new(0, 0, 0, 28)
        Container.AutomaticSize = Enum.AutomaticSize.Y
        Container.BackgroundTransparency = 1
        Container.Parent = Section

        local Layout = Instance.new("UIListLayout")
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        Layout.Padding = UDim.new(0, 4)
        Layout.Parent = Container

        local Padding = Instance.new("UIPadding")
        Padding.PaddingLeft = UDim.new(0, 10)
        Padding.PaddingRight = UDim.new(0, 10)
        Padding.PaddingTop = UDim.new(0, 4)
        Padding.PaddingBottom = UDim.new(0, 8)
        Padding.Parent = Container

        local SF = {}
        SF.Window = self
        SF.Container = Container

        function SF:Toggle(text, default, callback)
            local toggled = default or false
            local Toggle = Instance.new("Frame")
            Toggle.Size = UDim2.new(1, 0, 0, 18)
            Toggle.BackgroundTransparency = 1
            Toggle.Parent = Container

            local Box = Instance.new("Frame")
            Box.Size = UDim2.new(0, 14, 0, 14)
            Box.Position = UDim2.new(0, 0, 0, 2)
            Box.BorderSizePixel = 0
            Box.BackgroundColor3 = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(45, 45, 45)
            Box.Parent = Toggle

            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = Color3.fromRGB(80, 80, 80)
            BoxStroke.Transparency = 0.85
            BoxStroke.Thickness = 1
            BoxStroke.Parent = Box

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -20, 1, 0)
            Label.Position = UDim2.new(0, 20, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Code
            Label.TextSize = 13
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(180, 180, 180)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Toggle

            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.BackgroundTransparency = 1
            Button.Text = ""
            Button.Parent = Toggle

            Button.Activated:Connect(function()
                toggled = not toggled
                TweenService:Create(Box, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(45, 45, 45)
                }):Play()
                if callback then callback(toggled) end
            end)
        end

        function SF:BindToggle(text, default, callback)
            local toggled = default or false
            local boundKey = nil
            local listening = false

            local Toggle = Instance.new("Frame")
            Toggle.Size = UDim2.new(1, 0, 0, 20)
            Toggle.BackgroundTransparency = 1
            Toggle.Parent = Container

            local Box = Instance.new("Frame")
            Box.Size = UDim2.new(0, 14, 0, 14)
            Box.Position = UDim2.new(0, 0, 0, 3)
            Box.BorderSizePixel = 0
            Box.BackgroundColor3 = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(45, 45, 45)
            Box.Parent = Toggle

            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = Color3.fromRGB(80, 80, 80)
            BoxStroke.Transparency = 0.85
            BoxStroke.Thickness = 1
            BoxStroke.Parent = Box

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -60, 1, 0)
            Label.Position = UDim2.new(0, 20, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Code
            Label.TextSize = 13
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(180, 180, 180)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Toggle

            local BindButton = Instance.new("TextButton")
            BindButton.Size = UDim2.new(0, 50, 1, 0)
            BindButton.Position = UDim2.new(1, -50, 0, 0)
            BindButton.BackgroundTransparency = 1
            BindButton.BorderSizePixel = 0
            BindButton.Font = Enum.Font.Code
            BindButton.TextSize = 13
            BindButton.Text = "None"
            BindButton.TextColor3 = Color3.fromRGB(180, 180, 180)
            BindButton.TextXAlignment = Enum.TextXAlignment.Right
            BindButton.AutoButtonColor = false
            BindButton.Parent = Toggle

            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, -55, 1, 0)
            Button.BackgroundTransparency = 1
            Button.Text = ""
            Button.Parent = Toggle

            local bindData = {name = text, toggled = false, key = nil, entry = nil, label = nil, keyLabel = nil}
            table.insert(self.Window.activeBinds, bindData)

            local function UpdateKeybindDisplay()
                if boundKey and not bindData.entry then
                    local Entry = Instance.new("Frame")
                    Entry.Size = UDim2.new(1, 0, 0, 18)
                    Entry.BackgroundTransparency = 1
                    Entry.Parent = self.Window.KeybindsContainer

                    local NameLabel = Instance.new("TextLabel")
                    NameLabel.Size = UDim2.new(1, -50, 1, 0)
                    NameLabel.BackgroundTransparency = 1
                    NameLabel.Font = Enum.Font.Code
                    NameLabel.TextSize = 13
                    NameLabel.Text = text
                    NameLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
                    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
                    NameLabel.Parent = Entry

                    local KeyLabel = Instance.new("TextLabel")
                    KeyLabel.Size = UDim2.new(0, 50, 1, 0)
                    KeyLabel.Position = UDim2.new(1, -50, 0, 0)
                    KeyLabel.BackgroundTransparency = 1
                    KeyLabel.Font = Enum.Font.Code
                    KeyLabel.TextSize = 13
                    KeyLabel.Text = boundKey.Name
                    KeyLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                    KeyLabel.TextXAlignment = Enum.TextXAlignment.Right
                    KeyLabel.Parent = Entry

                    bindData.entry = Entry
                    bindData.label = NameLabel
                    bindData.keyLabel = KeyLabel
                elseif not boundKey and bindData.entry then
                    bindData.entry:Destroy()
                    bindData.entry = nil
                    bindData.label = nil
                    bindData.keyLabel = nil
                elseif bindData.label then
                    TweenService:Create(bindData.label, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextColor3 = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)
                    }):Play()
                    bindData.keyLabel.Text = boundKey.Name
                end
            end

            Button.Activated:Connect(function()
                toggled = not toggled
                bindData.toggled = toggled
                TweenService:Create(Box, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(45, 45, 45)
                }):Play()
                UpdateKeybindDisplay()
                if callback then callback(toggled) end
            end)

            BindButton.Activated:Connect(function()
                if listening then return end
                listening = true
                BindButton.Text = "..."
                local conn
                conn = UserInputService.InputBegan:Connect(function(input, gp)
                    if gp then return end
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        boundKey = nil
                        BindButton.Text = "None"
                        listening = false
                        conn:Disconnect()
                    elseif input.UserInputType == Enum.UserInputType.Keyboard then
                        boundKey = input.KeyCode
                        BindButton.Text = input.KeyCode.Name
                        listening = false
                        conn:Disconnect()
                    end
                    UpdateKeybindDisplay()
                end)
            end)

            UserInputService.InputBegan:Connect(function(input, gp)
                if gp or listening or not boundKey or input.KeyCode ~= boundKey then return end
                toggled = not toggled
                bindData.toggled = toggled
                TweenService:Create(Box, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundColor3 = toggled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(45, 45, 45)
                }):Play()
                UpdateKeybindDisplay()
                if callback then callback(toggled) end
            end)
        end

        function SF:Slider(text, min, max, default, callback)
            local value = default or min
            local dragging = false

            local SliderFrame = Instance.new("Frame")
            SliderFrame.Size = UDim2.new(1, 0, 0, 26)
            SliderFrame.BackgroundTransparency = 1
            SliderFrame.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, 0, 0, 14)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Code
            Label.TextSize = 13
            Label.Text = text .. ": " .. tostring(value)
            Label.TextColor3 = Color3.fromRGB(180, 180, 180)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = SliderFrame

            local BarOuter = Instance.new("Frame")
            BarOuter.Size = UDim2.new(1, 0, 0, 10)
            BarOuter.Position = UDim2.new(0, 0, 0, 16)
            BarOuter.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            BarOuter.BorderSizePixel = 0
            BarOuter.Parent = SliderFrame

            local BarStroke = Instance.new("UIStroke")
            BarStroke.Color = Color3.fromRGB(80, 80, 80)
            BarStroke.Transparency = 0.85
            BarStroke.Thickness = 1
            BarStroke.Parent = BarOuter

            local Fill = Instance.new("Frame")
            Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
            Fill.BorderSizePixel = 0
            Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Fill.Parent = BarOuter

            local function Update(input)
                local pos = math.clamp((input.Position.X - BarOuter.AbsolutePosition.X) / BarOuter.AbsoluteSize.X, 0, 1)
                value = math.floor(min + (max - min) * pos)
                TweenService:Create(Fill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(pos, 0, 1, 0)}):Play()
                Label.Text = text .. ": " .. tostring(value)
                if callback then callback(value) end
            end

            BarOuter.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true Update(input) end
            end)
            BarOuter.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then Update(input) end
            end)
        end

        function SF:Button(text, callback)
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Size = UDim2.new(1, 0, 0, 20)
            ButtonFrame.BackgroundTransparency = 1
            ButtonFrame.Parent = Container

            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Button.BorderSizePixel = 0
            Button.Text = text
            Button.Font = Enum.Font.Code
            Button.TextSize = 13
            Button.TextColor3 = Color3.fromRGB(180, 180, 180)
            Button.AutoButtonColor = false
            Button.Parent = ButtonFrame

            local ButtonStroke = Instance.new("UIStroke")
            ButtonStroke.Color = Color3.fromRGB(80, 80, 80)
            ButtonStroke.Transparency = 0.85
            ButtonStroke.Thickness = 1
            ButtonStroke.Parent = Button

            Button.Activated:Connect(function() if callback then callback() end end)
        end

        function SF:Dropdown(text, options, default, callback)
            local selected = default or options[1]

            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Size = UDim2.new(1, 0, 0, 36)
            DropdownFrame.BackgroundTransparency = 1
            DropdownFrame.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, 0, 0, 14)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Code
            Label.TextSize = 13
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(180, 180, 180)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = DropdownFrame

            local MainButtonOuter = Instance.new("Frame")
            MainButtonOuter.Size = UDim2.new(1, 2, 0, 20)
            MainButtonOuter.Position = UDim2.new(0, -1, 0, 16)
            MainButtonOuter.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            MainButtonOuter.BackgroundTransparency = 0.85
            MainButtonOuter.BorderSizePixel = 0
            MainButtonOuter.Parent = DropdownFrame

            local MainButton = Instance.new("TextButton")
            MainButton.Size = UDim2.new(1, -2, 1, -2)
            MainButton.Position = UDim2.new(0, 1, 0, 1)
            MainButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            MainButton.BorderSizePixel = 0
            MainButton.Text = ""
            MainButton.AutoButtonColor = false
            MainButton.Parent = MainButtonOuter

            local MainLabel = Instance.new("TextLabel")
            MainLabel.Size = UDim2.new(1, -10, 1, 0)
            MainLabel.Position = UDim2.new(0, 5, 0, 0)
            MainLabel.BackgroundTransparency = 1
            MainLabel.Font = Enum.Font.Code
            MainLabel.TextSize = 13
            MainLabel.Text = selected
            MainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            MainLabel.TextXAlignment = Enum.TextXAlignment.Left
            MainLabel.Parent = MainButton

            local OptionsContainer = Instance.new("Frame")
            OptionsContainer.Size = UDim2.new(1, 0, 0, 0)
            OptionsContainer.Position = UDim2.new(0, 0, 1, 2)
            OptionsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            OptionsContainer.BorderSizePixel = 0
            OptionsContainer.Visible = false
            OptionsContainer.ClipsDescendants = true
            OptionsContainer.ZIndex = 11
            OptionsContainer.Parent = MainButton

            local OptionsStroke = Instance.new("UIStroke")
            OptionsStroke.Color = Color3.fromRGB(80, 80, 80)
            OptionsStroke.Transparency = 0.85
            OptionsStroke.Thickness = 1
            OptionsStroke.Parent = OptionsContainer

            local function CreateOptions()
                for _, child in ipairs(OptionsContainer:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                for i, option in ipairs(options) do
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Size = UDim2.new(1, 0, 0, 18)
                    OptionButton.Position = UDim2.new(0, 0, 0, (i - 1) * 18)
                    OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    OptionButton.BorderSizePixel = 0
                    OptionButton.Text = ""
                    OptionButton.AutoButtonColor = false
                    OptionButton.ZIndex = 12
                    OptionButton.Parent = OptionsContainer

                    local OptionLabel = Instance.new("TextLabel")
                    OptionLabel.Size = UDim2.new(1, -10, 1, 0)
                    OptionLabel.Position = UDim2.new(0, 5, 0, 0)
                    OptionLabel.BackgroundTransparency = 1
                    OptionLabel.Font = Enum.Font.Code
                    OptionLabel.TextSize = 13
                    OptionLabel.Text = option
                    OptionLabel.TextColor3 = (option == selected) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
                    OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                    OptionLabel.ZIndex = 12
                    OptionLabel.Parent = OptionButton

                    OptionButton.Activated:Connect(function()
                        selected = option
                        MainLabel.Text = selected
                        CreateOptions()
                        if callback then callback(selected) end
                        TweenService:Create(OptionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                        task.wait(0.2)
                        OptionsContainer.Visible = false
                        DropdownFrame.ZIndex = 1
                    end)
                end
            end

            CreateOptions()

            MainButton.Activated:Connect(function()
                if OptionsContainer.Visible then
                    TweenService:Create(OptionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                    task.wait(0.2)
                    OptionsContainer.Visible = false
                    DropdownFrame.ZIndex = 1
                else
                    DropdownFrame.ZIndex = 10
                    OptionsContainer.Visible = true
                    TweenService:Create(OptionsContainer, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, #options * 18)}):Play()
                end
            end)
        end

        function SF:Textbox(text, placeholder, callback)
            local TextboxFrame = Instance.new("Frame")
            TextboxFrame.Size = UDim2.new(1, 0, 0, 36)
            TextboxFrame.BackgroundTransparency = 1
            TextboxFrame.Parent = Container

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, 0, 0, 14)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.Code
            Label.TextSize = 13
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(180, 180, 180)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = TextboxFrame

            local BoxOuter = Instance.new("Frame")
            BoxOuter.Size = UDim2.new(1, 2, 0, 20)
            BoxOuter.Position = UDim2.new(0, -1, 0, 16)
            BoxOuter.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            BoxOuter.BackgroundTransparency = 0.85
            BoxOuter.BorderSizePixel = 0
            BoxOuter.Parent = TextboxFrame

            local BoxInner = Instance.new("TextBox")
            BoxInner.Size = UDim2.new(1, -2, 1, -2)
            BoxInner.Position = UDim2.new(0, 1, 0, 1)
            BoxInner.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            BoxInner.BorderSizePixel = 0
            BoxInner.Font = Enum.Font.Code
            BoxInner.TextSize = 13
            BoxInner.Text = ""
            BoxInner.PlaceholderText = placeholder or ""
            BoxInner.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
            BoxInner.TextColor3 = Color3.fromRGB(180, 180, 180)
            BoxInner.TextXAlignment = Enum.TextXAlignment.Left
            BoxInner.TextTruncate = Enum.TextTruncate.AtEnd
            BoxInner.ClearTextOnFocus = false
            BoxInner.Parent = BoxOuter

            local InnerPadding = Instance.new("UIPadding")
            InnerPadding.PaddingLeft = UDim.new(0, 6)
            InnerPadding.Parent = BoxInner

            BoxInner.FocusLost:Connect(function(enterPressed)
                if callback then callback(BoxInner.Text, enterPressed) end
            end)
        end

        return SF
    end

    function Window:SetupWatermark(title)
        local lastFPS = 0
        local lastPing = 0
        local lastTime = "00:00:00"
        local showWatermark = true
        local showFPS = true
        local showPing = true
        local showTime = true

        local function UpdateWatermark()
            local parts = {title}
            
            if showFPS then
                table.insert(parts, "FPS: " .. lastFPS)
            end
            
            if showPing then
                table.insert(parts, "Ping: " .. lastPing .. "ms")
            end
            
            if showTime then
                table.insert(parts, "Time: " .. lastTime)
            end
            
            local text = table.concat(parts, " | ")
            self.WatermarkText.Text = text
            
            local textBounds = game:GetService("TextService"):GetTextSize(text, 13, Enum.Font.Code, Vector2.new(math.huge, 25))
            local newWidth = textBounds.X + 10
            self.Watermark.Size = UDim2.new(0, newWidth, 0, 25)
            self.Watermark.Position = UDim2.new(1, -newWidth - 10, 0, 10)
            
            self.Watermark.Visible = showWatermark
        end

        task.spawn(function()
            while true do
                lastFPS = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
                lastPing = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
                local time = os.date("*t")
                lastTime = string.format("%02d:%02d:%02d", time.hour, time.min, time.sec)
                task.wait()
            end
        end)

        game:GetService("RunService").Heartbeat:Connect(UpdateWatermark)

        return {
            SetShowWatermark = function(v) showWatermark = v end,
            SetShowFPS = function(v) showFPS = v end,
            SetShowPing = function(v) showPing = v end,
            SetShowTime = function(v) showTime = v end
        }
    end

    return Window
end

return Library
