--Variables--
local Brick = script.Parent

local vx=0
local vy=0
local RS = game:GetService("RunService")
local g=3
--Code--
local function PlayerTouched(Part)
	Brick.Velocity=Vector3.zero
	local boom = Brick:GetChildren()[2]
	wait(0.05)
	boom:Play()
	Brick.Size=Vector3.new(5,5,5)
	local Parent = Part.Parent
	if game.Players:GetPlayerFromCharacter(Parent) then
		Parent.Humanoid.Health = 0
	end
	wait(0.5)
	Brick:Destroy()
end
RS.Heartbeat:Connect(function(step)
	vx=Brick.Velocity.X
	vy=Brick.Velocity.Y
	Brick.Velocity=Vector3.new(vx,vy-g*step,0)
end)

Brick.Touched:connect(PlayerTouched)