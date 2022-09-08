# ffmpeg -i IMG_%3d.jpg -vf zoompan=d=(A+B)/B:s=WxH:fps=1/B,framerate=25:interp_start=0:interp_end=255:scene=100 -c:v mpeg4 -maxrate 5M -q:v 2 out.mp4
# ffmpeg -y -i *.jpg -filter_complex "zoompan=d=(5+1)/1:s=1920x1080:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -c:v mpeg4 -maxrate 5M -q:v 2 out.mp4

# ffmpeg -y -i *.jpg -vf "setpts=N/0.5/TB,framerate=fps=25" -codec:v mpeg4 out.mp4

# ffmpeg -y -framerate 0.5 -i *.jpg -vf fps=2 -f nut - | ffmpeg -f nut -i - -vf framerate=25 -c:v mpeg4 out.mp4

# ffmpeg -i *.jpg -vf "zoompan=z=1:d=4:s=1920x1080:fps=2,framerate=25" -c:v mpeg4 out.mp4


# ffmpeg -framerate 1/3 -i 2*.jpg -r 25 -c:v libx264 -pix_fmt yuv420p output.mp4

# ffmpeg -framerate 10 -pattern_type glob -i "*.png" -pix_fmt yuv420p output.mkv

# ffmpeg -pattern_type glob -i "*.jpg" -vf "zoompan=z=1:d=4:fps=2,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,framerate=25" -c:v mpeg4 out.mp4

# ffmpeg -pattern_type glob -i "*.jpg" -vf "zoompan=z=1:d=4:s=1920x1080:fps=2,framerate=25" -c:v mpeg4 out.mp4

# ffmpeg -y -loop 1 -i "$1.jpg" -t 00:00:01 -vf pad="width=ceil(iw/2)*2:height=ceil(ih/2)*2" -c:v libx264 -tune stillimage -pix_fmt yuv420p "$1.mp4"

# ffmpeg -framerate 1/10 -i img%3d.png -i audio.wav -vf 'scale=3840:2880:force_original_aspect_ratio=decrease,pad=3840:2880:(ow-iw)/2:(oh-ih)/2,setsar=1' -c:v libx264 -crf 14 -r 25 -pix_fmt yuv420p -shortest output.mp4


# ffmpeg -framerate 1/10 -pattern_type glob -i "*.jpg" -vf 'zoompan=z=1:d=4:fps=2,scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1' -c:v libx264 -crf 14 -r 25 -pix_fmt yuv420p -shortest output.mp4

# ffmpeg -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame" -r 25 -c:v libx264 "Test_Output.mp4"

# ffmpeg -i IMG_%3d.jpg -vf zoompan=d=(A+B)/B:fps=1/B,framerate=25:interp_start=0:interp_end=255:scene=100 -c:v mpeg4 -maxrate 5M -q:v 2 out.mp4



# ffmpeg -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "framerate=25:interp_start=0:interp_end=255:scene=100,scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame" -r 25 -c:v libx264 "Test_Output.mp4"


# ffmpeg -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v libx264 "Test_Output.mp4"

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v libx264 "Test_Output.mp4"
# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(5+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v libx264 "Test_Output.mp4"

# zoompan=d=(A+B)/B:fps=1/B

#framerate=25:interp_start=0:interp_end=255:scene=100,

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v libx264 "Test_Output.mp4"

# -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output.mp4"

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100,crop=640:1080:390:0" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output.mp4"
# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100,crop=640:720:320:0" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output.mp4"

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100,crop=720:720:280:0" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output2.mp4"

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v h264_nvenc -pix_fmt yuv420p -preset slow "Test_Output2.mp4"ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v h264_nvenc -pix_fmt yuv420p -preset slow "Test_Output2.mp4"

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output2.mp4"

#ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,zoompan=d=(10+1)/1:fps=1/1,framerate=25:interp_start=0:interp_end=255:scene=100,crop=640:640:320:0" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output2.mp4"


# ffmpeg -i "Test_Output.mp4" -i fab.png -filter_complex "[0:v][1:v]overlay=248:576:" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output2.mp4"

# enable='between(t,0,20)'
# 



# ffmpeg -i "Test_Output.mp4" -i fab.png -filter_complex "[0:v][1:v]overlay=248:576:" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output2.mp4"

# ffmpeg -i "Test_Output2.mp4"  -c:v h264_nvenc -pix_fmt yuv420p -preset slow -b:v 200k "Test_Output3.mp4"

# ffmpeg -y -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,framerate=25" -r 25 -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output4.mp4"

# ffmpeg -framerate 1/5 -start_number 0 -reinit_filter 0 -pattern_type glob -i "*.jpg" -vf "scale=1920:1080:force_original_aspect_ratio=decrease:eval=frame,pad=1920:1080:-1:-1:eval=frame,setsar=1,framerate=25" -c:v h264_nvenc -profile:v high -pix_fmt yuv420p -bf:v 3 -preset slow -rc-lookahead 32 "Test_Output4.mp4"

ffmpeg -i "../Test_Output2.mp4" -t 00:01:00 -loop 0 -an -vsync 0 -vf "scale=1920:1080" "Test_Output3.webp"

# ffmpeg -i "../Test_Output2.mp4" -vcodec libwebp -filter:v fps=fps=25 -compression_level 3 -q:v 70 -loop 1 -preset picture -an -vsync 0 -b:v 10k output.webp

# ffmpeg -y -i "../Test_Output2.mp4" -vcodec libwebp -preset default -loop 0 -an -vsync 0 -vf "fps=25, scale=1920:1080" -qscale 10 output.webp