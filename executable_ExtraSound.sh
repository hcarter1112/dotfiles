#!/bin/bash
#These are the default modules that I would run at start up to go with my audio set up.

    #I have My headset mic going into some FX and then into Virtual1-Mic. I have remapped the the Virtual1-Mic.monitor feed so that the mic feed would come over the remapped source. I can then select the remapped source in pvcontrol

pactl load-module module-null-sink sink_name=Virtual1-Mic
pactl load-module module-remap-source source_name=Mic-Source master=Virtual1-Mic

#This is the set up for the media playback loop. I have it set up so that if the the Virtual2-Media-Playback sink is selected the media will play through it and then the loopback will pick up the monitor source and play the dual output into A7 Gaming. I then have the loopback.monitor going into the Virtual1-Mic sink. End result is that the audio played on the sink will be playing in the headset and over the voice connection.

pactl load-module module-null-sink sink_name=Virtual2-Media-Playback
pactl load-module module-loopback source=Virtual2-Media-Playback sink=Virtual1-Mic
pactl load-module module-loopback source=Virtual2-Media-Playback sink=alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.stereo-game  
