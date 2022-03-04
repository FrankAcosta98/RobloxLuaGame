local Players = game:GetService("Players")
local Teams = game:GetService("Teams")


local teamSpectators = Teams.Spectating
-- Command to play the game


local function onPlayerDied(player, character)
	-- When someone dies, put them on the spectator team
	player.Team = teamSpectators
end

local function onPlayerSpawned(player, character)
	local human = character:WaitForChild("Humanoid")
	human.Died:Connect(function () onPlayerDied(player, character) end)
end


local function onPlayerAdded(player)
	-- Listen for this player spawning
	if player.Character then
		onPlayerSpawned(player, player.Character)
	end
	player.CharacterAdded:Connect(function ()
		onPlayerSpawned(player, player.Character)
	end)
end

-- Listen for players being added
for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)