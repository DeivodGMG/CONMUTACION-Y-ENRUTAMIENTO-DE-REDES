require("Manager")
function BinarioAIP()
    os.execute("cls")
    local PesoBits = {128, 64, 32, 16, 8, 4, 2, 1}
    local IPBinaria = {
        ["1"] = "",
        ["2"] = "",
        ["3"] = "",
        ["4"] = ""
    }
    local IpFinal = {0, 0, 0, 0}
    for i = 1, 4, 1 do
        print("Ingrese los 8 bits del Octeto "..i..":")
        local ok,mensajeError = pcall(function ()
        local select = tonumber(io.read())
        local verify = select + 0
        local text = tostring(select)
        IPBinaria[tostring(i)] = text
        for j = 1, 8, 1 do
            if string.sub(text, j, j) == "1" then
                    IpFinal[i] = IpFinal[i] + PesoBits[j]
            end
        end
    end)
    if ok == false then
        print(mensajeError)
        Errorsito()
    end
    end
print("------------------------------------")
print("Aqui esta tu binario a formato IP:")
for i = 1, 4, 1 do
    io.write(IpFinal[i])
    if i < 4 then
        io.write(".")
    end
end
print("")
FinaldeBinarioaIP()
end-- LA FUNCION