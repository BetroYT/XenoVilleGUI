-- Place this in StarterPlayerScripts or StarterGui as a LocalScript
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local targetPosition = Vector3.new(-1480, -77.7, -11293) -- Default position
local basePosition = Vector3.new(-1581, -78.4, -11440) -- Base position

-- Create the teleport GUI
local teleportGui = Instance.new("ScreenGui")
teleportGui.Name = "TestingTeleportGUI"
teleportGui.ResetOnSpawn = false
teleportGui.Parent = player:WaitForChild("PlayerGui")

-- Main frame (moveable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150) -- Increased height for new button
mainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = teleportGui

-- Title bar for dragging
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.Text = "XenoVille GUI"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 14
titleBar.Active = true
titleBar.Parent = mainFrame

-- Coordinates display
local coordsLabel = Instance.new("TextLabel")
coordsLabel.Size = UDim2.new(1, -10, 0, 30)
coordsLabel.Position = UDim2.new(0, 5, 0, 25)
coordsLabel.BackgroundTransparency = 1
coordsLabel.Text = "Coordinates: (0, 0, 0)"
coordsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
coordsLabel.Font = Enum.Font.Gotham
coordsLabel.TextSize = 14
coordsLabel.TextXAlignment = Enum.TextXAlignment.Left
coordsLabel.Parent = mainFrame

-- Button container (now with 2 rows)
local buttonContainer = Instance.new("Frame")
buttonContainer.Size = UDim2.new(1, -10, 0, 80) -- Taller for two rows
buttonContainer.Position = UDim2.new(0, 5, 1, -85)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = mainFrame

-- First row of buttons
local firstRow = Instance.new("Frame")
firstRow.Size = UDim2.new(1, 0, 0, 35)
firstRow.Position = UDim2.new(0, 0, 0, 0)
firstRow.BackgroundTransparency = 1
firstRow.Parent = buttonContainer

-- Teleport button
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0.45, 0, 1, 0)
teleportButton.Position = UDim2.new(0, 0, 0, 0)
teleportButton.Text = "TELEPORT"
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.Font = Enum.Font.GothamBold
teleportButton.TextSize = 14
teleportButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
teleportButton.Parent = firstRow

-- Set Location button
local setLocationButton = Instance.new("TextButton")
setLocationButton.Size = UDim2.new(0.45, 0, 1, 0)
setLocationButton.Position = UDim2.new(0.55, 0, 0, 0)
setLocationButton.Text = "SET LOC"
setLocationButton.TextColor3 = Color3.fromRGB(255, 255, 255)
setLocationButton.Font = Enum.Font.GothamBold
setLocationButton.TextSize = 14
setLocationButton.BackgroundColor3 = Color3.fromRGB(60, 60, 120)
setLocationButton.Parent = firstRow

-- Second row of buttons
local secondRow = Instance.new("Frame")
secondRow.Size = UDim2.new(1, 0, 0, 35)
secondRow.Position = UDim2.new(0, 0, 1, -35)
secondRow.BackgroundTransparency = 1
secondRow.Parent = buttonContainer

-- Base button
local baseButton = Instance.new("TextButton")
baseButton.Size = UDim2.new(0.9, 0, 1, 0)
baseButton.Position = UDim2.new(0.05, 0, 0, 0)
baseButton.Text = "BASE"
baseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
baseButton.Font = Enum.Font.GothamBold
baseButton.TextSize = 14
baseButton.BackgroundColor3 = Color3.fromRGB(120, 60, 60) -- Reddish color
baseButton.Parent = secondRow

-- Make window draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        update(input)
    end
end)

-- Update coordinates
local function updateCoordinates()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local position = player.Character.HumanoidRootPart.Position
        coordsLabel.Text = string.format("(%.1f, %.1f, %.1f)", position.X, position.Y, position.Z)
    else
        coordsLabel.Text = "(No character)"
    end
end

-- Set new location
local function setNewLocation()
    if not player.Character then return end
    
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    targetPosition = rootPart.Position
    
    -- Visual feedback
    local originalText = setLocationButton.Text
    setLocationButton.Text = "SAVED!"
    task.wait(0.5)
    setLocationButton.Text = originalText
end

-- Teleport function (generic)
local function teleportTo(position)
    if not player.Character then return false end
    
    local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return false end
    
    -- Disable all buttons during teleport
    teleportButton.Active = false
    setLocationButton.Active = false
    baseButton.Active = false
    
    -- Fade effect
    local tween = TweenService:Create(
        teleportButton,
        TweenInfo.new(0.3),
        {BackgroundTransparency = 0.7, TextTransparency = 0.7}
    )
    tween:Play()
    
    -- Teleport
    rootPart.CFrame = CFrame.new(position)
    task.wait(0.3)
    
    -- Reset buttons
    teleportButton.Active = true
    setLocationButton.Active = true
    baseButton.Active = true
    tween:Destroy()
    
    -- Update coordinates
    updateCoordinates()
    return true
end

-- Connect buttons
teleportButton.MouseButton1Click:Connect(function()
    teleportButton.Text = "TELEPORTING..."
    teleportTo(targetPosition)
    teleportButton.Text = "TELEPORT"
end)

setLocationButton.MouseButton1Click:Connect(setNewLocation)

baseButton.MouseButton1Click:Connect(function()
    baseButton.Text = "GOING TO BASE..."
    teleportTo(basePosition)
    baseButton.Text = "BASE"
end)

-- Update coordinates continuously
RunService.Heartbeat:Connect(updateCoordinates)

-- Initial update
updateCoordinates()
