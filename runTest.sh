#!/bin/bash

#Variables
CONFIG_PATH='configs/detection/slowonly/slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
CHECKPOINT_PATH='slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb_20230320-a1ca5e76.pth'
WORK_DIR='data/multisports/out'
DUMP_DIR1='data/multisports/out/pickle1.pkl'
DUMP_DIR2='data/multisports/out/pickle2.pkl'
DUMP_DIR3='data/multisports/out/pickle3.pkl'
DUMP_DIR4='data/multisports/out/pickle4.pkl'
DUMP_DIR5='data/multisports/out/pickle5.pkl'
ANN_VAL_TEST1='data/multisports/annotations/multisports_val_fixed_0.csv'

#Ejecutar el comando de Python
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1" --ann-file-val "$ANN_VAL_TEST1"