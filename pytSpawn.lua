local RepS=game:GetService("ReplicatedStorage")
local remote=RepS:WaitForChild('ShotEvent')
local SS=game:GetService("ServerStorage")
remote.onServerEvent:Connect(function(player,pos,aim)
	local rocket=Instance.new('Part')
	rocket.Name='proyectile'
	rocket.Parent=game.Workspace
	--rocket.Position =pos
	rocket.Shape=Enum.PartType.Ball
	rocket.BrickColor=BrickColor.new("Neon orange")
	rocket.Material="Neon"
	rocket.Size=Vector3.new(0.5,0.5,0.5)
	local kill=script:GetChildren()[1]:Clone()
	local boom=script:GetChildren()[2]:Clone()
	kill.Parent=rocket
	boom.Parent=rocket
	--+++++++
	local dis=(aim-pos).magnitude
	local spd=165
	rocket.CFrame=CFrame.new(pos,aim)
	rocket.Velocity=rocket.CFrame.LookVector*spd
	wait(0.2)
	kill.Disabled=false
	--+++++++
end)