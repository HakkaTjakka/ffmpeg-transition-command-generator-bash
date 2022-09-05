#ffmpeg -y -loop 1 -i "$1.jpg" -t 00:00:01 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -c:v libx264 -tune stillimage -pix_fmt yuv420p "$1.mp4"

#ffmpeg -y -i "$1.mkv" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p a.mp4



#ffmpeg -y -i "$1.mkv" -ss 00:00:05 -t 00:00:25 -filter_complex "[0:v]scale=250:-1,pad='width=ceil(iw/2)*2:height=ceil(ih/2)*2'" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -an "a.mp4"
#
#ffmpeg -y -i "a.mp4" -filter_complex "[0:v]setpts=0.25*PTS" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -an "$1.mp4"
#
## ffmpeg -y -i "$1.mkv" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -an "a.mp4"
#
## ffmpeg -y -i "a.mp4" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 -an "$1.mp4"
#
#ffmpeg -y -i "$1.mp4" -vf palettegen "$1.png"
#
#ffmpeg -y -i "$1.mp4" -i "$1.png" -filter_complex "[0:v][1:v]paletteuse" "$1.gif"
#
##		COMMAND="ffmpeg -y -hide_banner -progress url -nostdin -i \"$FILENAME\" -map 0:v:0 -map 0:a:0 -strict -2 -filter_complex \"[0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black,subtitles=f='$line':force_style='Fontname=Simply Rounded Bold,FontSize=24,Outline=1'\" -c:s mov_text -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 -c:a copy \"out/$BASENAME.$LANGUAGE.PART.mp4\""


ffmpeg -y -i "$1.mkv" -ss 00:00:2.0 -t 00:00:05 -filter_complex "[0:v]scale=-1:80,pad='width=ceil(iw/2)*2:height=ceil(ih/2)*2'" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -an "a.mp4"

#ffmpeg -y -i "a.mp4" -filter_complex "[0:v]setpts=0.25*PTS,fps=20" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -an "$1.mp4"

ffmpeg -y -i "a.mp4" -filter_complex "[0:v]setpts=0.5*PTS" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -an "$1.mp4"
 
ffmpeg -y -i "$1.mp4" -vf palettegen "$1.png"
 
ffmpeg -y -i "$1.mp4" -i "$1.png" -filter_complex "[0:v][1:v]paletteuse" "$1.gif"

