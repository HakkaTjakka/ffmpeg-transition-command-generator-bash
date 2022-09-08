#!/bin/bash
# ffmpeg -y -i simple.mp4 -ss 00:00:04.1 -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple_cut.mp4

# ffmpeg -y -i simple.mp4 -ss 00 -t 13 -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple.01.mp4
# ffmpeg -y -i simple.mp4 -ss 08 -t 10 -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple.02.mp4
# ffmpeg -y -i simple.mp4 -ss 13 -t 10 -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple.03.mp4
#  
# 
#ffmpeg -y -i simplescreenrecorder-2022-09-05_11.18.00.mp4 -ss 00:00:04.1 -t 00:03:25 -filter_complex "fps=fps=60" -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple.mp4

# ffmpeg -y -i simple.mp4 simple.mp3

# exit

# ffmpeg -y -i simple.mp4 -filter_complex "fps=fps=60" -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple_60.mp4

TRANSTIME="3.0"
FIRST=1
COUNT=0
ONE="1"
TEN="10"
T_START=0
T_END=0
fmt="%6s%7s%7s%7s%7s%7s%20s"
PREV_END=0
#CORRECT="0"
CORRECT=".1"

function execute_render() {
        if [ $COUNT == "01" ]; then
            FIRST=0
            T_START=0
            T_END=$(echo "($2)"| bc -l);
        else
            T_START=$(echo "($1-$TRANSTIME)"| bc -l);  
            T_END=$(echo "($2)"| bc -l);
        fi

#        echo $T_START $T_END
        T_START=$(printf "%.2f" $T_START)
        T_END=$(printf "%.2f" $T_END)
        #echo COUNT "$1" "$T_START" "$T_END" "simple.$COUNT.mp4"
        printf "$fmt" "$COUNT" "$1" "$T_START" "$T_END" "$PREV_END" "$2" "simple.$COUNT.mp4"
        echo -n " Cutting..."

        END_EXTRA=$(echo "($T_END+$CORRECT)"| bc -l);
        END_EXTRA=$(printf "%.2f" $END_EXTRA)
        if [ "$2" == "0" ]; then
#            echo -n -ss $T_START -to end 
            printf "%4s%7s%4s%7s" -ss $T_START -to end 
            ffmpeg -hide_banner -loglevel error -y -i simple.mp4 -ss $T_START -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 "simple.$COUNT.mp4"
        else 
#            echo -n -ss $T_START -to $T_END 
            printf "%4s%7s%4s%7s" -ss $T_START -to $END_EXTRA
            ffmpeg -hide_banner -loglevel error -y -i simple.mp4 -ss $T_START -to $END_EXTRA -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 "simple.$COUNT.mp4"
        fi            
        echo " Done."
        PREV_END=$T_END

#        MAX_X=$(printf "%.2f" $MAX_X)

#        T_START=$(echo "($1-$TRANSTIME)"| bc -l);  
#        T_END=$(echo "($1+$TRANSTIME)"| bc -l);
#        echo ffmpeg -y -i simple.mp4 -ss T_START -t 10 -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple.03.mp4
}

function execute_render2() {
        if [ $COUNT == "01" ]; then
            FIRST=0
            T_START=0
            T_END=$(echo "($2)"| bc -l);
        else
            T_START=$(echo "($1-$TRANSTIME)"| bc -l);  
            T_END=$(echo "($2)"| bc -l);
        fi

#        echo $T_START $T_END
        T_START=$(printf "%.2f" $T_START)
        T_END=$(printf "%.2f" $T_END)
        #echo COUNT "$1" "$T_START" "$T_END" "simple.$COUNT.mp4"
        printf "$fmt" "$COUNT" "$1" "$T_START" "$T_END" "$PREV_END" "$2" "simple.$COUNT.mp4"
        echo -n " Cutting..."

        END_EXTRA=$(echo "($T_END+$CORRECT)"| bc -l);
        END_EXTRA=$(printf "%.2f" $END_EXTRA)
        if [ "$2" == "0" ]; then
#            echo -n -ss $T_START -to end 
            printf "%4s%7s%4s%7s" -ss $T_START -to end 
            ffmpeg -hide_banner -loglevel error -y -i simple.mp4 -ss $T_START -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 "simple.$COUNT.mp4"
        else 
#            echo -n -ss $T_START -to $T_END 
            printf "%4s%7s%4s%7s" -ss $T_START -to $END_EXTRA
            ffmpeg -hide_banner -loglevel error -y -i simple.mp4 -ss $T_START -to $END_EXTRA -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 "simple.$COUNT.mp4"
        fi            
        echo " Done."
        PREV_END=$T_END

#        MAX_X=$(printf "%.2f" $MAX_X)

#        T_START=$(echo "($1-$TRANSTIME)"| bc -l);  
#        T_END=$(echo "($1+$TRANSTIME)"| bc -l);
#        echo ffmpeg -y -i simple.mp4 -ss T_START -t 10 -c:v h264_nvenc -pix_fmt yuv420p -preset fast -movflags faststart -vsync 2 simple.03.mp4
}

timers=(
1
5   
11 
20
30
36
40
45.5
50.5
56.5
61
65
71
76.5
131
144
152
157
162
166
172
181.5
185
214
219
0
)

export LC_NUMERIC="en_US.UTF-8"

printf "$fmt\n" "#" "time" "start" "end" "prev" "next" "file"

for t in ${timers[@]}; do
    COUNT=$(echo "($COUNT+$ONE)"| bc -l);  
    COUNT="${COUNT%.*}"
    if [ "$COUNT" -lt "$TEN" ]; then
        COUNT=0"$COUNT"
    fi

    NEXT=$(echo "($COUNT)"| bc -l);
    NEXT=${timers[$NEXT]}
    execute_render "${t}" "${NEXT}"
    if [ "$NEXT" == "0" ]; then
        break
    fi
done
