require("Manager")
function IP_Binario()
  os.execute("cls")
  Octetos = {
    ["1"] = {},
    ["2"] = {},
    ["3"] = {},
    ["4"] = {}
}
for i = 1, 4,1 do
  ok,mensaje = pcall(function ()
  print("Ingrese el octeto "..i)
  N = tonumber(io.read())
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
  Errorsito()
break
end
end
print("--------------------------------------")
print("Aqui esta tu IP en formato binario:")
for i = 1, 4, 1 do
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
FinaldeIPaBinario()
end--FUNCION PRINCIPAL