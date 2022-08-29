#!/bin/bash

FILENAME=$*
BASENAME="${FILENAME%.*}"

#bin1/ffmpeg -v debug \
bin1/ffmpeg \
	-ss 40 -t 20 -i russel.01.mp4 \
	-filter_complex " \
	plusglshader=sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl:duration=10.1[out1]; \
	[out1]plusglshader=sdsource=gl/sway_shader.gl:vxsource=gl/sway_vertex.gl:duration=5[out2]; \
	[out2]plusglshader=sdsource=gl/split_9_shader.gl:vxsource=gl/split_9_vertex.gl:start=3:duration=3 \
	" \
	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 5000k \
	-y output_plus.mp4


### F="_shader.gl"
### V="_vertex.gl"
### 
### SHADER="bluesea"
### F1=$SHADER$F
### V1=$SHADER$V
### echo $F1 $V1
### 
### SHADER="jitter"
### F2=$SHADER$F
### V2=$SHADER$V
### echo $F2 $V2
### 
### bin1/ffmpeg -v debug \
### 	-ss 40 -t 30 -i russel.01.mp4 \
### 	-filter_complex " \
### 	plusglshader=sdsource=gl/$F1:vxsource=gl/$V1:duration=10 \
### 	[out1];[out1]
### 	plusglshader=sdsource=gl/$F2:vxsource=gl/$V2:start=10:duration=10.0 \
### 	"  \
### 	-c:v h264_nvenc -pix_fmt yuv420p -preset fast \
### 	-y output_plus.mp4
