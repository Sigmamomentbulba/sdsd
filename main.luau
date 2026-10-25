local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/Orion/Source.lua')))()
local Run = game:GetService("RunService")
local Window = OrionLib:MakeWindow({IntroText = "Бан батлс 👏", IntroIcon = "rbxassetid://15315284749",Name = ("Граб Лаггер - Slap Battles 👏".." | ".. identifyexecutor()),IntroToggleIcon = "rbxassetid://7734091286", HidePremium = false, SaveConfig = false, IntroEnabled = true})

local bypass
local success, errorMsg = pcall(function()
    bypass = hookmetamethod(game, "__namecall", function(method, ...) 
        if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
            return
        end
        return bypass(method, ...)
    end)
end)

if not success then
    OrionLib:MakeNotification({Name = "Предупреждение",Content = "Ваш чит не поддерживает функции защиты от античита слеп батлса.",Image = "rbxassetid://7733658504",Time = 15})
end


local function EquipGlove(Glove)
	for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
      -- Check if the name contains the character '{'
      if v.Name:find("{") then
          local args = {
              [1] = Glove,
			  [2] = true
          }
  
          -- Check if v is a RemoteEvent and can FireServer
          if v:IsA("RemoteEvent") then
              v:FireServer(unpack(args))
          elseif v:IsA("RemoteFunction") then
              -- If it's a RemoteFunction, use InvokeServer
              local result = v:InvokeServer(unpack(args))
              print("Result from InvokeServer:", result)  -- Optional: Print the result
          else
              print("v is neither a RemoteEvent nor a RemoteFunction.")
          end
      end
  end
end
local Tab = Window:MakeTab({
	Name = "Информация",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Новый лучший скрипт!")
Tab:AddLabel("Милена шлюха")

Tab:AddButton({
	Name = "Закрыть меню",
	Callback = function()
      		OrionLib:Destroy()
  	end    
})

local ScritpsTab = Window:MakeTab({
	Name = "Скрипты",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ScritpsTab:AddButton({
	Name = "Флинг",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/n0kc/AtomicHub/main/Script.lua'))()
  	end    
})
ScritpsTab:AddButton({
	Name = "Infinity Yield",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  	end    
})


local LagTab = Window:MakeTab({
	Name = "Лаггер",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
_G.Lagger = false
LagTab:AddToggle({
	Name = "Врубить лаггер",
	Default = false,
	Callback = function(Value)
		_G.Lagger = Value
	end    
})
Run.RenderStepped:Connect(function()
if _G.Lagger then
    for i=1, 20 do
        game:GetService("ReplicatedStorage").GeneralAbility:FireServer("addglove")
    end
end
end)


local AntiLagTab = Window:MakeTab({
	Name = "АнтиЛаг",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

_G.AntiLagger = false
AntiLagTab:AddToggle({
	Name = "Врубить антилаггер",
	Default = false,
	Callback = function(Value)
		_G.AntiLagger = Value
	end    
})
Run.RenderStepped:Connect(function()
if _G.AntiLagger then
    task.spawn(function()
        for _, obj in pairs(game.Players:GetPlayers()) do
for _, obj1 in pairs(obj.Character:GetChildren()) do
if obj1.Name == "grabhand" then
obj1:Destroy()
end
end
end
    end)
end
end)

local HelpTab = Window:MakeTab({
	Name = "Вспомогательное",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local last_glove = "Default"
HelpTab:AddButton({
	Name = "Стать невидимым(1 раз нажми, призрак сам возьмётся)",
	Callback = function()
            last_glove = game.Players.LocalPlayer.leaderstats.Glove.Value
      		EquipGlove("Ghost")
            game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
            EquipGlove(last_glove)
  	end    
})
HelpTab:AddButton({
	Name = "Взять граб",
	Callback = function()
            EquipGlove("Grab")
  	end    
})

HelpTab:AddButton({
	Name = "Тп к хантеру наверх",
	Callback = function()
      		game.Players.LocalPlayer.Character:MoveTo(Vector3.new(17880.849609375, -2.5070173740386963, -3561.41064453125))
  	end    
})
