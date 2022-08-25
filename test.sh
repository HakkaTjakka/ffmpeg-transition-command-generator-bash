#!/bin/bash

FILENAME=$*
BASENAME="${FILENAME%.*}"
TRANSTIME="2.0"

GET_INFO_VIDEO () {
  NUM=${#NAMES[@]}
  L=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1")

  FPS=$(ffprobe -v error -select_streams v:0 -show_entries stream=r_frame_rate -of default=noprint_wrappers=1:nokey=1 "$1")

#  FRAMES=$(ffprobe -v error -select_streams v:0 -count_frames -show_entries stream=nb_read_frames -of default=noprint_wrappers=1:nokey=1 "$1")
  FRAMES=$(echo "($L * $FPS)"| bc -l);

  L="${L%0000}"
  FRAMES="${FRAMES%.*}"

  echo INDEX=$NUM NAME=$1 LENGTH=$L FPS=$FPS FRAMES=$FRAMES # $2 $3
  NAMES+=( "$1" )
  LENGTH+=( "$L" )
}


MAIN () {
  FILENAME=$*
  BASENAME="${FILENAME%.*}" ; echo BASENAME=$BASENAME

  NAMES=()
  LENGTH=()

  for line in $BASENAME.*.mp4
  do
    INDEX="${line%.*}"
    INDEX="${INDEX##*.}"

    S=$(echo "($INDEX)"| bc -l);  
    if [ ! "$S" == "0" ]; then
      # echo $line $part $S
      GET_INFO_VIDEO $line $INDEX $S
    fi
  done

  # echo -n "Files:"
  echo "Files:"
  echo "bin2/ffmpeg \\" > ffmpeg_command.part1
  echo "-filter_complex \" \\" > ffmpeg_command.part2
  echo -n "[v0a1]" > ffmpeg_command.part3
  p="0"
  for i in ${!NAMES[@]};
  do
    # echo -n " "
    #echo -n $i=${NAMES[$i]}
    ONE="1.0"
    n=$(echo "($i+$ONE)"| bc -l);  
    n="${n%.*}"
#    echo p=$p i=$i n=$n
    NAME=${NAMES[$i]}
    LENGTH=${LENGTH[$i]}
    TRANS=$(echo "($LENGTH-$TRANSTIME)"| bc -l);  
    TRANS="${TRANS%0000}"

    echo INDEX=$i NEXT=$n $NAME $LENGTH $TRANS # $2 $3

    echo "-i \"$NAME\" \\" >> ffmpeg_command.part1

    echo "["$i":v]split[v"$i"a0][v"$i"b0]; \\" >> ffmpeg_command.part2
    echo "["$i":a]atrim=0:"$LENGTH"[s"$i"]; \\" >> ffmpeg_command.part2
    echo "[v"$i"a0]trim=0:"$TRANS"[v"$i"a1]; \\" >> ffmpeg_command.part2
    echo "[v"$i"b0]trim="$TRANS":"$LENGTH"[v"$i"b1t]; \\" >> ffmpeg_command.part2
    echo "[v"$i"b1t]setpts=PTS-STARTPTS[v"$i"b1]; \\" >> ffmpeg_command.part2
    echo "" >> ffmpeg_command.part2
    if [ ! "$i" == "0" ]; then
      echo "[v"$p"b1][v"$i"a1]gltransition=duration="$TRANSTIME":source=transitions/crosswarp.glsl[vt"$p"]; \\" >> ffmpeg_command.part2
      echo -n "[vt"$p"]" >> ffmpeg_command.part3
      if [ ! "$i" == "$NUM" ]; then
        echo "[s"$p"][s"$i"]acrossfade=duration="$TRANSTIME"[outa"$i"]; \\" >> ffmpeg_command.part2
        echo "" >> ffmpeg_command.part2
      else
        echo "[outa"$p"][s"$i"]acrossfade=duration="$TRANSTIME"[outa]; \\" >> ffmpeg_command.part2
        echo "" >> ffmpeg_command.part2
        n=$(echo "($n+$ONE)"| bc -l);  
        n="${n%.*}"
        echo "[v"$i"b1]concat=n="$n"[outv] \\" >> ffmpeg_command.part3
        echo "" >> ffmpeg_command.part3
      fi  
    fi
    p=$i
    # echo NUM=$NUM
  done    
  echo "\" \\" >> ffmpeg_command.part3
  echo "-map \"[outv]\" \\" >> ffmpeg_command.part3
  echo "-map \"[outa]\" \\" >> ffmpeg_command.part3
  echo "-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart \\" >> ffmpeg_command.part3
  echo "-y output.mp4" >> ffmpeg_command.part3

  cat ffmpeg_command.part1 > ffmpeg_command.sh
  cat ffmpeg_command.part2 >> ffmpeg_command.sh
  cat ffmpeg_command.part3 >> ffmpeg_command.sh

  chmod +x ffmpeg_command.sh
  exit
}


TEST1 () {
  ONE="1"
  T1=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.01.TWITTER.MP4") ;  F1=$(echo "($T1-$ONE)"| bc -l); echo T1=$T1 F1=$F1 ;
  T2=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.02.TWITTER.MP4") ;  F2=$(echo "($T2-$ONE)"| bc -l); echo T2=$T2 F2=$F2 ;
  T3=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.03.TWITTER.MP4") ;  F3=$(echo "($T3-$ONE)"| bc -l); echo T3=$T3 F3=$F3 ;


  bin2/ffmpeg \
   -i "$BASENAME.01.TWITTER.MP4" \
   -i "$BASENAME.02.TWITTER.MP4" \
   -i "$BASENAME.03.TWITTER.MP4" \
   -filter_complex " \
    [0:v]split[v0a0][v0b0]; \
    [0:a]atrim=0:4[s0]; \
    [v0a0]trim=0:3[v0a1]; \
    [v0b0]trim=3:4[v0b1t]; \
    [v0b1t]setpts=PTS-STARTPTS[v0b1]; \

    [1:v]split[v1a0][v1b0]; \
    [1:a]atrim=0:4[s1]; \
    [v1a0]trim=0:3[v1a1]; \
    [v1b0]trim=3:4[v1b1t]; \
    [v1b1t]setpts=PTS-STARTPTS[v1b1]; \

    [v0b1][v1a1]gltransition=duration=1:source=transitions/crosswarp.glsl[vt0]; \
    [s0][s1]acrossfade=duration=1[outa1]; \

    [2:v]split[v2a0][v2b0]; \
    [2:a]atrim=0:4[s2]; \
    [v2a0]trim=0:3[v2a1]; \
    [v2b0]trim=3:4[v2b1t]; \
    [v2b1t]setpts=PTS-STARTPTS[v2b1]; \

    [v1b1][v2a1]gltransition=duration=1:source=transitions/crosswarp.glsl[vt1]; \
    [outa1][s2]acrossfade=duration=1[outa]; \

    [v0a1][vt0][vt1][v2b1]concat=n=4[outv] \

    " \
    -map "[outv]" \
    -map "[outa]" \
    -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart \
    -y output.mp4
}


TEST2 () {
bin2/ffmpeg \
  -i "$BASENAME.01.TWITTER.MP4" \
  -i "$BASENAME.02.TWITTER.MP4" \
  -i "$BASENAME.03.TWITTER.MP4" \
  -filter_complex " \
    [0:v]split[v0a0][v0b0]; \
    [1:v]split[v1a0][v1b0]; \
    [2:v]split[v2a0][v2b0]; \
  
    [0:a]atrim=0:4[s0]; \
    [1:a]atrim=0:4[s1]; \
    [2:a]atrim=0:4[s2]; \
    [v0a0]trim=0:3[v0a1]; \
    [v0b0]trim=3:4[v0b1t]; \
    [v0b1t]setpts=PTS-STARTPTS[v0b1]; \

    [v1a0]trim=0:3[v1a1]; \
    [v1b0]trim=3:4[v1b1t]; \
    [v1b1t]setpts=PTS-STARTPTS[v1b1]; \

    [v2a0]trim=0:3[v2a1]; \
    [v2b0]trim=3:4[v2b1t]; \
    [v2b1t]setpts=PTS-STARTPTS[v2b1]; \

    [v0b1][v1a1]gltransition=duration=1:source=transitions/crosswarp.glsl[vt0]; \
    [v1b1][v2a1]gltransition=duration=1:source=transitions/crosswarp.glsl[vt1]; \
    [v0a1][vt0][vt1][v2b1]concat=n=4[outv]; \
    [s0][s1]acrossfade=duration=1[outa1]; \
    [outa1][s2]acrossfade=duration=1[outa] \

  " \
  -map "[outv]" \
  -map "[outa]" \
  -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart \
  -y output.mp4
}

#TEST1 $*
#TEST2 $*
MAIN $*

