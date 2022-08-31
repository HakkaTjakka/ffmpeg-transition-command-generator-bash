#!/bin/bash

FILENAME=$*
BASENAME="${FILENAME%.*}"

test_plusglshader1 () {
    # bin1/ffmpeg -v debug \
    bin1/ffmpeg \
    	-ss 40 -t 20 -i russel.01.mp4 \
    	-filter_complex " \
    	plusglshader=sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl:duration=10.1[out1]; \
    	[out1]plusglshader=sdsource=gl/sway_shader.gl:vxsource=gl/sway_vertex.gl:duration=5[out2]; \
    	[out2]plusglshader=sdsource=gl/split_9_shader.gl:vxsource=gl/split_9_vertex.gl:start=3:duration=10 \
    	" \
    	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
    	-y output_test_plusglshader1.mp4
}

test_fadeglshader1 () {
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
    	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 10M \
    	-movflags faststart -y output_test_fadeglshader1.mp4
    
    #    "[0:v]fadeglshader=offset=4:fade_duration=1:ext_source=russel.01.mp4:sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl \
}

GET_INFO_VIDEO () {
  NUM=${#NAMES[@]}
  L=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1")

  FPS=$(ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 "$1")

#  FRAMES=$(ffprobe -v error -select_streams v:0 -count_frames -show_entries stream=nb_read_frames -of default=noprint_wrappers=1:nokey=1 "$1")
  FRAMES=$(echo "($L * $FPS)"| bc -l);

  L="${L%????}"
  FRAMES="${FRAMES%.*}"

  echo INDEX=$NUM NAME=$1 LENGTH=$L FPS=$FPS FRAMES=$FRAMES # $2 $3
  NAMES+=( "$1" )
  LENGTH+=( "$L" )
}

test_pipglshader3 () {
    # ffmpeg -i russel.03.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.03.an.mp4

    ffmpeg -i russel.01.mp4 -y -map 0:v -vcodec copy russel.03.an.mp4 
    ffmpeg -i russel.02.mp4 -y -map 0:v -vcodec copy russel.03.an.mp4 
    ffmpeg -i russel.03.mp4 -y -map 0:v -vcodec copy russel.03.an.mp4 

    TRANSTIME="5.0"
    L1=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.02.mp4")
    L1b=$(echo "($L1-$TRANSTIME)"| bc -l);  

    L2=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.03.mp4")
#    echo L1=$L1 L1b=$L1b L2=$L2

    L1="${L1%????}"
    L1b="${L1b%????}"
    L2="${L2%????}"
#    echo L1=$L1 L1b=$L1b L2=$L2
    
    bin1/ffmpeg \
        -i russel.02.mp4 \
        -i russel.03.mp4 \
        -filter_complex " \
        [0:v]pipglshader=start="$L1b":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \
        [1:v]trim="$TRANSTIME":"$L2"[v1a]; \
        [v1a]setpts=PTS-STARTPTS[v1b]; \
        [out1][v1b]concat=n=2[outv]; \
        [0:a][1:a]acrossfade=duration="$TRANSTIME"[outa] \
        " \
        -map "[outv]" \
        -map "[outa]" \
        -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
        -movflags faststart -y output_test_pipglshader3.mp4

}

MAIN () {
    FILENAME=$*
    BASENAME="${FILENAME%.*}" ; echo BASENAME=$BASENAME
    TRANSTIME="5.0"

    NAMES=()
    NAMES_AN=()
    LENGTH=()

    for line in $BASENAME.*.mp4
    do
        INDEX="${line%.*}"
        AN=$INDEX".an.mp4"

        INDEX="${INDEX##*.}"

        S=$(echo "($INDEX)"| bc -l);  
        if [ ! "$S" == "0" ]; then
            bin1/ffmpeg -hide_banner -loglevel error -i $line -y -map 0:v -vcodec copy $AN
            echo AN=$AN
            NAMES_AN+=( "$AN" )
            # echo $line $part $S
            GET_INFO_VIDEO $line $INDEX $S 
        fi
    done

    # echo -n "Files:"
    echo "Files:"
    echo "bin1/ffmpeg \\" > ffmpeg_command.part.plus1
    echo "-filter_complex \" \\" > ffmpeg_command.part.plus2
    # echo -n "[v0a1]" > ffmpeg_command.part.plus3
    rm ffmpeg_command.part.plus3
    p="0"
    add="0"
    for i in ${!NAMES[@]};
    do
        # echo -n " "
        #echo -n $i=${NAMES[$i]}
        ONE="1.0"
        n=$(echo "($i+$ONE)"| bc -l);  
        n="${n%.*}"
#        echo p=$p i=$i n=$n
        NAME=${NAMES[$i]}
        NAME_AN=${NAMES_AN[$n]}
        LENGTH_N=${LENGTH[$n]}
        LENGTH_N=$(echo "($LENGTH_N-$TRANSTIME)"| bc -l);  
        LENGTH_N="${LENGTH_N%0000}"
    
        LENGTH_NI=${LENGTH[$n]}
    
        LENGTH=${LENGTH[$i]}
        TRANS=$(echo "($LENGTH-$TRANSTIME)"| bc -l);  
        TRANS="${TRANS%0000}"
        TRANS2=$(echo "($TRANS-$TRANSTIME)"| bc -l);  
        TRANS2="${TRANS2%0000}"
    
        echo INDEX=$i NEXT=$n $NAME $LENGTH $TRANS # $2 $3

        echo "-i \"$NAME\" \\" >> ffmpeg_command.part.plus1

        if [ ! "$i" == "$NUM" ]; then
            if [ ! "$i" == "0" ]; then
                echo "[v"$i"a]pipglshader=start="$TRANS2":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source="$NAME_AN":vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out"$i"]; \\" >> ffmpeg_command.part.plus2
                echo -n "[out"$i"]" >> ffmpeg_command.part.plus3
                add=$(echo "($add+$ONE)"| bc -l);  
            else 
                echo "["$i":v]pipglshader=start="$TRANS":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source="$NAME_AN":vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out"$i"]; \\" >> ffmpeg_command.part.plus2
                echo -n "[out"$i"]" >> ffmpeg_command.part.plus3
                add=$(echo "($add+$ONE)"| bc -l);  
            fi
            if [ ! "$i" == "0" ]; then
                if [ ! "$p" == "$NUM" ]; then
                    if [ ! "$n" == "$NUM" ]; then
                        echo "[outa"$i"]["$n":a]acrossfade=duration="$TRANSTIME"[outa"$n"]; \\" >> ffmpeg_command.part.plus2
                    else 
                        echo "[outa"$i"]["$n":a]acrossfade=duration="$TRANSTIME"[outa]; \\" >> ffmpeg_command.part.plus2
                    fi
                    echo "["$n":v]trim="$TRANSTIME":"$LENGTH_NI",setpts=PTS-STARTPTS[v"$n"a]; \\" >> ffmpeg_command.part.plus2
                fi
            else 
                echo "["$i":a]["$n":a]acrossfade=duration="$TRANSTIME"[outa"$n"]; \\" >> ffmpeg_command.part.plus2
                echo "["$n":v]trim="$TRANSTIME":"$LENGTH_NI",setpts=PTS-STARTPTS[v"$n"a]; \\" >> ffmpeg_command.part.plus2
            fi
        else
            echo -n "[v"$i"a]" >> ffmpeg_command.part.plus3
            add=$(echo "($add+$ONE)"| bc -l);  
            add="${add%.*}"
            echo "concat=n="$add"[outv] \\" >> ffmpeg_command.part.plus3
        fi  
    p=$i
  done    

  echo "\" \\" >> ffmpeg_command.part.plus3
  echo "-map \"[outv]\" \\" >> ffmpeg_command.part.plus3
  echo "-map \"[outa]\" \\" >> ffmpeg_command.part.plus3
#  echo "-an \\" >> ffmpeg_command.part.plus3
  echo "-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart \\" >> ffmpeg_command.part.plus3
  echo "-y output_plus_auto.mp4" >> ffmpeg_command.part.plus3

  cat ffmpeg_command.part.plus1 > ffmpeg_command.plus.sh
  cat ffmpeg_command.part.plus2 >> ffmpeg_command.plus.sh
  cat ffmpeg_command.part.plus3 >> ffmpeg_command.plus.sh

  chmod +x ffmpeg_command.plus.sh
  exit
}

test_pipglshader1 () {
    ffmpeg -i russel.03.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.03.an.mp4

    TRANSTIME="5.0"
    L1=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.02.mp4")
    L1b=$(echo "($L1-$TRANSTIME)"| bc -l);  
    L2=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.03.mp4")
    
    bin1/ffmpeg \
        -i russel.02.mp4 \
        -i russel.03.mp4 \
        -filter_complex " \
        [0:v]pipglshader=start="$L1b":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \
        [1:v]trim="$TRANSTIME":"$L2"[v1a]; \
        [v1a]setpts=PTS-STARTPTS[v1b]; \
        [out1][v1b]concat=n=2[outv]; \
        [0:a][1:a]acrossfade=duration="$TRANSTIME"[outa] \
        " \
        -map "[outv]" \
        -map "[outa]" \
        -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
        -movflags faststart -y output_test_pipglshader1.mp4
}

test_pipglshader2 () {
    TRANSTIME="5.0"
    L1=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.02.mp4")
    L1b=$(echo "($L1-$TRANSTIME)"| bc -l);  
    L2=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.03.mp4")

    bin1/ffmpeg \
        -i russel.02.mp4 \
        -i russel.03.mp4 \
        -filter_complex " \
        [0:v]pipglshader=start="$L1b":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out1]; \
        [1:v]trim="$TRANSTIME":"$L2"[v1a]; \
        [v1a]setpts=PTS-STARTPTS[v1b]; \
        [out1][v1b]concat=n=2[outv] \
        " \
        -an \
        -map "[outv]" \
        -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
        -movflags faststart -y output_test_pipglshader2_video.mp4

    bin1/ffmpeg \
        -i russel.02.mp4 \
        -i russel.03.mp4 \
        -filter_complex " \
        [0:a][1:a]acrossfade=duration="$TRANSTIME"[outa] \
        " \
        -map "[outa]" \
        -y output_test_pipglshader2_audio.mp3
    
        bin1/ffmpeg -y -i output_test_pipglshader2_audio.mp3 -i output_test_pipglshader2_video.mp4 -c copy output_test_pipglshader2.mp4
}

test_plusglshader1
test_fadeglshader1    
test_pipglshader1
test_pipglshader2
test_pipglshader3
MAIN russel.mp4

#### #bin1/ffmpeg -v debug \
#### bin1/ffmpeg \
####     -i russel.01.an.mp4 \
####     -ss 0 -t 10 \
####     -filter_complex " \
####     [0:v]pipglshader=start=5:duration=5:pip_duration=5:ext_source=russel.03.an.mp4:vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[outv] \
####     " \
####  	-an \
####  	-map "[outv]" \
####  	-c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
####  	-movflags faststart -y output_plus3.mp4
#### 
#### L=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "russel.03.an.mp4")
#### L="${L%????}"
#### 
#### bin1/ffmpeg \
####     -i output_plus3.mp4 \
####     -i russel.03.an.mp4 \
####     -filter_complex " \
####     [1:v]trim=5:"$L"[v1a]; \
####     [v1a]setpts=PTS-STARTPTS[v1b]; \
####     [0:v][v1b]concat=n=2[outv] \
####     " \
####     -an \
####     -map "[outv]" \
####     -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 12000k \
####     -movflags faststart -y output_plus3_comb.mp4

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
