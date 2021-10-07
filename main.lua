if not IY_LOADED then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()

	InfStoreBtn = makeSettingsButton("Infinite Store","rbxassetid://2161586957",759)
	InfStoreBtn.Position = UDim2.new(0, 5, 0, 235)
	InfStoreBtn.Size = UDim2.new(1, -10, 0, 25)
	InfStoreBtn.Name = "InfStore"
	InfStoreBtn.Parent = SettingsHolder
	
	print(InfStoreBtn.Icon.Image)

	SettingsHolder.CanvasSize = UDim2.new(0,0,0,265)

	notify("Infinite Store", "A Button Can Be Found In Settings To Open Up Infinite Store", 5)
end


local cVer = "1.8.9 [DEV]"


if IS_LOADED then
	error("Infinite Store is already running!",0)
	return
end
pcall(function() getgenv().IS_LOADED  = true end)

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local UserInputService = game:GetService('UserInputService')

COREGUI = game:GetService("CoreGui")
PARENT = nil
if (not is_sirhurt_closure) and (syn and syn.protect_gui) then
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	syn.protect_gui(Main)
	Main.Parent = COREGUI
	PARENT = Main
elseif get_hidden_gui or gethui then
	local hiddenUI = get_hidden_gui or gethui
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = hiddenUI()
	PARENT = Main
elseif COREGUI:FindFirstChild('RobloxGui') then
	PARENT = COREGUI.RobloxGui
else
	local Main = Instance.new("ScreenGui")
	Main.Name = randomString()
	Main.Parent = COREGUI
	PARENT = Main
end

PARENT.ResetOnSpawn = false
PARENT.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



function addPlugin(name)
	if name:lower() == 'plugin file name' or name:lower() == 'iy_fe.iy' or name == 'iy_fe' then
		notify('Plugin Error','Please enter a valid plugin')
	else
		local file
		local fileName
		if name:sub(-3) == '.iy' then
			pcall(function() file = readfile(name) end)
			fileName = name
		else
			pcall(function() file = readfile(name..'.iy') end)
			fileName = name..'.iy'
		end
		if file then
			if not FindInTable(PluginsTable, fileName) then
				table.insert(PluginsTable, fileName)
				LoadPlugin(fileName)
				refreshplugins()
				pcall(eventEditor.Refresh)
			else
				notify('Plugin Error','This plugin is already added')
			end
		else
			notify('Plugin Error','Cannot locate file "'..fileName..'". Is the file in the correct folder?')
		end
	end
end



function dragGUI(gui)
	task.spawn(function()
		local dragging
		local dragInput
		local dragStart = Vector3.new(0,0,0)
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService("TweenService"):Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
		end
		gui.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end)
end



function deletePlugin(name)
	local pName = name..'.iy'
	if name:sub(-3) == '.iy' then
		pName = name
	end
	for i = #cmds,1,-1 do
		if cmds[i].PLUGIN == pName then
			table.remove(cmds, i)
		end
	end
	for i,v in pairs(CMDsF:GetChildren()) do
		if v.Name == 'PLUGIN_'..pName then
			v:Destroy()
		end
	end
	for i,v in pairs(PluginsTable) do
		if v == pName then
			table.remove(PluginsTable, i)
			notify('Removed Plugin',pName..' was removed')
		end
	end
	IndexContents('',true)
	refreshplugins()
end




mainFrame = Instance.new("Frame")
dragGUI(mainFrame)


local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local ListHolder = Instance.new("Frame")
local Home = Instance.new("Frame")
local Welcome = Instance.new("TextLabel")
local cart = Instance.new("ImageLabel")
local text = Instance.new("ImageLabel")
local Epik = Instance.new("Frame")
local Round = Instance.new("ImageLabel")
local Photo = Instance.new("ImageLabel")
local Name = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Devs = Instance.new("Frame")
local Round_2 = Instance.new("ImageLabel")
local Photo_2 = Instance.new("ImageLabel")
local Name_2 = Instance.new("TextLabel")
local Credit_2 = Instance.new("TextLabel")
local Photo2 = Instance.new("ImageLabel")
local Name2 = Instance.new("TextLabel")
local List = Instance.new("Frame")
local List1 = Instance.new("TextLabel")
local List2 = Instance.new("TextLabel")
local List3 = Instance.new("TextLabel")
local List4 = Instance.new("TextLabel")
local Plugins = Instance.new("Frame")
local TopBarExample = Instance.new("Frame")
local _4Install = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local _3Created = Instance.new("TextLabel")
local _2Author = Instance.new("TextLabel")
local _1Name = Instance.new("TextLabel")
local List_2 = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local Template = Instance.new("Frame")
local PluginName = Instance.new("TextLabel")
local InfoBtn = Instance.new("ImageButton")
local Author = Instance.new("TextLabel")
local UIListLayout_2 = Instance.new("UIListLayout")
local Created = Instance.new("TextLabel")
local Install = Instance.new("TextButton")
local SearchBar = Instance.new("Frame")
local Search = Instance.new("TextBox")
local Icon = Instance.new("ImageLabel")
local SideBar = Instance.new("Frame")
local Holder = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Home_2 = Instance.new("TextButton")
local Plugins_2 = Instance.new("TextButton")
local DiscordInvite = Instance.new("TextLabel")
local PluginInfo = Instance.new("Frame")
local PluginInfo_2 = Instance.new("Frame")
local InfoLabel = Instance.new("TextLabel")
local PluginName_2 = Instance.new("TextLabel")
local List_3 = Instance.new("ScrollingFrame")
local UIGridLayout_2 = Instance.new("UIGridLayout")
local Command = Instance.new("TextLabel")

