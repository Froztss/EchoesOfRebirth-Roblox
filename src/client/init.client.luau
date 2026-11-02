--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Config"))

print(string.format("[%s] Client started (v%s)", Config.GameName, Config.Version))
