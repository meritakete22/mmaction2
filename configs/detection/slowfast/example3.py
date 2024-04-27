from mmaction.apis import init_recognizer
from mmengine.runner import Runner
from mmengine.config import Config
import mmcv
import csv

# Rutas de los ficheros
csv_file = '/home/luis/Documentos/GitHub/mmaction2/data/multisports/annotations/multisports_val.csv'
config_file = '/home/luis/Documentos/GitHub/mmaction2/configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
checkpoint_file = '/home/luis/Documentos/GitHub/mmaction2/slowfast_r50_4x16x1_256e_kinetics400_rgb_20200704-bcde7ed7.pth'

# Inicializar el reconocedor
model = init_recognizer(config_file, checkpoint_file, device='cuda:0')

# Configurar el pipeline de datos para la inferencia
test_pipeline_cfg = Config.fromfile(config_file)['test_pipeline']
test_pipeline = Compose(test_pipeline_cfg)

# Cargar los datos del archivo CSV
datos = []
with open(csv_file, newline='') as archivo:
    lector_csv = csv.reader(archivo)
    for fila in lector_csv:
        datos.append(fila)

# Seleccionar el primer video del CSV para la inferencia
video_file = datos[0][0]

# Realizar la inferencia utilizando Runner
runner = Runner(model, batch_processor=None, device='cuda:0')
video_data = dict(filename=video_file)
result = runner.infer_video(video_data, test_pipeline)

# Obtener la etiqueta de la clase predicha
label = result.argmax()

# Cargar el archivo de mapeo de clases
label_map = mmcv.load('data/multisports/annotations/multisports_GT.pkl')

# Obtener el nombre de la clase predicha
class_name = label_map[label]

# Mostrar el resultado
print(f'La clase predicha es: {class_name}')
