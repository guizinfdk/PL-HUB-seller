--[[
    PL-HUB - Loader
    Ordem: Tela de Carregamento → Verificação de Key → Painel Principal
]]

local BASE = "https://raw.githubusercontent.com/guizinfdk/PL-HUB-seller/refs/heads/main/"

-- 1. TELA DE CARREGAMENTO
local ok1, err1 = pcall(function()
    loadstring(game:HttpGet(BASE .. "carregamento.lua"))()
end)
if not ok1 then
    warn("[PL-HUB] Erro na tela de carregamento: " .. tostring(err1))
end

-- 2. Espera a tela de carregamento terminar
task.wait(2) -- ajuste se sua tela demorar mais

-- 3. VERIFICAÇÃO DE KEY
local ok2, err2 = pcall(function()
    loadstring(game:HttpGet(BASE .. "keySysten.lua"))()
end)
if not ok2 then
    warn("[PL-HUB] Erro na verificação de key: " .. tostring(err2))
end

-- 4. Espera a verificação de key terminar
task.wait(2) -- ajuste se a verificação demorar mais

-- 5. PAINEL PRINCIPAL
local ok3, err3 = pcall(function()
    loadstring(game:HttpGet(BASE .. "main.lua"))()
end)
if not ok3 then
    warn("[PL-HUB] Erro no painel principal: " .. tostring(err3))
end
