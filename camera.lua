local cam=workspace.CurrentCamera
local up = false
local down = false
local players=game:GetService("Players")
local localPlayer=players.LocalPlayer
local cameraOffset = Vector3.new(0, 1.5, -1)
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local ang=0

cam.CameraType = Enum.CameraType.Scriptable


UIS.InputEnded:Connect(function(inputObject, gameProcessed)
	if gameProcessed then return end
	if inputObject.KeyCode == Enum.KeyCode.Up or inputObject.KeyCode==Enum.KeyCode.W then
		up = false
	elseif inputObject.KeyCode == Enum.KeyCode.Down or inputObject.KeyCode==Enum.KeyCode.S then
		down = false
	end
end)


local function lookup()
	ang+=2
	--wait(5)
end

local function lookdown()
	ang-=2
	--wait(5)
end	


UIS.InputBegan:Connect(function(inputObject, gameProcessed)
	if gameProcessed then return end
	if inputObject.KeyCode == Enum.KeyCode.Up or inputObject.KeyCode==Enum.KeyCode.W then
		up = true
	elseif inputObject.KeyCode == Enum.KeyCode.Down or inputObject.KeyCode==Enum.KeyCode.S then
		down = true
	end
end)


localPlayer.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid")
	local rootPart = char:WaitForChild("Head")
	humanoid.AutoRotate = false

	RS.RenderStepped:Connect(function()
		local startCFrame
		if localPlayer.Team==game:GetService("Teams")['Blue Team'] then
			startCFrame = CFrame.new((rootPart.CFrame.Position)) * CFrame.Angles(0, math.rad(270), 0) * CFrame.Angles(math.rad(math.clamp(ang,-80,79)), 0, 0)
		elseif localPlayer.Team==game:GetService("Teams")['Red Team'] then
			startCFrame = CFrame.new((rootPart.CFrame.Position)) * CFrame.Angles(0, math.rad(-270), 0) * CFrame.Angles(math.rad(math.clamp(ang,-80,79)), 0, 0)
		end
		local cameraCFrame = startCFrame:ToWorldSpace(CFrame.new(cameraOffset.X, cameraOffset.Y, cameraOffset.Z))
		local cameraFocus = startCFrame:ToWorldSpace(CFrame.new(cameraOffset.X, cameraOffset.Y, -10000))
		cam.CFrame = CFrame.new(cameraCFrame.Position, cameraFocus.Position)
		if down then
			lookdown()
		elseif up then
			lookup()
		end
	end)
end)