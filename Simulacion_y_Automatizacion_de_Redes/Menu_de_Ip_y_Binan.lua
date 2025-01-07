require("Simulacion_y_Automatizacion_de_Redes.IP_Binario")
require("Simulacion_y_Automatizacion_de_Redes.Binario_a_IP")
function MenudeIpyBinan()
    os.execute("cls")
    print("Elige una funcionalidad:\n1) De IP a binario\n2) De binario a IP\nq) Atras")
    while true do
        local select = io.read()
        if select == "1" then
            IP_Binario()
        elseif select == "2" then
            BinarioAIP()
        elseif select == "q" then
            Menu_Simulacion()
        else
            print("Argumento invalido.")
        end
    end
end