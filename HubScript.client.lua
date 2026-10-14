
-- ELITE EGG | Interface v1.0

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local guiParent = player:WaitForChild("PlayerGui")

local old = guiParent:FindFirstChild("EliteEgg")
if old then old:Destroy() end

local roxo = Color3.fromRGB(145, 65, 255)
local fundo = Color3.fromRGB(18, 15, 27)
local painel = Color3.fromRGB(32, 26, 45)
local branco = Color3.fromRGB(245, 240, 255)

local gui = Instance.new("ScreenGui")
gui.Name = "EliteEgg"
gui.ResetOnSpawn = false
gui.Parent = guiParent

local janela = Instance.new("Frame")
janela.Name = "Janela"
janela.Size = UDim2.new(0.85, 0, 0.7, 0)
janela.Position = UDim2.new(0.5, 0, 0.5, 0)
janela.AnchorPoint = Vector2.new(0.5, 0.5)
janela.BackgroundColor3 = fundo
janela.Parent = gui

local limite = Instance.new("UISizeConstraint")
limite.MinSize = Vector2.new(300, 270)
limite.MaxSize = Vector2.new(650, 460)
limite.Parent = janela

local escala = Instance.new("UIScale")
escala.Parent = janela

local function arredondar(obj)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = obj
end

arredondar(janela)

local borda = Instance.new("UIStroke")
borda.Color = roxo
borda.Thickness = 2
borda.Parent = janela

local topo = Instance.new("TextLabel")
topo.Size = UDim2.new(1, -55, 0, 45)
topo.Position = UDim2.fromOffset(12, 0)
topo.BackgroundTransparency = 1
topo.Text = "👑 ELITE EGG"
topo.TextColor3 = branco
topo.TextSize = 20
topo.Font = Enum.Font.GothamBold
topo.TextXAlignment = Enum.TextXAlignment.Left
topo.Parent = janela

local esconder = Instance.new("TextButton")
esconder.Size = UDim2.fromOffset(38, 32)
esconder.Position = UDim2.new(1, -45, 0, 7)
esconder.Text = "—"
esconder.TextColor3 = branco
esconder.BackgroundColor3 = roxo
esconder.Parent = janela
arredondar(esconder)

local reabrir = Instance.new("TextButton")
reabrir.Size = UDim2.fromOffset(120, 42)
reabrir.Position = UDim2.new(0, 12, 0.5, -21)
reabrir.Text = "ELITE EGG"
reabrir.TextColor3 = branco
reabrir.BackgroundColor3 = fundo
reabrir.Visible = false
reabrir.Parent = gui
arredondar(reabrir)

esconder.Activated:Connect(function()
    janela.Visible = false
    reabrir.Visible = true
end)

reabrir.Activated:Connect(function()
    janela.Visible = true
    reabrir.Visible = false
end)

local menu = Instance.new("Frame")
menu.Position = UDim2.fromOffset(8, 52)
menu.Size = UDim2.new(0.32, -8, 1, -60)
menu.BackgroundColor3 = painel
menu.Parent = janela
arredondar(menu)

local conteudo = Instance.new("Frame")
conteudo.Position = UDim2.new(0.32, 4, 0, 52)
conteudo.Size = UDim2.new(0.68, -12, 1, -60)
conteudo.BackgroundColor3 = painel
conteudo.Parent = janela
arredondar(conteudo)

local paginas = {}
local botoes = {}

local function criarPagina(nome, titulo, descricao)
    local pagina = Instance.new("Frame")
    pagina.Name = nome
    pagina.Size = UDim2.fromScale(1, 1)
    pagina.BackgroundTransparency = 1
    pagina.Visible = false
    pagina.Parent = conteudo
    paginas[nome] = pagina

    local texto = Instance.new("TextLabel")
    texto.Position = UDim2.fromOffset(12, 15)
    texto.Size = UDim2.new(1, -24, 0, 38)
    texto.BackgroundTransparency = 1
    texto.Text = titulo
    texto.TextColor3 = branco
    texto.TextSize = 18
    texto.Font = Enum.Font.GothamBold
    texto.TextXAlignment = Enum.TextXAlignment.Left
    texto.Parent = pagina

    local desc = Instance.new("TextLabel")
    desc.Position = UDim2.fromOffset(12, 58)
    desc.Size = UDim2.new(1, -24, 0, 100)
    desc.BackgroundTransparency = 1
    desc.Text = descricao
    desc.TextColor3 = Color3.fromRGB(190, 180, 210)
    desc.TextSize = 14
    desc.TextWrapped = true
    desc.Font = Enum.Font.Gotham
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextYAlignment = Enum.TextYAlignment.Top
    desc.Parent = pagina
end

criarPagina("Home", "BEM-VINDO!", "ELITE EGG v1.0\nSeu hub de ferramentas e informações.")
criarPagina("Scanner", "EGG SCANNER", "Área para futuras informações dos ovos do seu próprio jogo.")
criarPagina("Stats", "ESTATÍSTICAS", "Aqui ficarão as estatísticas e os dados de rendimento.")
criarPagina("Settings", "CONFIGURAÇÕES", "Personalização e configurações do hub.")
criarPagina("Info", "SOBRE", "ELITE EGG\nVersão 1.0.0\nDesenvolvido no Roblox Studio.")

local function mostrar(nome)
    for n, pagina in pairs(paginas) do
        pagina.Visible = (n == nome)
    end
    for n, botao in pairs(botoes) do
        botao.BackgroundColor3 = n == nome and roxo or fundo
    end
end

local abas = {
    {"Home", "⌂  Home"},
    {"Scanner", "🥚  Egg Scanner"},
    {"Stats", "▤  Stats"},
    {"Settings", "⚙  Configurações"},
    {"Info", "ⓘ  Info"}
}

for i, aba in ipairs(abas) do
    local botao = Instance.new("TextButton")
    botao.Name = aba[1]
    botao.Size = UDim2.new(1, -12, 0, 38)
    botao.Position = UDim2.fromOffset(6, 8 + (i - 1) * 45)
    botao.BackgroundColor3 = fundo
    botao.Text = aba[2]
    botao.TextColor3 = branco
    botao.TextSize = 12
    botao.Font = Enum.Font.GothamMedium
    botao.TextWrapped = true
    botao.Parent = menu
    arredondar(botao)

    botoes[aba[1]] = botao
    botao.Activated:Connect(function()
        mostrar(aba[1])
    end)
end

mostrar("Home")

local camera = workspace.CurrentCamera

local function ajustar()
    if not camera then return end
    local v = camera.ViewportSize
    escala.Scale = math.clamp(
        math.min(v.X / 650, v.Y / 460),
        0.72,
        1
    )
end

if camera then
    ajustar()
    camera:GetPropertyChangedSignal("ViewportSize"):Connect(ajustar)
end

print("ELITE EGG carregado!")
