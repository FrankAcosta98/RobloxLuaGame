local r=0
local b=0
game:GetService("Players").CharacterAutoLoads=false
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
	player.CharacterAdded:Connect(function(char)
		char:WaitForChild("humanoid").Died:Connect(function()
			if r<=0 then
				if player.Team==game:GetService("Teams")['Blue Team'] then
					script.Parent.win.Visible=true
				else
					script.Parent.lose.Visible=true
				end
			elseif b<=0 then
				if player.Team==game:GetService("Teams")['Red Team'] then
					script.Parent.win.Visible=true
				else
					script.Parent.lose.Visible=true
				end
			end
		end)
	end)
end)