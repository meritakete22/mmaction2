#!/bin/bash

#Variables

CONFIG_PATH='configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
CHECKPOINT_PATH='slowfast_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb_20230320-af666368.pth'
# CONFIG_PATH='configs/detection/slowonly/slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
# CHECKPOINT_PATH='slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb_20230320-a1ca5e76.pth'
WORK_DIR='data/multisports/out'
DUMP_DIR1='data/multisports/out/pickle1_slowfast.pkl'
DUMP_DIR2='data/multisports/out/pickle2_slowfast.pkl'
DUMP_DIR3='data/multisports/out/pickle3_slowfast.pkl'
DUMP_DIR4='data/multisports/out/pickle4_slowfast.pkl'
DUMP_DIR5='data/multisports/out/pickle5_slowfast.pkl'
ANN_VAL_TEST1='data/multisports/annotations/multisports_val_fixed_0.csv'
ANN_VAL_TEST2='data/multisports/annotations/multisports_val_fixed_1.csv'
ANN_VAL_TEST3='data/multisports/annotations/multisports_val_fixed_2.csv'
ANN_VAL_TEST4='data/multisports/annotations/multisports_val_fixed_3.csv'
ANN_VAL_TEST5='data/multisports/annotations/multisports_val_fixed_4.csv'

#Ejecutar el comando de Python
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1" --ann-file-val "$ANN_VAL_TEST1"
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2" --ann-file-val "$ANN_VAL_TEST2"
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3" --ann-file-val "$ANN_VAL_TEST3"
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4" --ann-file-val "$ANN_VAL_TEST4"
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR5" --ann-file-val "$ANN_VAL_TEST5"
