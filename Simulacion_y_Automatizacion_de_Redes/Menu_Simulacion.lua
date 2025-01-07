require("Simulacion_y_Automatizacion_de_Redes.Simulacion_de_Subredes")
require("Simulacion_y_Automatizacion_de_Redes.Menu_de_Ip_y_Binan")
function Menu_Simulacion()
    os.execute("cls")
    print("Que trabajo le gustaria realizar?")
    print("------------------------")
    print("1) Simulador de subredes\n2) Conversor IP binario-decimal\nIngresa un numero\nq) Atras")
    while true do
        local selection = io.read()
        if selection == "1" then
            Simulacion_de_Subredes()
            break
        elseif selection == "2" then
            MenudeIpyBinan()
            break
        elseif selection == "q" then
            Menu()
            break
        end
    end
end