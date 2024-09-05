#!/bin/bash

#Variables

CONFIG_PATH='configs/detection/slowfast/slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb.py'
CHECKPOINT_PATH='slowfast_kinetics400-pretrained-r50_8xb6-8x8x1-cosine-10e_ava22-rgb_20220906-d934a48f.pth'

CONFIG_PATH2='configs/detection/acrn/slowfast-acrn_kinetics400-pretrained-r50_8xb8-8x8x1-cosine-10e_ava22-rgb.py'
CHECKPOINT_PATH2='slowfast-acrn_kinetics400-pretrained-r50_8xb8-8x8x1-cosine-10e_ava22-rgb_20220906-66ec24a2.pth'

WORK_DIR='data/ava/out'
# Slowfast
DUMP_DIR1_1='data/ava/out/pickle_slowfast1_1.pkl'
DUMP_DIR1_2='data/ava/out/pickle_slowfast2_1.pkl'
DUMP_DIR1_3='data/ava/out/pickle_slowfast3_1.pkl'
DUMP_DIR1_4='data/ava/out/pickle_slowfast4_1.pkl'
DUMP_DIR1_5='data/ava/out/pickle_slowfast5_1.pkl'
DUMP_DIR1_6='data/ava/out/pickle_slowfast6_1.pkl'
DUMP_DIR1_7='data/ava/out/pickle_slowfast7_1.pkl'
DUMP_DIR1_8='data/ava/out/pickle_slowfast8_1.pkl'
DUMP_DIR1_9='data/ava/out/pickle_slowfast9_1.pkl'
DUMP_DIR1_10='data/ava/out/pickle_slowfast10_1.pkl'

DUMP_DIR2_1='data/ava/out/pickle_slowfast1_2.pkl'
DUMP_DIR2_2='data/ava/out/pickle_slowfast2_2.pkl'
DUMP_DIR2_3='data/ava/out/pickle_slowfast3_2.pkl'
DUMP_DIR2_4='data/ava/out/pickle_slowfast4_2.pkl'
DUMP_DIR2_5='data/ava/out/pickle_slowfast5_2.pkl'
DUMP_DIR2_6='data/ava/out/pickle_slowfast6_2.pkl'
DUMP_DIR2_7='data/ava/out/pickle_slowfast7_2.pkl'
DUMP_DIR2_8='data/ava/out/pickle_slowfast8_2.pkl'
DUMP_DIR2_9='data/ava/out/pickle_slowfast9_2.pkl'
DUMP_DIR2_10='data/ava/out/pickle_slowfast10_2.pkl'
DUMP_DIR2_11='data/ava/out/pickle_slowfast11_2.pkl'

# ACRN
DUMP_DIR3_1='data/ava/out/pickle_acrn1_1.pkl'
DUMP_DIR3_2='data/ava/out/pickle_acrn2_1.pkl'
DUMP_DIR3_3='data/ava/out/pickle_acrn3_1.pkl'
DUMP_DIR3_4='data/ava/out/pickle_acrn4_1.pkl'
DUMP_DIR3_5='data/ava/out/pickle_acrn5_1.pkl'
DUMP_DIR3_6='data/ava/out/pickle_acrn6_1.pkl'
DUMP_DIR3_7='data/ava/out/pickle_acrn7_1.pkl'
DUMP_DIR3_8='data/ava/out/pickle_acrn8_1.pkl'
DUMP_DIR3_9='data/ava/out/pickle_acrn9_1.pkl'
DUMP_DIR3_10='data/ava/out/pickle_acrn10_1.pkl'

DUMP_DIR4_1='data/ava/out/pickle_acrn1_2.pkl'
DUMP_DIR4_2='data/ava/out/pickle_acrn2_2.pkl'
DUMP_DIR4_3='data/ava/out/pickle_acrn3_2.pkl'
DUMP_DIR4_4='data/ava/out/pickle_acrn4_2.pkl'
DUMP_DIR4_5='data/ava/out/pickle_acrn5_2.pkl'
DUMP_DIR4_6='data/ava/out/pickle_acrn6_2.pkl'
DUMP_DIR4_7='data/ava/out/pickle_acrn7_2.pkl'
DUMP_DIR4_8='data/ava/out/pickle_acrn8_2.pkl'
DUMP_DIR4_9='data/ava/out/pickle_acrn9_2.pkl'
DUMP_DIR4_10='data/ava/out/pickle_acrn10_2.pkl'
DUMP_DIR4_11='data/ava/out/pickle_acrn11_2.pkl'


# # Slowfast
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.002' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.1' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_2" --action-thr '0.2' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_3" --action-thr '0.5' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_5" --action-thr '0.8' --person-thr '0.01'

python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.002' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.1' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_2" --action-thr '0.2' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_3" --action-thr '0.5' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_5" --action-thr '0.8' --person-thr '0.2'

python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.1' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_2" --action-thr '0.2' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_3" --action-thr '0.5' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_4" --action-thr '0.6' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_5" --action-thr '0.8' --person-thr '0.5'

python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_1" --action-thr '0.1' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_2" --action-thr '0.2' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_3" --action-thr '0.5' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_4" --action-thr '0.6' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_5" --action-thr '0.8' --person-thr '0.9'

python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_6" --action-thr '0.2' --person-thr '0.1'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_7" --action-thr '0.2' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_8" --action-thr '0.2' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_9" --action-thr '0.2' --person-thr '0.6'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_10" --action-thr '0.2' --person-thr '0.8'

python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_6" --action-thr '0.002' --person-thr '0.1'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_7" --action-thr '0.002' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_8" --action-thr '0.002' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_9" --action-thr '0.002' --person-thr '0.6'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_10" --action-thr '0.002' --person-thr '0.8'
python tools/test.py "$CONFIG_PATH" "$CHECKPOINT_PATH" --work-dir "$WORK_DIR" --dump "$DUMP_DIR2_11" --action-thr '0.002' --person-thr '0.9'


# # ACRN

python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.002' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.1' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_2" --action-thr '0.2' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_3" --action-thr '0.5' --person-thr '0.01'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_5" --action-thr '0.8' --person-thr '0.01'

python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.002' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_1" --action-thr '0.1' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_2" --action-thr '0.2' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_3" --action-thr '0.5' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR1_5" --action-thr '0.8' --person-thr '0.2'

python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_1" --action-thr '0.1' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_2" --action-thr '0.2' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_3" --action-thr '0.5' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_4" --action-thr '0.6' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_5" --action-thr '0.8' --person-thr '0.5'

python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_1" --action-thr '0.1' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_2" --action-thr '0.2' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_3" --action-thr '0.5' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_4" --action-thr '0.6' --person-thr '0.9'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_5" --action-thr '0.8' --person-thr '0.9'

python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_6" --action-thr '0.2' --person-thr '0.1'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_7" --action-thr '0.2' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR_8" --action-thr '0.2' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_9" --action-thr '0.2' --person-thr '0.6'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR3_10" --action-thr '0.2' --person-thr '0.8'

python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_6" --action-thr '0.002' --person-thr '0.1'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_7" --action-thr '0.002' --person-thr '0.2'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_8" --action-thr '0.002' --person-thr '0.5'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_9" --action-thr '0.002' --person-thr '0.6'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_10" --action-thr '0.002' --person-thr '0.8'
python tools/test.py "$CONFIG_PATH2" "$CHECKPOINT_PATH2" --work-dir "$WORK_DIR" --dump "$DUMP_DIR4_11" --action-thr '0.002' --person-thr '0.9'
