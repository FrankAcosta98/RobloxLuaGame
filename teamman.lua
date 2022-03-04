local RepS=game:GetService("ReplicatedStorage")
local remote=RepS:WaitForChild('ActivateCam')
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

remote.Event:Connect(function()
	RS:BindToRenderStep("MouseLock",Enum.RenderPriority.Last.Value+1,function()
		UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
		UIS. MouseIconEnabled = false
	end)

end)
