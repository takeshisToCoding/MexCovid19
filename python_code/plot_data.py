import numpy
import pandas as pd
import numpy  as np 
import matplotlib.pyplot as plt


def main():
    print("Reading the CSV file [casos acumulados y nuevos por dia]...")
    df = pd.read_csv("../data/casos_totales.csv")
    ##############################################
    ######## CASOS Y DEFUNCIONES ACUMULADAS ######
    ax = plt.gca()
    df.plot(x="FECHA", y="Casos Confirmados", kind = 'line', ax=ax)
    df.plot(x="FECHA", y="Muertes", kind = 'line', color="red", ax=ax)
    plt.axis('off')
    df.plot(x="FECHA", y="Casos Confirmados", kind = 'bar', legend=False, ax=ax)
    df.plot(x="FECHA", y="Muertes", kind = 'bar', color="red",ax=ax,
            title="Casos acumulados", grid=True, legend=False, figsize=(12, 8) ) 
    plt.axis('on')
    plt.tick_params(axis='x', labelsize=6)
    plt.tick_params(axis='y', labelsize=12)

    ##############################################
    ######## CASOS Y DEFUNCIONES ACUMULADAS ######
    df.plot(x="FECHA", y="casosNuevosDia", kind = 'bar', ylim=(0, 500))
    ax_1 = plt.gca()
    df.plot(x="FECHA", y="muertesNuevasDia", kind = 'bar', ylim=(0, 500),
            color="red", ax=ax_1,
            title="Casos nuevos por dia", grid=True,  figsize=(12, 8) ) 
    plt.axis('on')
    plt.tick_params(axis='x', labelsize=6)
    plt.tick_params(axis='y', labelsize=12)

    ###################################################
    ######## CASOS AMBULATORIOS Y HOSPITALIZADOS ######
    print("Reading the CSV file [casos ambulatorios, hospitalizados]...")
    df_hospitalizados = pd.read_csv("../data/casos_ambulatorios_hospitalizados.csv")
    df_hospitalizados.plot(x="Fecha", y="TotalCasosConfirmados", kind = 'bar', ylim=(0, 4000),
                           color="green")
    ax_2 = plt.gca()
    df_hospitalizados.plot(x="Fecha", y="Ambulatorio", kind = 'bar', ylim=(0, 4000),
                           color="blue", 
                           title="Casos confirmados contra casos ambulatorios (Acumulados)",
                           grid=True, figsize=(12, 8),
                           ax=ax_2)
    plt.tick_params(axis='x', labelsize=6)  
    plt.tick_params(axis='y', labelsize=12)

    ##########
    df_hospitalizados.plot(x="Fecha", y="TotalCasosConfirmados", kind = 'bar', ylim=(0, 4000),
                           color="green")
    ax_3 = plt.gca()
    df_hospitalizados.plot(x="Fecha", y="TotalHospitalizados", kind = 'bar', ylim=(0, 4000),
                           color="red", 
                           title="Casos confirmados contra casos hospitalizados (Acumulados)",
                           grid=True, figsize=(12, 8),
                           ax=ax_3)
    plt.tick_params(axis='x', labelsize=6)  
    plt.tick_params(axis='y', labelsize=12)

    ##########
    df_hospitalizados[["Fecha",
                       "TotalHospitalizados(%)",
                       "Ambulatorio(%)",]].plot(
                           x="Fecha", kind = 'bar',
                           stacked=True, ylim=(0, 1.2),
                           color=[(0.5,0.4,0.5), (0.75, 0.75, 0.25)],
                           title="Porcentaje de casos ambulatorios (Sobre casos acumulados)",
                           grid=True, figsize=(12, 8))
    plt.tick_params(axis='x', labelsize=6)  
    plt.tick_params(axis='y', labelsize=12)

    ##########
    df_hospitalizados[["Fecha",
                       "HospitalizadoIntubado(TotalCasos)(%)",
                       "HospitalizadoGrave(TotalCasos)(%)",
                       "HospitalizadoEstable(TotalCasos)(%)",
                       "Ambulatorio(%)",]].plot(
                           x="Fecha", kind = 'bar',
                           stacked=True, ylim=(0, 1.2),
                           color=[(0.75,0.15,0.15), (0.9, 0.55, 0.15),
                                  (0.15, 0.6, 0.85), (0.25, 0.75, 0.25)],
                           title="Porcentaje de casos ambulatorios (Sobre casos acumulados)",
                           grid=True, figsize=(12, 8))
    plt.tick_params(axis='x', labelsize=6)  
    plt.tick_params(axis='y', labelsize=12)
    
    ##########
    df_hospitalizados[["Fecha",
                       "HospitalizadoIntubado(TotalHospitalizados)(%)",
                       "HospitalizadoGrave(TotalHospitalizados)(%)",
                       "HospitalizadoEstable(TotalHospitalizados) (%)"
                       ]].plot(
                           x="Fecha", kind = 'bar',
                           stacked=True, ylim=(0, 1.2),
                           color=[(0.8,0.3,0.3), (0.25, 0.75, 0.25), (0.25, 0.27, 0.75)],
                           title="Desglose de casos hospitalizados",
                           grid=True, figsize=(12, 8))
    plt.tick_params(axis='x', labelsize=6)  
    plt.tick_params(axis='y', labelsize=12)


    
    plt.show()
    return

if __name__=="__main__":
    main()
