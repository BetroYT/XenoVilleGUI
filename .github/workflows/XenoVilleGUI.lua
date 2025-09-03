-- -- Place this in StarterPlayerScripts or StarterGui as a LocalScript
-- local trolling = false
-- local RunService = game:GetService("RunService")
-- local Title = "Xenoville GUI"
-- local player = game:GetService("Players").LocalPlayer
-- local targetPosition = Vector3.new(-1480, -77.7, -11293) -- Default position
-- local basePosition = Vector3.new(-1581, -78.4, -11440) -- Base position
-- local autoTeleportEnabled = false
-- local wasRoadmapSelectorVisible = false
-- local wasRoadmapPromptVisible = false

-- -- Create the UI elements
-- local screenGui = Instance.new("ScreenGui")
-- screenGui.Name = "XenovilleGUI"
-- screenGui.Parent = player:WaitForChild("PlayerGui")

-- local frame = Instance.new("Frame")
-- frame.Size = UDim2.new(0, 0, 0, 0) -- Start with size 0 for opening animation
-- frame.Position = UDim2.new(0.5, -125, 0.5, -90)
-- frame.AnchorPoint = Vector2.new(0.5, 0.5)
-- frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
-- frame.BorderSizePixel = 0
-- frame.Parent = screenGui

-- -- Opening animation
-- game:GetService("TweenService"):Create(
--     frame,
--     TweenInfo.new(0.3),
--     {Size = UDim2.new(0, 250, 0, 200)}
-- ):Play()

-- -- Title Bar with close button
-- local titleBar = Instance.new("Frame")
-- titleBar.Size = UDim2.new(1, 0, 0.15, 0)
-- titleBar.BackgroundTransparency = 1
-- titleBar.Parent = frame

-- local titleLabel = Instance.new("TextLabel")
-- titleLabel.Size = UDim2.new(0.8, 0, 1, 0)
-- titleLabel.Text = Title
-- titleLabel.TextColor3 = Color3.new(1, 1, 1)
-- titleLabel.BackgroundTransparency = 1
-- titleLabel.Font = Enum.Font.GothamBold
-- titleLabel.TextScaled = true
-- titleLabel.TextXAlignment = Enum.TextXAlignment.Left
-- titleLabel.Parent = titleBar

-- local closeButton = Instance.new("TextButton")
-- closeButton.Size = UDim2.new(0.15, 0, 0.7, 0)
-- closeButton.Position = UDim2.new(0.85, 0, 0.15, 0)
-- closeButton.Text = "X"
-- closeButton.TextColor3 = Color3.new(1, 1, 1)
-- closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
-- closeButton.AutoButtonColor = false
-- closeButton.Font = Enum.Font.GothamBold
-- closeButton.TextScaled = true
-- closeButton.Parent = titleBar

-- -- Status labels container
-- local statusContainer = Instance.new("Frame")
-- statusContainer.Size = UDim2.new(1, -20, 0.2, 0)
-- statusContainer.Position = UDim2.new(0, 10, 0.15, 0)
-- statusContainer.BackgroundTransparency = 1
-- statusContainer.Parent = frame

-- -- RoadmapPrompt status label
-- local roadmapPromptLabel = Instance.new("TextLabel")
-- roadmapPromptLabel.Size = UDim2.new(1, 0, 0.45, 0)
-- roadmapPromptLabel.Text = "RoadmapPrompt: Checking..."
-- roadmapPromptLabel.TextColor3 = Color3.new(1, 1, 1)
-- roadmapPromptLabel.BackgroundTransparency = 1
-- roadmapPromptLabel.Font = Enum.Font.Gotham
-- roadmapPromptLabel.TextScaled = true
-- roadmapPromptLabel.TextXAlignment = Enum.TextXAlignment.Left
-- roadmapPromptLabel.Parent = statusContainer

-- -- RoadmapSelector status label
-- local roadmapSelectorLabel = Instance.new("TextLabel")
-- roadmapSelectorLabel.Size = UDim2.new(1, 0, 0.45, 0)
-- roadmapSelectorLabel.Position = UDim2.new(0, 0, 0.55, 0)
-- roadmapSelectorLabel.Text = "RoadmapSelector: Checking..."
-- roadmapSelectorLabel.TextColor3 = Color3.new(1, 1, 1)
-- roadmapSelectorLabel.BackgroundTransparency = 1
-- roadmapSelectorLabel.Font = Enum.Font.Gotham
-- roadmapSelectorLabel.TextScaled = true
-- roadmapSelectorLabel.TextXAlignment = Enum.TextXAlignment.Left
-- roadmapSelectorLabel.Parent = statusContainer

-- -- Button container
-- local buttonContainer = Instance.new("Frame")
-- buttonContainer.Size = UDim2.new(1, -20, 0.65, 0)
-- buttonContainer.Position = UDim2.new(0, 10, 0.35, 0)
-- buttonContainer.BackgroundTransparency = 1
-- buttonContainer.Parent = frame

