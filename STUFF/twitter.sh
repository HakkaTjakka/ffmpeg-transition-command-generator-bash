#!/bin/bash

FILENAME=$*
BASENAME="${FILENAME%.*}"
# VAR=$(echo $BASENAME | sed 's/[][]/\\&/g' |  sed 's/ /\\ /g')


### ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase,fps=fps=25" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 128k "TWITTER.MP4"

# ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1920:1080:force_original_aspect_ratio=increase,fps=fps=25" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 128k "TWITTER.MP4"
#-b:v 2000k 

## SPEED="0.90"
## PITCH="1.00"
## #RATE="44100"
## RATE="48000"

### ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]fps=fps=25,setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 128k "TWITTER.MP4"

#-b:v 2000k 

#ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase,fps=fps=25;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 128k "TWITTER.MP4"

# ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase,fps=fps=25" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "TWITTER.MP4"

# ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase,fps=fps=25" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "TWITTER.MP4"

#ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "TWITTER.MP4"


#### ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k -b:v 1000k "$BASENAME.TWITTER.MP4"

# ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:v]fps=fps=25,scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

#ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]fps=fps=30;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "TWITTER.MP4"

# ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"


# ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:v]fps=fps=30,setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 128k "$BASENAME.TWITTER.MP4"

# ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:a]aresample=44100" -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

# ffmpeg -hide_banner -ss 01:04:28 -i "$1" -ss 00:00:20.3 -t 00:01:26.1 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"
# ffmpeg -hide_banner  -i "$1" -ss 00:00:53.0 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"
# ffmpeg -hide_banner  -i "$1" -ss 00:00:19.0 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

# ffmpeg -y -loop 1 -i "$1.jpg" -t 00:00:25 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -c:v libx264 -tune stillimage -pix_fmt yuv420p "$1.mp4"
 
# ffmpeg -hide_banner -y -i "$1.mp4" -i "best_ringtone_2017.mp3" -c copy -shortest  -c:a aac -b:a 64k -ac 2 "$1.best_ringtone_2017.mp4"
# ffmpeg -hide_banner -y -i "$1.mp4" -i "thug_life.mp3" -c copy -shortest  -c:a aac -b:a 64k -ac 2 "$1.thug_life.mp4"

### SPEED="140/183"
### PITCH="1.00"
### RATE="48000"
### #RATE="44100"
### # 
### ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 64k -ac 2 "$BASENAME.TWITTER.MP4"


# ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]setpts=$SPEED*PTS[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 64k -ac 2 "$BASENAME.TWITTER.MP4"

### ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k -b:v 1000k "$BASENAME.TWITTER.MP4"
### ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:v]rotate=a=t/20.0" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 1000k "$BASENAME.TWITTER.MP4"

### ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

### ffmpeg -hide_banner  -i "$1" -filter_complex "[0:v]setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"
### ffmpeg -hide_banner  -i "$1" -filter_complex "[0:v]setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

### ffmpeg -hide_banner  -i "$1" -filter_complex "[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"


### ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k -b:v 1500k "$BASENAME.TWITTER.MP4"


# ffmpeg -hide_banner -ss 00:31:02 -i "$1" -ss 00:01:02 -t 00:02:19 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

## ffmpeg -hide_banner -i "$1" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"
# ffmpeg -hide_banner -i "$1" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

# ffmpeg -y -hide_banner -ss 01:21:00 -i "$1" -ss 00:00:21 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_1.MP4"
# ffmpeg -y -hide_banner -ss 01:23:20 -i "$1" -ss 00:00:19 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_2.MP4"
# ffmpeg -y -hide_banner -ss 01:25:40 -i "$1" -ss 00:00:17 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_3.MP4"
# ffmpeg -y -hide_banner -ss 01:28:00 -i "$1" -ss 00:00:15 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_4.MP4"
# ffmpeg -y -hide_banner -ss 01:30:20 -i "$1" -ss 00:00:13 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_5.MP4"
# ffmpeg -y -hide_banner -ss 01:32:40 -i "$1" -ss 00:00:11 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_6.MP4"
# ffmpeg -y -hide_banner -ss 01:35:00 -i "$1" -ss 00:00:09 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_7.MP4"

