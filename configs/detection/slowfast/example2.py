from mmaction.apis import inference_recognizer, init_recognizer
import mmcv
import csv

# Rutas de los ficheros
csv_file = '/home/luis/Documentos/GitHub/mmaction2/data/multisports/annotations/multisports_val.csv'
config_file = '/home/luis/Documentos/GitHub/mmaction2/configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
checkpoint_file = '/home/luis/Documentos/GitHub/mmaction2/slowfast_r50_4x16x1_256e_kinetics400_rgb_20200704-bcde7ed7.pth'

# Configurar el modelo
model = init_recognizer(config_file, checkpoint_file, device='cuda:0')

# Cargar los datos del archivo CSV
datos = []
# Abrir el archivo CSV en modo lectura
with open(csv_file, newline='') as archivo:
    # Crear un lector CSV
    lector_csv = csv.reader(archivo)
    
    # Iterar sobre cada fila del CSV
    for fila in lector_csv:
        # Agregar la fila a la matriz
        datos.append(fila)

video_file = datos[0][0]

# Realizar inferencia en el video
result = inference_recognizer(model, video_file)

# Obtener la etiqueta de la clase predicha
label = result.argmax()

# Cargar el archivo de mapeo de clases
label_map = mmcv.load('data/multisports/annotations/multisports_GT.pkl')

# Obtener el nombre de la clase predicha
class_name = label_map[label]

# Mostrar el resultado
print(f'La clase predicha es: {class_name}')