-- -- Button template function
-- local function createButton(name, position, size, color, text)
--     local button = Instance.new("TextButton")
--     button.Name = name
--     button.Size = size
--     button.Position = position
--     button.Text = text
--     button.TextColor3 = Color3.new(1, 1, 1)
--     button.BackgroundColor3 = color
--     button.AutoButtonColor = false
--     button.Font = Enum.Font.GothamBold
--     button.TextScaled = true
--     button.Parent = buttonContainer
--     return button
-- end

-- -- Create buttons
-- local teleportButton = createButton(
--     "TeleportButton",
--     UDim2.new(0, 0, 0, 0),
--     UDim2.new(0.45, 0, 0.3, 0),
--     Color3.fromRGB(0, 90, 180),
--     "TELEPORT"
-- )

-- local saveButton = createButton(
--     "SaveButton",
--     UDim2.new(0.55, 0, 0, 0),
--     UDim2.new(0.45, 0, 0.3, 0),
--     Color3.fromRGB(40, 140, 40),
--     "SAVE LOCATION"
-- )

-- local baseButton = createButton(
--     "BaseButton",
--     UDim2.new(0, 0, 0.35, 0),
--     UDim2.new(0.45, 0, 0.3, 0),
--     Color3.fromRGB(120, 60, 180),
--     "BASE"
-- )

-- local autoTeleportButton = createButton(
--     "AutoTeleportButton",
--     UDim2.new(0.55, 0, 0.35, 0),
--     UDim2.new(0.45, 0, 0.3, 0),
--     Color3.fromRGB(180, 120, 40),
--     "AUTO: OFF"
-- )

-- -- Button hover effects
-- local function buttonHoverEffect(button, hoverColor)
--     local originalColor = button.BackgroundColor3
    
--     button.MouseEnter:Connect(function()
--         game:GetService("TweenService"):Create(
--             button,
--             TweenInfo.new(0.2),
--             {BackgroundColor3 = hoverColor}
--         ):Play()
--     end)
    
--     button.MouseLeave:Connect(function()
--         game:GetService("TweenService"):Create(
--             button,
--             TweenInfo.new(0.2),
--             {BackgroundColor3 = originalColor}
--         ):Play()
--     end)
-- end

-- -- Apply hover effects
-- buttonHoverEffect(teleportButton, Color3.fromRGB(0, 120, 215))
-- buttonHoverEffect(saveButton, Color3.fromRGB(60, 180, 60))
-- buttonHoverEffect(baseButton, Color3.fromRGB(150, 80, 200))
-- buttonHoverEffect(autoTeleportButton, Color3.fromRGB(200, 150, 60))
-- buttonHoverEffect(closeButton, Color3.fromRGB(220, 80, 80))

-- -- Teleport function
-- local function teleportPlayer(position)
--     local character = player.Character
--     if character then
--         local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
--         if humanoidRootPart then
--             -- Check if we need to load the destination area first
--             local canTeleport = pcall(function()
--                 humanoidRootPart.CFrame = CFrame.new(position)
--             end)
            
--             if not canTeleport then
--                 -- If direct teleport fails, try using the loading method
--                 player:RequestStreamAroundAsync(position)
--                 wait(2) -- Give time for the area to load
--                 humanoidRootPart.CFrame = CFrame.new(position)
--             end
--         end
--     end
-- end

-- -- Save current position function
-- local function saveCurrentPosition()
--     local character = player.Character
--     if character then
--         local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
--         if humanoidRootPart then
--             targetPosition = humanoidRootPart.Position
            
--             -- Button feedback
--             local originalText = saveButton.Text
--             saveButton.Text = "LOCATION SAVED!"
            
--             -- Change button color temporarily
--             game:GetService("TweenService"):Create(
--                 saveButton,
--                 TweenInfo.new(0.2),
--                 {BackgroundColor3 = Color3.fromRGB(80, 200, 80)}
--             ):Play()
            
--             -- Return to original after 1 second
--             wait(1)
            
--             saveButton.Text = originalText
--             game:GetService("TweenService"):Create(
--                 saveButton,
--                 TweenInfo.new(0.2),
--                 {BackgroundColor3 = Color3.fromRGB(40, 140, 40)}
--             ):Play()
--         end
--     end
-- end

-- -- Function to check UI visibility
-- local function checkUIVisibility()
--     local playerGui = player:WaitForChild("PlayerGui")
    
--     -- Check RoadmapPrompt
--     local promptPath = playerGui:FindFirstChild("UI") and playerGui.UI:FindFirstChild("Uni") 
--         and playerGui.UI.Uni:FindFirstChild("Interfaces") 
--         and playerGui.UI.Uni.Interfaces:FindFirstChild("RoadmapPrompt")
		
    
--     local isPromptVisible = false
--     if promptPath then
--         isPromptVisible = promptPath.Visible
--         roadmapPromptLabel.Text = "RoadmapPrompt: " .. (isPromptVisible and "VISIBLE" or "HIDDEN")
--         roadmapPromptLabel.TextColor3 = isPromptVisible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
--     else
--         roadmapPromptLabel.Text = "RoadmapPrompt: NOT FOUND"
--         roadmapPromptLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
--     end
    
