local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")

local camera = game.Workspace.Camera

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		if humanoid then
			humanoid.WalkSpeed = 30 -------------------Set Run Speed
		end
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = 17 ---------------------Set Walk Speed
	end
end)

RunService.RenderStepped:Connect(function()
	if humanoid then
		if humanoid.MoveDirection.Magnitude > 0 then
			local headBobY = math.sin(tick() * 10) * .2

			if humanoid.WalkSpeed == 17 then --------------------------------------Match to Walk Speed
				headBobY = math.sin(tick() * 10) * .2
			elseif humanoid.WalkSpeed == 30 then --------------------------------------Match to Run Speed
				headBobY = math.sin(tick() * 18) * .3
			end

			local bob = Vector3.new(0, headBobY, 0)

			humanoid.CameraOffset = humanoid.CameraOffset:Lerp(bob, .1)

		else
			humanoid.CameraOffset = humanoid.CameraOffset:Lerp(Vector3.new(), .1)
		end
	end
end)

-------------------------------------------- Change Walk Speed to match you desired Walk Speed in Starter Player Propertise