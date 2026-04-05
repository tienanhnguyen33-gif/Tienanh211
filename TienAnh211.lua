local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local speed = 50
local flying = false
local bodyVelocity

local function startFlying()
    flying = true
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Parent = humanoidRootPart
    
    while flying and bodyVelocity and bodyVelocity.Parent do
        bodyVelocity.Velocity = humanoidRootPart.CFrame.LookVector * speed
        wait(0.1)
    end
end

local function stopFlying()
    flying = false
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
end

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        if flying then
            stopFlying()
        else
            startFlying()
        end
    elseif input.KeyCode == Enum.KeyCode.Plus or input.KeyCode == Enum.KeyCode.Equals then
        speed = math.min(speed + 10, 500)
        print("🚀 Speed: " .. speed)
    elseif input.KeyCode == Enum.KeyCode.Minus then
        speed = math.max(speed - 10, 10)
        print("⬇️ Speed: " .. speed)
    end
end)