--     -- Check RoadmapSelector
--     local selectorPath = playerGui:FindFirstChild("UI") and playerGui.UI:FindFirstChild("Uni") 
--         and playerGui.UI.Uni:FindFirstChild("Interfaces") 
--         and playerGui.UI.Uni.Interfaces:FindFirstChild("RoadmapSelector")
    
--     local isSelectorVisible = false
--     if selectorPath then
--         isSelectorVisible = selectorPath.Visible
--         roadmapSelectorLabel.Text = "RoadmapSelector: " .. (isSelectorVisible and "VISIBLE" or "HIDDEN")
--         roadmapSelectorLabel.TextColor3 = isSelectorVisible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
--     else
--         roadmapSelectorLabel.Text = "RoadmapSelector: NOT FOUND"
--         roadmapSelectorLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
--     end
    
--     -- Handle auto teleport logic
--     if autoTeleportEnabled then
--         -- Check for RoadmapSelector becoming not visible after being visible
-- 		if wasRoadmapPromptVisible then
-- 			promptPath.Position = UDim2.new(0.625, 0, 0.78, 0)
-- 		end
--         if wasRoadmapSelectorVisible and not isSelectorVisible then
--             teleportPlayer(targetPosition)
--         end
        
--         -- Check for RoadmapPrompt becoming not visible after being visible
--         if wasRoadmapPromptVisible and not isPromptVisible then
--             teleportPlayer(basePosition)
--         end
--     else
-- 		promptPath.Position = UDim2.new(0.5, 0, 0.939999998, 0)
-- 	end
	
-- 	-- troll
-- 	--if trolling then
-- 	--	teleportPlayer(targetPosition)
-- 	--	trolling = false
-- 	--else
-- 	--	teleportPlayer(basePosition)
-- 	--	trolling = true
-- 	--end
    
--     -- Update previous states
--     wasRoadmapSelectorVisible = isSelectorVisible
--     wasRoadmapPromptVisible = isPromptVisible
-- end

-- -- Toggle auto teleport function
-- local function toggleAutoTeleport()
--     autoTeleportEnabled = not autoTeleportEnabled
    
--     if autoTeleportEnabled then
-- 		if promptPath then
-- 			-- Set the position of RoadmapPrompt
-- 			return true
-- 		end
--         autoTeleportButton.Text = "AUTO: ON"
--         game:GetService("TweenService"):Create(
--             autoTeleportButton,
--             TweenInfo.new(0.2),
--             {BackgroundColor3 = Color3.fromRGB(60, 200, 60)}
--         ):Play()
--     else
-- 		if promptPath then
-- 			-- Set the position of RoadmapPrompt
-- 			return true
-- 		end
--         autoTeleportButton.Text = "AUTO: OFF"
--         game:GetService("TweenService"):Create(
--             autoTeleportButton,
--             TweenInfo.new(0.2),
--             {BackgroundColor3 = Color3.fromRGB(180, 120, 40)}
--         ):Play()
--     end
-- end

-- -- Close GUI function
-- local function closeGUI()
--     game:GetService("TweenService"):Create(
--         frame,
--         TweenInfo.new(0.3),
--         {Size = UDim2.new(0, 0, 0, 0)}
--     ):Play()
--     wait(0.3)
--     screenGui:Destroy()
-- end

-- -- Connect the buttons
-- teleportButton.MouseButton1Click:Connect(function()
--     teleportPlayer(targetPosition)
-- end)

-- saveButton.MouseButton1Click:Connect(saveCurrentPosition)

-- baseButton.MouseButton1Click:Connect(function()
--     teleportPlayer(basePosition)
-- end)

-- autoTeleportButton.MouseButton1Click:Connect(toggleAutoTeleport)

-- closeButton.MouseButton1Click:Connect(closeGUI)

-- -- Make the UI draggable
-- local UserInputService = game:GetService("UserInputService")
-- local dragging
-- local dragInput
-- local dragStart
-- local startPos

-- local function update(input)
--     local delta = input.Position - dragStart
--     frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
-- end

-- titleBar.InputBegan:Connect(function(input)
--     if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
--         dragging = true
--         dragStart = input.Position
--         startPos = frame.Position
        
--         input.Changed:Connect(function()
--             if input.UserInputState == Enum.UserInputState.End then
--                 dragging = false
--             end
--         end)
--     end
-- end)

-- titleBar.InputChanged:Connect(function(input)
--     if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
--         dragInput = input
--     end
-- end)

-- UserInputService.InputChanged:Connect(function(input)
--     if input == dragInput and dragging then
--         update(input)
--     end
-- end)

-- -- Continuously check UI visibility
-- RunService.Heartbeat:Connect(function(deltaTime)
-- 	checkUIVisibility()
-- end)

-- --while true do
-- --    checkUIVisibility()
-- --    wait(0.5) -- Check more frequently for responsiveness
-- --end
