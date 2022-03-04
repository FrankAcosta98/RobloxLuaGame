local RpS=game:GetService("ReplicatedStorage")
local remote=RpS:WaitForChild("CoolDown")
local bar=script.Parent

local function OnEvent(cool)--58
	bar.Size=UDim2.fromOffset(2,(cool*58)/5)
end

remote.Event:Connect(OnEvent)
