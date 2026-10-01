#! /bin/sh

APP_NAME=${1,,}
SINK_NAME=${2,,}

if [ -z $APP_NAME ]; then
  echo "ERROR: No app name has been provided"
  exit 1
fi

if [ -z $SINK_NAME ]; then
  echo "ERROR: No sink provided"
  exit 1
fi

if [[ $SINK_NAME == "system" ]]; then
  SYSTEM_SINK="alsa_output.usb-TC-Helicon_GoXLR-00.HiFi__Speaker__sink"
elif [[ $SINK_NAME == "chat" ]]; then
  SYSTEM_SINK="alsa_output.usb-TC-Helicon_GoXLR-00.HiFi__Headphones__sink"
elif [[ $SINK_NAME == "game" ]]; then
  SYSTEM_SINK="alsa_output.usb-TC-Helicon_GoXLR-00.HiFi__Line1__sink"
elif [[ $SINK_NAME == "music" ]]; then
  SYSTEM_SINK=alsa_output.usb-TC-Helicon_GoXLR-00.HiFi__Line2__sink
elif [[ $SINK_NAME == "speakers" ]]; then
  SYSTEM_SINK="alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y8QFB8U0849463-00.HiFi__Line__sink"
else
  echo "ERROR: Unknown device name"
  exit 1
fi

SINK_INPUT_ID=$(pactl list sink-inputs | grep -E "Sink Input #|media.name =|application.name =" | \
  awk -v app="$APP_NAME" '
  /Sink Input #/ {id=$3}
  tolower($0) ~ app {print id; exit}' |tr -d '#')

echo $SINK_INPUT_ID

if [ -n "$SINK_INPUT_ID" ] ; then
  echo "Found $APP_NAME streaming on ID: $SINK_INPUT_ID"
  echo "Routing to target sink"
  pactl move-sink-input "$SINK_INPUT_ID" "$SYSTEM_SINK"
  exit 0
else
  echo "ERROR: Could not find an active audio stream for '$APP_NAME'."
  echo "Make sure the aplication is open and actively playing audio"
  exit 1
fi