# ffmpeg -y -hide_banner -ss 00:00:00 -i "$1" -ss 00:00:00 -t 01:00:03 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -b:v 1M "PART1.TWITTER.MP4"
# ffmpeg -y -hide_banner -ss 00:59:00 -i "$1" -ss 00:01:00 -t 01:00:03 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -b:v 1M "PART2.TWITTER.MP4"
# ffmpeg -y -hide_banner -ss 01:59:00 -i "$1" -ss 00:01:00 -t 01:00:03 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -b:v 1M "PART3.TWITTER.MP4"
# ffmpeg -y -hide_banner -ss 02:59:00 -i "$1" -ss 00:01:00 -t 01:00:03 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -b:v 1M "PART4.TWITTER.MP4"
# ffmpeg -y -hide_banner -ss 03:59:00 -i "$1" -ss 00:01:00 -t 01:00:03 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -b:v 1M "PART5.TWITTER.MP4"

# ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k -b:v 1000k "$BASENAME.TWITTER.MP4"
# ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:v]mpdecimate[b];[b]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"
# ffmpeg -hide_banner -i "$FILENAME" -vf mpdecimate -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

### ffmpeg -y -hide_banner              -i "$1"              -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_1.MP4"
### ffmpeg -y -hide_banner -ss 00:02:00 -i "$1" -ss 00:00:18 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_2.MP4"
### ffmpeg -y -hide_banner -ss 00:04:20 -i "$1" -ss 00:00:16 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_3.MP4"
### ffmpeg -y -hide_banner -ss 00:06:40 -i "$1" -ss 00:00:14 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_4.MP4"


### ffmpeg -hide_banner -i "$FILENAME" -filter_complex "[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

#ffmpeg -y -hide_banner -ss 00:27:00 -i "$1" -ss 00:01:00 -t 00:02:20 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "PART.TWITTER_2.MP4"
# ffmpeg -y -hide_banner -ss 00:27:00 -i "$1" -ss 00:01:00 -t 00:00:43 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.TWITTER.MP4"

# ffmpeg -y -hide_banner -ss 00:02:13 -i "$1" -ss 00:00:30 -t 00:01:16 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.01.TWITTER.MP4"
# ffmpeg -y -hide_banner -ss 00:04:00 -i "$1" -ss 00:00:07 -t 00:00:18 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.02.TWITTER.MP4"
# ffmpeg -y -hide_banner -ss 00:05:00 -i "$1" -ss 00:00:06 -t 00:00:12 -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=increase;[0:a]aresample=44100" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -ac 2 -b:a 64k "$BASENAME.03.TWITTER.MP4"


# ./ffmpeg -i "$BASENAME.02.TWITTER.MP4" -i "$BASENAME.01.TWITTER.MP4" -filter_complex "gltransition=duration=1:offset=1.5" out.mp4


# ./ffmpeg -i "$BASENAME.02.TWITTER.MP4" -i "$BASENAME.01.TWITTER.MP4" -filter_complex "gltransition" -y \
#	-c:v libx264 -profile:v baseline -preset slow -movflags faststart -pix_fmt yuv420p out.mp4

### ffmpeg -i "$BASENAME.02.TWITTER.MP4" -i "$BASENAME.01.TWITTER.MP4" -filter_complex "[0:v][1:v]xfade=offset=4.5:duration=1[outv]" -map "[outv]" -c:v h264_nvenc -pix_fmt yuv420p output.mp4

####################################

### ffmpeg -y -hide_banner -ss 00:02:13 -i "$1" -ss 00:00:29.5 -t 00:01:16.5 -c:v h264_nvenc -pix_fmt yuv420p -preset fast "$BASENAME.01.TWITTER.MP4"
### ffmpeg -y -hide_banner -ss 00:04:00 -i "$1" -ss 00:00:06.5 -t 00:00:18.5 -c:v h264_nvenc -pix_fmt yuv420p -preset fast "$BASENAME.02.TWITTER.MP4"
### ffmpeg -y -hide_banner -ss 00:05:00 -i "$1" -ss 00:00:05.5 -t 00:00:13.5 -c:v h264_nvenc -pix_fmt yuv420p -preset fast "$BASENAME.03.TWITTER.MP4"
### ffmpeg -y -hide_banner -ss 00:06:40 -i "$1" -ss 00:00:05.5 -t 00:01:20.5 -c:v h264_nvenc -pix_fmt yuv420p -preset fast "$BASENAME.04.TWITTER.MP4"
###  
### ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.01.TWITTER.MP4" > l1.txt
### read -r FILELENGTH1 < l1.txt
### ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.02.TWITTER.MP4" > l2.txt
### read -r FILELENGTH2 < l2.txt
### ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.03.TWITTER.MP4" > l3.txt
### read -r FILELENGTH3 < l3.txt
### ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.04.TWITTER.MP4" > l4.txt
### read -r FILELENGTH4 < l4.txt
### ONE="1"
### FADE1=$(echo "($FILELENGTH1-$ONE)"| bc -l)
### FADE2=$(echo "($FILELENGTH2-$ONE)"| bc -l)
### FADE3=$(echo "($FILELENGTH3-$ONE)"| bc -l)
### echo $FILELENGTH1 - $ONE = $FADE1
### echo $FILELENGTH2 - $ONE = $FADE2
### echo $FILELENGTH3 - $ONE = $FADE3
### echo $FILELENGTH4 
### 
### FADE2=$(echo "($FADE1+$FADE2)"| bc -l)
### echo $FADE1 + $FILELENGTH2 - $ONE = $FADE2
### FADE3=$(echo "($FADE2+$FADE3)"| bc -l)
### echo $FADE2 + $FILELENGTH3 - $ONE = $FADE3

