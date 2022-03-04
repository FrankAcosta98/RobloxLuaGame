local btn=script.Parent
local cam =workspace.Camera
local RS=game:GetService("RunService")
local Players = game:GetService("Players")
local pass=true
local RepS=game:GetService("ReplicatedStorage")
local remote=RepS:WaitForChild('PlayBtn')
local activeCam=RepS:WaitForChild('ActivateCam')


remote.OnClientEvent:Connect(function()
	cam.CameraType = Enum.CameraType.Scriptable
	script.Parent.Parent.Parent.Enabled=false
	script.Disabled=true
	activeCam:Fire()
end)