--Properties:

mainFrame.Name = "mainFrame"
mainFrame.Parent = PARENT
mainFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
mainFrame.BackgroundTransparency = 1.000
mainFrame.BorderColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.300319493, 0, 0.285551757, 0)
mainFrame.Size = UDim2.new(0, 500, 0, 320)
mainFrame.ZIndex = 10

TopBar.Name = "TopBar"
TopBar.Parent = mainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 20)
TopBar.ZIndex = 10

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(0.149999946, 0, 0, 0)
Title.Size = UDim2.new(0.850000083, 0, 0.949999988, 0)
Title.ZIndex = 10
Title.Font = Enum.Font.SourceSans
Title.Text = "Infinite Store v1.8.9"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000

Close.Name = "Close"
Close.Parent = TopBar
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(1, -20, 0, 0)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.ZIndex = 10
Close.Font = Enum.Font.SourceSans
Close.Text = ""
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000

ImageLabel.Parent = Close
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 5, 0, 5)
ImageLabel.Size = UDim2.new(0, 10, 0, 10)
ImageLabel.ZIndex = 10
ImageLabel.Image = "rbxassetid://5054663650"

ListHolder.Name = "ListHolder"
ListHolder.Parent = mainFrame
ListHolder.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
ListHolder.BorderSizePixel = 0
ListHolder.Position = UDim2.new(0, 0, 0, 20)
ListHolder.Size = UDim2.new(1, 0, 0, 300)
ListHolder.ZIndex = 10

Home.Name = "Home"
Home.Parent = ListHolder
Home.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Home.BorderSizePixel = 0
Home.ClipsDescendants = true
Home.Position = UDim2.new(0, 75, 0, 0)
Home.Size = UDim2.new(0.850000024, 0, 0, 300)
Home.ZIndex = 15

Welcome.Name = "Welcome"
Welcome.Parent = Home
Welcome.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Welcome.BackgroundTransparency = 1.000
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.230750099, 0, 0.123333335, 0)
Welcome.Size = UDim2.new(0.534000397, 0, 0.203333333, 0)
Welcome.ZIndex = 51
Welcome.Font = Enum.Font.Gotham
Welcome.Text = "Welcome To"
Welcome.TextColor3 = Color3.fromRGB(206, 206, 206)
Welcome.TextSize = 30.000
Welcome.TextTransparency = 1.000
Welcome.TextWrapped = true

cart.Name = "cart"
cart.Parent = Home
cart.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
cart.BackgroundTransparency = 1.000
cart.Position = UDim2.new(-0.244705886, 0, -0.0500000007, 0)
cart.Size = UDim2.new(0, 208, 0, 208)
cart.ZIndex = 26
cart.Image = "http://www.roblox.com/asset/?id=7244695078"

text.Name = "text"
text.Parent = Home
text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
text.BackgroundTransparency = 1.000
text.Position = UDim2.new(0.244705886, 0, -0.50999999, 0)
text.Size = UDim2.new(0, 208, 0, 208)
text.ZIndex = 27
text.Image = "http://www.roblox.com/asset/?id=7244694623"

Epik.Name = "Epik"
Epik.Parent = Home
Epik.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Epik.BackgroundTransparency = 1.000
Epik.Position = UDim2.new(0.0260000005, 0, 1.09000003, 0)
Epik.Size = UDim2.new(0, 104, 0, 141)
Epik.ZIndex = 100

Round.Name = "Round"
Round.Parent = Epik
Round.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Round.BackgroundTransparency = 1.000
Round.Size = UDim2.new(1.00000024, 0, 1.00000012, 0)
Round.ZIndex = 101
Round.Image = "rbxassetid://605740338"
Round.ImageColor3 = Color3.fromRGB(46, 46, 47)
Round.ScaleType = Enum.ScaleType.Slice
Round.SliceCenter = Rect.new(24, 24, 216, 216)

Photo.Name = "Photo"
Photo.Parent = Round
Photo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Photo.BackgroundTransparency = 1.000
Photo.Size = UDim2.new(1, 0, 0.737588704, 0)
Photo.ZIndex = 102
Photo.Image = "http://www.roblox.com/asset/?id=7657546445"

