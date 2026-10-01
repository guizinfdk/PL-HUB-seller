--// ============================================
--// PAINEL DE KEY + SISTEMA DE VALIDAÇÃO
--// ============================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local SITE_URL = "https://pl-key-system.guizinz-creator-scripts.workers.dev"

local enviarRequisicao = request or http_request or (syn and syn.request)
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// ============================================
--// INTERFACE
--// ============================================

local oldGui = playerGui:FindFirstChild("KeyPanelGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyPanelGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local painel = Instance.new("Frame")
painel.Name = "Painel"
painel.Size = UDim2.new(0, 400, 0, 320)
painel.Position = UDim2.new(0.5, 0, 0.5, 0)
painel.AnchorPoint = Vector2.new(0.5, 0.5)
painel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
painel.BorderSizePixel = 0
painel.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = painel

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(60, 60, 80)
stroke.Thickness = 1.5
stroke.Parent = painel

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 38)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 26))
}
gradient.Rotation = 90
gradient.Parent = painel

local titulo = Instance.new("TextLabel")
titulo.Name = "Titulo"
titulo.Size = UDim2.new(1, 0, 0, 50)
titulo.Position = UDim2.new(0, 0, 0, 15)
titulo.BackgroundTransparency = 1
titulo.Text = "🔒 VERIFICAÇÃO DE KEY"
titulo.TextColor3 = Color3.fromRGB(240, 240, 255)
titulo.Font = Enum.Font.GothamBold
titulo.TextSize = 22
titulo.Parent = painel

local subtitulo = Instance.new("TextLabel")
subtitulo.Name = "Subtitulo"
subtitulo.Size = UDim2.new(1, -30, 0, 35)
subtitulo.Position = UDim2.new(0, 15, 0, 55)
subtitulo.BackgroundTransparency = 1
subtitulo.Text = "Insira sua key para continuar"
subtitulo.TextColor3 = Color3.fromRGB(150, 150, 170)
subtitulo.Font = Enum.Font.Gotham
subtitulo.TextSize = 13
subtitulo.TextWrapped = true
subtitulo.Parent = painel

local caixaTexto = Instance.new("TextBox")
caixaTexto.Name = "CaixaKey"
caixaTexto.Size = UDim2.new(0, 340, 0, 45)
caixaTexto.Position = UDim2.new(0.5, 0, 0, 100)
caixaTexto.AnchorPoint = Vector2.new(0.5, 0)
caixaTexto.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
caixaTexto.BorderSizePixel = 0
caixaTexto.Text = ""
caixaTexto.PlaceholderText = "Digite sua key aqui..."
caixaTexto.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
caixaTexto.TextColor3 = Color3.fromRGB(230, 230, 245)
caixaTexto.Font = Enum.Font.Gotham
caixaTexto.TextSize = 15
caixaTexto.ClearTextOnFocus = false
caixaTexto.Parent = painel

local cornerText = Instance.new("UICorner")
cornerText.CornerRadius = UDim.new(0, 8)
cornerText.Parent = caixaTexto

local strokeText = Instance.new("UIStroke")
strokeText.Color = Color3.fromRGB(70, 70, 95)
strokeText.Thickness = 1
strokeText.Parent = caixaTexto

local botaoVerificar = Instance.new("TextButton")
botaoVerificar.Name = "BotaoVerificar"
botaoVerificar.Size = UDim2.new(0, 340, 0, 45)
botaoVerificar.Position = UDim2.new(0.5, 0, 0, 165)
botaoVerificar.AnchorPoint = Vector2.new(0.5, 0)
botaoVerificar.BackgroundColor3 = Color3.fromRGB(60, 130, 220)
botaoVerificar.BorderSizePixel = 0
botaoVerificar.Text = "VERIFICAR ACESSO"
botaoVerificar.TextColor3 = Color3.fromRGB(255, 255, 255)
botaoVerificar.Font = Enum.Font.GothamBold
botaoVerificar.TextSize = 15
botaoVerificar.AutoButtonColor = true
botaoVerificar.Parent = painel

local cornerBtn1 = Instance.new("UICorner")
cornerBtn1.CornerRadius = UDim.new(0, 8)
cornerBtn1.Parent = botaoVerificar

local botaoGerar = Instance.new("TextButton")
botaoGerar.Name = "BotaoGerar"
botaoGerar.Size = UDim2.new(0, 340, 0, 45)
botaoGerar.Position = UDim2.new(0.5, 0, 0, 225)
botaoGerar.AnchorPoint = Vector2.new(0.5, 0)
botaoGerar.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
botaoGerar.BorderSizePixel = 0
botaoGerar.Text = "GERAR KEY"
botaoGerar.TextColor3 = Color3.fromRGB(200, 200, 220)
botaoGerar.Font = Enum.Font.GothamBold
botaoGerar.TextSize = 15
botaoGerar.AutoButtonColor = true
botaoGerar.Parent = painel

local cornerBtn2 = Instance.new("UICorner")
cornerBtn2.CornerRadius = UDim.new(0, 8)
cornerBtn2.Parent = botaoGerar

local strokeBtn2 = Instance.new("UIStroke")
strokeBtn2.Color = Color3.fromRGB(80, 80, 110)
strokeBtn2.Thickness = 1
strokeBtn2.Parent = botaoGerar

