--[[
    PL-HUB - Loader (SEM Key System)
    Ordem: Tela de Carregamento → Painel Principal
]]

local BASE = "https://raw.githubusercontent.com/guizinfdk/PL-HUBv4.5/refs/heads/main/"

-- 1. TELA DE CARREGAMENTO
local ok1, err1 = pcall(function()
    loadstring(game:HttpGet(BASE .. "carregamento.lua"))()
end)
if not ok1 then
    warn("[PL-HUB] Erro na tela de carregamento: " .. tostring(err1))
end

task.wait(2) -- ajuste se sua tela demorar mais

-- 2. PAINEL PRINCIPAL
local ok2, err2 = pcall(function()
    loadstring(game:HttpGet(BASE .. "main.lua"))()
end)
if not ok2 then
    warn("[PL-HUB] Erro no painel principal: " .. tostring(err2))
end
