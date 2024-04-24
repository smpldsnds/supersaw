#!/bin/bash

folder="./samples"

for wav_file in "$folder"/*.wav; do
    if [ -f "$wav_file" ]; then
        base_name=$(basename "$wav_file" .wav)
        ffmpeg -i "$wav_file" -y -c:a libvorbis "$folder/$base_name.ogg"
        ffmpeg -i "$wav_file" -y -c:a aac -b:a 192k "$folder/$base_name.m4a"
        ffmpeg -i "$wav_file" -y -c:a libmp3lame -b:a 192k "$folder/$base_name.mp3"
    fi
done

