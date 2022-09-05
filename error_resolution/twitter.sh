#!/bin/bash

COUNT="0"
ONE="1.0"
TEN="10"
CORRECT=".1"
TRANSTIME="5.0"

test_fadeglshader1 () {
#    ffmpeg -i russel.01.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.01.an.mp4
#    ffmpeg -i russel.02.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.02.an.mp4
#    ffmpeg -i russel.03.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.03.an.mp4
#    ffmpeg -i russel.01.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.01.an.mp4
#    ffmpeg -i russel.02.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.02.an.mp4
#    ffmpeg -i russel.03.mp4 -n -c:v h264_nvenc -pix_fmt yuv420p -preset slow -an russel.03.an.mp4

    #bin1/ffmpeg -v debug \
    bin/ffmpeg \
        -i mp4/out.01.an.mp4 \
        -i mp4/out.02.an.mp4 \
        -filter_complex " \
        [0:v]fadeglshader=offset=5:fade_duration=10:ext_source=mp4/out.02.an.mp4:vxsource=gl_fade/fade_vertex.gl:sdsource=gl_fade/fade_shader.gl[out0]; \
        [1:v]trim=10.0:25.00,setpts=PTS-STARTPTS[v1a]; \
        [out0][v1a]concat=n=2[outv] \

        " \
        -an \
        -map "[outv]" \
        -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 10M \
        -movflags faststart -y output_test_fadeglshader1.mp4
    
    #    "[0:v]fadeglshader=offset=4:fade_duration=1:ext_source=russel.01.mp4:sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl \
}

func_done () {
	COUNT=$(echo "($COUNT+$ONE)"| bc -l);  
    COUNT="${COUNT%.*}"
    if [ "$COUNT" -lt "$TEN" ]; then
    	COUNT=0"$COUNT" out.$COUNT.mp4
    fi
    echo $COUNT $2 $3 $1
}

#fmt_add="%-5s%-6s%-5s%-12s%-10s%-40s\n"
fmt_add="%-5s%-5s%-10s%-10s%-12s%-40s\n"

func_add () {
    # echo $6
    BASENAME="${1##*/}"
    BASENAME="${BASENAME%.*}"
	COUNT=$(echo "($COUNT+$ONE)"| bc -l);  
    COUNT="${COUNT%.*}"
    if [ "$COUNT" -lt "$TEN" ]; then
    	COUNT=0"$COUNT"
    fi
    printf "$fmt_add" "$2" "$3" "$4" "$5" "out.$COUNT.mp4" "$1" 

###    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1" -c:v h264_nvenc -pix_fmt yuv420p -tune stillimage -movflags faststart -vsync 2 "mp4/out.$COUNT.mp4"
    bin/ffmpeg -y -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=sar=1/1" -c:v h264_nvenc -pix_fmt yuv420p -tune stillimage -movflags faststart -vsync 2 "mp4_$7/out.$COUNT.mp4"
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,setsar=1/1" -c:v h264_nvenc -pix_fmt yuv420p -tune stillimage -movflags faststart -vsync 2 "mp4/out.$COUNT.mp4"
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1" -c:v h264_nvenc -tune stillimage -preset losslesshp "mp4/out.$COUNT.mp4"
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:12"$CORRECT" -c:v copy "mp4/out.$COUNT.mp4" 
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1" -c:v h264_nvenc -preset lossless "mp4/out.$COUNT.mp4" 
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -f image2 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1" -c:v libx264 -qp 0 -pix_fmt yuv420p -movflags faststart -vsync 2 "mp4/out.$COUNT.mp4"
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -f image2 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1" -c:v libx264 -pix_fmt yuv444p -profile:v high444 -crf 0 -preset:v slow  -movflags faststart -vsync 2 "mp4/out.$COUNT.m4v"
#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -f image2 -i "$1" -t 00:00:12"$CORRECT" -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1" -c:v libx264 -pix_fmt yuv420p -tune:v lossless -crf 0 -movflags faststart -vsync 2 "mp4/out.$COUNT.mp4"

# -c:v libx264 -pix_fmt yuv444p -profile:v high444 -crf 0 -preset:v slow Tree480_lossless.m4v
#-preset losslesshp
    # bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:25 -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=sar=1/1,setdar=dar=$7" -c:v h264_nvenc -pix_fmt yuv420p -pix_fmt yuv420p -tune stillimage  "mp4/out.$COUNT.mp4"
# ,setdar=dar=2560/1600
}