Name.Name = "Name"
Name.Parent = Round
Name.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Name.BackgroundTransparency = 1.000
Name.BorderSizePixel = 0
Name.Position = UDim2.new(0, 0, 0.737588584, 0)
Name.Size = UDim2.new(1, 0, 0.262410909, 0)
Name.ZIndex = 100
Name.Font = Enum.Font.Gotham
Name.Text = "epik"
Name.TextColor3 = Color3.fromRGB(206, 206, 206)
Name.TextSize = 25.000
Name.TextWrapped = true

Credit.Name = "Credit"
Credit.Parent = Round
Credit.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Credit.BackgroundTransparency = 1.000
Credit.BorderSizePixel = 0
Credit.Position = UDim2.new(0, 0, -0.14184396, 0)
Credit.Size = UDim2.new(1, 0, 0.141843975, 0)
Credit.ZIndex = 100
Credit.Font = Enum.Font.Gotham
Credit.Text = "Founded By"
Credit.TextColor3 = Color3.fromRGB(206, 206, 206)
Credit.TextSize = 15.000
Credit.TextWrapped = true

Devs.Name = "Devs"
Devs.Parent = Home
Devs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Devs.BackgroundTransparency = 1.000
Devs.Position = UDim2.new(0.296000004, 0, 1.09000003, 0)
Devs.Size = UDim2.new(0, 286, 0, 141)
Devs.ZIndex = 100

Round_2.Name = "Round"
Round_2.Parent = Devs
Round_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Round_2.BackgroundTransparency = 1.000
Round_2.Size = UDim2.new(1.00000024, 0, 1.00000012, 0)
Round_2.ZIndex = 101
Round_2.Image = "rbxassetid://605740338"
Round_2.ImageColor3 = Color3.fromRGB(46, 46, 47)
Round_2.ScaleType = Enum.ScaleType.Slice
Round_2.SliceCenter = Rect.new(24, 24, 216, 216)

Photo_2.Name = "Photo"
Photo_2.Parent = Round_2
Photo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Photo_2.BackgroundTransparency = 1.000
Photo_2.Position = UDim2.new(0.104895085, 0, 0, 0)
Photo_2.Size = UDim2.new(0.363636494, 0, 0.737588704, 0)
Photo_2.ZIndex = 102
Photo_2.Image = "http://www.roblox.com/asset/?id=7657547318"

Name_2.Name = "Name"
Name_2.Parent = Round_2
Name_2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Name_2.BackgroundTransparency = 1.000
Name_2.BorderSizePixel = 0
Name_2.Position = UDim2.new(0.104895085, 0, 0.737588584, 0)
Name_2.Size = UDim2.new(0.363636494, 0, 0.262410909, 0)
Name_2.ZIndex = 100
Name_2.Font = Enum.Font.Gotham
Name_2.Text = "Kaizer"
Name_2.TextColor3 = Color3.fromRGB(206, 206, 206)
Name_2.TextSize = 25.000
Name_2.TextWrapped = true

Credit_2.Name = "Credit"
Credit_2.Parent = Round_2
Credit_2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Credit_2.BackgroundTransparency = 1.000
Credit_2.BorderSizePixel = 0
Credit_2.Position = UDim2.new(0, 0, -0.14184396, 0)
Credit_2.Size = UDim2.new(1, 0, 0.141843975, 0)
Credit_2.ZIndex = 100
Credit_2.Font = Enum.Font.Gotham
Credit_2.Text = "Developed By"
Credit_2.TextColor3 = Color3.fromRGB(206, 206, 206)
Credit_2.TextSize = 15.000
Credit_2.TextWrapped = true

Photo2.Name = "Photo2"
Photo2.Parent = Round_2
Photo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Photo2.BackgroundTransparency = 1.000
Photo2.Position = UDim2.new(0.527971923, 0, 0, 0)
Photo2.Size = UDim2.new(0.363636494, 0, 0.737588704, 0)
Photo2.ZIndex = 102
Photo2.Image = "http://www.roblox.com/asset/?id=7657548002"

Name2.Name = "Name2"
Name2.Parent = Round_2
Name2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Name2.BackgroundTransparency = 1.000
Name2.BorderSizePixel = 0
Name2.Position = UDim2.new(0.527971923, 0, 0.737588584, 0)
Name2.Size = UDim2.new(0.363636494, 0, 0.262410909, 0)
Name2.ZIndex = 100
Name2.Font = Enum.Font.Gotham
Name2.Text = "Mikel"
Name2.TextColor3 = Color3.fromRGB(206, 206, 206)
Name2.TextSize = 25.000
Name2.TextWrapped = true

List.Name = "List"
List.Parent = Home
List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List.BackgroundTransparency = 1.000
List.Position = UDim2.new(0.41894114, 0, 0.0566666685, 0)
List.Size = UDim2.new(0, 429, 0, 181)
List.ZIndex = 100

List1.Name = "List1"
List1.Parent = List
List1.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
List1.BackgroundTransparency = 1.000
List1.BorderSizePixel = 0
List1.Position = UDim2.new(0.051282052, 0, -0.000728037208, 0)
List1.Size = UDim2.new(1, 0, 0.148745388, 0)
List1.ZIndex = 100
List1.Font = Enum.Font.Gotham
List1.Text = "• Sick Plugins For Infinite Yield"
List1.TextColor3 = Color3.fromRGB(206, 206, 206)
List1.TextSize = 15.000
List1.TextTransparency = 1.000
List1.TextWrapped = true
List1.TextXAlignment = Enum.TextXAlignment.Left

