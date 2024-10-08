do local GUI = game.CoreGui:FindFirstChild("Darkrai");if GUI then GUI:Destroy();end;if _G.Color == nil then
	_G.Color = Color3.fromRGB(7, 236, 240)
end 
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
 local Dragging = nil
 local DragInput = nil
 local DragStart = nil
 local StartPosition = nil

 local function Update(input)
	 local Delta = input.Position - DragStart
	 local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
	 local Tween = TweenService:Create(object, TweenInfo.new(0.15), {Position = pos})
	 Tween:Play()
 end

 topbarobject.InputBegan:Connect(
	 function(input)
		 if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			 Dragging = true
			 DragStart = input.Position
			 StartPosition = object.Position

			 input.Changed:Connect(
				 function()
					 if input.UserInputState == Enum.UserInputState.End then
						 Dragging = false
					 end
				 end
			 )
		 end
	 end
 )

 topbarobject.InputChanged:Connect(
	 function(input)
		 if
			 input.UserInputType == Enum.UserInputType.MouseMovement or
			 input.UserInputType == Enum.UserInputType.Touch
		 then
			 DragInput = input
		 end
	 end
 )

 UserInputService.InputChanged:Connect(
	 function(input)
		 if input == DragInput and Dragging then
			 Update(input)
		 end
	 end
 )
end

local DarkraiX = {}

function DarkraiX:ToggleUi()
if game.CoreGui:FindFirstChild("Darkrai").Enabled == true then -- oh am dumb
game.CoreGui:FindFirstChild("Darkrai").Enabled = false
else
game.CoreGui:FindFirstChild("Darkrai").Enabled = true
end
end

