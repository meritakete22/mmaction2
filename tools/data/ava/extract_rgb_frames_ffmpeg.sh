#!/bin/bash

# Define directories
IN_DATA_DIR="../../../data/ava/videos_15min"
OUT_DATA_DIR="/media/luis/PortableSSD/data/ava/rawframes"
VALIDATION_LIST="../../../data/ava/annotations/ava_val.txt"

# Check if output directory exists, if not create it
if [[ ! -d "${OUT_DATA_DIR}" ]]; then
  echo "${OUT_DATA_DIR} doesn't exist. Creating it."
  mkdir -p "${OUT_DATA_DIR}"
fi

# Read the list of validation videos
mapfile -t validation_videos < "${VALIDATION_LIST}"

# Loop through all videos in the input directory
for video in "${IN_DATA_DIR}"/*; do
  # Extract video name without extension
  video_name=$(basename "${video}")
  # Get the base name without extension
  base_name="${video_name%.*}"  
  # Check if the base name is in the validation list
  if [[ " ${validation_videos[*]} " == *" $base_name "* ]]; then

    if [[ $video_name = *".webm" ]]; then
      video_name=${video_name::-5}
    else
      video_name=${video_name::-4}
    fi

    # Define output directory for the current video
    out_video_dir="${OUT_DATA_DIR}/${video_name}"

    # Remove existing output directory to avoid duplicate frames
    if [[ -d "${out_video_dir}" ]]; then
      echo "Removing existing directory ${out_video_dir}"
      rm -rf "${out_video_dir}"
    fi

    # Create a fresh output directory
    mkdir -p "${out_video_dir}"

    # Define output file name pattern
    out_name="${out_video_dir}/img_%05d.jpg"

    # Extract frames using ffmpeg
    ffmpeg -i "${video}" -vf "fps=30" -q:v 1 "${out_name}"

    # Check if ffmpeg succeeded
    if [[ $? -ne 0 ]]; then
      echo "Failed to process ${video}. Continuing with the next file."
    else
      echo "Successfully processed ${video}."
    fi
  fi
done