fmt="%-5s%-5s%-10s%-10s%-6s%-10s\n"

TEST_MP4 () {
    printf "$fmt" w h sar dar t filename
    for line in $1
    do
        INFO=$(bin/ffprobe -v error -select_streams v:0 -show_entries stream=width,height,sample_aspect_ratio,display_aspect_ratio,duration -of csv=s=*:p=0 "$line")

        IFS=$'*' read -r width height sar dar duration <<< $INFO
        duration="${duration%0000}"    
        printf "$fmt" "$width" "$height" "$sar" "$dar" "$duration" "$line"
    done
}

ratio_x="1920"
ratio_y="1080"

MAIN () {
    export LC_NUMERIC="en_US.UTF-8"
    MAX_X=0
    MAX_Y=0
    printf "$fmt" w h sar dar filename
    if test -f "filelist.txt"; then
        rm filelist.txt
    fi
    if [ ! -d "mp4_$2x$3" ]; then
        mkdir "mp4_$2x$3"
    fi  
    for line in $1
    do
        INFO=$(bin/ffprobe -v error -select_streams v:0 -show_entries stream=width,height,sample_aspect_ratio,display_aspect_ratio -of csv=s=*:p=0 "$line")
    
        IFS=$'*' read -r width height sar dar <<< $INFO
        printf "$fmt" "$width" "$height" "$sar" "$dar" "$line"
        echo "$INFO*$line" >> filelist.txt
        # echo $(echo "$width " | bc -l)
        if [ $(echo "$width" | bc -l) -gt $MAX_X ]; then MAX_X=$width; fi 
        if [ $(echo "$height" | bc -l) -gt $MAX_Y ]; then MAX_Y=$height; fi 
    done
    echo max width x height = $MAX_X x $MAX_Y

#    n_x=$(echo "($MAX_X/$ratio_x)"| bc -l);
#    n_y=$(echo "($MAX_Y/$ratio_y)"| bc -l);
#    echo n_x=$n_x n_y=$n_y
#    if [ $n_x > $n_y ]; then
#        MAX_X=$(echo "($ratio_x*$MAX_Y/$ratio_y)"| bc -l);
#        MAX_X=$(printf "%.2f" $MAX_X)
#    else
#        MAX_Y=$(echo "($ratio_y*$MAX_X/$ratio_x)"| bc -l);
#        MAX_Y=$(printf "%.2f" $MAX_Y)
#    fi 
#
#    echo max width x height = $MAX_X x $MAX_Y


    while IFS=$'\n' read -r line; do
        # array+=( $line )
        IFS=$'*' read -r width height sar dar filename <<< $line

        func_add "$filename" "$width" "$height" "$sar" "$dar" "$2:$3:force_original_aspect_ratio=decrease,pad=$2:$3:-1:-1:color=black" "$2x$3"
#        echo func_add "$filename" "$width" "$height" "$sar" "$dar" "$2:$3:force_original_aspect_ratio=decrease,pad=$2:$3:-1:-1:color=black" "$2x$3"
        #func_add "$filename" "$width" "$height" "$sar" "$dar" "1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black" "1920/1080"

#        func_add "$filename" "$width" "$height" "$sar" "$dar" "1600:1080:force_original_aspect_ratio=decrease,pad=1600:1080:-1:-1:color=black" "1600/1080"
#        func_add "$filename" "$width" "$height" "$sar" "$dar" "1600:1000:force_original_aspect_ratio=decrease,pad=1600:1000:-1:-1:color=black" "$MAX_X""/""$MAX_Y"

#        func_add "$filename" "$width" "$height" "$sar" "$dar" "3840:2160:force_original_aspect_ratio=decrease,pad=3840:2160:-1:-1:color=black" "$MAX_X""/""$MAX_Y"
#        func_add "$filename" "$width" "$height" "$sar" "$dar" "$MAX_X"":""$MAX_Y"":force_original_aspect_ratio=decrease,pad="$MAX_X"":""$MAX_Y":-1:-1:color=black" "$MAX_X""/""$MAX_Y"
#        echo func_add "$filename" "$width" "$height" "$sar" "$dar" "$MAX_X"":""$MAX_Y"":force_original_aspect_ratio=decrease,pad="$MAX_X"":""$MAX_Y":-1:-1:color=black" "$MAX_X""/""$MAX_Y"
#        func_add "$filename" "$width" "$height" "$sar" "$dar" "$MAX_X"":""$MAX_Y"":force_original_aspect_ratio=decrease,pad=3840:2160:-1:-1:color=black" "$MAX_X""/""$MAX_Y"
#        func_add "$filename" "$width" "$height" "$sar" "$dar" "473"":""1024"":force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black" "$MAX_X""/""$MAX_Y"
        #946:2048

#        func_add "$filename" "$width" "$height" "$sar" "$dar" "$MAX_X"":""$MAX_Y" "$MAX_X""/""$MAX_Y"
    done < "filelist.txt"

#exit

}

