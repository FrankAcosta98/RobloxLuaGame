local RS = game:GetService("RunService")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer
local left=false
local right=false



UIS.InputEnded:Connect(function(inputObject,gameProcessed)
	if gameProcessed then return end
	if inputObject.KeyCode == Enum.KeyCode.D or inputObject.KeyCode==Enum.KeyCode.Right then 
		right=false
		localPlayer:Move(Vector3.new(0, 0, 0), true)
	elseif inputObject.KeyCode == Enum.KeyCode.A or inputObject.KeyCode==Enum.KeyCode.Left then 
		left=false
		localPlayer:Move(Vector3.new(0, 0, 0), true)
	end
end)


local function Left()
	localPlayer:Move(Vector3.new(-1, 0, 0), true)
end
local function Right()
	localPlayer:Move(Vector3.new(1, 0, 0), true)
end


UIS.InputBegan:connect(function(inputObject, gameProcessed)
	if gameProcessed then return end
	if inputObject.KeyCode == Enum.KeyCode.D or inputObject.KeyCode==Enum.KeyCode.Right then 
		right=true
	elseif inputObject.KeyCode == Enum.KeyCode.A or inputObject.KeyCode==Enum.KeyCode.Left then 
		left=true
	end
end)


RS.Stepped:Connect(function()
	if left then
		Left()
	elseif right then
		Right()
	end
	end)
	