List2.Name = "List2"
List2.Parent = List
List2.BackgroundColor3 = Color3.fromRGB(42, 0, 0)
List2.BackgroundTransparency = 1.000
List2.BorderSizePixel = 0
List2.Position = UDim2.new(0.051282052, 0, 0.145765275, 0)
List2.Size = UDim2.new(1, 0, 0.148745388, 0)
List2.ZIndex = 100
List2.Font = Enum.Font.Gotham
List2.Text = "• Absolutely 0 Bugs"
List2.TextColor3 = Color3.fromRGB(206, 206, 206)
List2.TextSize = 15.000
List2.TextTransparency = 1.000
List2.TextWrapped = true
List2.TextXAlignment = Enum.TextXAlignment.Left

List3.Name = "List3"
List3.Parent = List
List3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
List3.BackgroundTransparency = 1.000
List3.BorderColor3 = Color3.fromRGB(1, 12, 53)
List3.BorderSizePixel = 0
List3.Position = UDim2.new(0.051282052, 0, 0.292258769, 0)
List3.Size = UDim2.new(1, 0, 0.148745388, 0)
List3.ZIndex = 100
List3.Font = Enum.Font.Gotham
List3.Text = "• Very *In*active Discord Server"
List3.TextColor3 = Color3.fromRGB(206, 206, 206)
List3.TextSize = 15.000
List3.TextTransparency = 1.000
List3.TextWrapped = true
List3.TextXAlignment = Enum.TextXAlignment.Left

List4.Name = "List4"
List4.Parent = List
List4.BackgroundColor3 = Color3.fromRGB(7, 42, 38)
List4.BackgroundTransparency = 1.000
List4.BorderSizePixel = 0
List4.Position = UDim2.new(0.0510000661, 0, 0.439073265, 0)
List4.Size = UDim2.new(1, 0, 0.148745388, 0)
List4.ZIndex = 100
List4.Font = Enum.Font.Gotham
List4.Text = "• Sexy Interfaces"
List4.TextColor3 = Color3.fromRGB(206, 206, 206)
List4.TextSize = 15.000
List4.TextTransparency = 1.000
List4.TextWrapped = true
List4.TextXAlignment = Enum.TextXAlignment.Left

Plugins.Name = "Plugins"
Plugins.Parent = ListHolder
Plugins.BackgroundColor3 = Color3.fromRGB(36, 36, 37)
Plugins.BorderSizePixel = 0
Plugins.ClipsDescendants = true
Plugins.Position = UDim2.new(0, 75, 0, 0)
Plugins.Size = UDim2.new(0.850000024, 0, 0, 300)
Plugins.Visible = false
Plugins.ZIndex = 10

TopBarExample.Name = "TopBarExample"
TopBarExample.Parent = Plugins
TopBarExample.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
TopBarExample.BorderSizePixel = 0
TopBarExample.ClipsDescendants = true
TopBarExample.Position = UDim2.new(0, 0, 0.115000002, 0)
TopBarExample.Size = UDim2.new(0, 425, 0, 15)
TopBarExample.ZIndex = 10

_4Install.Name = "4Install"
_4Install.Parent = TopBarExample
_4Install.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
_4Install.BorderSizePixel = 0
_4Install.Position = UDim2.new(0.251926512, 0, 0, 0)
_4Install.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
_4Install.ZIndex = 10
_4Install.Font = Enum.Font.SourceSansBold
_4Install.Text = "Install Button"
_4Install.TextColor3 = Color3.fromRGB(255, 255, 255)
_4Install.TextSize = 14.000
_4Install.TextWrapped = true

UIListLayout.Parent = TopBarExample
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.Padding = UDim.new(0, 3)

_3Created.Name = "3Created"
_3Created.Parent = TopBarExample
_3Created.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
_3Created.BorderSizePixel = 0
_3Created.Position = UDim2.new(0.503853023, 0, 0, 0)
_3Created.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
_3Created.ZIndex = 10
_3Created.Font = Enum.Font.SourceSansBold
_3Created.Text = "Date Created"
_3Created.TextColor3 = Color3.fromRGB(255, 255, 255)
_3Created.TextSize = 14.000
_3Created.TextWrapped = true

_2Author.Name = "2Author"
_2Author.Parent = TopBarExample
_2Author.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
_2Author.BorderSizePixel = 0
_2Author.Position = UDim2.new(0.251926512, 0, 0, 0)
_2Author.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
_2Author.ZIndex = 10
_2Author.Font = Enum.Font.SourceSansBold
_2Author.Text = "Creator Name"
_2Author.TextColor3 = Color3.fromRGB(255, 255, 255)
_2Author.TextSize = 14.000
_2Author.TextWrapped = true

