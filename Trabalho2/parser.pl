import math
import pandas as pd

# Read the CSV file
df = pd.read_csv("../data/paragem_autocarros_oeiras_processado_4.csv", sep=";")

# Open the knowledge database file
f = open("../state.pl", "w")
# Write to the knowledge database file
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n")
f.write("% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3\n\n")
f.write("% Base de conhecimento\n\n")
f.write("% @author Joel Alexandre Dias Ferreira - A89982\n\n")
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n\n\n")
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n")
f.write("%       BASE CONHECIMENTO\n")
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n\n\n")
# Write the predicates
f.write(
    "%----Paragem: #Gid,Lat,Long,Estado,Tipo,Publicidade,Operadora,Carreiras,CodigoRua,NomeRua,Freguesia -> {V,F}\n\n")


def truncate(number, digits) -> float:
    stepper = 10.0 ** digits
    return math.trunc(stepper * number) / stepper


for index, row in df.iterrows():
    if not (pd.isna(row['gid']) or pd.isna(row['latitude']) or pd.isna(row['longitude'])):
        f.write("paragem(" + str(row['gid']) + ", " + str(truncate(row['latitude'], 2)) + ", " +
                str(truncate(row['longitude'], 2)) + ", '" + row['Estado de Conservacao'] + "', '" +
                str(row['Tipo de Abrigo']) + "', '" + row['Abrigo com Publicidade?'] + "', '" +
                row['Operadora'] + "', [" + row['Carreira'] + "], " + str(row['Codigo de Rua']) + ", \"" +
                str(row['Nome da Rua']).replace("Rua Pedro Álvares Cabral", "Rua Pedro Alvares Cabral") + "\", \"" +
                str(row['Freguesia']).replace("Algés, Linda-a-Velha e Cruz Quebrada-Dafundo",
                                              "Alges Linda-a-Velha e Cruz Quebrada-Dafundo") + "\").\n")

# Write the predicate for the bus route connections
f.write(
    "\n\n%----Arco: #IdParagemOrigem,IdParagemDestino,Distancia,Carreira,Operadoras,Publicidade,Abrigo -> {V,F}\n\n")
excel_file = "../data/lista_adjacencias_paragens.xlsx"
readed_excel_file = pd.ExcelFile(excel_file)

for sheet in readed_excel_file.sheet_names:
    df = pd.read_excel(excel_file, sheet_name=sheet)
    for (index1, row1), (index2, row2) in zip(df[:-1].iterrows(), df[1:].iterrows()):
        if not (pd.isna(row1['gid']) or pd.isna(row2['gid']) or pd.isna(row1['latitude']) or pd.isna(
                row2['latitude']) or
                pd.isna(row1['longitude']) or pd.isna(row2['longitude']) or pd.isna(row1['Operadora']) or
                pd.isna(row2['Operadora']) or pd.isna(row1['Abrigo com Publicidade?']) or
                pd.isna(row2['Abrigo com Publicidade?']) or pd.isna(row1['Tipo de Abrigo']) or
                pd.isna(row2['Tipo de Abrigo'])):
            f.write("arco(" + str(row1['gid']) + ", ")
            f.write(str(row2['gid']) + ", ") + f.write(str(
                (truncate(
                    math.sqrt(
                        math.pow(row2['latitude'] - row1['latitude'], 2) + math.pow(
                            row2['longitude'] - row1['longitude'],
                            2)) / 1000, 3))) + ", ")
            f.write(sheet + ", ")
            if row1['Operadora'] == row2['Operadora']:
                f.write("['" + row1['Operadora'] + "'], ")
            else:
                f.write("['" + row1['Operadora'] + "', '" + row2['Operadora'] + "'], ")
            if row1['Abrigo com Publicidade?'] == 'Yes' and row2['Abrigo com Publicidade?'] == 'Yes':
                f.write("'Yes', ")
            else:
                f.write("'No', ")
            if row1['Tipo de Abrigo'] == row2['Tipo de Abrigo']:
                f.write(f"'{row1['Tipo de Abrigo']}'")
            else:
                f.write("'Sem Abrigo'")
            f.write(").\n")
