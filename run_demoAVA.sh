#!/bin/bash

# Definir variables
VIDEO_PATH='data/ava/videos_1min/covMYDBa5dk.mp4'
VIDEO_PATH2='data/ava/videos_1min/D8Vhxbho1fY.mp4'
OUTPUT_PATH='data/ava/demo/pruebaAVA.mp4'
CONFIG_PATH='configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb.py'
CONFIG_PATH2='configs/detection/acrn/slowfast-acrn_kinetics400-pretrained-r50_8xb8-8x8x1-cosine-10e_ava22-rgb.py'
CHECKPOINT_PATH='slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb_20220906-d934a48f.pth'
CHECKPOINT_PATH2='slowfast-acrn_kinetics400-pretrained-r50_8xb8-8x8x1-cosine-10e_ava22-rgb_20220906-66ec24a2.pth'
LABEL_MAP_PATH='tools/data/ava/label_map.txt'
DET_SCORE_THRESH=0.8
ACTION_SCORE_THRESH=0.002
PREDICT_STEPSIZE=8
OUTPUT_STEPSIZE=1
OUTPUT_FPS=30
# Ejecutar el comando de Python
python demo/demo_spatiotemporal_det.py "$VIDEO_PATH" "$OUTPUT_PATH" --config "$CONFIG_PATH" --checkpoint "$CHECKPOINT_PATH" --label-map "$LABEL_MAP_PATH" --det-score-thr $DET_SCORE_THRESH --action-score-thr $ACTION_SCORE_THRESH --predict-stepsize $PREDICT_STEPSIZE --output-stepsize $OUTPUT_STEPSIZE --output-fps $OUTPUT_FPS