_1Name.Name = "1Name"
_1Name.Parent = TopBarExample
_1Name.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
_1Name.BorderSizePixel = 0
_1Name.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
_1Name.ZIndex = 10
_1Name.Font = Enum.Font.SourceSansBold
_1Name.Text = "Plugin Name"
_1Name.TextColor3 = Color3.fromRGB(255, 255, 255)
_1Name.TextSize = 14.000
_1Name.TextWrapped = true

List_2.Name = "List"
List_2.Parent = Plugins
List_2.Active = true
List_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List_2.BackgroundTransparency = 1.000
List_2.BorderSizePixel = 0
List_2.Position = UDim2.new(0.00904986169, 0, 0.183333337, 0)
List_2.Size = UDim2.new(0, 421, 0, 244)
List_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
List_2.CanvasSize = UDim2.new(0, 0, 0, 500)
List_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

UIGridLayout.Parent = List_2
UIGridLayout.CellSize = UDim2.new(0, 420, 0, 25)

Template.Name = "Template"
Template.Parent = UIGridLayout
Template.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Template.BorderSizePixel = 0
Template.ClipsDescendants = true
Template.Position = UDim2.new(-7.18060633e-08, 0, 0, 0)
Template.Size = UDim2.new(0.964706123, 0, -1.45082998, 429)
Template.ZIndex = 10

PluginName.Name = "PluginName"
PluginName.Parent = Template
PluginName.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
PluginName.BorderSizePixel = 0
PluginName.Position = UDim2.new(-0.062650606, 0, 0, 0)
PluginName.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
PluginName.ZIndex = 10
PluginName.Font = Enum.Font.SourceSansBold
PluginName.Text = "Name"
PluginName.TextColor3 = Color3.fromRGB(255, 255, 255)
PluginName.TextSize = 14.000
PluginName.TextWrapped = true

InfoBtn.Name = "InfoBtn"
InfoBtn.Parent = PluginName
InfoBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoBtn.BackgroundTransparency = 1.000
InfoBtn.Position = UDim2.new(0, 0, 0.216666743, 0)
InfoBtn.Size = UDim2.new(0, 17, 0, 17)
InfoBtn.ZIndex = 40
InfoBtn.Image = "rbxassetid://3523243755"
InfoBtn.ImageColor3 = Color3.fromRGB(98, 98, 98)

Author.Name = "Author"
Author.Parent = Template
Author.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Author.BorderSizePixel = 0
Author.Position = UDim2.new(0.251926512, 0, 0, 0)
Author.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
Author.ZIndex = 10
Author.Font = Enum.Font.SourceSansBold
Author.Text = "Author"
Author.TextColor3 = Color3.fromRGB(255, 255, 255)
Author.TextSize = 14.000
Author.TextWrapped = true

UIListLayout_2.Parent = Template
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 3)

Created.Name = "Created"
Created.Parent = Template
Created.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Created.BorderSizePixel = 0
Created.Position = UDim2.new(0.503853023, 0, 0, 0)
Created.Size = UDim2.new(0.244588628, 0, 0.999999642, 0)
Created.ZIndex = 10
Created.Font = Enum.Font.SourceSansBold
Created.Text = "0/00/0000"
Created.TextColor3 = Color3.fromRGB(255, 255, 255)
Created.TextSize = 14.000
Created.TextWrapped = true

Install.Name = "Install"
Install.Parent = Template
Install.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Install.BorderSizePixel = 0
Install.Position = UDim2.new(0.755779684, 0, 0, 0)
Install.Size = UDim2.new(0.244220376, 0, 1, 0)
Install.Font = Enum.Font.SourceSansBold
Install.Text = "Install"
Install.TextColor3 = Color3.fromRGB(255, 255, 255)
Install.TextSize = 14.000

SearchBar.Name = "SearchBar"
SearchBar.Parent = Plugins
SearchBar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
SearchBar.BorderSizePixel = 0
SearchBar.ClipsDescendants = true
SearchBar.Position = UDim2.new(0.0160000008, 0, 0.0179999992, 0)
SearchBar.Size = UDim2.new(0, 425, 0, 23)
SearchBar.ZIndex = 10

Search.Name = "Search"
Search.Parent = SearchBar
Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search.BackgroundTransparency = 1.000
Search.Position = UDim2.new(0.0776470602, 0, 0, 0)
Search.Size = UDim2.new(0, 385, 0, 23)
Search.Font = Enum.Font.SourceSans
Search.PlaceholderColor3 = Color3.fromRGB(148, 148, 148)
Search.PlaceholderText = "Search"
Search.Text = ""
Search.TextColor3 = Color3.fromRGB(255, 255, 255)
Search.TextSize = 16.000
Search.TextXAlignment = Enum.TextXAlignment.Left

Icon.Name = "Icon"
Icon.Parent = SearchBar
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.Position = UDim2.new(0.00999999978, 0, 0, 0)
Icon.Size = UDim2.new(0, 23, 0, 23)
Icon.Image = "http://www.roblox.com/asset/?id=6031154871"
Icon.ImageColor3 = Color3.fromRGB(206, 206, 206)

