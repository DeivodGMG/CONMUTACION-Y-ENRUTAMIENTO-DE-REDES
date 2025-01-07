local function UpsError()
    print(":( Algo salio mal")
    print("----------------")
    print("1) Reintentar proceso\nq) Ir al Menu")
    while true do
      local selection = io.read()
      if selection == "1" then
        Simulacion_de_Subredes()
        break
      elseif selection == "q" then
        Menu_Simulacion()
        break
      end
    end
end
local function Start() --INICIO DEL PROGRAMA
local CIDR = 0
local DirecciondeRed = {0, 0, 0, 0}
local PesosdeBinarios = {1, 2, 4, 8, 16, 32, 64, 128}
local Ip = {} --IP DE ENTRADA
local EnterMascaradeRed = {} --MASCARA DE ENTRADA
local Numero
    local Octetos = { --IP EN BINARIO
        ["1"] = {},
        ["2"] = {},
        ["3"] = {},
        ["4"] = {}
    }
    local MascaradeRed = { --MASCARA EN BINARIO
        ["1"] = {},
        ["2"] = {},
        ["3"] = {},
        ["4"] = {}
    }
local MascaraRemasterizada = { --DIRECCION DE RED EN BINARIO
        ["1"] = {},
        ["2"] = {},
        ["3"] = {},
        ["4"] = {}
}
local RedBroudcast = {--GUARDAR EL BINARIO DEL BROUDCAST
        ["1"] = {},
        ["2"] = {},
        ["3"] = {},
        ["4"] = {}
}
local BroudcastFinal = {0, 0, 0, 0}--DE BINARIO A DECIMAL
    os.execute("cls")
    print("Paso 1: Ingresar una IPv4")
  for i = 1, 4,1 do
    local ok,mensaje = pcall(function ()
    print("Ingrese el octeto "..i)
    N = tonumber(io.read())
    Ip[i] = N
    for j = 1, 8, 1 do --OCHO PORQUE SON 8 BITS 
        if i == 1 then
          Octetos["1"][j] = math.floor(N % 2)
        N = N / 2
        elseif i == 2 then
          Octetos["2"][j] = math.floor(N % 2)
        N = N / 2
      elseif i == 3 then
        Octetos["3"][j] = math.floor(N % 2)
      N = N / 2
    elseif i == 4 then
      Octetos["4"][j] = math.floor(N % 2)
    N = N / 2
        end--IF
    end
  end)--pcall
  if ok == false then
    UpsError()
  break
  end
  end
  os.execute("cls")
  print("Paso 2: Registrar una mascara de subred")
  for i = 1, 4,1 do
   local ok,mensaje = pcall(function ()
    print("Ingrese el octeto "..i)
    N = tonumber(io.read())
    EnterMascaradeRed[i] = N
    for j = 1, 8, 1 do --OCHO PORQUE SON 8 BITS 
        if i == 1 then
          MascaradeRed["1"][j] = math.floor(N % 2)
        N = N / 2
        elseif i == 2 then
          MascaradeRed["2"][j] = math.floor(N % 2)
        N = N / 2
      elseif i == 3 then
        MascaradeRed["3"][j] = math.floor(N % 2)
      N = N / 2
    elseif i == 4 then
      MascaradeRed["4"][j] = math.floor(N % 2)
    N = N / 2
        end--IF
    end
  end)--pcall

  if ok == false then
    UpsError()
  break
  end
  end

for i = 1, 4, 1 do --ASIGNACION DE UNOS Y CEROS
    for j = 1, 8, 1 do
      if MascaradeRed[tostring(i)][j] == 1 then
        CIDR = CIDR + 1
      end
        if Octetos[tostring(i)][j] == 1 and MascaradeRed[tostring(i)][j] == 1 then
           table.insert(MascaraRemasterizada[tostring(i)], j, 1)
           else
            table.insert(MascaraRemasterizada[tostring(i)], j, 0)
        end
    end
