#!/bin/bash

# Definir variables
VIDEO_PATH='data/ava/videos_1min/covMYDBa5dk.mp4'
# VIDEO_PATH='data/ava/videos_1min/b-YoBU0XT90.mp4'
CONFIG_PATH='configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb.py'
CONFIG_PATH2='configs/detection/acrn/slowfast-acrn_kinetics400-pretrained-r50_8xb8-8x8x1-cosine-10e_ava22-rgb.py'
CHECKPOINT_PATH='slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb_20220906-d934a48f.pth'
CHECKPOINT_PATH2='slowfast-acrn_kinetics400-pretrained-r50_8xb8-8x8x1-cosine-10e_ava22-rgb_20220906-66ec24a2.pth'
LABEL_MAP_PATH='tools/data/ava/label_map.txt'
PREDICT_STEPSIZE=8
OUTPUT_STEPSIZE=1
OUTPUT_FPS=15
START_FRAME=0902

DET_SCORE_THRESH=0.8
ACTION_SCORE_THRESH=0.002
OUTPUT_PATH_SLOWFAST='data/ava/demo/pruebaSlowfast.mp4'
OUTPUT_PATH_ACRN='data/ava/demo/pruebaACRN.mp4'


DET_SCORE_THRESH_LOW=0.5
ACTION_SCORE_THRESH_LOW=0.8
OUTPUT_PATH_SLOWFAST_LOW='data/ava/demo/pruebaSlowfastLow.mp4'
OUTPUT_PATH_ACRN_LOW='data/ava/demo/pruebaACRNLow.mp4'


# Slowfast
python demo/demo_spatiotemporal_det_GT.py "$VIDEO_PATH" "$OUTPUT_PATH_SLOWFAST" --config "$CONFIG_PATH" --checkpoint "$CHECKPOINT_PATH" --label-map "$LABEL_MAP_PATH" --det-score-thr $DET_SCORE_THRESH --action-score-thr $ACTION_SCORE_THRESH --predict-stepsize $PREDICT_STEPSIZE --output-stepsize $OUTPUT_STEPSIZE --output-fps $OUTPUT_FPS --start-frame $START_FRAME
python demo/demo_spatiotemporal_det_GT.py "$VIDEO_PATH" "$OUTPUT_PATH_SLOWFAST_LOW" --config "$CONFIG_PATH" --checkpoint "$CHECKPOINT_PATH" --label-map "$LABEL_MAP_PATH" --det-score-thr $DET_SCORE_THRESH_LOW --action-score-thr $ACTION_SCORE_THRESH_LOW --predict-stepsize $PREDICT_STEPSIZE --output-stepsize $OUTPUT_STEPSIZE --output-fps $OUTPUT_FPS --start-frame $START_FRAME
ffmpeg -y -i $OUTPUT_PATH_SLOWFAST -i $OUTPUT_PATH_SLOWFAST_LOW -filter_complex "
[0:v]drawtext=fontfile='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf':text='Mejores Hiperparametros':x=w-tw-10:y=h-th-10:fontsize=24:fontcolor=white:box=1:boxcolor=black@0.5[upper];
[1:v]drawtext=fontfile='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf':text='Peores Hiperparametros':x=w-tw-10:y=h-th-10:fontsize=24:fontcolor=white:box=1:boxcolor=black@0.5[lower];
[upper][lower]vstack=inputs=2
"  -c:v mpeg4 -b:v 3000k data/ava/demo/mixSlowfast.mp4



# ACRN
python demo/demo_spatiotemporal_det_GT.py "$VIDEO_PATH" "$OUTPUT_PATH_ACRN" --config "$CONFIG_PATH2" --checkpoint "$CHECKPOINT_PATH2" --label-map "$LABEL_MAP_PATH" --det-score-thr $DET_SCORE_THRESH --action-score-thr $ACTION_SCORE_THRESH --predict-stepsize $PREDICT_STEPSIZE --output-stepsize $OUTPUT_STEPSIZE --output-fps $OUTPUT_FPS --start-frame $START_FRAME
python demo/demo_spatiotemporal_det_GT.py "$VIDEO_PATH" "$OUTPUT_PATH_ACRN_LOW" --config "$CONFIG_PATH2" --checkpoint "$CHECKPOINT_PATH2" --label-map "$LABEL_MAP_PATH" --det-score-thr $DET_SCORE_THRESH_LOW --action-score-thr $ACTION_SCORE_THRESH_LOW --predict-stepsize $PREDICT_STEPSIZE --output-stepsize $OUTPUT_STEPSIZE --output-fps $OUTPUT_FPS --start-frame $START_FRAME
ffmpeg -y -i $OUTPUT_PATH_ACRN -i $OUTPUT_PATH_ACRN_LOW -filter_complex "
[0:v]drawtext=fontfile='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf':text='Mejores Hiperparametros':x=w-tw-10:y=h-th-10:fontsize=24:fontcolor=white:box=1:boxcolor=black@0.5[upper];
[1:v]drawtext=fontfile='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf':text='Peores Hiperparametros':x=w-tw-10:y=h-th-10:fontsize=24:fontcolor=white:box=1:boxcolor=black@0.5[lower];
[upper][lower]vstack=inputs=2
"  -c:v mpeg4 -b:v 3000k data/ava/demo/mixACRN.mp4

# Unir Slowfast y ACRN
ffmpeg -y -i $OUTPUT_PATH_SLOWFAST -i $OUTPUT_PATH_ACRN -filter_complex "
[0:v]drawtext=fontfile='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf':text='Slowfast':x=w-tw-10:y=h-th-10:fontsize=24:fontcolor=white:box=1:boxcolor=black@0.5[upper];
[1:v]drawtext=fontfile='/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf':text='ACRN':x=w-tw-10:y=h-th-10:fontsize=24:fontcolor=white:box=1:boxcolor=black@0.5[lower];
[upper][lower]vstack=inputs=2
" -c:v mpeg4 -b:v 3000k data/ava/demo/mixSlowfastACRN.mp4