SideBar.Name = "SideBar"
SideBar.Parent = mainFrame
SideBar.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
SideBar.BorderSizePixel = 0
SideBar.Position = UDim2.new(0, 0, 0.0625, 0)
SideBar.Size = UDim2.new(0.150000006, 0, 0.875, 20)
SideBar.ZIndex = 10

Holder.Name = "Holder"
Holder.Parent = SideBar
Holder.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
Holder.BackgroundTransparency = 1.000
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0, 0, 0.0566666685, 0)
Holder.Size = UDim2.new(1, 0, 0.943333328, 0)
Holder.ZIndex = 10

UIListLayout_3.Parent = Holder
UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 4)

Home_2.Name = "Home"
Home_2.Parent = Holder
Home_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home_2.BackgroundTransparency = 1.000
Home_2.Size = UDim2.new(1.02699995, -8, 0, 20)
Home_2.Font = Enum.Font.SourceSansBold
Home_2.Text = "Home"
Home_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Home_2.TextSize = 20.000
Home_2.TextXAlignment = Enum.TextXAlignment.Left

Plugins_2.Name = "Plugins"
Plugins_2.Parent = Holder
Plugins_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Plugins_2.BackgroundTransparency = 1.000
Plugins_2.Size = UDim2.new(1.02699995, -8, 0, 20)
Plugins_2.Font = Enum.Font.SourceSansBold
Plugins_2.Text = "Plugins"
Plugins_2.TextColor3 = Color3.fromRGB(156, 156, 156)
Plugins_2.TextSize = 20.000
Plugins_2.TextXAlignment = Enum.TextXAlignment.Left

DiscordInvite.Name = "DiscordInvite"
DiscordInvite.Parent = SideBar
DiscordInvite.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
DiscordInvite.BackgroundTransparency = 1.000
DiscordInvite.BorderSizePixel = 0
DiscordInvite.Position = UDim2.new(-0.0266666673, 0, 0.968999982, 0)
DiscordInvite.Size = UDim2.new(1.05128217, 0, 0.0294661485, 0)
DiscordInvite.ZIndex = 100
DiscordInvite.Font = Enum.Font.Gotham
DiscordInvite.Text = ".gg/infinitestore"
DiscordInvite.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordInvite.TextSize = 9.000
DiscordInvite.TextWrapped = true

PluginInfo.Name = "PluginInfo"
PluginInfo.Parent = mainFrame
PluginInfo.BackgroundColor3 = Color3.fromRGB(46, 46, 47)
PluginInfo.BorderSizePixel = 0
PluginInfo.Position = UDim2.new(0.589999974, 0, 0.063000001, 0)
PluginInfo.Size = UDim2.new(0.384000003, 0, 0.846875012, 20)

PluginInfo_2.Name = "PluginInfo"
PluginInfo_2.Parent = PluginInfo
PluginInfo_2.BackgroundColor3 = Color3.fromRGB(27, 27, 30)
PluginInfo_2.BorderSizePixel = 0
PluginInfo_2.Position = UDim2.new(0.316333145, 0, -0.00279209623, 0)
PluginInfo_2.Size = UDim2.new(0.683666527, 0, 0.0749570429, 20)
PluginInfo_2.ZIndex = 2

InfoLabel.Name = "InfoLabel"
InfoLabel.Parent = PluginInfo_2
InfoLabel.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
InfoLabel.BackgroundTransparency = 1.000
InfoLabel.BorderSizePixel = 0
InfoLabel.Position = UDim2.new(0.0781938657, 0, 0.521674156, 0)
InfoLabel.Size = UDim2.new(0.921806693, 0, 0.478325754, 0)
InfoLabel.ZIndex = 10
InfoLabel.Font = Enum.Font.SourceSansBold
InfoLabel.Text = "Commands"
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 17.000
InfoLabel.TextWrapped = true

PluginName_2.Name = "PluginName"
PluginName_2.Parent = PluginInfo_2
PluginName_2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
PluginName_2.BackgroundTransparency = 1.000
PluginName_2.BorderSizePixel = 0
PluginName_2.Position = UDim2.new(0.0781938657, 0, 0.0194319878, 0)
PluginName_2.Size = UDim2.new(0.921806693, 0, 0.502242088, 0)
PluginName_2.ZIndex = 10
PluginName_2.Font = Enum.Font.SourceSansBold
PluginName_2.Text = "Name"
PluginName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
PluginName_2.TextSize = 17.000
PluginName_2.TextWrapped = true

List_3.Name = "List"
List_3.Parent = PluginInfo
List_3.Active = true
List_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List_3.BackgroundTransparency = 1.000
List_3.BorderSizePixel = 0
List_3.Position = UDim2.new(0.369791657, 0, 0.140893474, 0)
List_3.Size = UDim2.new(0, 121, 0, 249)
List_3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
List_3.CanvasSize = UDim2.new(0, 0, 0, 500)
List_3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

UIGridLayout_2.Parent = List_3
UIGridLayout_2.CellSize = UDim2.new(0, 120, 0, 15)