function DarkraiX:Window(text,gamenme,logo,keybind)
 local hubname = text
 local gamename = gamenme
 local uihide = false
 local abc = false
 local logo = logo or 0
 local currentpage = ""
 local keybind = keybind or Enum.KeyCode.RightControl
 local yoo = string.gsub(tostring(keybind),"Enum.KeyCode.","")
 if gamename == "" then 
	 gamename = ""..PlaceName.Name
 end
 
 local Darkrai = Instance.new("ScreenGui") -- guess i am using hubname wrong
 Darkrai.Name = "Darkrai" -- wait
 Darkrai.Parent = game.CoreGui
 Darkrai.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

 local Main = Instance.new("Frame")
 Main.Name = "Main"
 Main.Parent = Darkrai
 Main.ClipsDescendants = true
 Main.AnchorPoint = Vector2.new(0.5,0.5)
 Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
 Main.Position = UDim2.new(0.5, 0, 0.5, 0)
 Main.Size = UDim2.new(0, 0, 0, 0)
 
 Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)

 local MCNR = Instance.new("UICorner")
 MCNR.Name = "MCNR"
 MCNR.Parent = Main

 local Top = Instance.new("Frame")
 Top.Name = "Top"
 Top.Parent = Main
 Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
 Top.Size = UDim2.new(0, 656, 0, 27)

 local TCNR = Instance.new("UICorner")
 TCNR.Name = "TCNR"
 TCNR.Parent = Top

 local Logo = Instance.new("ImageLabel")
 Logo.Name = "Logo"
 Logo.Parent = Top
 Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Logo.BackgroundTransparency = 1.000
 Logo.Position = UDim2.new(0, 10, 0, 1)
 Logo.Size = UDim2.new(0, 25, 0, 25)
 Logo.Image = ""

 local Name = Instance.new("TextLabel")
 Name.Name = "Name"
 Name.Parent = Top
 Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Name.BackgroundTransparency = 1.000
 Name.Position = UDim2.new(0.0609756112, 0, 0, 0)
 Name.Size = UDim2.new(0, 61, 0, 27)
 Name.Font = Enum.Font.GothamSemibold
 Name.Text = hubname
 Name.TextColor3 = Color3.fromRGB(255, 255, 255)
 Name.TextSize = 17.000

 local Hub = Instance.new("TextLabel")
 Hub.Name = "Hub"
 Hub.Parent = Top
 Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 Hub.BackgroundTransparency = 1.000
 Hub.Position = UDim2.new(0, 110, 0, 0)
 Hub.Size = UDim2.new(0, 81, 0, 27)
 Hub.Font = Enum.Font.GothamSemibold
 Hub.Text = "   | "..gamename
 Hub.TextColor3 = Color3.fromRGB(255,255,255)
 Hub.TextSize = 17.000
 Hub.TextXAlignment = Enum.TextXAlignment.Left

 local BindButton = Instance.new("TextButton")
 BindButton.Name = "BindButton"
 BindButton.Parent = Top
 BindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 BindButton.BackgroundTransparency = 1.000
 BindButton.Position = UDim2.new(0.847561002, 0, 0, 0)
 BindButton.Size = UDim2.new(0, 100, 0, 27)
 BindButton.Font = Enum.Font.GothamSemibold
 BindButton.Text = "[Hub Ui Rac Vai Lon]"
 BindButton.TextColor3 = Color3.fromRGB(255,255,255)
 BindButton.TextSize = 13.000

 local Tab = Instance.new("Frame")
 Tab.Name = "Tab"
 Tab.Parent = Main
 Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
 Tab.Position = UDim2.new(0, 5, 0, 30)
 Tab.Size = UDim2.new(0, 150, 0, 365)

 local TCNR = Instance.new("UICorner")
 TCNR.Name = "TCNR"
 TCNR.Parent = Tab

 local ScrollTab = Instance.new("ScrollingFrame")
 ScrollTab.Name = "ScrollTab"
 ScrollTab.Parent = Tab
 ScrollTab.Active = true
 ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 ScrollTab.BackgroundTransparency = 1.000
 ScrollTab.Size = UDim2.new(0, 150, 0, 365)
 ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
 ScrollTab.ScrollBarThickness = 0

 local PLL = Instance.new("UIListLayout")
 PLL.Name = "PLL"
 PLL.Parent = ScrollTab
 PLL.SortOrder = Enum.SortOrder.LayoutOrder
 PLL.Padding = UDim.new(0, 15)

 local PPD = Instance.new("UIPadding")
 PPD.Name = "PPD"
 PPD.Parent = ScrollTab
 PPD.PaddingLeft = UDim.new(0, 10)
 PPD.PaddingTop = UDim.new(0, 10)

 local Page = Instance.new("Frame")
 Page.Name = "Page"
 Page.Parent = Main
 Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
 Page.Position = UDim2.new(0.245426834, 0, 0.075000003, 0)
 Page.Size = UDim2.new(0, 490, 0, 365)

 local PCNR = Instance.new("UICorner")
 PCNR.Name = "PCNR"
 PCNR.Parent = Page

 local MainPage = Instance.new("Frame")
 MainPage.Name = "MainPage"
 MainPage.Parent = Page
 MainPage.ClipsDescendants = true
 MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
 MainPage.BackgroundTransparency = 1.000
 MainPage.Size = UDim2.new(0, 490, 0, 365)

 local PageList = Instance.new("Folder")
 PageList.Name = "PageList"
 PageList.Parent = MainPage

 local UIPageLayout = Instance.new("UIPageLayout")

 UIPageLayout.Parent = PageList
 UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
 UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
 UIPageLayout.EasingStyle = Enum.EasingStyle.Quad
 UIPageLayout.FillDirection = Enum.FillDirection.Vertical
 UIPageLayout.Padding = UDim.new(0, 15)
 UIPageLayout.TweenTime = 0.400
 UIPageLayout.GamepadInputEnabled = false
 UIPageLayout.ScrollWheelInputEnabled = false
 UIPageLayout.TouchInputEnabled = false
 
 MakeDraggable(Top,Main)

 UserInputService.InputBegan:Connect(function(input)
	 if input.KeyCode == Enum.KeyCode[yoo] then
		 if uihide == false then
			 uihide = true
			 Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
		 else
			 uihide = false
			 Main:TweenSize(UDim2.new(0, 656, 0, 400),"Out","Quad",0.4,true)
		 end
	 end
 end)
 
 local uitab = {}
 
 function uitab:AddTab(text)
	 local TabButton = Instance.new("TextButton")
	 TabButton.Parent = ScrollTab
	 TabButton.Name = text.."Server"
	 TabButton.Text = text
	 TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	 TabButton.BorderColor3 = Color3.fromRGB(255,255,255)
	 TabButton.BorderSizePixel = 3
	 TabButton.Size = UDim2.new(0, 130, 0, 23)
	 TabButton.Font = Enum.Font.GothamSemibold
	 TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
	 TabButton.TextSize = 15.000
	 TabButton.TextTransparency = 0.500

	 local MainFramePage = Instance.new("ScrollingFrame")
	 MainFramePage.Name = text.."_Page"
	 MainFramePage.Parent = PageList
	 MainFramePage.Active = true
	 MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	 MainFramePage.BackgroundTransparency = 1.000
	 MainFramePage.BorderSizePixel = 0
	 MainFramePage.Size = UDim2.new(0, 490, 0, 365)
	 MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
	 MainFramePage.ScrollBarThickness = 0
	 
	 local UIPadding = Instance.new("UIPadding")
	 local UIListLayout = Instance.new("UIListLayout")
	 
	 UIPadding.Parent = MainFramePage
	 UIPadding.PaddingLeft = UDim.new(0, 10)
	 UIPadding.PaddingTop = UDim.new(0, 10)

	 UIListLayout.Padding = UDim.new(0,15)
	 UIListLayout.Parent = MainFramePage
	 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	 
	 TabButton.MouseButton1Click:Connect(function()
		 for i,v in next, ScrollTab:GetChildren() do
			 if v:IsA("TextButton") then
				 TweenService:Create(
					 v,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {TextTransparency = 0.5}
				 ):Play()
			 end
			 TweenService:Create(
				 TabButton,
				 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {TextTransparency = 0}
			 ):Play()
		 end
		 for i,v in next, PageList:GetChildren() do
			 currentpage = string.gsub(TabButton.Name,"Server","").."_Page"
			 if v.Name == currentpage then
				 UIPageLayout:JumpTo(v)
			 end
		 end
	 end)

	 if abc == false then
		 for i,v in next, ScrollTab:GetChildren() do
			 if v:IsA("TextButton") then
				 TweenService:Create(
					 v,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {TextTransparency = 0.5}
				 ):Play()
			 end
			 TweenService:Create(
				 TabButton,
				 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {TextTransparency = 0}
			 ):Play()
		 end
		 UIPageLayout:JumpToIndex(1)
		 abc = true
	 end
	 
	 game:GetService("RunService").Stepped:Connect(function()
		 pcall(function()
			 MainFramePage.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
			 ScrollTab.CanvasSize = UDim2.new(0,0,0,PLL.AbsoluteContentSize.Y + 20)
		 end)
	 end)
	 
	 local main = {}
	 function main:AddButton(text,callback)
		 local Button = Instance.new("Frame")
		 local UICorner = Instance.new("UICorner")
		 local TextBtn = Instance.new("TextButton")
		 local UICorner_2 = Instance.new("UICorner")
		 local Black = Instance.new("Frame")
		 local UICorner_3 = Instance.new("UICorner")
		 
		 Button.Name = "Button"
		 Button.Parent = MainFramePage
		 Button.BackgroundColor3 = _G.Color
		 Button.Size = UDim2.new(0, 470, 0, 31)
		 
		 UICorner.CornerRadius = UDim.new(0, 5)
		 UICorner.Parent = Button
		 
		 TextBtn.Name = "TextBtn"
		 TextBtn.Parent = Button
		 TextBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		 TextBtn.Position = UDim2.new(0, 1, 0, 1)
		 TextBtn.Size = UDim2.new(0, 468, 0, 29)
		 TextBtn.AutoButtonColor = false
		 TextBtn.Font = Enum.Font.GothamSemibold
		 TextBtn.Text = text
		 TextBtn.TextColor3 = Color3.fromRGB(225, 225, 225)
		 TextBtn.TextSize = 15.000
		 
		 UICorner_2.CornerRadius = UDim.new(0, 5)
		 UICorner_2.Parent = TextBtn
		 
		 Black.Name = "Black"
		 Black.Parent = Button
		 Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		 Black.BackgroundTransparency = 1.000
		 Black.BorderSizePixel = 0
		 Black.Position = UDim2.new(0, 1, 0, 1)
		 Black.Size = UDim2.new(0, 468, 0, 29)
		 
		 UICorner_3.CornerRadius = UDim.new(0, 5)
		 UICorner_3.Parent = Black

		 TextBtn.MouseEnter:Connect(function()
			 TweenService:Create(
				 Black,
				 TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {BackgroundTransparency = 0.7}
			 ):Play()
		 end)
		 TextBtn.MouseLeave:Connect(function()
			 TweenService:Create(
				 Black,
				 TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {BackgroundTransparency = 1}
			 ):Play()
		 end)
		 TextBtn.MouseButton1Click:Connect(function()
			 TextBtn.TextSize = 0
			 TweenService:Create(
				 TextBtn,
				 TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {TextSize = 15}
			 ):Play()
			 callback()
		 end)
	 end
	 function main:AddToggle(text,config,callback)
		 config = config or false
		 local toggled = config
		 local Toggle = Instance.new("Frame")
		 local UICorner = Instance.new("UICorner")
		 local Button = Instance.new("TextButton")
		 local UICorner_2 = Instance.new("UICorner")
		 local Label = Instance.new("TextLabel")
		 local ToggleImage = Instance.new("Frame")
		 local UICorner_3 = Instance.new("UICorner")
		 local Circle = Instance.new("Frame")
		 local UICorner_4 = Instance.new("UICorner")

		 Toggle.Name = "Toggle"
		 Toggle.Parent = MainFramePage
		 Toggle.BackgroundColor3 = _G.Color
		 Toggle.Size = UDim2.new(0, 470, 0, 31)

		 UICorner.CornerRadius = UDim.new(0, 5)
		 UICorner.Parent = Toggle

		 Button.Name = "Button"
		 Button.Parent = Toggle
		 Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		 Button.Position = UDim2.new(0, 1, 0, 1)
		 Button.Size = UDim2.new(0, 468, 0, 29)
		 Button.AutoButtonColor = false
		 Button.Font = Enum.Font.SourceSans
		 Button.Text = ""
		 Button.TextColor3 = Color3.fromRGB(0, 0, 0)
		 Button.TextSize = 11.000

		 UICorner_2.CornerRadius = UDim.new(0, 5)
		 UICorner_2.Parent = Button

		 Label.Name = "Label"
		 Label.Parent = Toggle
		 Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 Label.BackgroundTransparency = 1.000
		 Label.Position = UDim2.new(0, 1, 0, 1)
		 Label.Size = UDim2.new(0, 468, 0, 29)
		 Label.Font = Enum.Font.GothamSemibold
		 Label.Text = text
		 Label.TextColor3 = Color3.fromRGB(225, 225, 225)
		 Label.TextSize = 15.000

		 ToggleImage.Name = "ToggleImage"
		 ToggleImage.Parent = Toggle
		 ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
		 ToggleImage.Position = UDim2.new(0, 415, 0, 5)
		 ToggleImage.Size = UDim2.new(0, 45, 0, 20)

		 UICorner_3.CornerRadius = UDim.new(0, 10)
		 UICorner_3.Parent = ToggleImage

		 Circle.Name = "Circle"
		 Circle.Parent = ToggleImage
		 Circle.BackgroundColor3 = Color3.fromRGB(227, 60, 60)
		 Circle.Position = UDim2.new(0, 2, 0, 2)
		 Circle.Size = UDim2.new(0, 16, 0, 16)

		 UICorner_4.CornerRadius = UDim.new(0, 10)
		 UICorner_4.Parent = Circle

		 Button.MouseButton1Click:Connect(function()
			 if toggled == false then
				 toggled = true
				 Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.2,true)
				 TweenService:Create(
					 Circle,
					 TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {BackgroundColor3 = Color3.fromRGB(0,255,0) }
				 ):Play()
			 else
				 toggled = false
				 Circle:TweenPosition(UDim2.new(0,2,0,2),"Out","Sine",0.2,true)
				 TweenService:Create(
					 Circle,
					 TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {BackgroundColor3 = Color3.fromRGB(227, 60, 110)}
				 ):Play()
			 end
			 pcall(callback,toggled)
		 end)

		 if config == true then
			 toggled = true
			 Circle:TweenPosition(UDim2.new(0,27,0,2),"Out","Sine",0.4,true)
			 TweenService:Create(
				 Circle,
				 TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {BackgroundColor3 = Color3.fromRGB(0,255,0) }
			 ):Play()
			 pcall(callback,toggled)
		 end
	 end
	 function main:AddDropdown(text,option,callback)
		 local isdropping = false
		 local Dropdown = Instance.new("Frame")
		 local UICorner = Instance.new("UICorner")
		 local DropTitle = Instance.new("TextLabel")
		 local DropScroll = Instance.new("ScrollingFrame")
		 local UIListLayout = Instance.new("UIListLayout")
		 local UIPadding = Instance.new("UIPadding")
		 local DropButton = Instance.new("TextButton")
		 local DropImage = Instance.new("ImageLabel")
		 
		 Dropdown.Name = "Dropdown"
		 Dropdown.Parent = MainFramePage
		 Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		 Dropdown.ClipsDescendants = true
		 Dropdown.Size = UDim2.new(0, 470, 0, 31)
		 
		 UICorner.CornerRadius = UDim.new(0, 5)
		 UICorner.Parent = Dropdown
		 
		 DropTitle.Name = "DropTitle"
		 DropTitle.Parent = Dropdown
		 DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 DropTitle.BackgroundTransparency = 1.000
		 DropTitle.Size = UDim2.new(0, 470, 0, 31)
		 DropTitle.Font = Enum.Font.GothamSemibold
		 DropTitle.Text = text.. " : "
		 DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
		 DropTitle.TextSize = 15.000
		 
		 DropScroll.Name = "DropScroll"
		 DropScroll.Parent = DropTitle
		 DropScroll.Active = true
		 DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 DropScroll.BackgroundTransparency = 1.000
		 DropScroll.BorderSizePixel = 0
		 DropScroll.Position = UDim2.new(0, 0, 0, 31)
		 DropScroll.Size = UDim2.new(0, 470, 0, 100)
		 DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
		 DropScroll.ScrollBarThickness = 3
		 
		 UIListLayout.Parent = DropScroll
		 UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		 UIListLayout.Padding = UDim.new(0, 5)
		 
		 UIPadding.Parent = DropScroll
		 UIPadding.PaddingLeft = UDim.new(0, 5)
		 UIPadding.PaddingTop = UDim.new(0, 5)
		 
		 DropImage.Name = "DropImage"
		 DropImage.Parent = Dropdown
		 DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 DropImage.BackgroundTransparency = 1.000
		 DropImage.Position = UDim2.new(0, 445, 0, 6)
		 DropImage.Rotation = 180.000
		 DropImage.Size = UDim2.new(0, 20, 0, 20)
		 DropImage.Image = "rbxassetid://133896060252289"
		 
		 DropButton.Name = "DropButton"
		 DropButton.Parent = Dropdown
		 DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 DropButton.BackgroundTransparency = 1.000
		 DropButton.Size = UDim2.new(0, 470, 0, 31)
		 DropButton.Font = Enum.Font.SourceSans
		 DropButton.Text = ""
		 DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		 DropButton.TextSize = 14.000

		 for i,v in next,option do
			 local Item = Instance.new("TextButton")

			 Item.Name = "Item"
			 Item.Parent = DropScroll
			 Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			 Item.BackgroundTransparency = 1.000
			 Item.Size = UDim2.new(0, 460, 0, 26)
			 Item.Font = Enum.Font.GothamSemibold
			 Item.Text = tostring(v)
			 Item.TextColor3 = Color3.fromRGB(225, 225, 225)
			 Item.TextSize = 13.000
			 Item.TextTransparency = 0.500

			 Item.MouseEnter:Connect(function()
				 TweenService:Create(
					 Item,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {TextTransparency = 0}
				 ):Play()
			 end)

			 Item.MouseLeave:Connect(function()
				 TweenService:Create(
					 Item,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {TextTransparency = 0.5}
				 ):Play()
			 end)

			 Item.MouseButton1Click:Connect(function()
				 isdropping = false
				 Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
				 TweenService:Create(
					 DropImage,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {Rotation = 180}
				 ):Play()
				 callback(Item.Text)
				 DropTitle.Text = text.." : "..Item.Text
			 end)
		 end

		 DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

		 DropButton.MouseButton1Click:Connect(function()
			 if isdropping == false then
				 isdropping = true
				 Dropdown:TweenSize(UDim2.new(0,470,0,131),"Out","Quad",0.3,true)
				 TweenService:Create(
					 DropImage,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {Rotation = 0}
				 ):Play()
			 else
				 isdropping = false
				 Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
				 TweenService:Create(
					 DropImage,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {Rotation = 180}
				 ):Play()
			 end
		 end)

		 local dropfunc = {}
		 function dropfunc:Add(t)
			 local Item = Instance.new("TextButton")
			 Item.Name = "Item"
			 Item.Parent = DropScroll
			 Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			 Item.BackgroundTransparency = 1.000
			 Item.Size = UDim2.new(0, 470, 0, 26)
			 Item.Font = Enum.Font.GothamSemibold
			 Item.Text = tostring(t)
			 Item.TextColor3 = Color3.fromRGB(225, 225, 225)
			 Item.TextSize = 13.000
			 Item.TextTransparency = 0.500

			 Item.MouseEnter:Connect(function()
				 TweenService:Create(
					 Item,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {TextTransparency = 0}
				 ):Play()
			 end)

			 Item.MouseLeave:Connect(function()
				 TweenService:Create(
					 Item,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {TextTransparency = 0.5}
				 ):Play()
			 end)

			 Item.MouseButton1Click:Connect(function()
				 isdropping = false
				 Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
				 TweenService:Create(
					 DropImage,
					 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					 {Rotation = 180}
				 ):Play()
				 callback(Item.Text)
				 DropTitle.Text = text.." : "..Item.Text
			 end)
		 end
		 function dropfunc:Clear()
			 DropTitle.Text = tostring(text).." : "
			 isdropping = false
			 Dropdown:TweenSize(UDim2.new(0,470,0,31),"Out","Quad",0.3,true)
			 TweenService:Create(
				 DropImage,
				 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {Rotation = 180}
			 ):Play()
			 for i,v in next, DropScroll:GetChildren() do
				 if v:IsA("TextButton") then
					 v:Destroy()
				 end
			 end
		 end
		 return dropfunc
	 end

	 function main:AddSlider(text,min,max,set,callback)
		 local Slider = Instance.new("Frame")
		 local slidercorner = Instance.new("UICorner")
		 local sliderr = Instance.new("Frame")
		 local sliderrcorner = Instance.new("UICorner")
		 local SliderLabel = Instance.new("TextLabel")
		 local HAHA = Instance.new("Frame")
		 local AHEHE = Instance.new("TextButton")
		 local bar = Instance.new("Frame")
		 local bar1 = Instance.new("Frame")
		 local bar1corner = Instance.new("UICorner")
		 local barcorner = Instance.new("UICorner")
		 local circlebar = Instance.new("Frame")
		 local UICorner = Instance.new("UICorner")
		 local slidervalue = Instance.new("Frame")
		 local valuecorner = Instance.new("UICorner")
		 local TextBox = Instance.new("TextBox")
		 local UICorner_2 = Instance.new("UICorner")

		 Slider.Name = "Slider"
		 Slider.Parent = MainFramePage
		 Slider.BackgroundColor3 = _G.Color
		 Slider.BackgroundTransparency = 0
		 Slider.Size = UDim2.new(0, 470, 0, 51)

		 slidercorner.CornerRadius = UDim.new(0, 5)
		 slidercorner.Name = "slidercorner"
		 slidercorner.Parent = Slider

		 sliderr.Name = "sliderr"
		 sliderr.Parent = Slider
		 sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		 sliderr.Position = UDim2.new(0, 1, 0, 1)
		 sliderr.Size = UDim2.new(0, 468, 0, 49)

		 sliderrcorner.CornerRadius = UDim.new(0, 5)
		 sliderrcorner.Name = "sliderrcorner"
		 sliderrcorner.Parent = sliderr

		 SliderLabel.Name = "SliderLabel"
		 SliderLabel.Parent = sliderr
		 SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 SliderLabel.BackgroundTransparency = 1.000
		 SliderLabel.Position = UDim2.new(0, 15, 0, 0)
		 SliderLabel.Size = UDim2.new(0, 180, 0, 26)
		 SliderLabel.Font = Enum.Font.GothamSemibold
		 SliderLabel.Text = text
		 SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
		 SliderLabel.TextSize = 16.000
		 SliderLabel.TextTransparency = 0
		 SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

		 HAHA.Name = "HAHA"
		 HAHA.Parent = sliderr
		 HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 HAHA.BackgroundTransparency = 1.000
		 HAHA.Size = UDim2.new(0, 468, 0, 29)

		 AHEHE.Name = "AHEHE"
		 AHEHE.Parent = sliderr
		 AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 AHEHE.BackgroundTransparency = 1.000
		 AHEHE.Position = UDim2.new(0, 10, 0, 35)
		 AHEHE.Size = UDim2.new(0, 448, 0, 5)
		 AHEHE.Font = Enum.Font.SourceSans
		 AHEHE.Text = ""
		 AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
		 AHEHE.TextSize = 14.000

		 bar.Name = "bar"
		 bar.Parent = AHEHE
		 bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		 bar.Size = UDim2.new(0, 448, 0, 5)

		 bar1.Name = "bar1"
		 bar1.Parent = bar
		 bar1.BackgroundColor3 = _G.Color
		 bar1.BackgroundTransparency = 0
		 bar1.Size = UDim2.new(set/max, 0, 0, 5)

		 bar1corner.CornerRadius = UDim.new(0, 5)
		 bar1corner.Name = "bar1corner"
		 bar1corner.Parent = bar1

		 barcorner.CornerRadius = UDim.new(0, 5)
		 barcorner.Name = "barcorner"
		 barcorner.Parent = bar

		 circlebar.Name = "circlebar"
		 circlebar.Parent = bar1
		 circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
		 circlebar.Position = UDim2.new(1, -2, 0, -3)
		 circlebar.Size = UDim2.new(0, 10, 0, 10)

		 UICorner.CornerRadius = UDim.new(0, 100)
		 UICorner.Parent = circlebar

		 slidervalue.Name = "slidervalue"
		 slidervalue.Parent = sliderr
		 slidervalue.BackgroundColor3 = _G.Color
		 slidervalue.BackgroundTransparency = 0
		 slidervalue.Position = UDim2.new(0, 395, 0, 5)
		 slidervalue.Size = UDim2.new(0, 65, 0, 18)

		 valuecorner.CornerRadius = UDim.new(0, 5)
		 valuecorner.Name = "valuecorner"
		 valuecorner.Parent = slidervalue

		 TextBox.Parent = slidervalue
		 TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		 TextBox.Position = UDim2.new(0, 1, 0, 1)
		 TextBox.Size = UDim2.new(0, 63, 0, 16)
		 TextBox.Font = Enum.Font.GothamSemibold
		 TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
		 TextBox.TextSize = 9.000
		 TextBox.Text = set
		 TextBox.TextTransparency = 0

		 UICorner_2.CornerRadius = UDim.new(0, 5)
		 UICorner_2.Parent = TextBox

		 local mouse = game.Players.LocalPlayer:GetMouse()
		 local uis = game:GetService("UserInputService")

		 if Value == nil then
			 Value = set
			 pcall(function()
				 callback(Value)
			 end)
		 end
		 
		 AHEHE.MouseButton1Down:Connect(function()
			 Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
			 pcall(function()
				 callback(Value)
			 end)
			 bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
			 circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
			 moveconnection = mouse.Move:Connect(function()
				 TextBox.Text = Value
				 Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
				 pcall(function()
					 callback(Value)
				 end)
				 bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
				 circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
			 end)
			 releaseconnection = uis.InputEnded:Connect(function(Mouse)
				 if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
					 Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
					 pcall(function()
						 callback(Value)
					 end)
					 bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 448), 0, 5)
					 circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 438), 0, -3)
					 moveconnection:Disconnect()
					 releaseconnection:Disconnect()
				 end
			 end)
		 end)
		 releaseconnection = uis.InputEnded:Connect(function(Mouse)
			 if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch  then
				 Value = math.floor((((tonumber(max) - tonumber(min)) / 448) * bar1.AbsoluteSize.X) + tonumber(min))
				 TextBox.Text = Value
			 end
		 end)

		 TextBox.FocusLost:Connect(function()
			 if tonumber(TextBox.Text) > max then
				 TextBox.Text  = max
			 end
			 bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
			 circlebar.Position = UDim2.new(1, -2, 0, -3)
			 TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
			 pcall(callback, TextBox.Text)
		 end)
	 end

	 function main:AddTextbox(text,disappear,callback)
		 local Textbox = Instance.new("Frame")
		 local TextboxCorner = Instance.new("UICorner")
		 local Textboxx = Instance.new("Frame")
		 local TextboxxCorner = Instance.new("UICorner")
		 local TextboxLabel = Instance.new("TextLabel")
		 local txtbtn = Instance.new("TextButton")
		 local RealTextbox = Instance.new("TextBox")
		 local UICorner = Instance.new("UICorner")

		 Textbox.Name = "Textbox"
		 Textbox.Parent = MainFramePage
		 Textbox.BackgroundColor3 = _G.Color
		 Textbox.BackgroundTransparency = 0
		 Textbox.Size = UDim2.new(0, 470, 0, 31)

		 TextboxCorner.CornerRadius = UDim.new(0, 5)
		 TextboxCorner.Name = "TextboxCorner"
		 TextboxCorner.Parent = Textbox

		 Textboxx.Name = "Textboxx"
		 Textboxx.Parent = Textbox
		 Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		 Textboxx.Position = UDim2.new(0, 1, 0, 1)
		 Textboxx.Size = UDim2.new(0, 468, 0, 29)

		 TextboxxCorner.CornerRadius = UDim.new(0, 5)
		 TextboxxCorner.Name = "TextboxxCorner"
		 TextboxxCorner.Parent = Textboxx

		 TextboxLabel.Name = "TextboxLabel"
		 TextboxLabel.Parent = Textbox
		 TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 TextboxLabel.BackgroundTransparency = 1.000
		 TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
		 TextboxLabel.Text = text
		 TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
		 TextboxLabel.Font = Enum.Font.GothamSemibold
		 TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
		 TextboxLabel.TextSize = 16.000
		 TextboxLabel.TextTransparency = 0
		 TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

		 txtbtn.Name = "txtbtn"
		 txtbtn.Parent = Textbox
		 txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 txtbtn.BackgroundTransparency = 1.000
		 txtbtn.Position = UDim2.new(0, 1, 0, 1)
		 txtbtn.Size = UDim2.new(0, 468, 0, 29)
		 txtbtn.Font = Enum.Font.SourceSans
		 txtbtn.Text = ""
		 txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
		 txtbtn.TextSize = 14.000

		 RealTextbox.Name = "RealTextbox"
		 RealTextbox.Parent = Textbox
		 RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		 RealTextbox.BackgroundTransparency = 0
		 RealTextbox.Position = UDim2.new(0, 360, 0, 4)
		 RealTextbox.Size = UDim2.new(0, 100, 0, 24)
		 RealTextbox.Font = Enum.Font.GothamSemibold
		 RealTextbox.Text = ""
		 RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
		 RealTextbox.TextSize = 11.000
		 RealTextbox.TextTransparency = 0

		 RealTextbox.FocusLost:Connect(function()
			 callback(RealTextbox.Text)
			 if disappear then
				 RealTextbox.Text = ""
			 end
		 end)

		 UICorner.CornerRadius = UDim.new(0, 5)
		 UICorner.Parent = RealTextbox
	 end
	 function main:AddLabel(text)
		 local Label = Instance.new("TextLabel")
		 local PaddingLabel = Instance.new("UIPadding")
		 local labelfunc = {}
 
		 Label.Name = "Label"
		 Label.Parent = MainFramePage
		 Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 Label.BackgroundTransparency = 1.000
		 Label.Size = UDim2.new(0, 470, 0, 20)
		 Label.Font = Enum.Font.GothamSemibold
		 Label.TextColor3 = Color3.fromRGB(225, 225, 225)
		 Label.TextSize = 16.000
		 Label.Text = text
		 Label.TextXAlignment = Enum.TextXAlignment.Left

		 PaddingLabel.PaddingLeft = UDim.new(0,15)
		 PaddingLabel.Parent = Label
		 PaddingLabel.Name = "PaddingLabel"
 
		 function labelfunc:Set(newtext)
			 Label.Text = newtext
		 end
		 return labelfunc
	 end

	 function main:AddSeperator(text)
		 local Seperator = Instance.new("Frame")
		 local Sep1 = Instance.new("Frame")
		 local Sep2 = Instance.new("TextLabel")
		 local Sep3 = Instance.new("Frame")
		 
		 Seperator.Name = "Seperator"
		 Seperator.Parent = MainFramePage
		 Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 Seperator.BackgroundTransparency = 1.000
		 Seperator.Size = UDim2.new(0, 470, 0, 20)
		 
		 Sep1.Name = "Sep1"
		 Sep1.Parent = Seperator
		 Sep1.BackgroundColor3 = _G.Color
		 Sep1.BorderSizePixel = 0
		 Sep1.Position = UDim2.new(0, 0, 0, 10)
		 Sep1.Size = UDim2.new(0, 80, 0, 1)
		 
		 Sep2.Name = "Sep2"
		 Sep2.Parent = Seperator
		 Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 Sep2.BackgroundTransparency = 1.000
		 Sep2.Position = UDim2.new(0, 185, 0, 0)
		 Sep2.Size = UDim2.new(0, 100, 0, 20)
		 Sep2.Font = Enum.Font.GothamSemibold
		 Sep2.Text = text
		 Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
		 Sep2.TextSize = 14.000
		 
		 Sep3.Name = "Sep3"
		 Sep3.Parent = Seperator
		 Sep3.BackgroundColor3 = _G.Color
		 Sep3.BorderSizePixel = 0
		 Sep3.Position = UDim2.new(0, 390, 0, 10)
		 Sep3.Size = UDim2.new(0, 80, 0, 1)
	 end

	 function main:AddLine()
		 local Linee = Instance.new("Frame")
		 local Line = Instance.new("Frame")
		 
		 Linee.Name = "Linee"
		 Linee.Parent = MainFramePage
		 Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		 Linee.BackgroundTransparency = 1.000
		 Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
		 Linee.Size = UDim2.new(0, 470, 0, 20)
		 
		 Line.Name = "Line"
		 Line.Parent = Linee
		 Line.BackgroundColor3 = _G.Color
		 Line.BorderSizePixel = 0
		 Line.Position = UDim2.new(0, 0, 0, 10)
		 Line.Size = UDim2.new(0, 470, 0, 1)
	 end
	 return main
 end
 return uitab
