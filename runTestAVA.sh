#!/bin/bash

#Variables

# CONFIG_PATH='configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-20e_ava21-rgb.py'
CONFIG_PATH='configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb.py'
# CHECKPOINT_PATH='slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-20e_ava21-rgb_20220906-5180ea3c.pth'
CHECKPOINT_PATH='slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb_20220906-d934a48f.pth'

WORK_DIR='data/ava/out'
DUMP_DIR1='data/ava/out/pickle_slowfast.pkl'

#Ejecutar el comando de Python
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1"