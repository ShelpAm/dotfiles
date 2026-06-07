#!/bin/bash
# Waybar custom audio module — shows speaker + mic volume

SPEAKER=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')
MIC=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -oP '\d+%' | head -1 | tr -d '%')
SPEAKER_MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes')
MIC_MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -o 'yes')

ICON_SPEAKER=""
ICON_MUTED=""
ICON_MIC=""
TOOLTIP="Speaker: ${SPEAKER}%\\nMic: ${MIC}%"

if [ -n "$SPEAKER_MUTED" ]; then
    CLASS="muted"
    TEXT="$ICON_MUTED  muted"
else
    CLASS=""
    TEXT="$ICON_SPEAKER  ${SPEAKER}%  $ICON_MIC  ${MIC}%"
fi

echo "{\"text\": \"$TEXT\", \"tooltip\": \"$TOOLTIP\", \"class\": \"$CLASS\"}"
