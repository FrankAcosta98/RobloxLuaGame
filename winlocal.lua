local r=0
local b=0
local players=game:GetService("Players")
players.CharacterAutoLoads=false
local localPlayer=players.LocalPlayer
local Resp=game:GetService("ReplicatedStorage")
local remote=Resp:WaitForChild("ded")

game.Players.PlayerAdded:Connect(function(player)

	for i,pl in ipairs(game.Teams["Red Team"]) do
		r+=1
	end
	for i,pl in ipairs(game.Teams["Blue Team"]) do
		b+=1
	end
	if r+b>2 then
		game.StarterGui:FindFirstChild("teams"):FindFirstChild("Frame"):FindFirstChild("play").Visible=true
	end	
end)

localPlayer.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid")
	humanoid.Died:Connect(function()
		remote:Fire()
	end)

end)




remote.Event:Connect(function()
	if localPlayer.Team==game:GetService("Teams")['Blue Team'] then
		b-=1
	end
	if localPlayer.Team==game:GetService("Teams")['Red Team'] then
		r-=1
	end
	if r<=0 then
		if players.LocalPlayer.Team==game:GetService("Teams")['Blue Team'] then
			script.Parent.win.Visible=true
		else
			script.Parent.lose.Visible=true
		end
	elseif b<=0 then
		if players.LocalPlayer.Team==game:GetService("Teams")['Red Team'] then
			script.Parent.win.Visible=true
		else
			script.Parent.lose.Visible=true
		end
	end
end)
