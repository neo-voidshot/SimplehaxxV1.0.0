-- // GUI TO LUA \\ --

-- // INSTANCES: 11 | SCRIPTS: 1 | MODULES: 0 \\ --

local UI = {}

-- // StarterGui.SimpleHaxx \\ --
UI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["1"]["Name"] = [[SimpleHaxx]]
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

-- // StarterGui.SimpleHaxx.Frame \\ --
UI["2"] = Instance.new("Frame", UI["1"])
UI["2"]["BorderSizePixel"] = 0
UI["2"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25)
UI["2"]["Size"] = UDim2.new(0, 337, 0, 213)
UI["2"]["Position"] = UDim2.new(0.06569, 0, 0.69146, 0)
UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

-- // StarterGui.SimpleHaxx.Frame.UICorner \\ --
UI["3"] = Instance.new("UICorner", UI["2"])


-- // StarterGui.SimpleHaxx.Frame.WalkspeedBox \\ --
UI["4"] = Instance.new("TextBox", UI["2"])
UI["4"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["4"]["PlaceholderColor3"] = Color3.fromRGB(179, 179, 179)
UI["4"]["BorderSizePixel"] = 0
UI["4"]["TextSize"] = 14
UI["4"]["Name"] = [[WalkspeedBox]]
UI["4"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54)
UI["4"]["FontFace"] = Font.new([[rbxassetid://12187365364]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["4"]["PlaceholderText"] = [[Insert desired walkspeed]]
UI["4"]["Size"] = UDim2.new(0, 317, 0, 27)
UI["4"]["Position"] = UDim2.new(0.02967, 0, 0.83747, 0)
UI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["4"]["Text"] = [[]]

-- // StarterGui.SimpleHaxx.Frame.WalkspeedBox.UICorner \\ --
UI["5"] = Instance.new("UICorner", UI["4"])
UI["5"]["CornerRadius"] = UDim.new(0, 3)

-- // StarterGui.SimpleHaxx.Frame.WalkspeedBox.UIStroke \\ --
UI["6"] = Instance.new("UIStroke", UI["4"])
UI["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["6"]["Color"] = Color3.fromRGB(255, 255, 255)

-- // StarterGui.SimpleHaxx.Frame.WalkspeedBox.Walkspeed input \\ --
UI["7"] = Instance.new("LocalScript", UI["4"])
UI["7"]["Name"] = [[Walkspeed input]]

-- // StarterGui.SimpleHaxx.Frame.UIStroke \\ --
UI["8"] = Instance.new("UIStroke", UI["2"])
UI["8"]["Color"] = Color3.fromRGB(255, 255, 255)

-- // StarterGui.SimpleHaxx.Frame.namelabel \\ --
UI["9"] = Instance.new("TextLabel", UI["2"])
UI["9"]["BorderSizePixel"] = 0
UI["9"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23)
UI["9"]["TextSize"] = 14
UI["9"]["FontFace"] = Font.new([[rbxassetid://12187365364]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
UI["9"]["TextColor3"] = Color3.fromRGB(63, 63, 63)
UI["9"]["Size"] = UDim2.new(0, 125, 0, 33)
UI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["9"]["Text"] = [[Simplehaxx]]
UI["9"]["Name"] = [[namelabel]]
UI["9"]["Position"] = UDim2.new(0, 0, -0.1575, 0)

-- // StarterGui.SimpleHaxx.Frame.namelabel.UICorner \\ --
UI["a"] = Instance.new("UICorner", UI["9"])
UI["a"]["CornerRadius"] = UDim.new(0, 3)

-- // StarterGui.SimpleHaxx.Frame.namelabel.UIStroke \\ --
UI["b"] = Instance.new("UIStroke", UI["9"])
UI["b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
UI["b"]["Color"] = Color3.fromRGB(255, 255, 255)

-- // StarterGui.SimpleHaxx.Frame.WalkspeedBox.Walkspeed input \\ --
local function SCRIPT_7()
local script = UI["7"]
	local Players = game:GetService("Players")
	local TextBox = script.Parent
	
	local function updateWalkspeed(player, speed)
	    local character = player.Character or player.CharacterAdded:Wait()
	    if character and character:FindFirstChild("Humanoid") then
	        character.Humanoid.WalkSpeed = speed
	    end
	end
	
	TextBox.FocusLost:Connect(function(enterPressed)
	    if enterPressed then
	        local speed = tonumber(TextBox.Text)
	        if speed then
	            for _, player in Players:GetPlayers() do
	                updateWalkspeed(player, speed)
	            end
	        end
	    end
	end)
	
	Players.PlayerAdded:Connect(function(player)
	    player.CharacterAdded:Connect(function(character)
	        local speed = tonumber(TextBox.Text)
	        if speed then
	            updateWalkspeed(player, speed)
	        end
	    end)
	end)
	
	for _, player in Players:GetPlayers() do
	    player.CharacterAdded:Connect(function(character)
	        local speed = tonumber(TextBox.Text)
	        if speed then
	            updateWalkspeed(player, speed)
	        end
	    end)
	end
end
task.spawn(SCRIPT_7)

return UI["1"], require;

local Frame1 = _G.Main:New("Test")

Frame1:Button("Text Button 1",function()
	print("Hello")
end)

Frame1:Button("Text Button 2",function()
	print("Hello 2")
end)

--End

return _G.Main
