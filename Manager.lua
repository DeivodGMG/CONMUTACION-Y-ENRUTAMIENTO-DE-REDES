Errorsito = function ()
    print("Algo salio mal :(\nq) Regresar al menu")
    while true do
        local select = io.read()
        if select == "q" then
            Menu()
        end
    end
end

FinaldeIPaBinario = function ()
    print("1) Reintentar proceso\nq) Regresar al menu")
    while true do
        local selection = io.read()
        if selection == "1" then
          IP_Binario()
          break
        elseif selection == "q" then
          Menu()
          break
        end
      end
end

FinaldeBinarioaIP = function ()
  print("1) Reintentar proceso\nq) Regresar al menu")
  while true do
      local selection = io.read()
      if selection == "1" then
        BinarioAIP()
        break
      elseif selection == "q" then
        Menu()
        break
      end
    end
end