end
for i = 1, 4, 1 do --OCTETOS
    Numero = 0
    for j = 8, 1, -1 do --BINARIO A DECIMAL
        if MascaraRemasterizada[tostring(i)][j] == 1 then
            Numero = Numero + PesosdeBinarios[j]
        end
    end
    DirecciondeRed[i] = Numero
end

for i = 1, 4, 1 do --DECIFRAR LA RED DE BRADCAST  
    for j = 1, 8, 1 do
        RedBroudcast[tostring(i)][j] = MascaraRemasterizada[tostring(i)][j]
        if MascaradeRed[tostring(i)][j] == 0 then
            RedBroudcast[tostring(i)][j] = 1
        end
    end
end  

for i = 1, 4, 1 do --OCTETOS
    Numero = 0
    for j = 8, 1, -1 do --BINARIO A DECIMAL
        if RedBroudcast[tostring(i)][j] == 1 then
            Numero = Numero + PesosdeBinarios[j]
        end
    end
    BroudcastFinal[i] = Numero
end

os.execute("cls")
  print("** Resultados **") --RESULTADOS
  io.write("- IP de entrada: ")
  for i = 1, 4, 1 do
    io.write(Ip[i])
    if i < 4 then
        io.write(".")
    end
  end
print("")
io.write("- Mascara de subred registrada: ")
for i = 1, 4, 1 do
    io.write(EnterMascaradeRed[i])
    if i < 4 then
        io.write(".")
    end
  end
print("")
io.write("- IP en formato binario: ")

  for i = 1, 4, 1 do --MODULO DE TRANSFORMACION
    for j = 8, 1, -1 do
      if i == 1 then
        io.write(Octetos["1"][j])
      elseif i == 2 then
        io.write(Octetos["2"][j])
    elseif i == 3 then
      io.write(Octetos["3"][j])
  elseif i == 4 then
    io.write(Octetos["4"][j])
      end--IF
    end
    if i < 4 then
      io.write(".")
    end
  end
  print("")
  io.write("- Mascara en formato binario: ")

  for i = 1, 4, 1 do --MODULO DE TRANSFORMACION
    for j = 8, 1, -1 do
      if i == 1 then
        io.write(MascaradeRed["1"][j])
      elseif i == 2 then
        io.write(MascaradeRed["2"][j])
    elseif i == 3 then
      io.write(MascaradeRed["3"][j])
  elseif i == 4 then
    io.write(MascaradeRed["4"][j])
      end--IF
    end
    if i < 4 then
      io.write(".")
    end
  end
print("")
print("--------------------------------------------------")

io.write("- Direccion de red: ")
for i = 1, 4, 1 do
    io.write(DirecciondeRed[i])
    if i < 4 then
        io.write(".")
  end
end
print("")
io.write("- Direccion de broadcast: ")
for i = 1, 4, 1 do
    io.write(BroudcastFinal[i])
    if i < 4 then
        io.write(".")
  end
end

print("")
io.write("- Mascara en formato CIDR: "..CIDR)
print("")
io.write("- Rango de hosts: ")
DirecciondeRed[4] = DirecciondeRed[4] + 1
BroudcastFinal[4] = BroudcastFinal[4] - 1
for i = 1, 4, 1 do
    io.write(DirecciondeRed[i])
    if i < 4 then
        io.write(".")
  end
end
  io.write(" - ")
for i = 1, 4, 1 do
    io.write(BroudcastFinal[i])
    if i < 4 then
        io.write(".")
  end
end
print("")
io.write("- Hosts disponibles: "..BroudcastFinal[4])
  end--FUNCION START
function Simulacion_de_Subredes()
    os.execute("cls")
print("Calcula subredes a partir de una IP y mascara de red.\nMuestra el rango de direcciones, mascara en notacion CIDR,\ndireccion de red y el Broadcast.")
print("1) Continuar\nq) Atras")
while true do
    local selection = io.read()
    if selection == "1" then
      Start()
      break
    elseif selection == "q" then
        Menu_Simulacion()
            break
    else
        print("Argumento invalido.")
    end
end


    --MANAGER
end