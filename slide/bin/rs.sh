#ffmpeg -f x11grab -video_size 1600x900 -framerate 50 -i :0.0+129,57 -vf format=yuv420p output.mp4
#ffmpeg -f x11grab -video_size 1920x1080 -framerate 30 -i :0.0 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 output.mp4

#ffmpeg -f x11grab -video_size 1920x1080 -framerate 30 -i :0.0 -f pulse -ac 2 -i default -c:v h264_nvenc -preset fast output.mp4

#ffmpeg -y -f vfwcap -i list 
#~/ffmpeg-n4.4-latest-linux64-gpl-4.4/bin/ffmpeg -list_devices true -f dshow -i dummy 
#~/ffmpeg-n4.4-latest-linux64-gpl-4.4/bin/ffmpeg -devices

#
#		COMMAND="~/ffmpeg-n4.4-latest-linux64-gpl-4.4/bin/ffmpeg -y -hide_banner -progress url -nostdin -i \"$FILENAME\" -map 0:v:0 -map 0:a:0 -strict -2 -filter_complex \"[0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:-1:-1:color=black,subtitles=f='$line':force_style='Fontname=Simply Rounded Bold,FontSize=20,Outline=2'\" -c:s mov_text -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 -c:a copy \"out/$BASENAME.$LANGUAGE.PART.mp4\""

#ffmpeg -f pulse -ac 2 -i default -f x11grab -r 25 -s 1366x768 -i :0.0 -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -crf 0 -threads 0 -acodec pcm_s16le -y output.mkv
#ffmpeg -f pulse -ac 2 -i default -f x11grab -r 25 -s 1920x1080 -i :0.0 -filter_complex "scale=960x540,mpdecimate" -vcodec h264_nvenc -pix_fmt yuv420p -preset fast -crf 0 -threads 0 -acodec pcm_s16le -y output.mkv

#ffmpeg -f pulse -ac 2 -i default -f x11grab -s 1920x1080 -i :0.0 -filter_complex "scale=960x540,mpdecimate" -c:v ffvhuff -acodec pcm_s16le -y output.mkv
#ffmpeg -f pulse -ac 2 -i default -f x11grab -s 1920x1080 -i :0.0 -c:v ffvhuff -acodec pcm_s16le -y output.mkv

#ffmpeg -f pulse -ac 2 -i default -f x11grab -s 1920x1080 -i :0.0 -c:v libx264 -preset veryslow -qp 0 -acodec pcm_s16le -y output.mkv

#

# ffmpeg -f pulse -ac 2 -i default -f x11grab -i :0.0 -c:v ffvhuff -acodec pcm_s16le -y output.mkv

# ffmpeg -f pulse -ac 2 -i default -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec h264_nvenc -pix_fmt yuv420p -preset fast -crf 0 -threads 0 -acodec pcm_s16le -y output.mkv

#ffmpeg -y -rtbufsize 1024M -thread_queue_size 1024 -f x11grab -framerate 30 -i :0.0 -c:v h264_nvenc -qp 0 -f pulse -ac 2 -i default -acodec pcm_s16le -threads 0 output.mp4

# ffmpeg -y -rtbufsize 1024M -thread_queue_size 1024 -f pulse -ac 2 -i default -f x11grab -framerate 30 -i :0.0 -c:v h264_nvenc -qp 0 -acodec pcm_s16le -threads 0 output.mkv

#ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i 0 -c:v libx264rgb -crf 0 -preset ultrafast sample.mkv

# ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i 0 -c:v h264_nvenc -qp 0 -preset fast sample.mkv

# ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -filter_complex amerge -ac 2 -i 0 -f pulse -ac 2 -i 1 -c:v libx264rgb -crf 0 -preset ultrafast sample.mkv

# ffmpeg -y -rtbufsize 1024M -thread_queue_size 1024 -f pulse -ac 2 -i 1 -f x11grab -framerate 15 -i :0.0 -c:v h264_nvenc -qp 0 -threads 0 -acodec pcm_s16le output.mkv

#ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 output.mkv

#ffmpeg -fflags +igndts -use_wallclock_as_timestamps 1 -thread_queue_size 2048 -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 -filter_complex "setpts=N/FR/TB" -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 output.mkv

# ffmpeg -thread_queue_size 2048 -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 -filter_complex "aresample=async=1" output.mkv

# ffmpeg -thread_queue_size 2048 -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 -c:v h264_nvenc -preset fast -filter_complex "aresample=async=1" output.mp4


#-fflags +igndts -use_wallclock_as_timestamps 1 -thread_queue_size 2048 
#-filter_complex "select=concatdec_select,aselect=concatdec_select,aresample=async=1"







# out_w is the width of the output rectangle
# out_h is the height of the output rectangle
# x and y specify the top left corner of the output rectangle

# ffmpeg -y -ss 00:39:42.6 -i output4.mp4 -ss 00:01:00 -t 00:00:04.00 -filter:v "crop=800:800:580:60" -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow on.mp4

# echo file 'on.mp4' > filelist.txt
# echo file 'on.mp4' >> filelist.txt
# #echo file 'on.mp4' >> filelist.txt
# 
# ffmpeg -y -safe 0 -f concat -i filelist.txt -filter_complex "setpts=0.5*PTS" -an -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow onon.mp4
# vlc onon.mp4
# ffmpeg -y -i output2.mp4 -ss 00:00:40 -an -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow -b:v 1000k output3.mp4

## ffmpeg -thread_queue_size 2048 -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 0 -filter_complex "aresample=async=0" -c:v h264_nvenc -preset fast output2.mp4

# ffmpeg -thread_queue_size 2048 -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 0 -c:v h264_nvenc -preset fast output2.mp4

# ffmpeg -y -i output2.mp4 -ss 00:00:16 -c:a copy -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow output3.mp4

# ffmpeg -y -i output2.mp4 -ss 00:00:16 -c:a copy -c copy output3.mp4

# ffmpeg -y -i output3.mp4 -t 00:40:43.0 -c copy output4.mp4

# ffmpeg -y -ss 01:31:33 -i output2.mp4 -ss 00:01:00 -c copy output3.mp4

# ffmpeg -y -ss 01:31:33 -i dont.nl.mp4 -ss 00:01:00.9 -t 00:00:13.7 -c:a copy -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow dont.cut.mp4
# ffmpeg -y -ss 01:31:33 -i dont.dut.mp4 -ss 00:01:00.9 -t 00:00:13.7 -c:a copy -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow dont.cut.dut.mp4

ffmpeg -y -i dont.cut.mp4 -ss 00:00:07.7 -t 00:00:03.7 -c:a copy -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow dont.cut.short.mp4
ffmpeg -y -i dont.cut.dut.mp4 -ss 00:00:07.7 -t 00:00:03.7 -c:a copy -c:v h264_nvenc -pix_fmt yuv420p -bf:v 3 -preset slow dont.cut.dut.short.mp4

# dont.nl.mp4