local rodape = Instance.new("TextLabel")
rodape.Name = "Rodape"
rodape.Size = UDim2.new(1, 0, 0, 20)
rodape.Position = UDim2.new(0, 0, 1, -25)
rodape.BackgroundTransparency = 1
rodape.Text = "PL Key System • Key válida por 24h"
rodape.TextColor3 = Color3.fromRGB(90, 90, 110)
rodape.Font = Enum.Font.Gotham
rodape.TextSize = 11
rodape.Parent = painel

local fechar = Instance.new("TextButton")
fechar.Name = "Fechar"
fechar.Size = UDim2.new(0, 28, 0, 28)
fechar.Position = UDim2.new(1, -38, 0, 10)
fechar.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
fechar.BorderSizePixel = 0
fechar.Text = "✕"
fechar.TextColor3 = Color3.fromRGB(220, 220, 240)
fechar.Font = Enum.Font.GothamBold
fechar.TextSize = 14
fechar.Parent = painel

local cornerFechar = Instance.new("UICorner")
cornerFechar.CornerRadius = UDim.new(0, 6)
cornerFechar.Parent = fechar

fechar.MouseButton1Click:Connect(function()
    painel.Visible = false
end)

--// Arrastar painel
local dragging, dragStart, startPos
painel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = painel.Position
    end
end)
painel.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        painel.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)
painel.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

--// ============================================
--// SISTEMA DE VALIDAÇÃO DE KEY
--// ============================================

local verificando = false
local autorizado = false
local encerrado = false
local tentativa = 0

local function mensagem(texto, erro)
    if encerrado then return end

    subtitulo.Text = texto
    subtitulo.TextColor3 = erro
        and Color3.fromRGB(255, 140, 140)
        or Color3.fromRGB(150, 230, 180)
end

local function atualizarBotao()
    if encerrado then return end

    botaoVerificar.Text = verificando
        and "VERIFICANDO..."
        or "VERIFICAR ACESSO"

    botaoVerificar.AutoButtonColor = not verificando
end

local function cancelar()
    encerrado = true
    tentativa = tentativa + 1
    verificando = false
end

screenGui.Destroying:Connect(cancelar)

painel:GetPropertyChangedSignal("Visible"):Connect(function()
    if not painel.Visible then
        cancelar()
    end
end)

--// Copiar link do site para gerar key
botaoGerar.MouseButton1Click:Connect(function()
    if encerrado or verificando or autorizado then return end

    local copiar = setclipboard or toclipboard

    if type(copiar) == "function" then
        local copiou = pcall(copiar, SITE_URL)

        if copiou then
            mensagem("Link copiado! Abra no navegador para gerar sua key.", false)
            return
        end
    end

    caixaTexto.Text = SITE_URL
    caixaTexto:CaptureFocus()
    caixaTexto.CursorPosition = #caixaTexto.Text + 1
    caixaTexto.SelectionStart = 1

    mensagem("Copie o link acima e abra no navegador.", false)
end)

local function verificarKey()
    if encerrado or verificando or autorizado then return end

    if type(enviarRequisicao) ~= "function" then
        mensagem("Seu executor não disponibilizou uma função HTTP compatível.", true)
        return
    end

    local key = caixaTexto.Text:match("^%s*(.-)%s*$") or ""

    if key == "" then
        mensagem("Cole sua key antes de verificar.", true)
        return
    end

    if #key ~= 67 or not key:match("^PL%-%x+$") then
        mensagem("Key em formato inválido. Copie a key completa do site.", true)
        return
    end

    verificando = true
    tentativa = tentativa + 1

    local tentativaAtual = tentativa

    atualizarBotao()
    mensagem("Consultando sua key no servidor...", false)

    task.delay(15, function()
        if encerrado or tentativa ~= tentativaAtual or not verificando then
            return
        end

        tentativa = tentativa + 1
        verificando = false

        atualizarBotao()
        mensagem("O servidor demorou a responder. Tente novamente.", true)
    end)

    task.spawn(function()
        local sucesso, resposta = pcall(function()
            return enviarRequisicao({
                Url = SITE_URL .. "/api/validate",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({
                    key = key
                })
            })
        end)

        if encerrado or tentativa ~= tentativaAtual then return end

        verificando = false
        atualizarBotao()

        if not sucesso or type(resposta) ~= "table" then
            mensagem("Falha na conexão. Confira sua internet e tente novamente.", true)
            return
        end

        local decodificou, dados = pcall(function()
            return HttpService:JSONDecode(resposta.Body or "")
        end)

        if not decodificou or type(dados) ~= "table" then
            mensagem("O servidor retornou uma resposta inválida.", true)
            return
        end

        local status = tonumber(resposta.StatusCode)

        if status == 200 and dados.ok == true and dados.valid == true then
            autorizado = true
            screenGui:Destroy()

            -- 🔑 AVISA O LOADER QUE PODE ABRIR O PAINEL
            _G.PL_HUB_KEY_OK = true

            return
        end

        if status == 429 then
            mensagem("Muitas tentativas. Aguarde um pouco e tente novamente.", true)
        elseif status and status >= 500 then
            mensagem("Servidor indisponível. Tente novamente mais tarde.", true)
        else
            mensagem(
                type(dados.error) == "string"
                    and dados.error
                    or "Key inválida ou vencida.",
                true
            )
        end
    end)
end

botaoVerificar.MouseButton1Click:Connect(verificarKey)

caixaTexto.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verificarKey()
    end
end)

print("[KeyPanel] Interface + validação de key carregadas com sucesso!")
