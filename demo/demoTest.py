
from mmaction.apis import inference_recognizer, init_recognizer

# cfg_path = '/home/luis/Documentos/GitHub/mmaction2/configs/detection/slowonly/slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
# path_checkpoint = '/home/luis/Documentos/GitHub/mmaction2/slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb_20230320-a1ca5e76.pth'

cfg_path = '/home/luis/Documentos/GitHub/mmaction2/configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
path_checkpoint = '/home/luis/Documentos/GitHub/mmaction2/slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb_20230320-af666368.pth'
video = '/home/luis/Documentos/GitHub/mmaction2/data/multisports/trainval/aerobic_gymnastics/v__wAgwttPYaQ_c001.mp4'

# cfg_path = 'configs/recognition/tsn/tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb.py'
# path_checkpoint = 'https://download.openmmlab.com/mmaction/v1.0/recognition/tsn/tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb/tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb_20220906-2692d16c.pth' # can be a local path
# video = 'demo/demo.mp4'   # you can specify your own picture path

# Build the recognizer from a config file and checkpoint file/url
print('init model')
model = init_recognizer(cfg_path, path_checkpoint, device='cpu')
print('init inference')
pred_result = inference_recognizer(model, video)

 