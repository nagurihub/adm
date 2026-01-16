local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui")
gui.Name = "VythenDualLoader"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if gethui then
	gui.Parent = gethui()
elseif syn and syn.protect_gui then
	syn.protect_gui(gui)
	gui.Parent = CoreGui
else
	gui.Parent = CoreGui
end

local main = Instance.new("Frame", gui)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.Size = UDim2.new(0, 380, 0, 230)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.BorderSizePixel = 0

Instance.new("UICorner", main).CornerRadius = UDim.new(0,8)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(60,60,60)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,35)
title.Position = UDim2.new(0,0,0.08,0)
title.BackgroundTransparency = 1
title.Text = "VYTHEN HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(255,255,255)

local subtitle = Instance.new("TextLabel", main)
subtitle.Size = UDim2.new(1,0,0,20)
subtitle.Position = UDim2.new(0,0,0.27,0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Choose Game Loader"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 14
subtitle.TextColor3 = Color3.fromRGB(150,150,150)

local function createButton(text, posY)
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0,300,0,45)
	btn.Position = UDim2.new(0.5,0,posY,0)
	btn.AnchorPoint = Vector2.new(0.5,0)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.TextColor3 = Color3.fromRGB(255,255,255)
	btn.AutoButtonColor = false

	Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
	local s = Instance.new("UIStroke", btn)
	s.Color = Color3.fromRGB(80,80,80)

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50,50,50)}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40,40,40)}):Play()
	end)

	return btn
end

local adoptBtn = createButton("LOAD ADOPT ME SCRIPT", 0.48)
local mm2Btn   = createButton("LOAD MM2 SCRIPT", 0.70)

local function closeUI()
	local info = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	for _,v in pairs(main:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") then
			TweenService:Create(v, info, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
		elseif v:IsA("UIStroke") then
			TweenService:Create(v, info, {Transparency = 1}):Play()
		end
	end
	task.delay(0.6, function()
		gui:Destroy()
	end)
end

adoptBtn.MouseButton1Click:Connect(function()
	adoptBtn.Text = "LOADING ADOPT ME..."
	adoptBtn.TextColor3 = Color3.fromRGB(100,255,100)
	closeUI()
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LibraryHubS-X/RR/refs/heads/main/adoptme.lua"))()
	end)
end)

mm2Btn.MouseButton1Click:Connect(function()
	mm2Btn.Text = "LOADING MM2..."
	mm2Btn.TextColor3 = Color3.fromRGB(100,255,100)
	closeUI()
	task.spawn(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/LibraryHubS-X/RR/refs/heads/main/mm2.lua"))()
	end)
end)