end


local ScreenGui1 = Instance.new("ScreenGui")
local ImageButton1 = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui1.Name = "ImageButton"
ScreenGui1.Parent = game.CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton1.Parent = ScreenGui1
ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton1.BorderSizePixel = 0
ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton1.Size = UDim2.new(0, 50, 0, 50)
ImageButton1.Draggable = true
ImageButton1.Image = "http://www.roblox.com/asset/?id=12523036534"
ImageButton1.MouseButton1Down:connect(function()
game:GetService("VirtualInputManager"):SendKeyEvent(true,305,false,game)
game:GetService("VirtualInputManager"):SendKeyEvent(false,305,false,game)
end)
UICorner.Parent = ImageButton1

local Library = DarkraiX:Window("Trùm FF Hub","Bắn FF","Trùm FF Hub",Enum.KeyCode.RightControl);

local Main = Library:AddTab("Main","")

Main:AddSeperator("🍃 Bay Đầu🍃")


Main:AddButton("Aimlock",function(t)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer
    local Mouse = game.Players.LocalPlayer:GetMouse()
    local CamlockState = false
    local Prediction = 0.16
    local HorizontalPrediction = 0.17
    local VerticalPrediction = 0.14
    local XPrediction = 8.381
    local YPrediction = 7.282
    local Players = game:GetService("Players")	
    local LP = Players.LocalPlayer	
    local Mouse = LP:GetMouse()	
    local Locked = true
    getgenv().Key = "c"
    function FindNearestEnemy()
        local ClosestDistance, ClosestPlayer = math.huge, nil
        local CenterPosition =
            Vector2.new(
            game:GetService("GuiService"):GetScreenResolution().X / 2,
            game:GetService("GuiService"):GetScreenResolution().Y / 2
        )
        for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
            if Player ~= LocalPlayer then
                local Character = Player.Character
                if Character and Character:FindFirstChild("HumanoidRootPart") and Character.Humanoid.Health > 0 then
                    local Position, IsVisibleOnViewport =
                        game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
                    if IsVisibleOnViewport then
                        local Distance = (CenterPosition - Vector2.new(Position.X, Position.Y)).Magnitude
                        if Distance < ClosestDistance then
                            ClosestPlayer = Character.HumanoidRootPart
                            ClosestDistance = Distance
                        end
                    end
                end
            end
        end
        return ClosestPlayer
    end
    local enemy = nil
    -- Function to aim the camera at the nearest enemy's HumanoidRootPart
    RunService.Heartbeat:Connect(
        function()
            if CamlockState == true then
                if enemy then
                    local camera = workspace.CurrentCamera
                    camera.CFrame = CFrame.new(camera.CFrame.p, enemy.Position + enemy.Velocity * Prediction)
                end
            end
        end
    )
    Mouse.KeyDown:Connect(function(k)	
        if k == getgenv().Key then	
                Locked = not Locked	
                if Locked then	
                    enemy = FindNearestEnemy()
                    CamlockState = true
                 else	
                    if enemy ~= nil then	
                        enemy = nil	
                        CamlockState = false
                    end	
                end	
        end	
     end)
    local BladLock = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Logo = Instance.new("ImageLabel")
    local TextButton = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    --Properties:
    BladLock.Name = "BladLock"
    BladLock.Parent = game.CoreGui
    BladLock.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Frame.Parent = BladLock
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.133798108, 0, 0.20107238, 0)
    Frame.Size = UDim2.new(0, 202, 0, 70)
    Frame.Active = true
    Frame.Draggable = true
    local function TopContainer()
        Frame.Position = UDim2.new(0.5, -Frame.AbsoluteSize.X / 2, 0, -Frame.AbsoluteSize.Y / 2)
    end
    TopContainer()
    Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(TopContainer)
    UICorner.Parent = Frame
    Logo.Name = "Logo"
    Logo.Parent = Frame
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 5.000
    Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0.326732665, 0, 0, 0)
    Logo.Size = UDim2.new(0, 70, 0, 70)
    Logo.Image = "rbxassetid://77535718993641"
    Logo.ImageTransparency = 0.200
    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.BackgroundTransparency = 5.000
    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0.0792079195, 0, 0.18571429, 0)
    TextButton.Size = UDim2.new(0, 170, 0, 44)
    TextButton.Font = Enum.Font.SourceSansSemibold
    TextButton.Text = "Toggle CamLock"
    TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextButton.TextScaled = true
    TextButton.TextSize = 14.000
    TextButton.TextWrapped = true
    local state = true
    TextButton.MouseButton1Click:Connect(
        function()
            state = not state
            if not state then
                TextButton.Text = "Bật"
                CamlockState = true
                enemy = FindNearestEnemy()
            else
                TextButton.Text = "Tắt"
                CamlockState = false
                enemy = nil
            end
        end
    )
    -- Function to hide the loading screen after a certain duration
    local function HideLoadingScreen()
        LoadingScreen:Destroy()
    end    
	end)


    Main:AddButton("EPS",function(t)
        local FillColor = Color3.fromRGB(0,255,0)
        local DepthMode = "AlwaysOnTop"
        local FillTransparency = 0.5
        local OutlineColor = Color3.fromRGB(0,255,0)
        local OutlineTransparency = 0
        
        local CoreGui = game:FindService("CoreGui")
        local Players = game:FindService("Players")
        local lp = Players.LocalPlayer
        local connections = {}
        
        local Storage = Instance.new("Folder")
        Storage.Parent = CoreGui
        Storage.Name = "Highlight_Storage"
        
        local function Highlight(plr)
            local Highlight = Instance.new("Highlight")
            Highlight.Name = plr.Name
            Highlight.FillColor = FillColor
            Highlight.DepthMode = DepthMode
            Highlight.FillTransparency = FillTransparency
            Highlight.OutlineColor = OutlineColor
            Highlight.OutlineTransparency = 0
            Highlight.Parent = Storage
            
            local plrchar = plr.Character
            if plrchar then
                Highlight.Adornee = plrchar
            end
        
            connections[plr] = plr.CharacterAdded:Connect(function(char)
                Highlight.Adornee = char
            end)
        end
        
        Players.PlayerAdded:Connect(Highlight)
        for i,v in next, Players:GetPlayers() do
            Highlight(v)
        end
        
        Players.PlayerRemoving:Connect(function(plr)
            local plrname = plr.Name
            if Storage[plrname] then
                Storage[plrname]:Destroy()
            end
            if connections[plr] then
                connections[plr]:Disconnect()
            end
        end)
    end)




    Main:AddButton("EPS NAME",function(t)
        local esp_settings = { 
            textsize = 27,
            colour = 255,0,0
        }
         
        local gui = Instance.new("BillboardGui")
        local esp = Instance.new("TextLabel",gui)
         
         
         
        gui.Name = "Cracked esp";
        gui.ResetOnSpawn = false
        gui.AlwaysOnTop = true;
        gui.LightInfluence = 0;
        gui.Size = UDim2.new(1.75, 0, 1.75, 0);
        esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        esp.Text = ""
        esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
        esp.BorderSizePixel = 4;
        esp.BorderColor3 = Color3.new(esp_settings.colour)
        esp.BorderSizePixel = 0
        esp.Font = "GothamSemibold"
        esp.TextSize = esp_settings.textsize
        esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour
         
        game:GetService("RunService").RenderStepped:Connect(function()
            for i,v in pairs (game:GetService("Players"):GetPlayers()) do
                if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil  then
                    esp.Text = "["..v.Name.."]"
                    gui:Clone().Parent = v.Character.Head
            end
        end
        end)
    end)



    Main:AddButton("FULL BRIGHT",function(t)
        game:GetService("Lighting").Brightness = 2
        game:GetService("Lighting").ClockTime = 14
        game:GetService("Lighting").FogEnd = 1000000
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end)


    Main:AddButton("INFINITE JUMP",function(t)
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end)



    Main:AddButton("FLY V3",function(t)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end)


    Main:AddButton("HITBOT",function(t)
        _G.HeadSize = 11
        _G.Disabled = true
         
        game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
        for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
        pcall(function()
        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
        v.Character.HumanoidRootPart.Transparency = 0.7
        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really white")
        v.Character.HumanoidRootPart.Material = "Neon"
        v.Character.HumanoidRootPart.CanCollide = false
        end)
        end
        end
        end
        end)
    end)