### TOT=$(echo "($FADE3+$FILELENGTH4)"| bc -l)
### echo TOT=$TOT
### 
### ffmpeg -y -i "$BASENAME.01.TWITTER.MP4" -i "$BASENAME.02.TWITTER.MP4" -i "$BASENAME.03.TWITTER.MP4" -i "$BASENAME.04.TWITTER.MP4" -filter_complex " \
### 	[0:v][1:v]xfade=transition=slideleft:offset=$FADE1:duration=$ONE[outv1]; \
### 	[outv1][2:v]xfade=transition=slideright:offset=$FADE2:duration=$ONE[outv2]; \
### 	[outv2][3:v]xfade=transition=slideleft:offset=$FADE3:duration=$ONE[outv]; \
### 	[0:a][1:a]acrossfade=duration=$ONE[outa1]; \
### 	[outa1][2:a]acrossfade=duration=$ONE[outa2]; \
### 	[outa2][3:a]acrossfade=duration=$ONE[outa] \
### 	" -map [outv] -map [outa] -c:v h264_nvenc -pix_fmt yuv420p -preset fast "$BASENAME.COMBINED.TWITTER.MP4"
### 
###  SPEED="140/$TOT"
###  PITCH="1.00"
###  RATE="48000"
###  #RATE="44100"
###  
###  FPS=$(echo "(25/($SPEED))"| bc -l)
###  echo SPEED="$SPEED"
###  echo FPS=$FPS
###  
###  ffmpeg -y -hide_banner -i "$BASENAME.COMBINED.TWITTER.MP4" -filter_complex "[0:v]setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase,fps=fps=$FPS[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 64k -ac 2 "$BASENAME.TWITTER.MP4"

 ### ffmpeg -hide_banner -i "$BASENAME.COMBINED.TWITTER.MP4" -filter_complex "[0:v]setpts=$SPEED*PTS,scale=1280:720:force_original_aspect_ratio=increase[v];[0:a]asetrate=$RATE/$PITCH,aresample=44100,atempo=(1.0/($SPEED/$PITCH))[a]" -map "[v]" -map "[a]" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -c:a aac -b:a 64k -ac 2 "$BASENAME.TWITTER.MP4"

### ffmpeg -y -hide_banner -i "$BASENAME.COMBINED.TWITTER.MP4" -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 900k "$BASENAME.SMALL.TWITTER.MP4"

# fps=fps=25

########################################################3

## 
## # ./ffmpeg -i "$BASENAME.02.TWITTER.MP4" -i "$BASENAME.01.TWITTER.MP4" -filter_complex "xfade=offset=4.5:duration=1" -c:v h264_nvenc -pix_fmt yuv420p output.mp4
## 
## # ffmpeg -i 1.mp4 -i 2.mp4 -filter_complex "xfade=offset=4.5:duration=1" output.mp4
## 
## # ./ffmpeg -i "$BASENAME.01.TWITTER.MP4" -i "$BASENAME.02.TWITTER.MP4" -filter_complex "gltransition=duration=5:offset=10.0:source=transitions/crosswarp.glsl" -c:v libx264 -pix_fmt yuv420p -y out.mp4
## # echo "./ffmpeg -i \"$BASENAME.01.TWITTER.MP4\" -i \"$BASENAME.02.TWITTER.MP4\" -filter_complex \"gltransition=duration=5:offset=10.0:source=transitions/crosswarp.glsl\" -c:v libx264 -pix_fmt yuv420p -y out.mp4" > command.sh
## 
## # ./ffmpeg -i "$BASENAME.01.TWITTER.MP4" -i "$BASENAME.02.TWITTER.MP4" -filter_complex gltransition -y out.mp4
## 
## 
## # ffmpeg -i "$BASENAME.01.TWITTER.MP4" -i "$BASENAME.02.TWITTER.MP4" -filter_complex "[0][1]xfade=transition=fade:duration=1:offset=4,format=yuv420p" output.mp4

# ffmpeg -i "$BASENAME.01.TWITTER.MP4" -i "$BASENAME.02.TWITTER.MP4" -vf "framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v libx264 "Test_Output.mp4"

