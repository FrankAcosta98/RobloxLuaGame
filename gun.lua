local launch = script.Parent
local sound = launch.Handle['sound']
local UIS = game:GetService("UserInputService")
local RepS=game:GetService("ReplicatedStorage")
local remote=RepS:WaitForChild("ShotEvent")
local can =true
local cool=0
local maxCool=5
local delta=game:GetService("RunService")
local cooldown = RepS:WaitForChild("CoolDown")


launch.Equipped:Connect(function(mouse)
	
	UIS.InputBegan:Connect(function(inputObject, gameProcessed)
		if gameProcessed then return end
		if can and (inputObject.KeyCode == Enum.KeyCode.Return or inputObject.KeyCode==Enum.KeyCode.Space) then
			remote:FireServer(launch.Handle.Position,mouse.Hit.p)
			sound:Play()
			can=false
		end
	end)
end)

delta.Heartbeat:Connect(function(step)
	if can==false and cool<=maxCool then
		cool+=step
		cooldown:Fire(cool)
	elseif cool>=maxCool then
			can=true
			cool=0
	end
end)