Command.Name = "Command"
Command.Parent = UIGridLayout_2
Command.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Command.BackgroundTransparency = 1.000
Command.BorderSizePixel = 0
Command.Size = UDim2.new(0.999999523, 0, 0.400000036, 0)
Command.ZIndex = 10
Command.Font = Enum.Font.SourceSans
Command.Text = ";cmd"
Command.TextColor3 = Color3.fromRGB(255, 255, 255)
Command.TextSize = 14.000
Command.TextWrapped = true
Command.TextXAlignment = Enum.TextXAlignment.Left

InfStoreBtn.MouseButton1Click:Connect(function()
	mainFrame:TweenPosition(UDim2.new(0.5,-250,0.5,-150), "InOut", "Quart", 0.5, true, nil)
end)

mainFrame.TopBar.Close.MouseButton1Click:Connect(function()
	mainFrame:TweenPosition(UDim2.new(0.5,-250,0,-500), "InOut", "Quart", 0.5, true, nil)
end)

mainFrame.TopBar.Title.Text = ("Infinite Store v" .. cVer)

local tweenService = game:GetService('TweenService')


local pluginTable = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Infinite-Store/Infinite-Store/main/plugintable.lua"), true))()


local openColor = Color3.fromRGB(255,255,255)
local closedColor = Color3.fromRGB(156,156,156)

local installDebounce = false

function intro()
	local tweenGoals = {TextTransparency = 0, Position = UDim2.new(0.231, 0,0, 0)}
	local tweenInfo = TweenInfo.new(0.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.Welcome, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(0.6)

	local tweenGoals = {Position = UDim2.new(0.245, 0,-0.05, 0)}
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.cart, tweenInfo, tweenGoals)
	tween:Play()

	local tweenGoals = {Position = UDim2.new(0.245, 0,-0.05, 0)}
	local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.text, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(1.1)

	local tweenGoals = {Position = UDim2.new(0.026, 0,0.5, 0)}
	local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.Epik, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(0.69420)

	local tweenGoals = {Position = UDim2.new(0.296, 0,0.5, 0)}
	local tweenInfo = TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.Devs, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(.9)

	local tweenGoals = {Position = UDim2.new(-0.07, 0,-0.05, 0)}
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.text, tweenInfo, tweenGoals)
	tween:Play()
	local tween = tweenService:Create(mainFrame.ListHolder.Home.cart, tweenInfo, tweenGoals)
	tween:Play()

	local tweenGoals = {Position = UDim2.new(-0.07, 0,0, 0)}
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.Welcome, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(.8)

	local tweenGoals = {TextTransparency = 0, Position = UDim2.new(0, 0,-0.001, 0)}
	local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.List.List1, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(.4)

	local tweenGoals = {TextTransparency = 0, Position = UDim2.new(0, 0,0.146, 0)}
	local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.List.List2, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(.4)

	local tweenGoals = {TextTransparency = 0, Position = UDim2.new(0, 0,0.292, 0)}
	local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.List.List3, tweenInfo, tweenGoals)
	tween:Play()

	task.wait(.4)

	local tweenGoals = {TextTransparency = 0, Position = UDim2.new(0, 0,0.439, 0)}
	local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
	local tween = tweenService:Create(mainFrame.ListHolder.Home.List.List4, tweenInfo, tweenGoals)
	tween:Play()

end
intro()

function pluginInfoToggle(bool)
	if bool == true then
		local tweenGoals = {Position = UDim2.new(0.858, 0,0.063, 0)}
		local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
		local tween = tweenService:Create(mainFrame.PluginInfo, tweenInfo, tweenGoals)
		tween:Play()
	else
		local tweenGoals = {Position = UDim2.new(0.59, 0,0.063, 0)}
		local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
		local tween = tweenService:Create(mainFrame.PluginInfo, tweenInfo, tweenGoals)
		tween:Play()
	end
end


