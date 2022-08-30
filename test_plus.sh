#!/bin/bash

FILENAME=$*
BASENAME="${FILENAME%.*}"

#bin1/ffmpeg -v debug \
bin1/ffmpeg \
	-ss 40 -t 20 -i russel.01.mp4 \
	-filter_complex " \
	plusglshader=sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl:duration=10.1[out1]; \
	[out1]plusglshader=sdsource=gl/sway_shader.gl:vxsource=gl/sway_vertex.gl:duration=5[out2]; \
	[out2]plusglshader=sdsource=gl/split_9_shader.gl:vxsource=gl/split_9_vertex.gl:start=3:duration=10 \
	" \
	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
	-y output_plus.mp4

ffmpeg -i russel.01.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.01.an.mp4
ffmpeg -i russel.02.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.02.an.mp4
ffmpeg -i russel.03.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.03.an.mp4

#bin1/ffmpeg -v debug \
bin1/ffmpeg \
    -ss 30 -t 10 \
    -i russel.01.an.mp4 \
    -filter_complex " \
    [0:v]fadeglshader=offset=5:fade_duration=1:ext_source=russel.02.an.mp4:vxsource=gl_fade/fade_vertex.gl:sdsource=gl_fade/fade_shader.gl[outv] \
	" \
	-an \
	-map "[outv]" \
	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
	-movflags faststart -y output_plus2.mp4

### #    "[0:v]fadeglshader=offset=4:fade_duration=1:ext_source=russel.01.mp4:sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl \

#bin1/ffmpeg -v debug \
bin1/ffmpeg \
    -i russel.01.an.mp4 \
    -ss 0 -t 10 \
    -filter_complex " \
    [0:v]pipglshader=start=5:duration=5:pip_duration=5:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[outv] \
    " \
 	-an \
 	-map "[outv]" \
 	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
 	-movflags faststart -y output_plus3.mp4

L=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.03.an.mp4")
L="${L%????}"

bin1/ffmpeg \
    -i output_plus3.mp4 \
    -i russel.03.an.mp4 \
    -filter_complex " \
    [1:v]trim=5:"$L"[v1a]; \
    [v1a]setpts=PTS-STARTPTS[v1b]; \
    [0:v][v1b]concat=n=2[outv] \
    " \
    -an \
    -map "[outv]" \
    -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
    -movflags faststart -y output_plus3_comb.mp4



##    [0:v]scale=1920/1080,setsar=sar=1920/1080,setdar=dar=1920/1080[scale0]; \
##    [scale0]pipglshader=start=5:duration=10:pip_duration=5:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[outv] \

##    [0:v]scale=1920/1080,setsar=sar=1920/1080,setdar=dar=960/1080[scale0]; \
##    [scale0]pipglshader=start=5:duration=10:pip_duration=5:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[scale1]; \
##    [scale1]scale=1920/1080,setdar=dar=1920/1080[outv] \

#    [0:v]scale=960/1080,setsar=sar=1/1,setdar=dar=960/1080[scale0]; \
#    [scale0]pipglshader=start=5:duration=10:pip_duration=5:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[outv] \

#    [0:v]scale=960/1080,setsar=sar=1/1,setdar=dar=960/1080[scale0]; \
#    [scale0]pipglshader=start=5:duration=10:pip_duration=5:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[scale1]; \
#    [scale1]scale=1920/1080,setdar=dar=1920/1080[outv] \


#    "[0:v]setdar=dar=960/1080,pipglshader=start=2:duration=10:pip_duration=8:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[v1]; \
#    [scale1]scale=1920/1080,setdar=dar=1920/1080[outv] \
#    "[0:v]scale=960/1080,setsar=sar=960/1080,setdar=dar=960/1080[scale0];
#    "[0:v]pipglshader=start=0:duration=10:pip_duration=3:ext_source=russel.02.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[scale0];
#    [scale0]scale=1920/1600,setsar=sar=1/1,setdar=dar=2560/1600[v1]; \


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
