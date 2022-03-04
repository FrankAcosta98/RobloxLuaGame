local btn=script.Parent
btn.Visible=false
local cam =workspace.Camera
local RS=game:GetService("RunService")
local Players = game:GetService("Players")
local pass=true
local RepS=game:GetService("ReplicatedStorage")
local remote=RepS:WaitForChild('PlayBtn')
local activeCam=RepS:WaitForChild('ActivateCam')

RS.Stepped:Connect(function()
	if pass then
		local Players = game.Players:GetPlayers()
		local num=#Players
		if num>=2 then
			btn.Visible=true
			pass=false
		end
	end

end)

btn.MouseButton1Click:Connect(function()
	remote:FireAllClients()
end)
