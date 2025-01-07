require("Simulacion_y_Automatizacion_de_Redes.Menu_Simulacion")
require("Manager")
function Menu()
    os.execute("cls")
    print("*** CONMUTACION Y ENRUTAMIENTO DE REDES ***")
    print("-------------------------------------------")
    print("1) Iniciar\nq) Salir")
    while true do
        local selection = io.read()
        if selection == "1" then
           Menu_Simulacion()
            break
        elseif selection == "q" then
            os.exit()
        else
            print("Argumento invalido.")
        end
    end
end
Menu()