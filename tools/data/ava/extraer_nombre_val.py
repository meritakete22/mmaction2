import csv

# Nombre del archivo CSV con las anotaciones
csv_file = "../../../data/ava/annotations/ava_val_v2.2.csv"

# Conjunto para almacenar nombres de videos únicos
video_names = set()

# Leer el archivo CSV
with open(csv_file, 'r') as file:
    reader = csv.reader(file)
    for row in reader:
        # Suponiendo que el nombre del video está en la primera columna (índice 0)
        video_name = row[0]
        video_names.add(video_name)

# Convertir el conjunto a una lista (opcional, si quieres ordenarlos)
unique_video_names = list(video_names)

# Nombre del archivo de salida
output_file = '../../../data/ava/annotations/ava_val.txt'

# Guardar los nombres únicos en un archivo de texto
with open(output_file, 'w') as file:
    for name in unique_video_names:
        file.write(name + '\n')

print(f'Se han guardado {len(unique_video_names)} nombres de videos únicos en {output_file}')