f.close()

# Write the schedules

# Open the knowledge database file for the schedules
f = open("../schedules.pl", "w")

# Write to the knowledge database file
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n")
f.write("% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3\n\n")
f.write("% Base de conhecimento de horários\n\n")
f.write("% @author Joel Alexandre Dias Ferreira - A89982\n\n")
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n\n\n")
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n")
f.write("%       BASE CONHECIMENTO HORÁRIOS\n")
f.write("%--------------------------------- - - - - - - - - - -  -  -  -  -   -\n\n\n")
# Write the predicates
f.write(
    "%----HorarioPassagem: #IdCarreira,ListaParagemPassagem -> {V,F}\n\n")

initialHour = 6  # initial hour
finalHour = 24  # final hour
incrementBusRoutes = 15  # minutes
currentHourBusRoutes = 6  # current hour
currentMinutesBusRoutes = 0  # current minutes

# dictionary that contains the full time for each bus route
busRouteDuration = {}

for sheet in readed_excel_file.sheet_names:
    df = pd.read_excel(excel_file, sheet_name=sheet)
    currentHourBusStops = currentHourBusRoutes
    f.write("horarioPassagem(" + sheet + ", [")
    duration = 0.0
    horariosCarreira = "partidas(" + sheet + ", ["
    currentIndex = 1
    hour = 0
    minutes = 0
    for (index1, row1), (index2, row2) in zip(df[:-1].iterrows(), df[1:].iterrows()):
        currentIndex += 1
        if not (pd.isna(row1['gid']) or pd.isna(row1['latitude']) or pd.isna(row2['latitude'])):
            f.write("(" + str(row1['gid']) + ", '" + f"{hour:02d}h" + ":" + f"{minutes:02d}m" + "')")

            duration += (math.sqrt(math.pow(row2['latitude'] - row1['latitude'], 2) +
                                   math.pow(row2['longitude'] - row1['longitude'], 2)) / 1000) * 2

            if duration < 60.0:
                minutes = int(math.ceil(duration))
            else:
                hour = int(math.ceil(duration / 60))
                minutes = int((duration / 60) - hour) * 100

            if currentIndex == df.shape[0]:
                f.write(", (" + str(row2['gid']) + ", '" + f"{hour:02d}h" + ":" + f"{minutes:02d}m" + "')]).\n")
            else:
                f.write(", ")
    valid = True
    first = True
    while valid:
        hour = 0
        minutes = 0
        if duration < 60:
            minutes = int(math.ceil(duration))
        else:
            hour = int(math.ceil(duration / 60))
            minutes = int((duration / 60) - hour) * 100

        if not ((currentHourBusRoutes + hour > finalHour) or (currentHourBusRoutes == 23 and
                                                              currentMinutesBusRoutes + minutes > 60) or
                (currentHourBusRoutes + hour == finalHour and currentMinutesBusRoutes + minutes > 0)):
            horariosCarreira = horariosCarreira + f"'{currentHourBusRoutes:02d}" + ":" + \
                               f"{currentMinutesBusRoutes:02d}', "
        else:
            valid = False
        currentMinutesBusRoutes += incrementBusRoutes
        if currentMinutesBusRoutes == 60:
            currentMinutesBusRoutes = 0
            currentHourBusRoutes += 1
    horariosCarreira = horariosCarreira[:-2]
    horariosCarreira = horariosCarreira + "]).\n"
    busRouteDuration[sheet] = horariosCarreira
    currentHourBusRoutes = initialHour
    currentMinutesBusRoutes = 0


f.write(
    "\n\n%----Partidas: #IdCarreira,ListaHorariosPartidas -> {V,F}\n\n")
# Write the bus starts to the file
for key in busRouteDuration:
    f.write(busRouteDuration[key])
f.close()


