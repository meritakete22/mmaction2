#!/bin/bash

# Definir variables
# VIDEO_PATH='data/multisports/trainval/aerobic_gymnastics/v_Ahg4VNTbKaM_c013.mp4'
# VIDEO_PATH='data/multisports/trainval/basketball/v_hDBjIvCw7Kk_c006.mp4'
VIDEO_PATH='data/multisports/trainval/volleyball/v_8rG1vjmJHr4_c006.mp4'
VIDEO_PATH='data/multisports/trainval/football/v_GGhhbMOp6yY_c009.mp4'
OUTPUT_PATH='data/multisports/demo/pruebaGT_FB.mp4'
CONFIG_PATH='configs/detection/slowonly/slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb.py'
CHECKPOINT_PATH='slowonly_kinetics400-pretrained-r50_8xb16-4x16x1-8e_multisports-rgb_20230320-a1ca5e76.pth'
LABEL_MAP_PATH='tools/data/multisports/label_map.txt'
DET_SCORE_THRESH=0.5
ACTION_SCORE_THRESH=0.5
PREDICT_STEPSIZE=8
OUTPUT_STEPSIZE=1
OUTPUT_FPS=30
# Ejecutar el comando de Python
python demo/demo_spatiotemporal_det_GT.py "$VIDEO_PATH" "$OUTPUT_PATH" --config "$CONFIG_PATH" --checkpoint "$CHECKPOINT_PATH" --label-map "$LABEL_MAP_PATH" --det-score-thr $DET_SCORE_THRESH --action-score-thr $ACTION_SCORE_THRESH --predict-stepsize $PREDICT_STEPSIZE --output-stepsize $OUTPUT_STEPSIZE --output-fps $OUTPUT_FPS