GET_INFO_VIDEO () {
  NUM=${#NAMES[@]}
  L=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1")

  FPS=$(ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 "$1")

#  FRAMES=$(ffprobe -v error -select_streams v:0 -count_frames -show_entries stream=nb_read_frames -of default=noprint_wrappers=1:nokey=1 "$1")
  FRAMES=$(echo "($L * $FPS)"| bc -l);

  L=$(echo "($L-$CORRECT)"| bc -l);  
  L="${L%0000}"

#  L="${L%????}"
  FRAMES="${FRAMES%.*}"

  echo INDEX=$NUM NAME=$1 LENGTH=$L FPS=$FPS FRAMES=$FRAMES # $2 $3
  NAMES+=( "$1" )
  LENGTH+=( "$L" )
}

MAKE_FFMPEG () {
    FILENAME=$1
    BASENAME="${FILENAME%.*}" ; echo BASENAME=$BASENAME

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
            bin/ffmpeg -hide_banner -loglevel error -i $line -y -map 0:v -vcodec copy $AN

#    bin/ffmpeg -y -progress url -nostdin -hide_banner -loglevel error -loop 1 -i "$1" -t 00:00:05 -filter_complex "[0:v]fps=fps=60,scale=$6,setsar=1/1,setdar=$7" -c:v h264_nvenc -pix_fmt yuv420p -pix_fmt yuv420p -tune stillimage  "mp4/out.$COUNT.mp4"

            echo AN=$AN
            NAMES_AN+=( "$AN" )
            # echo $line $part $S
            GET_INFO_VIDEO $line $INDEX $S 
        fi
    done

    # echo -n "Files:"
    echo "Files:"
    echo "bin/ffmpeg \\" > ffmpeg_command.part.plus1
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
                echo "["$i":v]split[v"$i"a][v"$i"b]; \\" >> ffmpeg_command.part.plus2
                echo "[v"$i"a]trim="$TRANSTIME":"$TRANS",setpts=PTS-STARTPTS[v"$i"A]; \\" >> ffmpeg_command.part.plus2
                echo "[v"$i"b]trim="$TRANS":"$LENGTH",setpts=PTS-STARTPTS[v"$i"B]; \\" >> ffmpeg_command.part.plus2

                echo "[v"$i"B]pipglshader=start=0.0:duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source="$NAME_AN":vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out"$i"]; \\" >> ffmpeg_command.part.plus2
#                echo "[v"$i"a]pipglshader=start="$TRANS2":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source="$NAME_AN":vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out"$i"]; \\" >> ffmpeg_command.part.plus2
                echo >> ffmpeg_command.part.plus2
                echo -n "[v"$i"A]" >> ffmpeg_command.part.plus3
                echo -n "[out"$i"]" >> ffmpeg_command.part.plus3
                add=$(echo "($add+$ONE)"| bc -l);  
                add=$(echo "($add+$ONE)"| bc -l);  
            else 

                echo "["$i":v]split[v"$i"a][v"$i"b]; \\" >> ffmpeg_command.part.plus2
                echo "[v"$i"a]trim=0.0:"$TRANS"[v"$i"A]; \\" >> ffmpeg_command.part.plus2
                echo "[v"$i"b]trim="$TRANS":"$LENGTH",setpts=PTS-STARTPTS[v"$i"B]; \\" >> ffmpeg_command.part.plus2

                echo "[v"$i"B]pipglshader=start=0.0:duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source="$NAME_AN":vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out"$i"]; \\" >> ffmpeg_command.part.plus2
#                echo "["$i":v]pipglshader=start="$TRANS":duration="$TRANSTIME":pip_duration="$TRANSTIME":ext_source="$NAME_AN":vxsource=gl_pip/pip_vertex.gl:sdsource=gl_pip/pip_shader.gl[out"$i"]; \\" >> ffmpeg_command.part.plus2
                echo >> ffmpeg_command.part.plus2
                echo -n "[v"$i"A]" >> ffmpeg_command.part.plus3
                echo -n "[out"$i"]" >> ffmpeg_command.part.plus3
                add=$(echo "($add+$ONE)"| bc -l);  
                add=$(echo "($add+$ONE)"| bc -l);  
            fi
###            if [ ! "$i" == "0" ]; then
###                if [ ! "$p" == "$NUM" ]; then
#                    if [ ! "$n" == "$NUM" ]; then
#                        echo "[outa"$i"]["$n":a]acrossfade=duration="$TRANSTIME"[outa"$n"]; \\" >> ffmpeg_command.part.plus2
#                    else 
#                        echo "[outa"$i"]["$n":a]acrossfade=duration="$TRANSTIME"[outa]; \\" >> ffmpeg_command.part.plus2
#                    fi
###                    echo "["$n":v]trim="$TRANSTIME":"$LENGTH_NI",setpts=PTS-STARTPTS[v"$n"a]; \\" >> ffmpeg_command.part.plus2
###                fi
###            else 
#                echo "["$i":a]["$n":a]acrossfade=duration="$TRANSTIME"[outa"$n"]; \\" >> ffmpeg_command.part.plus2
###                echo "["$n":v]trim="$TRANSTIME":"$LENGTH_NI",setpts=PTS-STARTPTS[v"$n"a]; \\" >> ffmpeg_command.part.plus2
###            fi
        else
            echo "["$i":v]trim="$TRANS":"$LENGTH",setpts=PTS-STARTPTS[v"$i"B]; \\" >> ffmpeg_command.part.plus2

            echo -n "[v"$i"B]" >> ffmpeg_command.part.plus3
            add=$(echo "($add+$ONE)"| bc -l);  
            add="${add%.*}"
            echo "concat=n="$add"[outv] \\" >> ffmpeg_command.part.plus3
        fi  
    p=$i
  done    

  DIR="$(dirname "${1}")"

  echo "\" \\" >> ffmpeg_command.part.plus3
  echo "-map \"[outv]\" \\" >> ffmpeg_command.part.plus3
#  echo "-map \"[outa]\" \\" >> ffmpeg_command.part.plus3
  echo "-an \\" >> ffmpeg_command.part.plus3
  echo "-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 \\" >> ffmpeg_command.part.plus3
  echo "-y output_$DIR.mp4" >> ffmpeg_command.part.plus3

  cat ffmpeg_command.part.plus1 > ffmpeg_command.$DIR.sh
  cat ffmpeg_command.part.plus2 >> ffmpeg_command.$DIR.sh
  cat ffmpeg_command.part.plus3 >> ffmpeg_command.$DIR.sh

  chmod +x ffmpeg_command.$DIR.sh
#  exit
}

MAKE () {
    MAIN "jpg/*.*" "$1" "$2"
    MAKE_FFMPEG "mp4_$1x$2/out.mp4" 
    TEST_MP4 "mp4_$1x$2/*.mp4"
    ./ffmpeg_command.mp4_$1x$2.sh
}

#MAKE 1920 1080
#MAKE 1280 720
#MAKE 640 360
#MAKE 1276 720
#MAKE 1284 720
#MAKE 1280 1280
#MAKE 1800 800
MAKE 3840 2160

#MAIN "jpg/000001.png"
### #test_fadeglshader1
### 
#mkdir out
#ffmpeg -i mp4/out.01.mp4 -vsync drop -q:v 2 out/out.01.%d.png
### ffmpeg -i mp4/out.01.an.mp4 -vsync drop -q:v 2 out/out.01.an.%d.jpg
# mkdir out2
# ffmpeg -i output_plus_auto.mp4 -vsync drop -q:v 2 out2/output_plus_auto.%d.jpg