ONE="1"
T1=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.01.TWITTER.MP4") ;  F1=$(echo "($T1-$ONE)"| bc -l); echo T1=$T1 F1=$F1 ;
T2=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.02.TWITTER.MP4") ;  F2=$(echo "($T2-$ONE)"| bc -l); echo T2=$T2 F2=$F2 ;
T3=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$BASENAME.03.TWITTER.MP4") ;  F3=$(echo "($T3-$ONE)"| bc -l); echo T3=$T3 F3=$F3 ;






exit

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
    [v1b1][v2a1]gltransition=duration=1[vt1]; \
    [v0a1][vt0][vt1][v2b1]concat=n=4[outv]; \
 	[s0][s1]acrossfade=duration=1[outa1]; \
 	[outa1][s2]acrossfade=duration=1[outa] \
    " \
  	-map "[outv]" \
   	-map "[outa]" \
 	-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart\
	-y output.mp4
##  -map "[outa]" \
## 	[0:a][1:a]acrossfade=duration=1[outa1]; \
## 	[outa1][2:a]acrossfade=duration=1[outa2]; \
## 	[outa2][3:a]acrossfade=duration=1[outa] \
###
###
###
### TWITTER.MP4" -filter_complex "gltransition=duration=1:offset=1.5" out.mp4


### ./ffmpeg -v debug \
### -ss 40 -t 20 -i russel.nl.mp4 \
### -filter_complex " \
### plusglshader=sdsource=gl/jitter_shader.gl:vxsource=gl/jitter_vertex.gl:duration=10.1 \
### [out1];[out1]
### plusglshader=sdsource=gl/sway_shader.gl:vxsource=gl/sway_vertex.gl:duration=5 \
### [out2];[out2]
### plusglshader=sdsource=gl/split_9_shader.gl:vxsource=gl/split_9_vertex.gl:start=3:duration=3 \
### " \
### -c:v h264_nvenc -pix_fmt yuv420p -preset fast \
### -y output.mp4



#### F="_shader.gl"
#### V="_vertex.gl"
#### 
#### SHADER="bluesea"
#### F1=$SHADER$F
#### V1=$SHADER$V
#### echo $F1 $V1
#### 
#### SHADER="jitter"
#### F2=$SHADER$F
#### V2=$SHADER$V
#### echo $F2 $V2
#### 
#### ./ffmpeg -v debug \
#### 	-ss 40 -t 30 -i russel.nl.mp4 \
#### 	-filter_complex " \
#### 	plusglshader=sdsource=gl/$F1:vxsource=gl/$V1:duration=10 \
#### 	[out1];[out1]
#### 	plusglshader=sdsource=gl/$F2:vxsource=gl/$V2:start=10:duration=10.0 \
#### 	"  \
#### 	-c:v h264_nvenc -pix_fmt yuv420p -preset fast \
#### 	-y output.mp4


#### bin2/ffmpeg \
####   -i "$BASENAME.01.TWITTER.MP4" \
####   -i "$BASENAME.02.TWITTER.MP4" \
####   -i "$BASENAME.03.TWITTER.MP4" \
####   -filter_complex " \
####     [0:v]split[v0a0][v0b0]; \
####     [1:v]split[v1a0][v1b0]; \
####     [2:v]split[v2a0][v2b0]; \
#### 
####     [v0a0]trim=0:3[v0a1]; \
####     [v0b0]trim=3:4[v0b1t]; \
####     [v0b1t]setpts=PTS-STARTPTS[v0b1]; \
#### 
####     [v1a0]trim=0:3[v1a1]; \
####     [v1b0]trim=3:4[v1b1t]; \
####     [v1b1t]setpts=PTS-STARTPTS[v1b1]; \
#### 
####     [v2a0]trim=0:3[v2a1]; \
####     [v2b0]trim=3:4[v2b1t]; \
####     [v2b1t]setpts=PTS-STARTPTS[v2b1]; \
#### 
####     [v0b1][v1a1]gltransition=duration=1:source=transitions/crosswarp.glsl[vt0]; \
####     [v1b1][v2a1]gltransition=duration=1[vt1]; \
####     [v0a1][vt0][vt1][v2b1]concat=n=4[outv] \
####     " \
####   -map "[outv]" \
####  	-c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart\
#### 	-y output.mp4
#### ##  -map "[outa]" \
#### ## 	[0:a][1:a]acrossfade=duration=1[outa1]; \
#### ## 	[outa1][2:a]acrossfade=duration=1[outa2]; \
#### ## 	[outa2][3:a]acrossfade=duration=1[outa] \