function tweenColor(instance, rgb, property, t1me)
	local tweenGoals = {ImageColor3 = rgb}
	local tweenInfo = TweenInfo.new(t1me, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
	local tween = tweenService:Create(instance, tweenInfo, tweenGoals)
	tween:Play()
end


function tweenColor2(instance, rgb, t1me)
	local tweenGoals = {TextColor3 = rgb}
	local tweenInfo = TweenInfo.new(t1me, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
	local tween = tweenService:Create(instance, tweenInfo, tweenGoals)
	tween:Play()
end



local ObjectHolder = mainFrame:WaitForChild('ListHolder'):WaitForChild('Plugins'):WaitForChild('List')
local searchBox = mainFrame:WaitForChild('ListHolder'):WaitForChild('Plugins'):WaitForChild('SearchBar'):WaitForChild('Search')

local Objects = {['Frame'] = true}
local Type = 1

function Filter(Text)
	for i,v in pairs(ObjectHolder:GetChildren()) do
		if Objects[v.ClassName] then
			if string.match(string.lower(v.Name), Text) then
				if Type == 1 then
					v.Visible = true
				end
				v.LayoutOrder = 1
			else
				if Type == 1 then
					v.Visible = false
				end
				v.LayoutOrder = 0
			end
		end
	end
end

searchBox:GetPropertyChangedSignal('Text'):Connect(function()
	local CurrentText = searchBox.Text

	if CurrentText == "" then
		for i,v in pairs(ObjectHolder:GetChildren()) do
			if Objects[v.ClassName] then
				v.Visible = true
			end
		end
	else
		Filter(string.lower(CurrentText))
	end
end)


for i,v in pairs(mainFrame.SideBar.Holder:GetChildren()) do
	if v:IsA('TextButton') then

		local cs = Instance.new('BoolValue')
		cs.Name = 'cs'
		cs.Parent = v

		v.MouseEnter:Connect(function()
			tweenColor2(v, openColor, 0.2)
		end)

		v.MouseLeave:Connect(function()
			if cs.Value == false then
				tweenColor2(v, closedColor, 0.2)
			end
		end)

		v.MouseButton1Click:Connect(function()
			for i,v in pairs(mainFrame.SideBar.Holder:GetDescendants()) do
				if v:IsA('TextButton') then tweenColor2(v, closedColor, 0.2) mainFrame.ListHolder[v.Name].Visible = false end
				if v.Name == 'cs' then v.Value = false end
			end

			v.cs.Value = true
			mainFrame.ListHolder[v.Name].Visible = true
			tweenColor2(v, openColor, 0.2)
		end)

	end
end


local pluginData = nil
local plginCount = 0

for index,plgin in pairs(pluginTable) do

	plginCount += 1

	local pluginFrameClone = mainFrame.ListHolder.Plugins.List.UIGridLayout.Template:Clone()

	pluginFrameClone.Name = tostring(plgin.Name .. ' ' .. plgin.Creator .. ' ' .. plgin.CreationDate)
	pluginFrameClone.Author.Text = plgin.Creator
	pluginFrameClone.PluginName.Text = plgin.Name
	pluginFrameClone.Created.Text = plgin.CreationDate

	if isfile(plgin.Name .. '.iy') then
		pluginFrameClone.Install.Text = 'Uninstall'
	end

	pluginFrameClone.Install.MouseButton1Click:Connect(function()
		if installDebounce == false then installDebounce = true

			local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
			local Response = requestfunc({
				Url = plgin.GithubLink,
				Method = "GET"
			})
			pluginData = Response.Body

			if isfile(plgin.Name .. '.iy') == true then

				pluginFrameClone.Install.Text = 'Uninstalling'
				deletePlugin(plgin.Name)
				delfile(plgin.Name .. '.iy')
				pluginFrameClone.Install.Text = 'Success'
				task.wait(.5)
				pluginFrameClone.Install.Text = 'Install'

			else

				pluginFrameClone.Install.Text = 'Installing'
				writefile(plgin.Name .. '.iy', pluginData)
				addPlugin(plgin.Name)
				pluginFrameClone.Install.Text = 'Success'
				task.wait(.5)
				pluginFrameClone.Install.Text = 'Uninstall'

			end

			installDebounce = false

		end
	end)

	pluginFrameClone.PluginName.InfoBtn.MouseButton1Click:Connect(function()
		if pluginFrameClone.PluginName.InfoBtn.ImageColor3 ~= Color3.fromRGB(255,255,255) then
			mainFrame.PluginInfo.PluginInfo.PluginName.Text = plgin.Name

			for i,v in pairs(mainFrame.ListHolder.Plugins:GetDescendants()) do
				if v.Name == 'InfoBtn' and v.Parent.Parent.Parent.Name ~= 'UIGridLayout' then
					tweenColor(v, Color3.fromRGB(98,98,98), v.ImageColor3, 0.2)
				end
			end

			tweenColor(pluginFrameClone.PluginName.InfoBtn, Color3.fromRGB(255,255,255), pluginFrameClone.PluginName.InfoBtn.ImageColor3, 0.2)

			for i,v in pairs(mainFrame.PluginInfo.List:GetChildren()) do
				if v:IsA('TextLabel') then
					v:Destroy()
				end
			end

			for i,v in pairs(plgin.Commands) do
				local tLabelClone = mainFrame.PluginInfo.List.UIGridLayout.Command:Clone()
				tLabelClone.Name = v
				tLabelClone.Text = ';' .. v
				tLabelClone.Parent = mainFrame.PluginInfo.List
			end

			pluginInfoToggle(true)
			mainFrame.PluginInfo.List.CanvasSize = UDim2.new(0,0,0, #plgin.Commands * 30)

		else

			pluginInfoToggle(false)
			tweenColor(pluginFrameClone.PluginName.InfoBtn, Color3.fromRGB(98,98,98), pluginFrameClone.PluginName.InfoBtn.ImageColor3, 0.5)

		end
	end)

	pluginFrameClone.Parent = mainFrame.ListHolder.Plugins.List
end

mainFrame.ListHolder.Plugins.List.CanvasSize = UDim2.new(0,0,0, plginCount * 30)

