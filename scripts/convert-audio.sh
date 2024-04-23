#!/bin/bash

folder="./samples"

for wav_file in "$folder"/*.wav; do
    if [ -f "$wav_file" ]; then
        base_name=$(basename "$wav_file" .wav)
        ffmpeg -i "$wav_file" -y -c:a libopus "$folder/$base_name.ogg"
        ffmpeg -i "$wav_file" -y -c:a aac -b:a 192k "$folder/$base_name.m4a"
    fi
done

